package com.web.service;

import com.db.mapper.UserMapper;
import com.db.model.authoritymanage.Users;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import javax.servlet.http.HttpServletRequest;

/**
 * 用户相关的业务逻辑操作
 * Created by admin on 2016/3/13.
 */
@Service
public class UserService {

    @Autowired
    HttpServletRequest request;

    @Autowired
    UserMapper userMapper;

    public int addUser(Users user) {
        if (userMapper.countUser(user) > 0) {
            return -1;
        }
        userMapper.addUser(user);
        return user.getId();
    }

}
