package com.lvbaba.dao;

import com.lvbaba.entity.Flight;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import javax.annotation.Resource;

import static org.junit.Assert.*;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration("classpath:applicationContext.xml")
public class FlightDaoTest {
    @Resource
    private FlightDao flightDao;

    @Test
    public void testQuery(){
        Flight flight = new Flight();
        flight.setFNumber("东航00001");
        flight.setFCompany("东方航空");
        flight.setFDTime("2020-10-20 16:32");
        flight.setFATime("2020-10-20 19:32");
        flight.setDAId(1);
        flight.setAAreaId(101);
        flight.setAAreaId(101);
        flight.setFPrice(99.99);
        System.out.println(flightDao.insertFlight(flight));
    }
}