package com.lvbaba.dao;

import com.lvbaba.entity.Admin;
import com.lvbaba.entity.User;
import org.springframework.stereotype.Repository;

@Repository
public interface AdminDao {
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
}
