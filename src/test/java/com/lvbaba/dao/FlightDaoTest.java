package com.lvbaba.dao;

import com.lvbaba.entity.Flight;
import junit.framework.TestCase;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import javax.annotation.Resource;
import java.util.List;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration("classpath:applicationContext.xml")
public class FlightDaoTest extends TestCase {

    @Resource
    private FlightDao flightDao;

    @Test
    public void testFlightAndArea(){
        List<Flight> flightList = flightDao.queryAllFlight();
    }

}