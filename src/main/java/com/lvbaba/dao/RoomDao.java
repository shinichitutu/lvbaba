package com.lvbaba.dao;

import com.lvbaba.entity.Room;

import java.util.List;

/**
 * Created by shinichi on 2020/10/23.
 */
public interface RoomDao {

    Room queryOne(Room room);

    List<Room> query(Room room);

    boolean insertRoom(Room room);

    boolean deleteRoom(Room room);

    boolean updateRoom(Room room);
}
