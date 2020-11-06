package com.lvbaba.service;

import com.lvbaba.entity.Admin;
import com.lvbaba.entity.User;
import com.lvbaba.entity.Userinfo;

import java.util.List;

public interface UserService {
    /**
     * 通过传递的UserName返回该账号的所有信息
     * @param user
     * @return
     */
    User queryByUserName(User user);

    /**
     * 注册账号
     * @param user
     * @return
     */
    boolean registerUser(User user);

    /**
     * 通过用户Id更新用户的所有信息，其中余额的更新时通过传递正值（充值+1）与负值（消费-1）来进行的
     * @param user
     * @return
     */
    boolean updateUser(User user);

    /**
     * 向用户信息表中插入用户详细信息
     * @param userinfo
     * @return
     */
    boolean insertUserInfo(Userinfo userinfo);

    /**
     * 向用户详情表中更新用户信息
     * @param userinfo
     * @return
     */
    boolean updateUserInfoById(Userinfo userinfo);

    /**
     * 通过主键ID删除用户信息
     * @param userinfo
     * @return
     */
    boolean deleteUserInfoById(Userinfo userinfo);

    /**
     * 通过用户Id返回用户（userinfo）表的对应信息
     * @param userinfo
     * @return
     */
    List<Userinfo> queryAllByUid(Userinfo userinfo);

    /**
     * 通过userInfoId查询对应的userInfo信息
     * @param UiId
     * @return
     */
    Userinfo queryUserInfoByUiId(Long uiId);

    /**
     * 通过用户的登录用户名查询返回该用户的所有信息
     * @param admin
     * @return
     */
    User queryByAdminName(Admin admin);

    /**
     * 向Admin表中插入新的Admin数据（注册）
     * @param admin
     * @return
     */
    boolean insertAdmin(Admin admin);

    /**
     * 通过触底的Admin对象，更新所有的Admin字段
     * @param admin
     * @return
     */
    boolean updateAdmin(Admin admin);


    /*根据订单的金额--money判断余额是否足够*/
    boolean isBalanceEnough(User user,Double money);


}
