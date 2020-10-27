package com.lvbaba.service.impl;

import com.lvbaba.dao.RoomDao;
import com.lvbaba.dao.RoomDetailDao;
import com.lvbaba.entity.Room;
import com.lvbaba.entity.Roomdetail;
import com.lvbaba.service.RoomDetailService;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;
import java.util.ArrayList;
import java.util.List;

/**
 * Created by shinichi on 2020/10/26.
 */
@Service("roomDetailService")
public class RoomDetailServiceImpl implements RoomDetailService {
    @Resource
    private RoomDetailDao roomDetailDao;

    @Resource
    private RoomDao roomDao;

    @Override
    public Roomdetail queryOne(Roomdetail roomdetail) {
        if(roomdetail==null){
            return null;
        }
        return roomDetailDao.queryOne(roomdetail);
    }

    @Override
    public List<Roomdetail> query(Roomdetail roomdetail) {
        if(roomdetail==null){
            return null;
        }
        List<Roomdetail> list = roomDetailDao.query(roomdetail);
        List<Roomdetail> list1 = new ArrayList<>();
        for (Roomdetail r:list){
            r.setRoom(roomDao.queryOne(new Room(r.getrId())));
            list1.add(r);
        }
        return list1;
    }

    @Override
    public boolean insertRoomDetail(Roomdetail roomdetail) {
        if(roomdetail==null){
            return false;
        }
        return roomDetailDao.insertRoomDetail(roomdetail);
    }

    @Override
    public boolean deleteRoomDetail(Roomdetail roomdetail) {
        if(roomdetail==null){
            return false;
        }
        return roomDetailDao.insertRoomDetail(roomdetail);
    }

    @Override
    public boolean updateRoomDetail(Roomdetail roomdetail) {
        if(roomdetail==null){
            return false;
        }
        return roomDetailDao.updateRoomDetail(roomdetail);
    }
}
