package com.lvbaba.dao;

import com.lvbaba.entity.Traindetail;
import junit.framework.TestCase;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import javax.annotation.Resource;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration("classpath:applicationContext.xml")
public class TraindetailDaoTest extends TestCase {
    @Resource
    private TraindetailDao trainDetailDao;

    @Test
    public void testInsertTraindetail() {
        Traindetail traindetail = new Traindetail();
        traindetail.setTrId(1);
        traindetail.setTdDate("2020-9-1");
        boolean b = trainDetailDao.insertTraindetail(traindetail);
        System.out.println(b);
    }
}