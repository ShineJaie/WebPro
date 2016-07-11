package com.web.controller.register;

import com.db.model.authoritymanage.Users;
import com.system.utils.MyWebUtils;
import com.web.service.UserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

/**
 * 用户注册
 */
@Controller
public class RegisterController {

    @Autowired
    UserService userService;

    /**
     * 注册页面
     *
     * @return page
     */
    @RequestMapping(value = "/register/page", produces = "text/html;charset=UTF-8")
    public ModelAndView registerPage() {

        return new ModelAndView("home/register");
    }

    /**
     * 注册功能逻辑
     *
     * @param user 注册信息
     * @return 提示信息
     */
    @ResponseBody
    @RequestMapping(value = "/register", produces = "application/json;charset=UTF-8")
    public String register(Users user) {

        user.setUsername(MyWebUtils.dealWithNullVal(user.getUsername()));
        user.setPassword(MyWebUtils.dealWithNullVal(user.getPassword()));
        user.setEmail(MyWebUtils.dealWithNullVal(user.getEmail()));

        if (!user.getUsername().isEmpty()) {

            // 对密码进行加密
            String cryptedPassword = new BCryptPasswordEncoder().encode(user.getPassword());
            user.setPassword(cryptedPassword);

            int userid = userService.addUser(user);

            if (userid > 0) {

                return MyWebUtils.convert2JsonResult(1, user.getUsername());

            } else {
                if (userid == -1) {
                    return MyWebUtils.convert2JsonResult(0, "已存在相同的用户名!");
                }
            }
        }
        return MyWebUtils.convert2JsonResult(0, "注册失败!");
    }

}
