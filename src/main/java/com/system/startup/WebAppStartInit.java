package com.system.startup;

import com.system.utils.MyFileUtils;
import com.system.utils.MyWebUtils;
import org.apache.log4j.Logger;
import redis.clients.jedis.JedisPool;
import redis.clients.jedis.JedisPoolConfig;

import javax.servlet.ServletContextEvent;
import javax.servlet.ServletContextListener;

/**
 * 程序初始化
 * Created by admin on 2016/3/13.
 */
public class WebAppStartInit implements ServletContextListener {

    private static final Logger logger = Logger.getLogger(WebAppStartInit.class);

    /**
     * 网站上线
     */
    @Override
    public void contextInitialized(ServletContextEvent servletContextEvent) {

        MyFileUtils.webappPath = servletContextEvent.getServletContext().getRealPath("/");

        String msg = "---> Webapp starting ...";
        logger.info(msg);

        // 初始化 jedis 连接池
        String ip = "localhost";
        MyWebUtils.jedisPool = new JedisPool(new JedisPoolConfig(), ip);
        logger.info("---> 初始化 jedis 连接池");
    }

    /**
     * 网站下线
     */
    @Override
    public void contextDestroyed(ServletContextEvent servletContextEvent) {

        String msg = "---> Webapp stoping ...";
        logger.info(msg);

        MyWebUtils.jedisPool.destroy();
        logger.info("---> 销毁 jedis 连接池");
    }
}
