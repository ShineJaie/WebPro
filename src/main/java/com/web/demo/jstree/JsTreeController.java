package com.web.demo.jstree;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

/**
 * jstree demo
 */
@Controller
@RequestMapping(value = "demo/jstree")
public class JsTreeController {

    @RequestMapping("/page")
    public ModelAndView page() {
        return new ModelAndView("demo/jstree_demo");
    }

}
