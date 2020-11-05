package com.lvbaba.service;

import com.lvbaba.entity.Orderdetail;

import java.util.List;

/**
 * Created by YY on 2020/11/4.
 */
public interface OrderDetailService {
    /**
     * 向OrderDetail表中插入数据
     * @param orderdetail
     * @return
     */
    boolean insertOrderDetail(Orderdetail orderdetail);

    /**
     * 通过主键id更新OrderDetail表中信息
     * @param orderdetail
     * @return
     */
    boolean updateOrderDatailById(Orderdetail orderdetail);

    /**
     * 通过主键id删除OrderDetail表中信息
     * @param orderdetail
     * @return
     */
    boolean deleteOrderDatailById(Orderdetail orderdetail);

    /**
     * 通过订单的id查找满足条件的所有订单详情信息
     * @param orderdetail
     * @return
     */
    List<Orderdetail> queryOrderDatailByOId(Orderdetail orderdetail);
    /**
     * 查询所有订单
     * @return
     */
    List<Orderdetail> query();
}
