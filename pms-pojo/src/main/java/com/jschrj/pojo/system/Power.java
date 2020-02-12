package com.jschrj.pojo.system;

import java.io.Serializable;

public class Power implements Serializable {

	/**
	 * 
	 */
	private static final long serialVersionUID = 7558927441549827350L;
	private int id;
	/**
	 * 应用id
	 */
	private int appid;
	/**
	 * 应用名称
	 */
	private String appname;
	/**
	 * 权限类型：1，查看，2，新增，3，编辑，4，删除，5，其他
	 */
	private int type;
	/**
	 * 权限描述
	 */
	private String description;
	/**
	 * 请求url
	 */
	private String requesturl;
	/**
	 * 状态：改权限角色是否拥有
	 */
	private int status;
	public Power() {
		super();
		// TODO Auto-generated constructor stub
	}
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	public int getAppid() {
		return appid;
	}
	public void setAppid(int appid) {
		this.appid = appid;
	}
	public String getAppname() {
		return appname;
	}
	public void setAppname(String appname) {
		this.appname = appname;
	}
	public int getType() {
		return type;
	}
	public void setType(int type) {
		this.type = type;
	}
	public String getDescription() {
		return description;
	}
	public void setDescription(String description) {
		this.description = description;
	}
	public String getRequesturl() {
		return requesturl;
	}
	public void setRequesturl(String requesturl) {
		this.requesturl = requesturl;
	}
	public int getStatus() {
		return status;
	}
	public void setStatus(int status) {
		this.status = status;
	}
	
}
