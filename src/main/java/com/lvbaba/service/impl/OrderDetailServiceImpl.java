package com.lvbaba.service.impl;

import com.lvbaba.dao.OrderdetailDao;
import com.lvbaba.entity.Orderdetail;
import com.lvbaba.service.OrderDetailService;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;
import java.util.List;

/**
 * Created by YY on 2020/11/4.
 */
@Service("orderDetaoilService")
public class OrderDetailServiceImpl implements OrderDetailService{
    @Resource
    private OrderdetailDao orderdetailDao;

    @Override
    public boolean insertOrderDetail(Orderdetail orderdetail) {
        return orderdetailDao.insertOrderDetail(orderdetail);
    }

    @Override
    public boolean updateOrderDatailById(Orderdetail orderdetail) {
        return orderdetailDao.updateOrderDatailById(orderdetail);
    }

    @Override
    public boolean deleteOrderDatailById(Orderdetail orderdetail) {
        return orderdetailDao.deleteOrderDatailById(orderdetail);
    }

    @Override
    public List<Orderdetail> queryOrderDatailByOId(Orderdetail orderdetail) {
        return orderdetailDao.queryOrderDatailByOId(orderdetail);
    }

    @Override
    public List<Orderdetail> query() {
        return orderdetailDao.query();
    }
}
