package com.lvbaba.service;

import com.lvbaba.entity.Roomdetail;

import java.util.List;

/**
 * Created by shinichi on 2020/10/26.
 */
public interface RoomDetailService {

    Roomdetail queryOne(Roomdetail roomdetail);

    List<Roomdetail> query(Roomdetail roomdetail);

    boolean insertRoomDetail(Roomdetail roomdetail);

    boolean deleteRoomDetail(Roomdetail roomdetail);

    boolean updateRoomDetail(Roomdetail roomdetail);
}
