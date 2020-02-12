package com.jschrj.pojo.task;

import com.jschrj.common.Constant;

import java.util.Date;

public class Task {
    private Integer id;

    private Integer pri;

    private Integer storyid;

    private String projectname;

    private String sourcename;

    private Integer rwtype;

    private Integer assignto;

    private String assigntoname;

    private Integer estimate;

    private String deadline;

    private Integer status;

    public String getAssigntoname() {
        return assigntoname;
    }

    public void setAssigntoname(String assigntoname) {
        this.assigntoname = assigntoname;
    }

    private String title;

    private Integer userid;

    private String username;

    private String createtime;

    private String updatetime;

    private byte[] content;

    private String contenthtml;

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public Integer getStoryid() {
        return storyid;
    }

    public void setStoryid(Integer storyid) {
        this.storyid = storyid;
    }

    public Integer getRwtype() {
        return rwtype;
    }

    public void setRwtype(Integer rwtype) {
        this.rwtype = rwtype;
    }

    public Integer getAssignto() {
        return assignto;
    }

    public void setAssignto(Integer assignto) {
        this.assignto = assignto;
    }

    public Integer getEstimate() {
        return estimate;
    }

    public void setEstimate(Integer estimate) {
        this.estimate = estimate;
    }

    public String getDeadline() {
        return deadline;
    }

    public void setDeadline(String deadline) {
        this.deadline = deadline;
    }

    public Integer getStatus() {
        return status;
    }

    public void setStatus(Integer status) {
        this.status = status;
    }

    public String getTitle() {
        return title;
    }

    public void setTitle(String title) {
        this.title = title == null ? null : title.trim();
    }

    public Integer getUserid() {
        return userid;
    }

    public void setUserid(Integer userid) {
        this.userid = userid;
    }

    public String getUsername() {
        return username;
    }

    public void setUsername(String username) {
        this.username = username == null ? null : username.trim();
    }

    public String getCreatetime() {
        return createtime;
    }

    public void setCreatetime(String createtime) {
        this.createtime = createtime;
    }

    public String getUpdatetime() {
        return updatetime;
    }

    public void setUpdatetime(String updatetime) {
        this.updatetime = updatetime;
    }

    public byte[] getContent() {
        return content;
    }

    public void setContent(byte[] content) {
        this.content = content;
    }

    public String getContenthtml() {
        return contenthtml;
    }

    public void setContenthtml(String contenthtml) {
        //将kineditor文本编辑器中的图片路径ping上远程附件服务器路径
        contenthtml=contenthtml.replaceAll("src=\"","src=\""+ Constant.FILE_VIEW_URL);
        this.contenthtml = contenthtml;
    }

    public Integer getPri() {
        return pri;
    }

    public void setPri(Integer pri) {
        this.pri = pri;
    }

    public String getProjectname() {
        return projectname;
    }

    public void setProjectname(String projectname) {
        this.projectname = projectname;
    }

    public String getSourcename() {
        return sourcename;
    }

    public void setSourcename(String sourcename) {
        this.sourcename = sourcename;
    }


}