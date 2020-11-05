package com.lvbaba.dao;

import com.lvbaba.entity.Userorder;

import java.util.List;

/**
 * Created by shinichi on 2020/10/23.
 */
public interface UserorderDao {
    /**
     * 查询单个订单表
     * @param userorder
     * @return
     */
    Userorder queryOne(Userorder userorder);

    /**
     * 查询关于用户的所有订单
     * @param userorder
     * @return
     */
    List<Userorder> query(Userorder userorder);

    /**
     * 管理员查询所有订单
     * @return
     */
    List<Userorder> queryAll();

    /**
     * 增加订单
     * @param userorder
     * @return
     */
    boolean insertUserorder(Userorder userorder);

    /**
     * 删除订单
     * @param userorder
     * @return
     */
    boolean deleteUserorder(Userorder userorder);

    /**
     * 更新订单详情
     * @param userorder
     * @return
     */
    boolean updateUserorder(Userorder userorder);

    /**
     * 查询关于用户的所有订单,用户用户旅行订单记录的表的展示
     * @param userId
     * @return
     */
    List<Userorder> queryUserOrdersByUserId(Long userId);
}
