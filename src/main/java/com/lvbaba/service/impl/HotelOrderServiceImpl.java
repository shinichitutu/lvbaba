package com.lvbaba.service.impl;

import com.lvbaba.dao.HotelOrderDao;
import com.lvbaba.entity.HotelOrder;
import com.lvbaba.service.HotelOrderService;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;
import java.util.List;

/**
 * Created by YY on 2020/11/3.
 */
@Service("hotelOrderService")
public class HotelOrderServiceImpl implements HotelOrderService{
    @Resource
    private HotelOrderDao hotelOrderDao;

    @Override
    public boolean insertHotelOrder(HotelOrder hotelOrder) {
        return hotelOrderDao.insertHotelOrder(hotelOrder);
    }

    @Override
    public boolean updateHotelOrder(HotelOrder hotelOrder) {
        return hotelOrderDao.updateHotelOrder(hotelOrder);
    }

    @Override
    public boolean removeHotelOrder(HotelOrder hotelOrder) {
        return hotelOrderDao.removeHotelOrder(hotelOrder);
    }

    @Override
    public HotelOrder queryOne(HotelOrder hotelOrder) {
        return hotelOrderDao.queryOne(hotelOrder);
    }

    @Override
    public List<HotelOrder> query() {
        return hotelOrderDao.query();
    }

    @Override
    public List<HotelOrder> query(HotelOrder hotelOrder) {
        return hotelOrderDao.query(hotelOrder);
    }
}
