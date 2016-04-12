package com.db.mapper.users;

import org.apache.ibatis.annotations.Param;

import java.util.List;
import java.util.Map;

/**
 * 用户管理 数据库相关操作
 */
public interface UsersMapper {

    /**
     * 获取用户列表数据
     *
     * @param start    从第几页开始
     * @param length   每页显示多少条数据
     * @param username 用户名
     * @return 用户列表数据
     */
    List<Map<String, Object>> selectUsersList(@Param("start") int start,
                                              @Param("length") int length,
                                              @Param("username") String username);

    /**
     * 获取用户总记录
     *
     * @param username 用户名
     * @return 用户总记录数
     */
    int countUsersTotal(@Param("username") String username);
}
