package com.system.bean;

import com.system.utils.MyWebUtils;
import org.apache.log4j.Logger;
import org.springframework.web.servlet.HandlerInterceptor;
import org.springframework.web.servlet.ModelAndView;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 * 用户登录控制 拦截器
 * Created by admin on 2016/3/14.
 */
public class LoginInterceptor implements HandlerInterceptor {

    private static final Logger logger = Logger.getLogger(LoginInterceptor.class);

    /**
     * 在业务处理器处理请求之前被调用
     * 如果返回 false
     * 从当前的拦截器往回执行所有拦截器的 afterCompletion(),再退出拦截器链
     * 如果返回 true
     * 执行下一个拦截器,直到所有的拦截器都执行完毕
     * 再执行被拦截的 Controller
     * 然后进入拦截器链,
     * 从最后一个拦截器往回执行所有的 postHandle()
     * 接着再从最后一个拦截器往回执行所有的 afterCompletion()
     */
    @Override
    public boolean preHandle(HttpServletRequest httpServletRequest, HttpServletResponse httpServletResponse, Object o) throws Exception {

        logger.info("---> Execution sequence: 1, preHandle");

        HttpSession session = httpServletRequest.getSession();
        String username = session.getAttribute("username") == null ? null : session.getAttribute("username").toString();
        username = MyWebUtils.dealWithNullVal(username);
        if (username.isEmpty()) {
            httpServletResponse.sendRedirect(httpServletRequest.getContextPath() + "/");
            return false;
        }

        return true;
    }

    /**
     * 在业务处理器处理请求执行完成后,生成视图之前执行的动作
     * 可在 modelAndView 中加入数据，比如当前时间
     */
    @Override
    public void postHandle(HttpServletRequest httpServletRequest, HttpServletResponse httpServletResponse, Object o, ModelAndView modelAndView) throws Exception {
        logger.info("---> Execution sequence: 2, postHandle");
    }

    /**
     * 在 DispatcherServlet 完全处理完请求后被调用,可用于清理资源等
     * 当有拦截器抛出异常时,会从当前拦截器往回执行所有的拦截器的 afterCompletion()
     */
    @Override
    public void afterCompletion(HttpServletRequest httpServletRequest, HttpServletResponse httpServletResponse, Object o, Exception e) throws Exception {
        logger.info("---> Execution sequence: 3, afterCompletion");
    }
}
