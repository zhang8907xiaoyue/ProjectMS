package com.jschrj.pojo.system;

import java.util.Date;

public class Email {
    private Integer id;

    private Integer storyid;

    private Integer status;

    private Integer mailto;

    private String mailtoname;

    private String content;

    private String createtime;

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

    public Integer getStatus() {
        return status;
    }

    public void setStatus(Integer status) {
        this.status = status;
    }

    public Integer getMailto() {
        return mailto;
    }

    public void setMailto(Integer mailto) {
        this.mailto = mailto;
    }

    public String getContent() {
        return content;
    }

    public void setContent(String content) {
        this.content = content == null ? null : content.trim();
    }

    public String getCreatetime() {
        return createtime;
    }

    public void setCreatetime(String createtime) {
        this.createtime = createtime;
    }

    public String getMailtoname() {
        return mailtoname;
    }

    public void setMailtoname(String mailtoname) {
        this.mailtoname = mailtoname;
    }
}