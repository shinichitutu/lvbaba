package com.lvbaba.service.impl;

import com.lvbaba.entity.User;
import com.lvbaba.service.UserService;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import javax.annotation.Resource;

import static org.junit.Assert.*;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration("classpath:applicationContext.xml")
public class UserServiceImplTest {
    @Resource
    UserService userService;
    @Test
    public void test(){
        User user = new User();
        user.setUUsername("zhangsan");
        User user1 = userService.queryByUserName(user);
        System.out.println(user1);
        assertNotNull(user1);
    }
}