package com.system.springsecurity.controller;

import com.system.utils.MyWebUtils;
import org.apache.log4j.Logger;
import org.springframework.security.authentication.AnonymousAuthenticationToken;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.security.web.authentication.logout.SecurityContextLogoutHandler;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * 网站入口
 */
@Controller
public class MainController {

    private static final Logger logger = Logger.getLogger(MainController.class);

    /**
     * 登录后的首页
     *
     * @return page
     */
    @RequestMapping(value = {"/", "/home**"})
    public ModelAndView defaultPage() {

        return new ModelAndView("home/home");
    }

    @RequestMapping(value = "/admin**")
    public ModelAndView adminPage() {

        ModelAndView model = new ModelAndView();
        model.addObject("title", "Spring Security Login Form - Database Authentication");
        model.addObject("message", "This page is for ROLE_ADMIN only!");
        model.setViewName("admin");
        return model;
    }

    /**
     * Spring Security 表单登录
     *
     * @param error  用户名和密码错误时不为 null
     * @param logout 注销登录时不为 null
     * @return 登录页面
     */
    @RequestMapping(value = "/login")
    public ModelAndView login(@RequestParam(value = "error", required = false) String error,
                              @RequestParam(value = "logout", required = false) String logout,
                              HttpServletRequest request,
                              HttpServletResponse response) {

        logger.info("---> user login...");

        String status = MyWebUtils.dealWithNullVal(request.getParameter("status"));

        ModelAndView model = new ModelAndView();

        if (status.equals("invalid")) {
            model.addObject("error", "会话已经过期!");
        }

        if (error != null) {
            model.addObject("error", "用户名或密码错误!");
        }

        if (logout != null) {
            model.addObject("msg", "注销成功!");
        }
        model.setViewName("login");

        response.setStatus(499); // 登录过期

        return model;
    }

    /**
     * 注销登录
     *
     * @param request  httpRequest
     * @param response httpResponse
     * @return 首页
     */
    @RequestMapping(value = "/logout")
    public String logoutPage(HttpServletRequest request, HttpServletResponse response) {

        Authentication auth = SecurityContextHolder.getContext().getAuthentication();
        if (auth != null) {
            new SecurityContextLogoutHandler().logout(request, response, auth);
        }

        SecurityContextHolder.getContext().setAuthentication(null);

        return "redirect:/login?logout";
    }

    /**
     * for 403 access denied page
     *
     * @return 403 页面
     */
    @RequestMapping(value = "/403")
    public ModelAndView accesssDenied() {

        ModelAndView mv = new ModelAndView();

        //check if user is login
        Authentication auth = SecurityContextHolder.getContext().getAuthentication();

        if (!(auth instanceof AnonymousAuthenticationToken)) {

            UserDetails userDetail = (UserDetails) auth.getPrincipal();
            mv.addObject("username", userDetail.getUsername());
        }

        mv.setViewName("/error/403");
        return mv;
    }

}
