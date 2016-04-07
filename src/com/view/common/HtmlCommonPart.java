package com.view.common;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

/**
 * html 公共部分
 * Created by admin on 2016/3/13.
 */
@Controller
public class HtmlCommonPart {

    /**
     * 页面侧边栏
     *
     * @return page
     */
    @RequestMapping(value = "/common/sidebar", produces = "text/html;charset=UTF-8")
    public ModelAndView sidePart() {

        return new ModelAndView("common/sidebar");
    }

    /**
     * 页面顶部栏
     *
     * @return page
     */
    @RequestMapping(value = "/common/topbar", produces = "text/html;charset=UTF-8")
    public ModelAndView topPart() {

        return new ModelAndView("common/topbar");
    }

}