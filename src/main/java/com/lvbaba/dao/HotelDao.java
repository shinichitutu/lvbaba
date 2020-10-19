package com.lvbaba.dao;

import com.lvbaba.entity.Hotel;

import java.util.List;

/**
 * Created by shinichi on 2020/10/16.
 */


public interface HotelDao {
    Hotel queryByhId(int hId);
    List<Hotel> query(Hotel hotel);
}
