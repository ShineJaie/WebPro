package com.db.model.authoritymanage;

import java.util.Date;

/**
 * 用户组与功能权限映射, 多对多
 */
public class UserGroup2Authority {

    public int id; // 自增长id
    public Date createdate; // 创建日期
    public Date modifydate; // 修改日期
    public String authorityname; // 权限名称 (映射 authority 表)
    public int usergroupid; // 用户组 id (映射 usergroup 表)

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

    public String getAuthorityname() {
        return authorityname;
    }

    public void setAuthorityname(String authorityname) {
        this.authorityname = authorityname;
    }

    public int getUsergroupid() {
        return usergroupid;
    }

    public void setUsergroupid(int usergroupid) {
        this.usergroupid = usergroupid;
    }
}
