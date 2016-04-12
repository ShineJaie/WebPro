package com.view.service;

import com.db.mapper.NewsMapper;
import com.db.model.News;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class NewsService {

    @Autowired
    NewsMapper newsMapper;

    public List<News> loadNews(int page, int pagesize) {

        return newsMapper.selectAll((page - 1) * pagesize, pagesize);
    }

    public int getNewCount() {

        // 返回新闻总条数
        return newsMapper.selectAllCount();
    }

    public News loadNewsDetail(int newsid) {

        return newsMapper.selectNews(newsid);
    }

    public int getNewsClickNum(int newsid) {

        return newsMapper.selectClickNum(newsid);
    }

    public void updateNewsClickNum(int newsid, int clicknum) {

        newsMapper.updateClickNum(newsid, clicknum);
    }

}
