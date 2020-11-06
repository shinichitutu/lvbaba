package com.lvbaba.service.impl;

import com.lvbaba.entity.User;
import com.lvbaba.service.UserOrderService;
import com.lvbaba.service.UserService;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;
import org.springframework.web.bind.annotation.RequestMapping;

import javax.annotation.Resource;

import static org.junit.Assert.*;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration("classpath:applicationContext.xml")
public class UserServiceImplTest {
    @Resource
    UserService userService;

    @Resource
    UserOrderService userOrderService;

    @Test
    public void test(){
        User user = new User();
        user.setuUsername("zhangsan");
        User user1 = userService.queryByUserName(user);
        assertNotNull(user1);
    }

    @Test
    public void test1(){
        System.out.println(userOrderService.addOrder(11L));

    }
}