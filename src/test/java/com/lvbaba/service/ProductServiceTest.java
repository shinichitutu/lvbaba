package com.lvbaba.service;

import com.lvbaba.entity.Product;
import junit.framework.TestCase;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import javax.annotation.Resource;
import java.util.Calendar;
import java.util.Date;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration("classpath:applicationContext.xml")
public class ProductServiceTest extends TestCase {
    @Resource
    private ProductService productService;

    @Test
    public void testINser() {
        Calendar calendar=Calendar.getInstance();
        Date nowTime=calendar.getTime();
        System.out.println(nowTime);
        //减填负数
        calendar.add(Calendar.HOUR, 10);
        nowTime=calendar.getTime();
        System.out.println(nowTime);
    }

}