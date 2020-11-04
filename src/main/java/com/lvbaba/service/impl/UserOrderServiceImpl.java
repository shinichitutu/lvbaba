package com.lvbaba.service.impl;

import com.lvbaba.dao.UserorderDao;
import com.lvbaba.entity.Userorder;
import com.lvbaba.service.UserOrderService;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;
import java.util.List;

/**
 * Created by YY on 2020/11/4.
 */
@Service("userOrderService")
public class UserOrderServiceImpl implements UserOrderService{
    @Resource
    private UserorderDao userorderDao;
    @Override
    public Userorder queryOne(Userorder userorder) {
        return userorderDao.queryOne(userorder);
    }

    @Override
    public List<Userorder> query(Userorder userorder) {
        return userorderDao.query(userorder);
    }

    @Override
    public List<Userorder> queryAll() {
        return userorderDao.queryAll();
    }

    @Override
    public boolean insertUserorder(Userorder userorder) {
        return userorderDao.insertUserorder(userorder);
    }

    @Override
    public boolean deleteUserorder(Userorder userorder) {
        return userorderDao.deleteUserorder(userorder);
    }

    @Override
    public boolean updateUserorder(Userorder userorder) {
        return userorderDao.updateUserorder(userorder);
    }
}
