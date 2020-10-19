package com.lvbaba.dao;

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
public class UserDaoTest {
    @Resource
    UserDao userDao;

    @Test
    public  void testLogin(){
        User user = new User();
        user.setUUsername("wangerhu");
        user.setUName("王二虎");
        user.setUPassword("123");
        user.setUId(3);
        User user1 = userDao.queryByUserName(user);
        System.out.println(user1);
        assertNotNull(user1);
    }
}