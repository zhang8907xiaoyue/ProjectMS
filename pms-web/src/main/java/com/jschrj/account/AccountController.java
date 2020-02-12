package com.jschrj.account;

import java.io.OutputStream;
import java.text.SimpleDateFormat;
import java.util.*;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.jschrj.common.VerifyCodeHelper;
import com.jschrj.pojo.base.KeyAndValue;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.SessionAttributes;
import org.springframework.web.bind.support.SessionStatus;

import com.alibaba.fastjson.JSONArray;
import com.jschrj.activemq.MqProduce;
import com.jschrj.common.ResultHelper;
import com.jschrj.common.TreeHelper;
import com.jschrj.pojo.system.Application;
import com.jschrj.pojo.system.User;
import com.jschrj.pojo.system.UserSession;
import com.jschrj.api.account.AccountService;

@Controller
@SessionAttributes("user")
@RequestMapping(value="/account")
public class AccountController {
	
	@Resource
	AccountService service;

	@Resource
	MqProduce mqProduce;
	
	@RequestMapping(value="/login")
	public String toLogin(HttpServletRequest request,HttpServletResponse response) throws Exception{
		HttpSession session=request.getSession();
		User user=(User)session.getAttribute("user");
		if(user!=null){
			response.sendRedirect(request.getContextPath()+"/account/index.do");
			return null;
		}else{
			return "/WEB-INF/account/login.jsp";
		}
	}

	/**
	 * 获取验证码
	 */
	@ResponseBody
	@RequestMapping(value = "/getVerifyCode", produces = "text/html;charset=UTF-8")
	public String getVerifyCode() {
		String verifyCode = VerifyCodeHelper.generateVerifyCode(4);
		return verifyCode;
	}

	/**
	 * 输出验证码图片流
	 * @param request
	 * @param response
	 */
	@RequestMapping(value = "/verifyCodeShow")
	public void verifyCodeShow( HttpServletRequest request,HttpServletResponse response) {
		try {
			int w = 100, h = 35;
			String verifyCode = request.getParameter("verifyCode");
			OutputStream stream = response.getOutputStream();
			VerifyCodeHelper.outputImage(w,h,stream,verifyCode);
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
	
	@RequestMapping(value="/index")
	public String toIndex(HttpServletRequest request){
		
		HttpSession session=request.getSession();
		User user=(User)session.getAttribute("user");
		request.setAttribute("realname", user.getRealname());
		return "/WEB-INF/account/index.jsp";
	} 
	
	@RequestMapping(value="/changepassword")
	public String toChangepassword(HttpServletRequest request){
		
		return "/WEB-INF/account/changepassword.jsp";
	} 
	
	/**
	 * 获取用户权限菜单
	 */
	@ResponseBody
	@RequestMapping(value = "/getLeftMenuTree", produces = "text/html;charset=UTF-8")
	public String getLeftMenuTree(HttpServletRequest request) throws Exception {
		HttpSession session=request.getSession();
		User user=(User)session.getAttribute("user");
		List<TreeHelper<Application>> leftMenu=new ArrayList<TreeHelper<Application>>();
		int parentid=Integer.parseInt(request.getParameter("parentid").toString());
		leftMenu=service.getLeftMenuTree(leftMenu,parentid,user.getId());
		String jsonResult=JSONArray.toJSONString(leftMenu);
		return jsonResult;
	}
	
	@RequestMapping(value="/maintab")
	public String toMaintab(HttpServletRequest request){
		
		return "/WEB-INF/account/maintab.jsp";
	} 
	
	@RequestMapping(value="/home")
	public String toHome(HttpServletRequest request){
		
		return "/WEB-INF/account/home.jsp";
	} 
	
	/**
	 * 检测用户是否登录
	 * @param request
	 * @param map
	 * @return
	 * @throws Exception
	 */
	@ResponseBody
	@RequestMapping(value = "/checkLogin", produces = "text/html;charset=UTF-8")
	public String doLogin(HttpServletRequest request, ModelMap map) throws Exception {
		String name = request.getParameter("username");
		String password = request.getParameter("password");
		User user=service.selectByName(name);
		String resultString="";
		ResultHelper resultParam=new ResultHelper();
		String sessionID = request.getRequestedSessionId();
		if(user!=null){
			if(user.getStatus()==0){
				throw new Exception("用户已被禁用！");
			}else if(password.equals(user.getPassword())){
				if(!UserSession.getSessionIDMap().containsKey(user.getId())){
					//不存在，首次登陆，放入Map
					UserSession.getSessionIDMap().put(user.getId(), sessionID);
				}else if(UserSession.getSessionIDMap().containsKey(user.getId())&&!sessionID.equals(UserSession.getSessionIDMap().get(user.getId()))){
					
					//清空sessionid
					UserSession.getSessionIDMap().remove(user.getId());
					UserSession.getSessionIDMap().put(user.getId(), sessionID);
				}
				map.put("user", user);
				resultParam.setSuccess(true);
				resultString=JSONArray.toJSONString(resultParam);
				mqProduce.sendOptlogMessage(null,"用户登录",
						user.getId(),user.getRealname());
			}else{
				throw new Exception("密码不正确！");
			}
		} else{
			throw new Exception("用户不存在！");
		}
		return resultString;
	}
	
	/**
	 * 登出
	 * @param status
	 * @param request
	 * @return
	 */
	@RequestMapping(value="/logOut")
	public String doLoginOut(SessionStatus status,HttpServletRequest request){
		HttpSession checkLoginSession=request.getSession();
		User user=(User)checkLoginSession.getAttribute("user");
		//清空sessionid
		UserSession.getSessionIDMap().remove(user.getId());
		//清空session，返回登录页面
		status.setComplete();
		return "/WEB-INF/account/login.jsp";
	}

	@ResponseBody
	@RequestMapping(value = "/getGkCounts", produces = "text/html;charset=UTF-8")
	public String getGkCounts(HttpServletRequest request) throws Exception {

		HttpSession checkLoginSession=request.getSession();
		User user=(User)checkLoginSession.getAttribute("user");
		KeyAndValue counts=service.getGkCounts(user.getId());
		String jsonResult=JSONArray.toJSONString(counts);
		return jsonResult;
	}

	@ResponseBody
	@RequestMapping(value = "/getProjectSum", produces = "text/html;charset=UTF-8")
	public String getProjectSum(HttpServletRequest request,HttpServletResponse response) throws Exception {
		String resultJson = null;
		List<KeyAndValue> listTemp=new ArrayList<KeyAndValue>();
		String dateFr="";
		String dateTo="";
		Calendar cal = Calendar.getInstance();
		int year=cal.get(Calendar.YEAR);
		Date now = new Date();
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
		dateTo = sdf.format(now);
		dateFr=String.valueOf(year)+"-01-01 00:00:00";
		Map<String,Object> param=new HashMap<>();
		param.put("dateFr",dateFr);
		param.put("dateTo",dateTo);
		listTemp=service.getProjectSum(param);
		resultJson=JSONArray.toJSONString(listTemp);
		return resultJson;
	}

	@ResponseBody
	@RequestMapping(value = "/getSourceSum", produces = "text/html;charset=UTF-8")
	public String getSourceSum(HttpServletRequest request,HttpServletResponse response) throws Exception {
		String resultJson = null;
		List<KeyAndValue> listTemp=new ArrayList<KeyAndValue>();
		String dateFr="";
		String dateTo="";
		Calendar cal = Calendar.getInstance();
		int year=cal.get(Calendar.YEAR);
		Date now = new Date();
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
		dateTo = sdf.format(now);
		dateFr=String.valueOf(year)+"-01-01 00:00:00";
		Map<String,Object> param=new HashMap<>();
		param.put("dateFr",dateFr);
		param.put("dateTo",dateTo);
		listTemp=service.getSourceSum(param);
		resultJson=JSONArray.toJSONString(listTemp);
		return resultJson;
	}
}
