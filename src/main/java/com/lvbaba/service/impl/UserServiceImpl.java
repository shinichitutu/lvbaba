package com.lvbaba.service.impl;

import com.lvbaba.dao.UserDao;
import com.lvbaba.entity.User;
import com.lvbaba.service.UserService;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;

/**
 * @author DBY
 * @date 2020/10/16 17:25
 */
@Service("userService")
public class UserServiceImpl implements UserService {
    @Resource
    private UserDao userDao;
    @Override
    public User queryByUserName(User user) {
        if (null==user) {
            return null;
        }
        return userDao.queryByUserName(user);
    }

    @Override
    public boolean registerUser(User user) {
        if (null==user){
            return false;
        }
        return userDao.insertUser(user);
    }

    @Override
    public boolean updateUser(User user) {
        if (null==user){
            return false;
        }
        return userDao.updateUser(user);
    }
}
