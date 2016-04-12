package com.db.mapper;


import com.db.model.News;

import java.util.List;

public interface NewsMapper {

    List<News> selectAll(int page, int pagesize);

    int selectAllCount();

    News selectNews(int newsid);

    int selectClickNum(int newsid);

    void updateClickNum(int newsid, int clicknum);

}
