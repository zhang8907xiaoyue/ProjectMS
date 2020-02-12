package com.jschrj.interceptor;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.HashMap;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.web.servlet.HandlerExceptionResolver;
import org.springframework.web.servlet.ModelAndView;

import com.alibaba.fastjson.JSONArray;
import com.alibaba.fastjson.JSONObject;
import com.jschrj.activemq.MqProduce;

/**
 * spring mvc异常统一捕获处理
 * @author PC
 *
 */
public class ExceptionHandler implements HandlerExceptionResolver {

	@Resource
	MqProduce mqProduce;
	
	public ModelAndView resolveException(HttpServletRequest request,
			HttpServletResponse response, Object obj, Exception ex) {
		String requestUrl = request.getRequestURI(); 
		//异常写入日志文件
		Logger logger = LoggerFactory.getLogger(ExceptionHandler.class);
		logger.error("请求："+requestUrl+",错误信息："+ex.getMessage());
		try {
			mqProduce.sendErrorlogMessage(requestUrl, ex.getMessage(), 0,"", "");
		} catch (Exception e1) {
			
			e1.printStackTrace();
		}
		//判断是否是ajax请求
		if (!(request.getHeader("accept").indexOf("application/json") > -1 || (request  
                .getHeader("X-Requested-With") != null && request  
                .getHeader("X-Requested-With").indexOf("XMLHttpRequest") > -1))) {  
            // 如果不是异步请求  
			Map<String, Object> model = new HashMap<String, Object>();
	        model.put("request", requestUrl);   
	        model.put("ex", ex.getMessage());  
//	        model.put("ex", "系统异常，请联系管理人员");
			return new ModelAndView("/WEB-INF/error/error.jsp",model);
        } else {// JSON格式返回  
            try {  
                PrintWriter writer = response.getWriter();  
                JSONObject jObj=new JSONObject();
                jObj.put("success", false);
                jObj.put("msg", ex.getMessage());
//                jObj.put("msg", "系统异常，请联系管理人员");
                writer.write(JSONArray.toJSONString(jObj));  
                writer.flush();
				writer.close();
            } catch (IOException e) {  
                e.printStackTrace();  
            }  
            return null;  
        }  
	}
	
}
