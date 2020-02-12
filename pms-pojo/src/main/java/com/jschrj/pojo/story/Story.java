package com.jschrj.pojo.story;

import com.jschrj.common.Constant;

import java.util.Date;

public class Story {
    private Integer id;

    private Integer project;

    private String projectname;

    private Integer source;

    private String sourcename;

    private Integer modular;

    private String modularname;

    private Integer pri;

    private String title;

    private Integer status;

    private String deadline;

    private String filename;

    private String fileurl;

    private Integer openedby;

    private String openedbyname;

    private String openeddate;

    private String finishdate;

    private String release;

    private byte[] content;

    private byte[] target;

    private String contenthtml;

    private String targethtml;

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public Integer getProject() {
        return project;
    }

    public void setProject(Integer project) {
        this.project = project;
    }

    public Integer getSource() {
        return source;
    }

    public void setSource(Integer source) {
        this.source = source;
    }

    public Integer getModular() {
        return modular;
    }

    public void setModular(Integer modular) {
        this.modular = modular;
    }

    public Integer getPri() {
        return pri;
    }

    public void setPri(Integer pri) {
        this.pri = pri;
    }

    public String getTitle() {
        return title;
    }

    public void setTitle(String title) {
        this.title = title == null ? null : title.trim();
    }

    public Integer getStatus() {
        return status;
    }

    public void setStatus(Integer status) {
        this.status = status;
    }

    public byte[] getTarget() {
        return target;
    }

    public void setTarget(byte[] target) {
        this.target = target;
    }

    public String getDeadline() {
        return deadline;
    }

    public void setDeadline(String deadline) {
        this.deadline = deadline;
    }

    public Integer getOpenedby() {
        return openedby;
    }

    public void setOpenedby(Integer openedby) {
        this.openedby = openedby;
    }

    public String getOpeneddate() {
        return openeddate;
    }

    public void setOpeneddate(String openeddate) {
        this.openeddate = openeddate;
    }

    public byte[] getContent() {
        return content;
    }

    public void setContent(byte[] content) {
        this.content = content;
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

    public String getModularname() {
        return modularname;
    }

    public void setModularname(String modularname) {
        this.modularname = modularname;
    }

    public String getOpenedbyname() {
        return openedbyname;
    }

    public void setOpenedbyname(String openedbyname) {
        this.openedbyname = openedbyname;
    }

    public String getContenthtml() {
        return contenthtml;
    }

    public void setContenthtml(String contenthtml) {
        //将kineditor文本编辑器中的图片路径ping上远程附件服务器路径
        contenthtml=contenthtml.replaceAll("src=\"","src=\""+ Constant.FILE_VIEW_URL);
        this.contenthtml = contenthtml;
    }

    public String getTargethtml() {
        return targethtml;
    }

    public void setTargethtml(String targethtml) {
        //将kineditor文本编辑器中的图片路径ping上远程附件服务器路径
        targethtml=targethtml.replaceAll("src=\"","src=\""+ Constant.FILE_VIEW_URL);
        this.targethtml = targethtml;
    }

    public String getFilename() {
        return filename;
    }

    public void setFilename(String filename) {
        this.filename = filename;
    }

    public String getFileurl() {
        return fileurl;
    }

    public void setFileurl(String fileurl) {
        //将kineditor文本编辑器中的图片路径ping上远程附件服务器路径
        fileurl=fileurl.replaceAll("src=\"","src=\""+ Constant.FILE_VIEW_URL);
        this.fileurl = fileurl;
    }

    public String getRelease() {
        return release;
    }

    public void setRelease(String release) {
        this.release = release;
    }

    public String getFinishdate() {
        return finishdate;
    }

    public void setFinishdate(String finishdate) {
        this.finishdate = finishdate;
    }
}