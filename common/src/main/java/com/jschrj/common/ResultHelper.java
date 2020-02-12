package com.jschrj.common;

import java.io.Serializable;

public class ResultHelper implements Serializable {
	/**
	 * 
	 */
	private static final long serialVersionUID = 975430964974219379L;
	private boolean success;
	private String msg="";
	
	public ResultHelper() {
		super();
		// TODO Auto-generated constructor stub
	}
	public boolean isSuccess() {
		return success;
	}
	public void setSuccess(boolean success) {
		this.success = success;
	}
	public String getMsg() {
		return msg;
	}
	public void setMsg(String msg) {
		this.msg = msg;
	}
}
