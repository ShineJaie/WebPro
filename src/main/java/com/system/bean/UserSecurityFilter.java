package com.system.bean;

import javax.servlet.*;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

public class UserSecurityFilter implements Filter {

    @Override
    public void destroy() {

    }

    @Override
    public void doFilter(ServletRequest servletRequest, ServletResponse servletResponse, FilterChain chain) throws IOException, ServletException {
        HttpServletRequest request = (HttpServletRequest) servletRequest;
        HttpServletResponse response = (HttpServletResponse) servletResponse;

        String pathInfo = request.getServletPath();
        if (pathInfo != null && (pathInfo.endsWith("login") || pathInfo.endsWith("loginout") || pathInfo.endsWith("reg"))) {
            chain.doFilter(servletRequest, servletResponse);
        } else {
            String username = request.getSession().getAttribute("username") == null ? null
                    : request.getSession().getAttribute("username").toString();
            if (username == null) {
                response.sendRedirect(request.getContextPath() + "/login");
            } else {
                chain.doFilter(servletRequest, servletResponse);
            }
        }
    }

    @Override
    public void init(FilterConfig arg0) throws ServletException {

    }

}
