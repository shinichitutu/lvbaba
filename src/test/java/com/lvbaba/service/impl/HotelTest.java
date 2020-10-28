package com.lvbaba.service.impl;

import com.lvbaba.dao.HotelDao;
import com.lvbaba.entity.Hotel;
import com.lvbaba.util.CountNum;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import javax.annotation.Resource;

/**
 * Created by YY on 2020/10/27.
 */
@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration("classpath:applicationContext.xml")
public class HotelTest {
    @Resource
    private HotelDao hotelDao;
    @Test
    public void testHotel(){
        
    }
}
