package com.jschrj.pojo.bug;

import com.jschrj.common.Constant;

import java.util.Date;

public class Bug {
    private Integer id;

    private Integer storyid;

    private Integer taskid;

    private Integer usecasestepid;

    private Integer project;

    private String projectname;

    private Integer type;

    private Integer severity;

    private Integer assignto;

    private String assigntoname;

    private Integer status;

    private String title;

    private String step;

    private String expect;

    private Integer duty;

    private String dutyname;

    private Integer finishedby;

    private String finishedbyname;

    private Integer result;

    private String username;

    private Integer userid;

    private String sqlname;

    private String sql;

    private String createtime;

    private String finishedtime;

    private String release;

    private byte[] content;

    private String contenthtml;

    private byte[] dutycontent;

    private String dutycontenthtml;

    private byte[] releaseremark;

    private String releaseremarkhtml;

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

    public Integer getTaskid() {
        return taskid;
    }

    public void setTaskid(Integer taskid) {
        this.taskid = taskid;
    }

    public Integer getUsecasestepid() {
        return usecasestepid;
    }

    public void setUsecasestepid(Integer usecasestepid) {
        this.usecasestepid = usecasestepid;
    }

    public Integer getType() {
        return type;
    }

    public void setType(Integer type) {
        this.type = type;
    }

    public Integer getSeverity() {
        return severity;
    }

    public void setSeverity(Integer severity) {
        this.severity = severity;
    }

    public Integer getAssignto() {
        return assignto;
    }

    public void setAssignto(Integer assignto) {
        this.assignto = assignto;
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

    public String getStep() {
        return step;
    }

    public void setStep(String step) {
        this.step = step == null ? null : step.trim();
    }

    public String getExpect() {
        return expect;
    }

    public void setExpect(String expect) {
        this.expect = expect == null ? null : expect.trim();
    }

    public Integer getDuty() {
        return duty;
    }

    public void setDuty(Integer duty) {
        this.duty = duty;
    }

    public Integer getFinishedby() {
        return finishedby;
    }

    public void setFinishedby(Integer finishedby) {
        this.finishedby = finishedby;
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

    public String getFinishedtime() {
        return finishedtime;
    }

    public void setFinishedtime(String finishedtime) {
        this.finishedtime = finishedtime;
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

    public String getAssigntoname() {
        return assigntoname;
    }

    public void setAssigntoname(String assigntoname) {
        this.assigntoname = assigntoname;
    }

    public String getFinishedbyname() {
        return finishedbyname;
    }

    public void setFinishedbyname(String finishedbyname) {
        this.finishedbyname = finishedbyname;
    }

    public String getDutyname() {
        return dutyname;
    }

    public void setDutyname(String dutyname) {
        this.dutyname = dutyname;
    }

    public String getProjectname() {
        return projectname;
    }

    public void setProjectname(String projectname) {
        this.projectname = projectname;
    }

    public Integer getProject() {
        return project;
    }

    public void setProject(Integer project) {
        this.project = project;
    }

    public String getRelease() {
        return release;
    }

    public void setRelease(String release) {
        this.release = release;
    }

    public Integer getResult() {
        return result;
    }

    public void setResult(Integer result) {
        this.result = result;
    }

    public String getSqlname() {
        return sqlname;
    }

    public void setSqlname(String sqlname) {
        this.sqlname = sqlname;
    }

    public String getSql() {
        return sql;
    }

    public void setSql(String sql) {
        this.sql = sql;
    }

    public byte[] getReleaseremark() {
        return releaseremark;
    }

    public void setReleaseremark(byte[] releaseremark) {
        this.releaseremark = releaseremark;
    }

    public String getReleaseremarkhtml() {
        return releaseremarkhtml;
    }

    public void setReleaseremarkhtml(String releaseremarkhtml) {
        //将kineditor文本编辑器中的图片路径ping上远程附件服务器路径
        releaseremarkhtml=releaseremarkhtml.replaceAll("src=\"","src=\""+ Constant.FILE_VIEW_URL);
        this.releaseremarkhtml = releaseremarkhtml;
    }

    public byte[] getDutycontent() {
        return dutycontent;
    }

    public void setDutycontent(byte[] dutycontent) {
        this.dutycontent = dutycontent;
    }

    public String getDutycontenthtml() {
        return dutycontenthtml;
    }

    public void setDutycontenthtml(String dutycontenthtml) {
        //将kineditor文本编辑器中的图片路径ping上远程附件服务器路径
        dutycontenthtml=dutycontenthtml.replaceAll("src=\"","src=\""+ Constant.FILE_VIEW_URL);
        this.dutycontenthtml = dutycontenthtml;
    }
}