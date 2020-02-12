package com.jschrj.activemq.listener;

import com.alibaba.fastjson.JSON;
import com.jschrj.api.system.SystemService;
import com.jschrj.pojo.system.Email;
import com.jschrj.pojo.system.Errorlog;
import org.springframework.stereotype.Component;

import javax.annotation.Resource;
import javax.jms.Message;
import javax.jms.MessageListener;
import javax.jms.TextMessage;

/**
 * 消息消费监听类
 * 
 * @author zxy
 */
@Component
public class MailMqListener implements MessageListener {
	
	@Resource
	SystemService service;

	public void onMessage(Message arg0) {
		TextMessage textMessage = (TextMessage) arg0;
		try {
			Email email=JSON.parseObject(textMessage.getText(),Email.class);
			service.insertEmaillog(email);
		} catch (Exception e) {
			
			e.printStackTrace();
		}
	}

}
