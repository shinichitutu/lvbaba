package com.lvbaba.service.impl;

import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import com.lvbaba.dao.AreaDao;
import com.lvbaba.dao.HotelDao;
import com.lvbaba.dao.RoomDao;
import com.lvbaba.dao.RoomDetailDao;
import com.lvbaba.entity.Area;
import com.lvbaba.entity.Hotel;
import com.lvbaba.entity.Room;
import com.lvbaba.entity.Roomdetail;
import com.lvbaba.service.HotelService;
import com.lvbaba.utli.Util;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;
import java.util.ArrayList;
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
    public List<Hotel> queryHotelByArea(String country, String city) {
        Area area =new Area();
        area.setCountry(country);
        area.setCity(city);
        Area area1 = areaDao.queryOne(area);
        Hotel hotel =new Hotel();
        hotel.setAreaId(area1.getAreaId());
        return hotelDao.query(hotel);
    }

    @Override
    public List<Hotel> queryBySearch(String country, String city, String inDate, String outDate, int num) {
        List<Hotel> hotelList =queryHotelByArea(country,city);
        List<Room> roomList = roomDao.query(new Room());
        List<Room> roomListRes = new ArrayList<>();
        for (Hotel hotel:hotelList) {
            for(Room room: roomList){
                if(hotel.getHotelId()==room.getHotelId()){
                    roomListRes.add(room);
                }
            }
        }

/*
        List<Roomdetail> roomdetailList = roomDetailDao.query(new Roomdetail());
        for(Room room:roomListRes){
            for(Roomdetail roomdetail:roomdetailList){
                if
            }
        }
*/

  return hotelList;


    }

    @Override
    public boolean isRoomAvailable(String inDate, String outDate, int num,long roomId) {
        while (!inDate.equals(outDate)){
            System.out.println(inDate);
            Roomdetail roomdetail =new Roomdetail();
            roomdetail.setRoomDate(inDate);
            roomdetail.setRoomId(roomId);
            Roomdetail roomdetail1 = roomDetailDao.queryOne(roomdetail);
            System.out.println(roomdetail1);
            Room room =new Room();
            room.setRoomId(roomId);
            Room room1 =roomDao.queryOne(room);
            long roomNum = room1.getRoomNumber();
            if(roomdetail1==null){
                System.out.println(1);
                return false;
            }
            else {
                if(roomNum - roomdetail1.getRdNumber()<num){
                    System.out.println(2);
                    return false;
                }
            }
            inDate = Util.addDay(inDate,1);

        }

        return true;
    }


}
