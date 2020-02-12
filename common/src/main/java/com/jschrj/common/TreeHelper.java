package com.jschrj.common;

import java.io.Serializable;
import java.util.List;

/**
 * 树形结构
 * @author Corey
 *
 */
public class TreeHelper<T> implements Serializable {
	/**
	 *
	 */
	private static final long serialVersionUID = -2142071806808158444L;
	private String id;
	private String name;
	private String pId;
	private String nocheck;
	/**
	 * 内容
	 */
	private String text;
	/**
	 * 状态：open,closed
	 */
	private String state;
	/**
	 * 路径
	 */
	private String url;
	/**
	 * 图标类名
	 */
	private String iconCls;
	/**
	 * 扩展属性
	 */
	private String ext1;
	/**
	 * 子节点
	 */
	private List<TreeHelper<T>> children;
	T attributes;
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getpId() {
		return pId;
	}
	public void setpId(String pId) {
		this.pId = pId;
	}
	public String getNocheck() {
		return nocheck;
	}
	public void setNocheck(String nocheck) {
		this.nocheck = nocheck;
	}
	public String getText() {
		return text;
	}
	public void setText(String text) {
		this.text = text;
	}
	public String getState() {
		return state;
	}
	public void setState(String state) {
		this.state = state;
	}
	public String getUrl() {
		return url;
	}
	public void setUrl(String url) {
		this.url = url;
	}
	public String getIconCls() {
		return iconCls;
	}
	public void setIconCls(String iconCls) {
		this.iconCls = iconCls;
	}
	public String getExt1() {
		return ext1;
	}
	public void setExt1(String ext1) {
		this.ext1 = ext1;
	}
	public List<TreeHelper<T>> getChildren() {
		return children;
	}
	public void setChildren(List<TreeHelper<T>> children) {
		this.children = children;
	}
	public T getAttributes() {
		return attributes;
	}
	public void setAttributes(T attributes) {
		this.attributes = attributes;
	}
	
}
