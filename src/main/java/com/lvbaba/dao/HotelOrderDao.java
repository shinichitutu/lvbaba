package com.lvbaba.dao;

import com.lvbaba.entity.HotelOrder;

import java.util.List;

/**
 * Created by YY on 2020/11/3.
 */
public interface HotelOrderDao {
    /**
     * 增加酒店订单
     * @param hotelOrder
     * @return
     */
    boolean insertHotelOrder(HotelOrder hotelOrder);
    /**
     * 更新酒店订单
     * @param hotelOrder
     * @return
     */
    boolean updateHotelOrder(HotelOrder hotelOrder);
    /**
     * 删除酒店订单
     * @param hotelOrder
     * @return
     */
    boolean removeHotelOrder(HotelOrder hotelOrder);

    /**
     * 查询单个酒店订单
     * @param hotelOrder
     * @return
     */
    HotelOrder queryOne(HotelOrder hotelOrder);

    /**
     * 查询所有订单
     * @return
     */
    List<HotelOrder> query();

    /**
     * 根据条件查询所有订单
     * @param hotelOrder
     * @return
     */
    List<HotelOrder> query(HotelOrder hotelOrder);
}
