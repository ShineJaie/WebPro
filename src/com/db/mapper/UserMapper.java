package com.db.mapper;


import com.db.model.authoritymanage.Users;

/**
 * 用户相关的 sql
 * Created by admin on 2016/3/13.
 */
public interface UserMapper {

    int countUser(Users user);

    int addUser(Users user);
}
