package com.db.model.authoritymanage;

import java.util.Date;

/**
 * 数据权限表, 预估项目不会有超过8级的权限结构
 */
public class Permission {

    public int id; // 自增长 id
    public Date createdate; // 创建日期
    public Date modifydate; // 修改日期

    public int parentid = 0; // 父节点 id
    public int depth = 1; // 权限的深度
    public int treedeep1id; // 权限一级
    public int treedeep2id; // 权限二级
    public int treedeep3id; // 权限三级
    public int treedeep4id; // 权限四级
    public int treedeep5id; // 权限五级
    public int treedeep6id; // 权限六级
    public int treedeep7id; // 权限七级
    public int treedeep8id; // 权限八级

    public String name; // 权限名称
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

    public int getParentid() {
        return parentid;
    }

    public void setParentid(int parentid) {
        this.parentid = parentid;
    }

    public int getDepth() {
        return depth;
    }

    public void setDepth(int depth) {
        this.depth = depth;
    }

    public int getTreedeep1id() {
        return treedeep1id;
    }

    public void setTreedeep1id(int treedeep1id) {
        this.treedeep1id = treedeep1id;
    }

    public int getTreedeep2id() {
        return treedeep2id;
    }

    public void setTreedeep2id(int treedeep2id) {
        this.treedeep2id = treedeep2id;
    }

    public int getTreedeep3id() {
        return treedeep3id;
    }

    public void setTreedeep3id(int treedeep3id) {
        this.treedeep3id = treedeep3id;
    }

    public int getTreedeep4id() {
        return treedeep4id;
    }

    public void setTreedeep4id(int treedeep4id) {
        this.treedeep4id = treedeep4id;
    }

    public int getTreedeep5id() {
        return treedeep5id;
    }

    public void setTreedeep5id(int treedeep5id) {
        this.treedeep5id = treedeep5id;
    }

    public int getTreedeep6id() {
        return treedeep6id;
    }

    public void setTreedeep6id(int treedeep6id) {
        this.treedeep6id = treedeep6id;
    }

    public int getTreedeep7id() {
        return treedeep7id;
    }

    public void setTreedeep7id(int treedeep7id) {
        this.treedeep7id = treedeep7id;
    }

    public int getTreedeep8id() {
        return treedeep8id;
    }

    public void setTreedeep8id(int treedeep8id) {
        this.treedeep8id = treedeep8id;
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
