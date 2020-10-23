package com.lvbaba.dao;

import com.lvbaba.entity.Userorder;

import java.util.List;

/**
 * Created by shinichi on 2020/10/23.
 */
public interface UserorderDao {

    Userorder queryOne(Userorder userorder);

    List<Userorder> query(Userorder userorder);

    boolean insertUserorder(Userorder userorder);

    boolean deleteUserorder(Userorder userorder);

    boolean updateUserorder(Userorder userorder);
}
