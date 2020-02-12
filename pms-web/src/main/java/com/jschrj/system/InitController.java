package com.jschrj.system;

import java.io.InputStream;
import java.util.Properties;

import javax.annotation.PostConstruct;

import org.springframework.stereotype.Controller;

import com.jschrj.common.Constant;

@Controller
public class InitController {

	@PostConstruct
	public void initConstant() throws Exception {
		
		// 构造Properties对象  
        Properties properties = new Properties();
		InputStream is = this.getClass().getResourceAsStream("/setting.properties");
		properties.load(is); 
		// 读取配置文件  
		Constant.VERSION=(String) properties.get("version");
		Constant.SENDMAIL=(String) properties.get("send-mail");
		Constant.FILE_SERVER_URL=(String) properties.get("file-server-url");
		Constant.FILE_VIEW_URL=(String) properties.get("file-view-url");
		Constant.FILE_SERVER_TOKEN=(String) properties.get("file-server-token");
		
	}
}
