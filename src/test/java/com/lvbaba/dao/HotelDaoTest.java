package com.lvbaba.dao;

import com.lvbaba.entity.Hotel;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import javax.annotation.Resource;
import java.util.List;

/**
 * Created by shinichi on 2020/10/23.
 */
@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration("classpath:applicationContext.xml")

public class HotelDaoTest {

    @Resource
    private HotelDao hotelDao;

    @Test
    public void test(){
        Hotel hotel = new Hotel();
        hotel.setHId(1);
        System.out.println(hotelDao.queryOne(hotel));
    }

    @Test
    public void testAll(){
        Hotel hotel = new Hotel();
        List<Hotel> list = hotelDao.query(hotel);
        for (Hotel h:list) {
            System.out.println(h);
        }
    }

}
