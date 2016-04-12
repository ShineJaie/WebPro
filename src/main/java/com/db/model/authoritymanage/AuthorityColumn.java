package com.db.model.authoritymanage;

import java.util.Date;

/**
 * 权限分栏表(功能模块), 记录动作分栏, 系统中提供的功能模块, 每一块就是一个分栏
 */
public class AuthorityColumn {

    public int id; // 自增长id
    public Date createdate; // 创建日期
    public Date modifydate; // 修改日期
    public String name; // 功能模版名称
    public String remark; // 备注

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

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getRemark() {
        return remark;
    }

    public void setRemark(String remark) {
        this.remark = remark;
    }
}
