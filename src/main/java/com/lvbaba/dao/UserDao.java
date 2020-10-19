package com.lvbaba.dao;

import com.lvbaba.entity.User;
import org.springframework.stereotype.Repository;

@Repository
public interface UserDao {
    /**
     * 通过用户的登录用户名查询返回该用户的所有信息
     * @param user
     * @return
     */
    User queryByUserName(User user);

    /**
     * 向user表中插入新的User数据（注册）
     * @param user
     * @return
     */
    boolean insertUser(User user);

    /**
     * 通过触底的User对象，更新所有的User字段，可以是个别或者全部，余额更新时，如果是充值就传入正的值（+1），
     * 如果是消费的就传入负值（-1）
     * @param user
     * @return
     */
    boolean updateUser(User user);
}
