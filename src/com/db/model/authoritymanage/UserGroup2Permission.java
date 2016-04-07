package com.db.model.authoritymanage;

import java.util.Date;

/**
 * 用户组与数据权限表映射, 多对多
 */
public class UserGroup2Permission {

    public int id; // 自增长 id
    public Date createdate; // 创建日期
    public Date modifydate; // 修改日期
    public int usergroupid; // 用户组 id (映射 usergroup 表)
    public int permissionid; // 数据权限 id (映射 permission 表)

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

    public int getUsergroupid() {
        return usergroupid;
    }

    public void setUsergroupid(int usergroupid) {
        this.usergroupid = usergroupid;
    }

    public int getPermissionid() {
        return permissionid;
    }

    public void setPermissionid(int permissionid) {
        this.permissionid = permissionid;
    }
}
