package com.lvbaba.dao;

import com.alibaba.fastjson.JSON;
import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import com.lvbaba.entity.Tour;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import javax.annotation.Resource;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import static org.junit.Assert.*;

/**
 * Created by YY on 2020/10/27.
 */
@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration("classpath:applicationContext.xml")
public class TourDaoTest {

    @Resource
    private TourDao tourDao;

    @Test
    public void queryAll() throws Exception {
        PageHelper.startPage(1,2);
        List<Tour> tourList = tourDao.queryAll();
        PageInfo<Tour> tourPageInfo = new PageInfo<>(tourList);
    }

}