package com.web.controller.users;

import com.alibaba.fastjson.JSONObject;
import com.system.utils.Pagination4DataTables;
import com.web.service.users.UsersService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import java.util.Map;

/**
 * 用户管理
 */
@Controller
public class UsersController {

    @Autowired
    UsersService usersService;

    @RequestMapping(value = "/admin/userslist/page", produces = "text/html;charset=UTF-8")

    public ModelAndView usersListPage() {

        return new ModelAndView("/users/userslist");
    }

    /**
     * 获取用户列表数据
     *
     * @param tablesParam datatables 插件的请求参数
     * @param username    用户名
     * @return json格式数据
     */
    @ResponseBody
    @RequestMapping(value = "/admin/userslist/data", produces = "application/json;charset=UTF-8")
    public String usersListData(Pagination4DataTables tablesParam, String username) {

        int draw = tablesParam.getDraw();
        int start = tablesParam.getStart();
        int length = tablesParam.getLength();

        Map<String, Object> usersData = usersService.getUsersData(start, length, username);

        JSONObject res = new JSONObject();

        res.put("draw", draw);
        res.put("recordsTotal", usersData.get("recordsTotal"));
        res.put("recordsFiltered", usersData.get("recordsFiltered"));
        res.put("data", usersData.get("data"));

        return res.toString();
    }


}
