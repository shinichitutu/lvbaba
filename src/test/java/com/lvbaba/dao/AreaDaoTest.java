package com.lvbaba.dao;

import com.lvbaba.entity.Area;
import junit.framework.TestCase;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import javax.annotation.Resource;
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
        areaList.forEach(System.out::println);
    }
}