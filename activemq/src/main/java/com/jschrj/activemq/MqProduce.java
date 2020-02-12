package com.jschrj.activemq;

import javax.annotation.Resource;
import javax.jms.JMSException;
import javax.jms.Message;
import javax.jms.Session;

import com.jschrj.common.Constant;
import com.jschrj.pojo.system.Email;
import org.springframework.jms.core.JmsTemplate;
import org.springframework.jms.core.MessageCreator;
import org.springframework.stereotype.Component;

import com.alibaba.fastjson.JSON;
import com.jschrj.pojo.system.Errorlog;
import com.jschrj.pojo.system.Optlog;

/**
 * ActiveMQ 消息生产类
 * 
 * @author zxy
 *
 */
@Component
public class MqProduce {

	@Resource
	private JmsTemplate jmsTemplate;

	/**
	 * 错误日志异步消息
	 * @param url 系统请求路径
	 * @param content 操作实体字符串
	 * @param userid 操作人id
	 * @param username 操作人
	 * @param remark 操作备注
	 * @throws Exception
	 */
	public void sendErrorlogMessage(String url, String content, int userid, String username, String remark) throws Exception {
		Errorlog log=new Errorlog();
		log.setUrl(url);
		log.setContent(content);
		log.setUserid(userid);
		log.setUsername(username);
		log.setRemark(remark);
		final String messgae=JSON.toJSONString(log);
		
		MessageCreator messageCreator = new MessageCreator() {
	        public Message createMessage(Session session) throws JMSException {
	            return session.createTextMessage(messgae);
	        }
	    };
		jmsTemplate.send("errorlog_queue",messageCreator);
	}
	
	/**
	 * 操作日志异步消息
	 * @param content 操作说明
	 * @param userid 操作人id
	 * @param username 操作人
	 * @throws Exception
	 */
	public void sendOptlogMessage(String referid, String content, int userid, String username) throws Exception {
		Optlog log=new Optlog();
		log.setReferid(referid);
		log.setContent(content);
		log.setUserid(userid);
		log.setUsername(username);
		final String messgae=JSON.toJSONString(log);
		
		MessageCreator messageCreator = new MessageCreator() {
	        public Message createMessage(Session session) throws JMSException {
	            return session.createTextMessage(messgae);
	        }
	    };
		jmsTemplate.send("optlog_queue",messageCreator);
	}

	public void sendEmailMessage(int storyid, int mailto, String content) throws Exception {
		Email email=new Email();
		email.setStoryid(storyid);
		email.setMailto(mailto);
		email.setContent(content);
		final String messgae=JSON.toJSONString(email);

		if(Constant.SENDMAIL=="1"){

			//测试环境默认不发送邮件
			MessageCreator messageCreator = new MessageCreator() {
				public Message createMessage(Session session) throws JMSException {
					return session.createTextMessage(messgae);
				}
			};
			jmsTemplate.send("mail_queue",messageCreator);
		}
	}
	
	/**
	 * 发送消息
	 * @param queueName 队列名称
	 * @param messgae 消息（实体json字符串）
	 * @throws Exception
	 */
	public void sendMessage(String queueName, final String messgae) throws Exception {
		
		MessageCreator messageCreator = new MessageCreator() {
	        public Message createMessage(Session session) throws JMSException {
	            return session.createTextMessage(messgae);
	        }
	    };
		jmsTemplate.send(queueName,messageCreator);
	}
}
