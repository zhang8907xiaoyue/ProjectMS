package com.jschrj.pojo.system;

import java.util.HashMap;
import java.util.Map;

public class UserSession {
	
	//定义静态sessionIDMap变量，使之程序运行时，一直存在内存中。
	private static Map<Object, String> sessionIDMap = new HashMap<Object,String>();

	public static Map<Object, String> getSessionIDMap() {
		return sessionIDMap;
	}

	public static void setSessionIDMap(Map<Object, String> sessionIDMap) {
		UserSession.sessionIDMap = sessionIDMap;
	}
	
}
