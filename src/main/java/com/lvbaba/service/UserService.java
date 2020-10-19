package com.lvbaba.service;

import com.lvbaba.entity.User;

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
}
