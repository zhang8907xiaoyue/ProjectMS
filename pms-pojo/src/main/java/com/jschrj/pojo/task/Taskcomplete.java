package com.jschrj.pojo.task;

import com.jschrj.common.Constant;

import java.util.Date;

public class Taskcomplete {
    private Integer id;

    private Integer storyid;

    private String projectname;

    private String sourcename;

    private Integer taskid;

    private String title;

    private Integer estimate;

    private String codeurl;

    private String sql;

    private String sqlname;

    private Integer userid;

    private String username;

    private String deadline;

    private String createtime;

    private String updatetime;
	
	private byte[] testremark;

    private byte[] releaseremark;

    private byte[] overdueremark;

    private String testremarkhtml;

    private String releaseremarkhtml;

    private String overdueremarkhtml;

    public byte[] getTestremark() {
        return testremark;
    }

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public Integer getTaskid() {
        return taskid;
    }

    public void setTaskid(Integer taskid) {
        this.taskid = taskid;
    }

    public Integer getEstimate() {
        return estimate;
    }

    public void setEstimate(Integer estimate) {
        this.estimate = estimate;
    }

    public String getCodeurl() {

        return codeurl;
    }

    public void setCodeurl(String codeurl) {

        this.codeurl = codeurl;
    }

    public String getSql() {

        return sql;
    }

    public void setSql(String sql) {
        this.sql = sql;
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
	
	public void setTestremark(byte[] testremark) {
        this.testremark = testremark;
    }

    public byte[] getReleaseremark() {
        return releaseremark;
    }

    public void setReleaseremark(byte[] releaseremark) {
        this.releaseremark = releaseremark;
    }

    public byte[] getOverdueremark() {
        return overdueremark;
    }

    public void setOverdueremark(byte[] overdueremark) {
        this.overdueremark = overdueremark;
    }

    public String getTestremarkhtml() {

        return testremarkhtml;
    }

    public void setTestremarkhtml(String testremarkhtml) {
        //将kineditor文本编辑器中的图片路径ping上远程附件服务器路径
        testremarkhtml=testremarkhtml.replaceAll("src=\"","src=\""+ Constant.FILE_VIEW_URL);
        this.testremarkhtml = testremarkhtml;
    }

    public String getReleaseremarkhtml() {
        return releaseremarkhtml;
    }

    public void setReleaseremarkhtml(String releaseremarkhtml) {
        //将kineditor文本编辑器中的图片路径ping上远程附件服务器路径
        releaseremarkhtml=releaseremarkhtml.replaceAll("src=\"","src=\""+ Constant.FILE_VIEW_URL);
        this.releaseremarkhtml = releaseremarkhtml;
    }

    public String getOverdueremarkhtml() {
        return overdueremarkhtml;
    }

    public void setOverdueremarkhtml(String overdueremarkhtml) {
        //将kineditor文本编辑器中的图片路径ping上远程附件服务器路径
        overdueremarkhtml=overdueremarkhtml.replaceAll("src=\"","src=\""+ Constant.FILE_VIEW_URL);
        this.overdueremarkhtml = overdueremarkhtml;
    }

    public Integer getStoryid() {
        return storyid;
    }

    public void setStoryid(Integer storyid) {
        this.storyid = storyid;
    }

    public String getSqlname() {
        return sqlname;
    }

    public void setSqlname(String sqlname) {
        this.sqlname = sqlname;
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

    public String getDeadline() {
        return deadline;
    }

    public void setDeadline(String deadline) {
        this.deadline = deadline;
    }

    public String getTitle() {
        return title;
    }

    public void setTitle(String title) {
        this.title = title;
    }
}