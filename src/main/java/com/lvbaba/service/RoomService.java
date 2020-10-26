package com.lvbaba.service;

import com.lvbaba.entity.Room;

import java.util.List;

/**
 * Created by shinichi on 2020/10/26.
 */

public interface RoomService {

    Room queryOne(Room room);

    List<Room> query(Room room);

    boolean insertRoom(Room room);

    boolean deleteRoom(Room room);

    boolean updateRoom(Room room);
}
