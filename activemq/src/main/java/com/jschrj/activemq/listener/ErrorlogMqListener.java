package com.jschrj.activemq.listener;

import javax.annotation.Resource;
import javax.jms.Message;
import javax.jms.MessageListener;
import javax.jms.TextMessage;

import org.springframework.stereotype.Component;

import com.alibaba.fastjson.JSON;
import com.jschrj.pojo.system.Errorlog;
import com.jschrj.api.system.SystemService;

/**
 * 消息消费监听类
 * 
 * @author zxy
 */
@Component
public class ErrorlogMqListener implements MessageListener {
	
	@Resource
	SystemService service;

	public void onMessage(Message arg0) {
		TextMessage textMessage = (TextMessage) arg0;
		try {
			Errorlog log=JSON.parseObject(textMessage.getText(),Errorlog.class);
			service.insertErrorlog(log);
		} catch (Exception e) {
			
			e.printStackTrace();
		}
	}

}
