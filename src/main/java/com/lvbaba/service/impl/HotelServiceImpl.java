package com.lvbaba.service.impl;

import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import com.lvbaba.dao.*;
import com.lvbaba.entity.*;
import com.lvbaba.service.HotelService;
import com.lvbaba.utli.Util;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;
import java.util.ArrayList;
import java.util.Collections;
import java.util.List;

/**
 * Created by shinichi on 2020/10/23.
 */
@Service("hotelService")
public class HotelServiceImpl implements HotelService {
    @Resource
    private HotelDao hotelDao;

    @Resource
    private AreaDao areaDao;

    @Resource
    private RoomDao roomDao;

    @Resource
    private RoomDetailDao roomDetailDao;

    @Resource
    private UserDao userDao;

    @Resource
    private UserorderDao userorderDao;

    @Resource
    private TourDao tourDao;


    @Override
    public Hotel queryOne(Hotel hotel) {
        if (hotel == null) {
            return null;
        }
        return hotelDao.queryOne(hotel);

    }

    @Override
    public List<Hotel> query(Hotel hotel) {
        if (hotel == null) {
            return null;
        }

        List<Hotel> list = hotelDao.query(hotel);
        List<Hotel> list1 =new ArrayList<>();
        for (Hotel hotel1:list) {
            Area area = areaDao.queryOne(new Area(hotel1.getAreaId()));
            hotel1.setArea(area);
            list1.add(hotel1);
        }
        return list1;
    }

    @Override
    public PageInfo<Hotel> queryAll(Integer size) {
        PageHelper.startPage(size,10);
        List<Hotel> query = hotelDao.query(new Hotel());
        PageInfo<Hotel> hotelPageInfo = new PageInfo<>(query);
        List<Hotel> list = hotelPageInfo.getList();
        List<Hotel> list1 =new ArrayList<>();
        for (Hotel hotel1:list) {
            Area area = areaDao.queryOne(new Area(hotel1.getAreaId()));
            hotel1.setArea(area);
            list1.add(hotel1);
        }
        hotelPageInfo.setList(list1);
        return hotelPageInfo;
    }

    @Override
    public boolean insertHotel(Hotel hotel) {
        if (hotel == null) {
            return false;
        }
        Hotel hotel1 = new Hotel();
        hotel1.setHotelName(hotel.getHotelName());
        hotel1.setAreaId(hotel.getAreaId());
        if(query(hotel1)==null||query(hotel1).size()==0){
            return hotelDao.insertHotel(hotel);
        }
        else {
            return false;
        }

    }

    @Override
    public boolean deleteHotel(Hotel hotel) {
        if (hotel == null) {
            return false;
        }
        return hotelDao.deleteHotel(hotel);
    }

    @Override
    public boolean updateHotel(Hotel hotel) {
        if (hotel == null) {
            return false;
        }
        Hotel hotel1 =new Hotel(hotel.getAreaId(),hotel.getHotelName(),hotel.getHotelLevel());
        if(hotelDao.query(hotel1).size()==0||hotelDao.query(hotel1)==null){
            return hotelDao.updateHotel(hotel);
        }
        return false;

    }

    @Override
    public boolean updateNewHotel(Hotel hotel) {
        return false;
    }


    @Override
    public List<Hotel> queryAllByAreaId(Hotel hotel) {
        if (hotel==null){
            return null;
        }
        return hotelDao.queryAllByAreaId(hotel);
    }

    @Override
    public List<Hotel> queryHotelByArea(String city) {
        Area area =new Area();
        area.setCity(city);
        Area area1 = areaDao.queryOne(area);
        Hotel hotel =new Hotel();
        hotel.setAreaId(area1.getAreaId());
        return hotelDao.query(hotel);
    }

    @Override
    public List<Hotel> queryBySearch(String city, String inDate, String outDate, int num) {

        List<Hotel> hotelList =queryHotelByArea(city);
        List<Room> roomList = roomDao.query(new Room());
        List<Room> roomListRes = new ArrayList<>();
        for (Hotel hotel:hotelList) {
            for(Room room: roomList){
                if(hotel.getHotelId()==room.getHotelId()){
                    roomListRes.add(room);
                }
            }
        }

        List<Roomdetail> roomdetailList = roomDetailDao.query(new Roomdetail());
        List<Long> hotelIdList=new ArrayList<>();

        for(Room room:roomListRes){
            if(isRoomAvailable(inDate,outDate,num,room.getRoomId())){
                hotelIdList.add(room.getHotelId());
            }
        }

       /* Collections.sort(hotelIdList);*/
       List<Long> hotelIdList2 = Util.duplicateRemoval(hotelIdList);
        List<Hotel> hotelList1 =new ArrayList<>();
        for(Long l:hotelIdList2){
            Hotel hotel =new Hotel();
            hotel.setHotelId(l);
           hotelList1.add(hotelDao.queryOne(hotel));
        }

        return hotelList1;
    }

    /*根据入住时间、离店时间，入住人数，roomId返判断是否有房间可以入住*/
    @Override
    public boolean isRoomAvailable(String inDate, String outDate, int num,long roomId) {
        while (!inDate.equals(outDate)){
            Roomdetail roomdetail =new Roomdetail();
            roomdetail.setRoomDate(inDate);
            roomdetail.setRoomId(roomId);
/*            Roomdetail roomdetail1 = roomDetailDao.queryOne(roomdetail);*/
            List<Roomdetail> roomdetailList = roomDetailDao.query(roomdetail);
            Room room =new Room();
            room.setRoomId(roomId);
            Room room1 =roomDao.queryOne(room);
            long roomNum = room1.getRoomNumber();
            if(roomdetailList.size()==0){
                return false;
            }
            else {
                if(roomNum - roomdetailList.get(0).getRdNumber()<num){
                    return false;
                }
            }
            inDate = Util.addDay(inDate,1);
        }

        return true;
    }

    /*根据入住时间、离店时间，入住人数，hotelId返回最适合的roomDetail集合*/
    @Override
    public List<Roomdetail> searchSuitableRooms(String inDate, String outDate, int num, long hotelId) {
        Room room =new Room();
        room.setHotelId(hotelId);
        List<Room> roomList = roomDao.query(room);
        System.out.println("测试房间列表"+roomList);
        for (Room r:roomList) {
            if(r.getPersonLimit()==1){
                if(isRoomAvailable(inDate,outDate,num,r.getRoomId())){
                    System.out.println("标间");
                    System.out.println(queryByDateAndRid(inDate,outDate,r.getRoomId()));
                    return queryByDateAndRid(inDate,outDate,r.getRoomId());
                }
            }
        }

        for (Room r:roomList) {
            if(r.getPersonLimit()==2){
                if(isRoomAvailable(inDate,outDate,num,r.getRoomId())){
                    System.out.println("大床");
                    return queryByDateAndRid(inDate,outDate,r.getRoomId());
                }
            }
        }

        for (Room r:roomList) {
            if(r.getPersonLimit()==3){
                if(isRoomAvailable(inDate,outDate,num,r.getRoomId())){
                    System.out.println("豪华");
                    return queryByDateAndRid(inDate,outDate,r.getRoomId());
                }
            }
        }


        return null;
    }

    @Override
    public List<Roomdetail> queryByDateAndRid(String inDate, String outDate, long rid) {
        List<Roomdetail> list =new ArrayList<>();
        Roomdetail roomdetail = new Roomdetail();
        roomdetail.setRoomId(rid);
        while (!inDate.equals(outDate)) {
            roomdetail.setRoomDate(inDate);
            List<Roomdetail> roomdetailList = roomDetailDao.query(roomdetail);
            list.add(roomdetailList.get(0));
            inDate = Util.addDay(inDate,1);
        }
        return list;
    }



    @Override
    public Double calculate(List<Roomdetail> list) {
        Double money  = 0.0;
        for (Roomdetail r: list) {
            money += r.getRdPrice();
        }
        return money;
    }



}
