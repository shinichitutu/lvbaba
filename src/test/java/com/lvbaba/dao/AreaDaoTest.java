package com.lvbaba.dao;

import com.lvbaba.entity.Area;
import com.lvbaba.utli.DateUtil;
import junit.framework.TestCase;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import javax.annotation.Resource;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Calendar;
import java.util.Date;
import java.util.List;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration("classpath:applicationContext.xml")
public class AreaDaoTest extends TestCase {
    @Resource
    private AreaDao areaDao;

    @Test
    public void testQuery() {
        Area area = new Area();
        area.setCountry("中国");
        List<Area> areaList = areaDao.query(area);

    }
    @Test
    public void testDate() throws ParseException {
        System.out.println(DateUtil.compareDate("2020-12-13","2020-12-12"));
    }
}