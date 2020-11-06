package com.lvbaba.service;

import com.lvbaba.entity.Roomdetail;
import com.lvbaba.entity.Userorder;

import java.util.List;

/**
 * Created by YY on 2020/11/4.
 */
public interface UserOrderService {
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

    /**
     * 通过订单Id退团
     * @param orderId
     * @return
     */
    boolean returnOrder(Long orderId);


    /**
     * 根据用户订单退款
     * @param userorder
     * @return
     */
    boolean refund(Userorder userorder);

    boolean addOrder(Long orderId);

    List<Roomdetail> queryByDateAndRid(String inDate, String outDate, long rid);

    boolean updateRoomBookingNumber(Long orderId,int type);

    boolean cancelOrders(Long tourId);



}
