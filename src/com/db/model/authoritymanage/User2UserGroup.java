package com.db.model.authoritymanage;

import java.util.Date;

/**
 * 用户与用户组映射表, 多对多
 */
public class User2UserGroup {

    public int id; // 自增长 id
    public Date createdate; // 创建日期
    public Date modifydate; // 修改日期
    public int userid; // 用户 id (映射 users 表)
    public String username; // 用户名称 (映射 users 表)
    public int usergroupid; // 用户组 id (映射 usergroup 表)
    public String usergroupname; // 用户组名称 (映射 usergroup 表)

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public Date getCreatedate() {
        return createdate;
    }

    public void setCreatedate(Date createdate) {
        this.createdate = createdate;
    }

    public Date getModifydate() {
        return modifydate;
    }

    public void setModifydate(Date modifydate) {
        this.modifydate = modifydate;
    }

    public int getUserid() {
        return userid;
    }

    public void setUserid(int userid) {
        this.userid = userid;
    }

    public String getUsername() {
        return username;
    }

    public void setUsername(String username) {
        this.username = username;
    }

    public int getUsergroupid() {
        return usergroupid;
    }

    public void setUsergroupid(int usergroupid) {
        this.usergroupid = usergroupid;
    }

    public String getUsergroupname() {
        return usergroupname;
    }

    public void setUsergroupname(String usergroupname) {
        this.usergroupname = usergroupname;
    }
}
