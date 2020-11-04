package com.lvbaba.service;

import com.lvbaba.entity.Orderdetail;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import javax.annotation.Resource;
import java.util.List;

/**
 * Created by YY on 2020/11/4.
 */
@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration("classpath:applicationContext.xml")
public class OrderDetailServiceTest {
    @Resource
    private OrderDetailService orderDetailService;

    /**
     * 测试查询订单
     */
    @Test
    public void query(){
        List<Orderdetail> list=orderDetailService.query();
        list.forEach(System.out::println);
    }
}
