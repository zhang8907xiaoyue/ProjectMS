package com.jschrj.activemq.listener;

import javax.annotation.Resource;
import javax.jms.Message;
import javax.jms.MessageListener;
import javax.jms.TextMessage;

import org.springframework.stereotype.Component;

import com.alibaba.fastjson.JSON;
import com.jschrj.pojo.system.Optlog;
import com.jschrj.api.system.SystemService;

/**
 * 消息消费监听类
 * 
 * @author zxy
 */
@Component
public class OptlogMqListener implements MessageListener {
	
	@Resource
	SystemService service;

	public void onMessage(Message arg0) {
		TextMessage textMessage = (TextMessage) arg0;
		try {
			Optlog log=JSON.parseObject(textMessage.getText(),Optlog.class);
			service.insertOptlog(log);
		} catch (Exception e) {
			
			e.printStackTrace();
		}
	}

}
