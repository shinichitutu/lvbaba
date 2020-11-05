package com.lvbaba.dao;

import com.lvbaba.entity.User;
import com.lvbaba.entity.Userinfo;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public interface UserInfoDao {
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
     * @param uiId
     * @return
     */
    Userinfo queryUserInfoByUiId(Long uiId);
}
