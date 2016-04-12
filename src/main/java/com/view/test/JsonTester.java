package com.view.test;

import com.alibaba.fastjson.JSONObject;
import com.system.utils.MyWebUtils;
import com.view.service.UserService;
import com.view.test.aop.CustomerAOP;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.ApplicationContext;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import javax.servlet.http.HttpServletRequest;
import java.text.SimpleDateFormat;
import java.util.Calendar;
import java.util.Date;
import java.util.Map;
import java.util.regex.Matcher;
import java.util.regex.Pattern;

/**
 * 简单页面测试类
 * Created by admin on 2016/3/14.
 */
@Controller
public class JsonTester {

    @Autowired
    UserService userService;

    @Autowired
    ApplicationContext applicationContext;

    @ResponseBody
    @RequestMapping(value = "/test/json", produces = "application/json;charset=UTF-8")
    public String jsonTest(HttpServletRequest request) {

        Map<String, Object> serverInfo = MyWebUtils.getServerInfo(request);

        JSONObject rst = new JSONObject(serverInfo);

        return rst.toString();
    }

    @ResponseBody
    @RequestMapping(value = "/test/bcrypt", produces = "application/json;charset=UTF-8")
    public String bcryptTest() {

        PasswordEncoder passwordEncoder = new BCryptPasswordEncoder();

        String password1 = passwordEncoder.encode("123");
        String password2 = passwordEncoder.encode("123");

        JSONObject json = new JSONObject();
        json.put("password1: ", password1);
        json.put("password2: ", password2);
        json.put("password1==password2: ", password1.equals(password2));
        json.put("matches: ", passwordEncoder.matches("123", password1));
        json.put("function: ", MyWebUtils.comparePassword("123", password2));

        return json.toString();
    }

    @RequestMapping(value = "/test/ueditor", produces = "text/html;charset=UTF-8")
    public ModelAndView page_ueditor() {
        return new ModelAndView("demo/uedit_demo");
    }

    @RequestMapping(value = "/test/sidebar", produces = "text/html;charset=UTF-8")
    public ModelAndView page_ajaxhtml() {
        return new ModelAndView("common/sidebar");
    }

    public static void main(String[] args) {

        String str = "hello world, heelo WORLD, Hello World, HELLO world.";
        System.out.println(str);

        Pattern pattern = caseInsensitive(); // 忽略大小写

        Matcher matcher = pattern.matcher(str);

        while (matcher.find()) {
            System.out.println(matcher.group());
        }
    }

    // 忽略大小写
    private static Pattern caseInsensitive() {

        // Pattern pattern = Pattern.compile("world", Pattern.CASE_INSENSITIVE); // 忽略大小写

        // 表示 (?i) 后面的字母一律忽略大小写
        // Pattern pattern = Pattern.compile("(?i)world"); // 忽略大小写的单词: world WORLD World world

        // Pattern pattern = Pattern.compile("W[A-Z]+"); // 大写的单词: WORLD

        Pattern pattern = Pattern.compile("W[D-Rd-r]+"); // 首字母大写的单词: WORLD World

        return pattern;
    }

}
