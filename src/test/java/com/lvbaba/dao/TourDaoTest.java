package com.lvbaba.dao;

import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import com.lvbaba.entity.Ticketrecord;
import com.lvbaba.entity.Tour;
import com.lvbaba.utli.Util;
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
public class TourDaoTest {

    @Resource
    private TourDao tourDao;


    @Resource
    private TicketrecordDao ticketrecordDao;


    @Test
    public void queryAll() throws Exception {
        PageHelper.startPage(1,2);
        List<Tour> tourList = tourDao.queryAll();
        PageInfo<Tour> tourPageInfo = new PageInfo<>(tourList);
    }

    @Test
    public void test(){
        System.out.println("测试");
        System.out.println(ticketrecordDao.queryOneByFdrId(6L));
        Ticketrecord tkr = new Ticketrecord();
        tkr.setFdrId(6L);
        tkr.setRecordStatus("已退票");
        tkr.setModifyDate(Util.getCurrentDate());
        System.out.println(ticketrecordDao.updateTicketRecordByFdrId(tkr));
        System.out.println(ticketrecordDao.queryOneByFdrId(6L));


    }

}