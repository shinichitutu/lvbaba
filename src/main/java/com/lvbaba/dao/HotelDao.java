package com.lvbaba.dao;

import com.lvbaba.entity.Hotel;
import com.lvbaba.entity.Room;

import java.util.List;

/**
 * Created by shinichi on 2020/10/23.
 */

public interface HotelDao {



    Hotel queryOne(Hotel hotel);

    List<Hotel> query(Hotel hotel);

    boolean insertHotel(Hotel hotel);

    boolean deleteHotel(Hotel hotel);

    boolean updateHotel(Hotel hotel);

}
