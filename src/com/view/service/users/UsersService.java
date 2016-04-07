package com.view.service.users;

import com.db.mapper.users.UsersMapper;
import com.system.utils.MyWebUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

/**
 * 用户管理业务逻辑
 */
@Service
public class UsersService {

    @Autowired
    UsersMapper usersMapper;

    /**
     * 获取用户列表数据
     *
     * @param start    从第几页开始
     * @param length   每页显示多少条数据
     * @param username 用户名
     * @return data: 用户列表数据, recordsFiltered: 筛选后的用户数, recordsTotal: 用户总记录数
     */
    public Map<String, Object> getUsersData(int start, int length, String username) {

        Map<String, Object> result = new HashMap<>();

        username = MyWebUtils.generFuzzyParam(username);

        // 用户列表
        List<Map<String, Object>> usersList = usersMapper.selectUsersList(start, length, username);

        // 总数
        int recordsTotal = usersMapper.countUsersTotal(username);

        result.put("recordsTotal", recordsTotal);

        if (usersList == null || usersList.isEmpty()) {

            result.put("data", new ArrayList<>());
            result.put("recordsFiltered", 0);
            return result;
        }

        result.put("data", usersList);
        result.put("recordsFiltered", usersList.size());
        return result;
    }

}
