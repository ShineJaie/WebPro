package com.db.model;

/**
 * 新闻表 model 对应新闻表 news
 * Created by admin on 2016/3/9.
 */
public class News {

    public int id;
    public String title;
    public String pubuser;
    public String pubtime;
    public int clicknum = 0;
    public String content;

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getPubuser() {
        return pubuser;
    }

    public void setPubuser(String pubuser) {
        this.pubuser = pubuser;
    }

    public String getPubtime() {
        return pubtime;
    }

    public void setPubtime(String pubtime) {
        this.pubtime = pubtime;
    }

    public int getClicknum() {
        return clicknum;
    }

    public void setClicknum(int clicknum) {
        this.clicknum = clicknum;
    }

    public String getTitle() {
        return title;
    }

    public void setTitle(String title) {
        this.title = title;
    }

    public String getContent() {
        return content;
    }

    public void setContent(String content) {
        this.content = content;
    }
}
