package com.lvbaba.service.impl;

import com.lvbaba.dao.AreaDao;
import com.lvbaba.dao.HotelDao;
import com.lvbaba.entity.Area;
import com.lvbaba.entity.Hotel;

import com.lvbaba.entity.Product;
import com.lvbaba.entity.Roomdetail;
import com.lvbaba.service.AreaService;
import com.lvbaba.service.HotelService;
import com.lvbaba.service.ProductService;
import com.lvbaba.service.RoomDetailService;

import com.lvbaba.utli.Util;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import javax.annotation.Resource;
import java.util.ArrayList;
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

    @Resource
    private ProductService productService;

    @Resource
    private HotelService hotelService;


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

    @Test
    public void testFindProduct(){

        System.out.println(productService.queryByAreaName("上海","北京"));
    }

    @Test
    public void testDate(){
        String date = Util.addDay("2020-10-25",1);
        System.out.println(date);
    }

    @Test
    public void testRoom(){
        System.out.println(hotelService.isRoomAvailable("2020-10-22","2020-10-25",2,1));
    }

    @Test
    public void testHotelSearch(){
        System.out.println(hotelService.queryBySearch("1","2020-10-22","2020-10-26",2));
    }

    @Test
    public void quchong(){
        List<Long> list =new ArrayList<>();
        list.add(Long.valueOf("5"));
        list.add(Long.valueOf("6"));
        list.add(Long.valueOf("6"));
        list.add(Long.valueOf("9"));
        list.add(Long.valueOf("6"));

/*        System.out.println(list.get(2).equals(list.get(1)));*/
        System.out.println(Util.duplicateRemoval(list));
    }


}
