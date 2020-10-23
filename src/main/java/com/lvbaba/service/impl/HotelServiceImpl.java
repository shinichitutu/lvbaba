package com.lvbaba.service.impl;

import com.lvbaba.dao.HotelDao;
import com.lvbaba.entity.Hotel;
import com.lvbaba.service.HotelService;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;
import java.util.List;

/**
 * Created by shinichi on 2020/10/23.
 */
@Service
public class HotelServiceImpl implements HotelService {
    @Resource
    private HotelDao hotelDao;



    @Override
    public Hotel queryOne(Hotel hotel) {
        if (hotel == null) {
            return null;
        }
        return hotelDao.queryOne(hotel);

    }

    @Override
    public List<Hotel> query(Hotel hotel) {
        if(hotel == null){
            return null;
        }
        return hotelDao.query(hotel);
    }

    @Override
    public boolean insertHotel(Hotel hotel) {
        if(hotel==null){
            return false;
        }
        return hotelDao.insertHotel(hotel);
    }

    @Override
    public boolean deleteHotel(Hotel hotel) {
        if(hotel==null){
            return false;
        }
        return hotelDao.deleteHotel(hotel);
    }

    @Override
    public boolean updateHotel(Hotel hotel) {
        if(hotel==null) {
            return false;
        }
         return hotelDao.updateHotel(hotel);
    }

}
