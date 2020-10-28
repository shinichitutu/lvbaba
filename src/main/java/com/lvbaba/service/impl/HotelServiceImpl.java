package com.lvbaba.service.impl;

import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import com.lvbaba.dao.AreaDao;
import com.lvbaba.dao.HotelDao;
import com.lvbaba.entity.Area;
import com.lvbaba.entity.Hotel;
import com.lvbaba.service.HotelService;
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
        hotel1.sethName(hotel.gethName());
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
        Hotel hotel1 =new Hotel(hotel.getAreaId(),hotel.gethName(),hotel.gethLevel());
        if(hotelDao.query(hotel1).size()==0||hotelDao.query(hotel1)==null){
            return hotelDao.updateHotel(hotel);
        }
        return false;

    }

}
