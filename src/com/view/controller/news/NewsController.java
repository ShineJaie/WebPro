package com.view.controller.news;

import com.db.model.News;
import com.system.utils.MyWebUtils;
import com.view.service.NewsService;
import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;
import redis.clients.jedis.Jedis;

import javax.servlet.http.HttpServletRequest;
import java.io.IOException;
import java.util.Map;

/**
 * 新闻相关
 */
@Controller
public class NewsController {

    private static final Logger logger = Logger.getLogger(NewsController.class);

    @Autowired
    NewsService newsService;

    // 加载新闻列表
    @RequestMapping(value = "/newslist", produces = "text/html;charset=UTF-8")
    public ModelAndView page_newslist(HttpServletRequest request) {

        ModelAndView modelAndView = new ModelAndView("news/newslist");

        int size = 2;
        modelAndView.addObject("sum", newsService.getNewCount());
        modelAndView.addObject("size", size);

        int page = 1;
        if (request.getParameter("page") != null) {
            page = Integer.parseInt(request.getParameter("page"));
            modelAndView.addObject("newslist", newsService.loadNews(page, size));
            if (page <= 0) {
                page = 1;
            }
        } else {
            modelAndView.addObject("newslist", newsService.loadNews(page, size));
        }

        modelAndView.addObject("page", page);

        return modelAndView;
    }

    // 新闻详细页
    @RequestMapping(value = "/newsdetail", produces = "text/html;charset=UTF-8")
    public ModelAndView page_newsdetail(int newsid) throws IOException {

/*        // memcached 作为缓存
        MemcachedClient mc = new MemcachedClient(AddrUtil.getAddresses("127.0.0.1:11211"));
        News news = (News) mc.get("newsModel_key" + String.valueOf(newsid));

        if (news == null) {
            // 缓存中没有
            news = newsService.loadNewsDetail(newsid);
            // 过期时间 1小时
            mc.set("newsModel_key" + String.valueOf(newsid), 60 * 60 * 1, news);
        } else {
            System.out.println("使用了 memcached 缓存中的内容");
        }*/

        //===========================================================

        ModelAndView modelAndView = new ModelAndView("news/newsdetail");

        // redis 作为缓存
        Jedis js = MyWebUtils.newJedis();
        Map<String, String> newsMap = js.hgetAll("news:key" + String.valueOf(newsid));

        if (newsMap == null || newsMap.isEmpty()) {
            logger.info("--> news detail from database");
            News news = newsService.loadNewsDetail(newsid);
            modelAndView.addObject("newsDetail", news);
            js.hset("news:key" + String.valueOf(newsid), "title", news.getTitle());
            js.hset("news:key" + String.valueOf(newsid), "content", news.getContent());
            js.hset("news:key" + String.valueOf(newsid), "pubtime", news.getPubtime());
            js.hset("news:key" + String.valueOf(newsid), "pubuser", news.getPubuser());
        } else {
            logger.info("--> news detail from redis");
            modelAndView.addObject("newsDetail", newsMap);
        }

        int newClickNum = new NewsClick(newsService).getNewsClickNum(newsid);

        modelAndView.addObject("newClickNum", newClickNum);

        return modelAndView;

    }

    @RequestMapping("/addnews/page")
    public ModelAndView page_addNews() {

        return new ModelAndView("/news/addnews");
    }

}
