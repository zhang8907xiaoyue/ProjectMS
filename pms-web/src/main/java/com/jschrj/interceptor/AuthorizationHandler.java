package com.jschrj.interceptor;

import java.io.PrintWriter;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.web.servlet.HandlerInterceptor;
import org.springframework.web.servlet.ModelAndView;

import com.alibaba.fastjson.JSONArray;
import com.alibaba.fastjson.JSONObject;
import com.jschrj.pojo.system.User;
import com.jschrj.pojo.system.UserSession;

/**
 * 登录session拦截器
 * @author PC
 *
 */
public class AuthorizationHandler implements HandlerInterceptor {

	public boolean preHandle(HttpServletRequest request, HttpServletResponse response,
			Object obj) throws Exception {
		HttpSession checkLoginSession=request.getSession();
		User user=(User)checkLoginSession.getAttribute("user");
		String sessionID = request.getRequestedSessionId();
		if(user!=null&&(!UserSession.getSessionIDMap().containsKey(user.getId())||!sessionID.equals(UserSession.getSessionIDMap().get(user.getId())))){
			//session失效
			checkLoginSession.removeAttribute("user");
			user=null;
		}
		if(user==null){
			//session过期
			//判断是否是ajax请求
			if (!(request.getHeader("accept").indexOf("application/json") > -1 || (request  
	                .getHeader("X-Requested-With") != null && request  
	                .getHeader("X-Requested-With").indexOf("XMLHttpRequest") > -1))) {  
					//用户session过期跳转登录页
			        response.sendRedirect(request.getContextPath()+"/account/login.do");
					
			} else{
				PrintWriter writer = response.getWriter();  
                JSONObject jObj=new JSONObject();
                jObj.put("success", false);
                jObj.put("msg", "网页过期，请刷新后重新登录！");
                writer.write(JSONArray.toJSONString(jObj));  
                writer.flush();  
			}
			return false;
		}else{
			return true;
		}
	}

	public void postHandle(HttpServletRequest arg0, HttpServletResponse arg1,
			Object arg2, ModelAndView arg3) throws Exception {
		
	}

	public void afterCompletion(HttpServletRequest arg0,
			HttpServletResponse arg1, Object arg2, Exception arg3)
			throws Exception {
		
	}

}
