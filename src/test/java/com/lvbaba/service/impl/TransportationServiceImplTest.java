package com.lvbaba.service.impl;

import com.lvbaba.entity.Flight;
import com.lvbaba.service.TransportationService;
import junit.framework.TestCase;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import javax.annotation.Resource;
import java.util.List;


@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration("classpath:applicationContext.xml")
public class TransportationServiceImplTest extends TestCase {

    @Resource
    private TransportationService transportationService;

    @Test
    public void testQueryAllFlight(){
        List<Flight> flightList = transportationService.queryAllFlight();
    }
}