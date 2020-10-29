package com.lvbaba.service;

import com.github.pagehelper.PageInfo;
import com.lvbaba.entity.Hotel;

import java.util.List;

/**
 * Created by shinichi on 2020/10/23.
 */
public interface HotelService {

    Hotel queryOne(Hotel hotel);

    List<Hotel> query(Hotel hotel);

    PageInfo<Hotel> queryAll(Integer size);

    boolean insertHotel(Hotel hotel);

    boolean deleteHotel(Hotel hotel);

    boolean updateHotel(Hotel hotel);

    boolean updateNewHotel(Hotel hotel);

    /**
     * 根据目的地Id返回对应目的地的酒店列表，json数据
     * @return
     */
    List<Hotel> queryAllByAreaId(Hotel hotel);

}
