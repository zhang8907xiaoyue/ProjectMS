package com.jschrj.dao.base;


public interface IFilesidDao {

	String getLastRequestDate() throws Exception;
	
    int insert() throws Exception;

	void added() throws Exception;

	void newDay() throws Exception;

	int getId() throws Exception;
}