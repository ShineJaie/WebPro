package com.db.model.authoritymanage;

import java.util.Date;

/**
 * 功能权限表, 记录系统中所有的操作权限(增、删、改), 以及动作相关描述
 */
public class Authority {

    public int id; // 自增长id
    public Date createdate; // 创建日期
    public Date modifydate; // 修改日期
    public String name; // 权限名称
    public String remark; // 备注
    public int authoritycolumnid; // 权限分栏id (映射 privilegecolumn 表)

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

    public int getAuthoritycolumnid() {
        return authoritycolumnid;
    }

    public void setAuthoritycolumnid(int authoritycolumnid) {
        this.authoritycolumnid = authoritycolumnid;
    }
}
