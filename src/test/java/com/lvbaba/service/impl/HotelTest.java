package com.lvbaba.service.impl;

import com.lvbaba.dao.AreaDao;
import com.lvbaba.dao.HotelDao;
import com.lvbaba.entity.Area;
import com.lvbaba.entity.Hotel;

import com.lvbaba.entity.Roomdetail;
import com.lvbaba.service.AreaService;
import com.lvbaba.service.RoomDetailService;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import javax.annotation.Resource;
import java.util.List;

/**
 * Created by YY on 2020/10/27.
 */
@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration("classpath:applicationContext.xml")
public class HotelTest {

    @Resource
    private AreaService areaService;

    @Resource
    private RoomDetailService roomDetailService;


    @Test
    public void testHotel(){
        Area area =new Area();
        area.setCountry("中国");

    }
  
    @Test
    public void testDelete(){
        Roomdetail roomdetail =new Roomdetail();
        roomdetail.setRdId(1);
        System.out.println(roomDetailService.deleteRoomDetail(roomdetail));}




}
