package com.lvbaba.dao;

import com.lvbaba.entity.HotelOrder;
import com.lvbaba.service.HotelOrderService;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import javax.annotation.Resource;

/**
 * Created by YY on 2020/11/3.
 */
@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration("classpath:applicationContext.xml")
public class HotelOrderTest {
    @Resource
    private HotelOrderService hotelOrderService;

    /**
     * 增加
     */
    @Test
    public void insert(){
        HotelOrder hotelOrder=new HotelOrder();
        hotelOrder.setUserId(1);
        hotelOrder.setRoomId(1);
        hotelOrder.setInDate("1");
        hotelOrder.setOutDate("1");
        hotelOrder.setHotelBookingDate(1);
        hotelOrder.setRoomNum(1);
        hotelOrder.setHoPrice(1);
        for (int i=0;i<10;i++){
            System.out.println(hotelOrderService.insertHotelOrder(hotelOrder));
        }
    }

    /**
     * 更新
     */
    @Test
    public void update(){
        HotelOrder hotelOrder=new HotelOrder();
        hotelOrder.setHoId(1);
        hotelOrder.setUserId(2);
        System.out.println(hotelOrderService.updateHotelOrder(hotelOrder));
    }

    /**
     * 删除
     */
    @Test
    public void remove(){
        HotelOrder hotelOrder=new HotelOrder();
        hotelOrder.setHoId(10);
        System.out.println(hotelOrderService.removeHotelOrder(hotelOrder));
    }

    /**
     * 查询单个
     */
    @Test
    public void queryOne(){
        HotelOrder hotelOrder=new HotelOrder();
        hotelOrder.setHoId(1);
        System.out.println(hotelOrderService.queryOne(hotelOrder));
    }

    /**
     * 查询所有测试
     * 查询所有条件
     */
    @Test
    public void queryAll(){
        hotelOrderService.query().forEach(System.out::println);
    }

    /**
     * 根据条件查询
     */
    @Test
    public void queryAllBy(){
        HotelOrder hotelOrder=new HotelOrder();
        hotelOrder.setHoPrice(1);
        hotelOrderService.query(hotelOrder).forEach(System.out::println);
    }
}
