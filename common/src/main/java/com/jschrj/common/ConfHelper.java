package com.jschrj.common;

import java.io.IOException;
import java.io.InputStream;
import java.util.Properties;

public class ConfHelper {
	
	public String getValue(String path,String name) {
		String value=null;
		Properties prop = new Properties();  
		try {
			InputStream in = this.getClass().getResourceAsStream(path);  
			prop.load(in);
			value=prop.getProperty(name);
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}  
		return value;
	}
}
