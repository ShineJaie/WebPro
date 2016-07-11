package com.web.controller.news;

import com.system.utils.MyWebUtils;
import com.web.service.NewsService;
import redis.clients.jedis.Jedis;

public class NewsClick {

    NewsService newsService;
    Jedis js;
    static int MAX = 5; // 最大刷新次数

    public NewsClick(NewsService newsService) {

        js = MyWebUtils.newJedis();
        this.newsService = newsService;
    }

    public int getNewsClickNum(int newsid) {

        if (js.exists("news" + newsid)) {

            // 存在 key, 1: 取出; 2: 分割; 3: 是否符合最大值, 如果达到往数据库更新，且清零，反之，继续刷新 redis 中内容.
            String getValue = js.get("news" + newsid);
            int oldCount = Integer.parseInt(getValue.split(",")[0]); // 起始 点击量
            int refCount = Integer.parseInt(getValue.split(",")[1]); // 刷新次数
            if (++refCount >= MAX) {
                newsService.updateNewsClickNum(newsid, oldCount + refCount);
                js.set("news" + newsid, String.valueOf(oldCount + refCount) + "," + "0"); // 清零
            } else {
                js.set("news" + newsid, String.valueOf(oldCount) + "," + refCount); // 累加
            }
            return oldCount + refCount;

        } else {
            // 不存在 key
            int oldCount = newsService.getNewsClickNum(newsid);
            // value: 数据库值,当前刷新次数
            js.set("news" + newsid, String.valueOf(oldCount) + "," + "1"); // 初始化
            return oldCount + 1;
        }
    }

}
