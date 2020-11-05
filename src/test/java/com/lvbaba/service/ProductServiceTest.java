package com.lvbaba.service;

import com.lvbaba.entity.Product;
import com.lvbaba.entity.Userorder;
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

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration("classpath:applicationContext.xml")
public class ProductServiceTest extends TestCase {
    @Resource
    private ProductService productService;

    @Test
    public void testINser() {
        Calendar calendar=Calendar.getInstance();
        Date nowTime=calendar.getTime();
        //减填负数
        calendar.add(Calendar.HOUR, 10);
        nowTime=calendar.getTime();
    }
    @Test
    /*退款*/
    public void refund() throws ParseException {
        Date date=new Date();
        SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
        String dateString="2020-10-31";
        Date date2=sdf.parse(dateString);
        double d=(date.getTime()-date2.getTime())/(1000*60*60*24);
        System.out.println(d);
        if(d>=0 && d<=3){
            System.out.println(0.5);
        }else if(d>3 && d<=10){
            System.out.println(0.3);
        }else if(d>10 && d<30){
            System.out.println(0.2);
        } else {
            System.out.println(0.1);
        }
    }
}