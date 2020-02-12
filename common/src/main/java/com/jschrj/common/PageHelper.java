package com.jschrj.common;

import java.util.List;

public class PageHelper<T> {
	
	private int page; // 当前页
	private int rowNum; // 每页显示条数
	private int lastpage; // 总页数
	private int total; // 总页数
	private int records; // 总记录数
	private List<T> rows; //数据
	private T userdata; //汇总数据
	private String sidx;//排序列名
	private String sord;//排序方式
	public int getPage() {
		return page;
	}
	public void setPage(int page) {
		this.page = page;
	}
	public int getRowNum() {
		return rowNum;
	}
	public void setRowNum(int rowNum) {
		this.rowNum = rowNum;
	}
	public int getLastpage() {
		return lastpage;
	}
	public void setLastpage(int lastpage) {
		this.lastpage = lastpage;
	}
	public int getTotal() {
		return total;
	}
	public void setTotal(int total) {
		this.total = total;
	}
	public int getRecords() {
		return records;
	}
	public void setRecords(int records) {
		setTotal((records%getRowNum()>0)?(records/getRowNum()+1):(records/getRowNum()));
		this.records = records;
	}
	public List<T> getRows() {
		return rows;
	}
	public void setRows(List<T> rows) {
		this.rows = rows;
	}
	public T getUserdata() {
		return userdata;
	}
	public void setUserdata(T userdata) {
		this.userdata = userdata;
	}
	public String getSidx() {
		return sidx;
	}
	public void setSidx(String sidx) {
		this.sidx = sidx;
	}
	public String getSord() {
		return sord;
	}
	public void setSord(String sord) {
		this.sord = sord;
	}
}
