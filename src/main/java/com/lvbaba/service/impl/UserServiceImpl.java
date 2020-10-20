package com.lvbaba.service.impl;

import com.lvbaba.dao.AdminDao;
import com.lvbaba.dao.UserDao;
import com.lvbaba.dao.UserInfoDao;
import com.lvbaba.entity.Admin;
import com.lvbaba.entity.User;
import com.lvbaba.entity.Userinfo;
import com.lvbaba.service.UserService;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;
import java.util.List;

/**
 * @author DBY
 * @date 2020/10/16 17:25
 */
@Service("userService")
public class UserServiceImpl implements UserService {
    @Resource
    private UserDao userDao;
    @Resource
    private UserInfoDao userInfoDao;
    @Resource
    private AdminDao adminDao;

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

    @Override
    public boolean insertUserInfo(Userinfo userinfo) {
        if (null==userinfo){
            return false;
        }
        return userInfoDao.insertUserInfo(userinfo);
    }

    @Override
    public boolean updateUserInfoById(Userinfo userinfo) {
        if (null==userinfo){
            return false;
        }
        return userInfoDao.updateUserInfoById(userinfo);
    }

    @Override
    public boolean deleteUserInfoById(Userinfo userinfo) {
        if (null==userinfo){
            return false;
        }
        return userInfoDao.deleteUserInfoById(userinfo);
    }

    @Override
    public List<Userinfo> queryAllByUid(Userinfo userinfo) {
        if (null==userinfo){
            return null;
        }
        return userInfoDao.queryAllByUid(userinfo);
    }

    @Override
    public User queryByAdminName(Admin admin) {
        if (null==admin){
            return null;
        }
        return adminDao.queryByAdminName(admin);
    }

    @Override
    public boolean insertAdmin(Admin admin) {
        if (null==admin){
            return false;
        }
        return adminDao.insertAdmin(admin);
    }

    @Override
    public boolean updateAdmin(Admin admin) {
        if (null==admin){
            return false;
        }
        return adminDao.updateAdmin(admin);
    }
    

}
