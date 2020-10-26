package com.lvbaba.service.impl;

import com.lvbaba.dao.RoomDao;
import com.lvbaba.entity.Room;
import com.lvbaba.service.RoomService;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;
import java.util.List;

/**
 * Created by shinichi on 2020/10/26.
 */

@Service
public class RoomServiceImpl implements RoomService {
    @Resource
    private RoomDao roomDao;

    @Override
    public Room queryOne(Room room) {
        if(room==null){
            return null;
        }
        return roomDao.queryOne(room);
    }

    @Override
    public List<Room> query(Room room) {
        if(room==null){
            return null;
        }
        return roomDao.query(room);
    }

    @Override
    public boolean insertRoom(Room room) {
        if(room==null){
            return false;
        }
        return roomDao.insertRoom(room);
    }

    @Override
    public boolean deleteRoom(Room room) {
        if(room==null){
            return false;
        }
        return roomDao.deleteRoom(room);
    }

    @Override
    public boolean updateRoom(Room room) {
        if(room==null){
            return false;
        }
        return roomDao.updateRoom(room);
    }
}
