package com.jschrj.system;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.alibaba.fastjson.JSON;
import com.alibaba.fastjson.JSONArray;
import com.jschrj.activemq.MqProduce;
import com.jschrj.common.PageHelper;
import com.jschrj.common.ResultHelper;
import com.jschrj.common.TreeHelper;
import com.jschrj.pojo.system.Application;
import com.jschrj.pojo.system.Organization;
import com.jschrj.pojo.system.Role;
import com.jschrj.pojo.system.RolePower;
import com.jschrj.pojo.system.User;
import com.jschrj.pojo.system.UserRole;
import com.jschrj.api.system.SystemService;

@Controller
@RequestMapping(value="/system")
public class SystemController {
	
	@Resource
	SystemService service;
	
	@Resource
	MqProduce mqProduce;
	
	/**********************************菜单管理start******************************************/
	/**
	 * 菜单管理
	 * @param request
	 * @return
	 */
	@RequestMapping(value="/application")
	public String toApplication(HttpServletRequest request){
		
		return "/WEB-INF/system/application.jsp";
	} 
	
	/**
	 * 菜单Form
	 * @param request
	 * @return
	 */
	@RequestMapping(value="/applicationForm")
	public String toApplicationForm(HttpServletRequest request) throws Exception{
		
		String type=request.getParameter("type");
		if("edit".equals(type)){
			int id=Integer.parseInt(request.getParameter("id").toString());
			Application application=service.getApplicationById(id);
			request.setAttribute("application", application);
		}
		request.setAttribute("type", type);
		return "/WEB-INF/system/applicationForm.jsp";
	} 
	
	/**
	 * 获取菜单分页信息 
	 * @param request
	 * @return
	 * @throws Exception
	 */
	@ResponseBody
	@RequestMapping(value = "/getApplicationPage",method=RequestMethod.POST, produces = "text/html;charset=UTF-8")
	public String getApplicationPage(HttpServletRequest request,PageHelper<Application> pageHelper) throws Exception {
		HttpSession checkLoginSession = request.getSession();
		User user = (User)checkLoginSession.getAttribute("user");
		int orgPowerId =user.getOrgpowerid();
		//注：jqgrid每页数量使用的是rows，与返回分页数据的list实体同名
		int rows=Integer.parseInt(request.getParameter("rows"));
		pageHelper.setRowNum(rows);
		String name=request.getParameter("name");
		int parentid=(request.getParameter("parentid")==null||request.getParameter("parentid")=="")?-1:Integer.parseInt(request.getParameter("parentid"));
		int status=Integer.parseInt(request.getParameter("status"));
		Map<String, Object> param = new HashMap<String, Object>();
		param.put("name", name);
		param.put("parentid", parentid);
		param.put("orgPowerId", orgPowerId);
		param.put("status", status);
		int records=service.getApplicationCounts(param);
		pageHelper.setRecords(records);
		pageHelper=service.getApplicationPage(pageHelper, param);
		String jsonResult=JSONArray.toJSONString(pageHelper);
		return jsonResult;
	}
	
	/**
	 * 获取菜单机构树
	 * @param request
	 * @return
	 * @throws Exception
	 */
	@ResponseBody
	@RequestMapping(value = "/getApplicationTree",method = RequestMethod.POST, produces = "text/html;charset=UTF-8")
	public String getApplicationTree(HttpServletRequest request) throws Exception {
		
		List<TreeHelper> listTemp = new ArrayList<TreeHelper>();
		listTemp = service.getApplicationTree();
		String jsonResult = JSON.toJSONString(listTemp);
		return jsonResult;
	}
	
	/**
	 * 新增菜单
	 * @param request
	 * @param organization
	 * @return
	 * @throws Exception
	 */
	@ResponseBody
	@RequestMapping(value = "/insertApplication",method=RequestMethod.POST, produces = "text/html;charset=UTF-8")
	public String insertApplication(HttpServletRequest request,Application application) throws Exception {
		ResultHelper resultHandler=new ResultHelper();
		HttpSession checkLoginSession=request.getSession();
		User user=(User)checkLoginSession.getAttribute("user");
		service.insertApplication(application);
		resultHandler.setSuccess(true);
		resultHandler.setMsg("菜单："+application.getName()+",新增成功！");
		mqProduce.sendOptlogMessage(null,"新增菜单："+application.getName(),
				user.getId(),user.getRealname());
		String jsonResult=JSONArray.toJSONString(resultHandler);
		return jsonResult;
	}
	
	/**
	 * 更新菜单
	 * @param request
	 * @param organization
	 * @return
	 * @throws Exception
	 */
	@ResponseBody
	@RequestMapping(value = "/updateApplication",method=RequestMethod.POST, produces = "text/html;charset=UTF-8")
	public String updateApplication(HttpServletRequest request,Application application) throws Exception {
		ResultHelper resultHandler=new ResultHelper();
		HttpSession checkLoginSession=request.getSession();
		User user=(User)checkLoginSession.getAttribute("user");
		service.updateApplication(application);
		resultHandler.setSuccess(true);
		resultHandler.setMsg("菜单："+application.getName()+",修改成功！");
		mqProduce.sendOptlogMessage(null,"修改菜单："+application.getName(),
				user.getId(),user.getRealname());
		String jsonResult=JSONArray.toJSONString(resultHandler);
		return jsonResult;
	}
	
	/**
	 * 禁用菜单
	 * @param request
	 * @param organization
	 * @return
	 * @throws Exception
	 */
	@ResponseBody
	@RequestMapping(value = "/deleteApplication",method=RequestMethod.POST, produces = "text/html;charset=UTF-8")
	public String deleteApplication(HttpServletRequest request,Application application) throws Exception {
		ResultHelper resultHandler=new ResultHelper();
		HttpSession checkLoginSession=request.getSession();
		User user=(User)checkLoginSession.getAttribute("user");
		application.setStatus(0);
		service.deleteApplication(application);
		resultHandler.setSuccess(true);
		resultHandler.setMsg("禁用菜单成功！");
		mqProduce.sendOptlogMessage(null,"禁用组织："+application.getId(),
				user.getId(),user.getRealname());
		String jsonResult=JSONArray.toJSONString(resultHandler);
		return jsonResult;
	}
	/**********************************菜单管理end******************************************/
	
	/**********************************组织管理start******************************************/
	/**
	 * 组织管理
	 * @param request
	 * @return
	 */
	@RequestMapping(value="/organization")
	public String toOrganization(HttpServletRequest request){
		
		return "/WEB-INF/system/organization.jsp";
	} 
	
	/**
	 * 组织Form
	 * @param request
	 * @return
	 */
	@RequestMapping(value="/organizationForm")
	public String toOrganizationForm(HttpServletRequest request) throws Exception{
		
		String type=request.getParameter("type");
		if("edit".equals(type)){
			int id=Integer.parseInt(request.getParameter("id").toString());
			Organization organization=service.getOrgById(id);
			request.setAttribute("organization", organization);
		}
		request.setAttribute("type", type);
		return "/WEB-INF/system/organizationForm.jsp";
	} 
	
	/**
	 * 获取组织分页信息 
	 * @param request
	 * @return
	 * @throws Exception
	 */
	@ResponseBody
	@RequestMapping(value = "/getOrgPage",method=RequestMethod.POST, produces = "text/html;charset=UTF-8")
	public String getOrgPage(HttpServletRequest request,PageHelper<Organization> pageHelper) throws Exception {
		HttpSession checkLoginSession = request.getSession();
		User user = (User)checkLoginSession.getAttribute("user");
//		int orgPowerId =user.getOrgpowerid();
		//注：jqgrid每页数量使用的是rows，与返回分页数据的list实体同名
		int rows=Integer.parseInt(request.getParameter("rows"));
		pageHelper.setRowNum(rows);
		String name=request.getParameter("name");
		int parentid=(request.getParameter("parentid")==null||request.getParameter("parentid")=="")?-1:Integer.parseInt(request.getParameter("parentid"));
		int status=Integer.parseInt(request.getParameter("status"));
		Map<String, Object> param = new HashMap<String, Object>();
		param.put("name", name);
		param.put("parentid", parentid);
//		param.put("orgPowerId", orgPowerId);
		param.put("status", status);
		int records=service.getOrgCounts(param);
		pageHelper.setRecords(records);
		pageHelper=service.getOrgPage(pageHelper, param);
		String jsonResult=JSONArray.toJSONString(pageHelper);
		return jsonResult;
	}
	
	/**
	 * 获取部门List信息 
	 * @param request
	 * @return
	 * @throws Exception
	 */
	@ResponseBody
	@RequestMapping(value = "/getOrgList",method=RequestMethod.POST, produces = "text/html;charset=UTF-8")
	public String getOrgList(HttpServletRequest request) throws Exception {
		
		List<Organization> listTemp=service.getOrgList();
		String jsonResult=JSONArray.toJSONString(listTemp);
		return jsonResult;
	}
	
	/**
	 * 获取组织机构树
	 * @param request
	 * @return
	 * @throws Exception
	 */
	@ResponseBody
	@RequestMapping(value = "/getOrgTree",method = RequestMethod.POST, produces = "text/html;charset=UTF-8")
	public String getOrgTree(HttpServletRequest request) throws Exception {
		
		HttpSession checkLoginSession = request.getSession();
		User user = (User) checkLoginSession.getAttribute("user");
		Map<String, Object> param=new HashMap<String, Object>();
		param.put("rootid",user.getOrgpowerid());
		List<TreeHelper> listTemp = new ArrayList<TreeHelper>();
		listTemp = service.getOrgTree(param);
		String jsonResult = JSON.toJSONString(listTemp);
		return jsonResult;
	}

	/**
	 * 获取组织机构树
	 * @param request
	 * @return
	 * @throws Exception
	 */
	@ResponseBody
	@RequestMapping(value = "/getOrgUserTree",method = RequestMethod.POST, produces = "text/html;charset=UTF-8")
	public String getOrgUserTree(HttpServletRequest request) throws Exception {

		List<TreeHelper> listTemp = new ArrayList<TreeHelper>();
		listTemp = service.getOrgUserTree();
		String jsonResult = JSON.toJSONString(listTemp);
		return jsonResult;
	}
	
	/**
	 * 新增组织
	 * @param request
	 * @param organization
	 * @return
	 * @throws Exception
	 */
	@ResponseBody
	@RequestMapping(value = "/insertOrg",method=RequestMethod.POST, produces = "text/html;charset=UTF-8")
	public String insertOrg(HttpServletRequest request,Organization organization) throws Exception {
		ResultHelper resultHandler=new ResultHelper();
		HttpSession checkLoginSession=request.getSession();
		User user=(User)checkLoginSession.getAttribute("user");
		organization.setUserid(user.getId());
		organization.setUsername(user.getRealname());
		service.insertOrg(organization);
		resultHandler.setSuccess(true);
		resultHandler.setMsg("组织："+organization.getName()+",新增成功！");
		mqProduce.sendOptlogMessage(null,"新增组织："+organization.getName(),
				user.getId(),user.getRealname());
		String jsonResult=JSONArray.toJSONString(resultHandler);
		return jsonResult;
	}
	
	/**
	 * 更新组织
	 * @param request
	 * @param organization
	 * @return
	 * @throws Exception
	 */
	@ResponseBody
	@RequestMapping(value = "/updateOrg",method=RequestMethod.POST, produces = "text/html;charset=UTF-8")
	public String updateOrg(HttpServletRequest request,Organization organization) throws Exception {
		ResultHelper resultHandler=new ResultHelper();
		HttpSession checkLoginSession=request.getSession();
		User user=(User)checkLoginSession.getAttribute("user");
		organization.setUserid(user.getId());
		organization.setUsername(user.getRealname());
		service.updateOrg(organization);
		resultHandler.setSuccess(true);
		resultHandler.setMsg("组织："+organization.getName()+",修改成功！");
		mqProduce.sendOptlogMessage(null,"修改组织："+organization.getName(),
				user.getId(),user.getRealname());
		String jsonResult=JSONArray.toJSONString(resultHandler);
		return jsonResult;
	}
	
	/**
	 * 禁用组织
	 * @param request
	 * @param organization
	 * @return
	 * @throws Exception
	 */
	@ResponseBody
	@RequestMapping(value = "/deleteOrg",method=RequestMethod.POST, produces = "text/html;charset=UTF-8")
	public String deleteOrg(HttpServletRequest request,Organization organization) throws Exception {
		ResultHelper resultHandler=new ResultHelper();
		HttpSession checkLoginSession=request.getSession();
		User user=(User)checkLoginSession.getAttribute("user");
		organization.setUserid(user.getId());
		organization.setUsername(user.getRealname());
		organization.setStatus(0);
		service.deleteOrg(organization);
		resultHandler.setSuccess(true);
		resultHandler.setMsg("禁用组织成功！");
		mqProduce.sendOptlogMessage(null,"禁用组织："+organization.getId(),
				user.getId(),user.getRealname());
		String jsonResult=JSONArray.toJSONString(resultHandler);
		return jsonResult;
	}
	/**********************************组织管理end******************************************/
	
	/**********************************用户管理start******************************************/
	/**
	 * 用户管理
	 * @param request
	 * @return
	 */
	@RequestMapping(value="/user")
	public String toUser(HttpServletRequest request){
		
		return "/WEB-INF/system/user.jsp";
	} 
	
	/**
	 * 用户Form
	 * @param request
	 * @return
	 */
	@RequestMapping(value="/userForm")
	public String toUserForm(HttpServletRequest request) throws Exception{
		
		String type=request.getParameter("type");
		if("edit".equals(type)){
			int id=Integer.parseInt(request.getParameter("id").toString());
			User user=service.getUserById(id);
			request.setAttribute("user", user);
		}
		request.setAttribute("type", type);
		return "/WEB-INF/system/userForm.jsp";
	} 
	
	/**
	 * 获取用户分页信息
	 * @param request
	 * @return
	 * @throws Exception
	 */
	@ResponseBody
	@RequestMapping(value = "/getUserPage",method=RequestMethod.POST, produces = "text/html;charset=UTF-8")
	public String getUserPage(HttpServletRequest request,PageHelper<User> pageHelper) throws Exception {
		HttpSession checkLoginSession = request.getSession();
		User user = (User)checkLoginSession.getAttribute("user");
		//注：jqgrid每页数量使用的是rows，与返回分页数据的list实体同名
		int rows=Integer.parseInt(request.getParameter("rows"));
		pageHelper.setRowNum(rows);
		String name=request.getParameter("name");
		String realname=request.getParameter("realname");
		String orgname=request.getParameter("orgname");
		int status=Integer.parseInt(request.getParameter("status"));
		Map<String, Object> param = new HashMap<String, Object>();
		param.put("name", name);
		param.put("realname", realname);
		param.put("orgname", orgname);
		param.put("status", status);
		int records=service.getUserCounts(param);
		pageHelper.setRecords(records);
		pageHelper=service.getUserPage(pageHelper, param);
		String jsonResult=JSONArray.toJSONString(pageHelper);
		return jsonResult;
	}

	/**
	 * 获取工作人员List信息
	 * @param request
	 * @return
	 * @throws Exception
	 */
	@ResponseBody
	@RequestMapping(value = "/getUserList",method=RequestMethod.POST, produces = "text/html;charset=UTF-8")
	public String getUserList(HttpServletRequest request) throws Exception {

		List<User> listTemp=service.getUserList();
		String jsonResult=JSONArray.toJSONString(listTemp);
		return jsonResult;
	}
	
	/**
	 * 新增用户
	 * @param request
	 * @param organization
	 * @return
	 * @throws Exception
	 */
	@ResponseBody
	@RequestMapping(value = "/insertUser",method=RequestMethod.POST, produces = "text/html;charset=UTF-8")
	public String insertUser(HttpServletRequest request,User userRecord) throws Exception {
		ResultHelper resultHandler=new ResultHelper();
		HttpSession checkLoginSession=request.getSession();
		User user=(User)checkLoginSession.getAttribute("user");
		userRecord.setUserid(user.getId());
		userRecord.setUsername(user.getRealname());
		service.insertUser(userRecord);
		resultHandler.setSuccess(true);
		resultHandler.setMsg("用户："+userRecord.getRealname()+",新增成功！");
		mqProduce.sendOptlogMessage(null,"新增用户："+userRecord.getRealname(),
				user.getId(),user.getRealname());
		String jsonResult=JSONArray.toJSONString(resultHandler);
		return jsonResult;
	}
	
	/**
	 * 更新用户
	 * @param request
	 * @param organization
	 * @return
	 * @throws Exception
	 */
	@ResponseBody
	@RequestMapping(value = "/updateUser",method=RequestMethod.POST, produces = "text/html;charset=UTF-8")
	public String updateUser(HttpServletRequest request,User userRecord) throws Exception {
		ResultHelper resultHandler=new ResultHelper();
		HttpSession checkLoginSession=request.getSession();
		User user=(User)checkLoginSession.getAttribute("user");
		userRecord.setUserid(user.getId());
		userRecord.setUsername(user.getRealname());
		service.updateUser(userRecord);
		resultHandler.setSuccess(true);
		resultHandler.setMsg("用户："+userRecord.getRealname()+",修改成功！");
		mqProduce.sendOptlogMessage(null,"修改用户："+userRecord.getRealname(),
				user.getId(),user.getRealname());
		String jsonResult=JSONArray.toJSONString(resultHandler);
		return jsonResult;
	}
	
	/**
	 * 更新密码
	 * @param request
	 * @param organization
	 * @return
	 * @throws Exception
	 */
	@ResponseBody
	@RequestMapping(value = "/updatePassword",method=RequestMethod.POST, produces = "text/html;charset=UTF-8")
	public String updateUser(HttpServletRequest request) throws Exception {
		ResultHelper resultHandler=new ResultHelper();
		HttpSession checkLoginSession=request.getSession();
		User user=(User)checkLoginSession.getAttribute("user");
		String oldpassword=request.getParameter("oldpassword");
		String newpassword=request.getParameter("newpassword");
		service.updatePassword(user.getId(),oldpassword,newpassword);
		resultHandler.setSuccess(true);
		resultHandler.setMsg("用户："+user.getRealname()+",修改密码成功！");
		mqProduce.sendOptlogMessage(null,"修改用户密码："+user.getRealname(),
				user.getId(),user.getRealname());
		String jsonResult=JSONArray.toJSONString(resultHandler);
		return jsonResult;
	}
	
	/**
	 * 禁用用户
	 * @param request
	 * @param organization
	 * @return
	 * @throws Exception
	 */
	@ResponseBody
	@RequestMapping(value = "/deleteUser",method=RequestMethod.POST, produces = "text/html;charset=UTF-8")
	public String deleteUser(HttpServletRequest request,User userRecord) throws Exception {
		ResultHelper resultHandler=new ResultHelper();
		HttpSession checkLoginSession=request.getSession();
		User user=(User)checkLoginSession.getAttribute("user");
		userRecord.setUserid(user.getId());
		userRecord.setUsername(user.getRealname());
		userRecord.setStatus(0);
		service.deleteUser(userRecord);
		resultHandler.setSuccess(true);
		resultHandler.setMsg("禁用用户成功！");
		mqProduce.sendOptlogMessage(null,"禁用用户："+userRecord.getId(),
				user.getId(),user.getRealname());
		String jsonResult=JSONArray.toJSONString(resultHandler);
		return jsonResult;
	}
	/**********************************用户管理end******************************************/
	
	/**********************************角色管理start******************************************/
	/**
	 * 角色管理
	 * @param request
	 * @return
	 */
	@RequestMapping(value="/role")
	public String toRole(HttpServletRequest request){
		
		return "/WEB-INF/system/role.jsp";
	} 
	
	/**
	 * 角色Form
	 * @param request
	 * @return
	 */
	@RequestMapping(value="/roleForm")
	public String toRoleForm(HttpServletRequest request) throws Exception{
		
		String type=request.getParameter("type");
		if("edit".equals(type)){
			int id=Integer.parseInt(request.getParameter("id").toString());
			Role role=service.getRoleById(id);
			request.setAttribute("role", role);
		}
		request.setAttribute("type", type);
		return "/WEB-INF/system/roleForm.jsp";
	} 
	
	/**
	 * 获取角色分页信息 
	 * @param request
	 * @return
	 * @throws Exception
	 */
	@ResponseBody
	@RequestMapping(value = "/getRolePage",method=RequestMethod.POST, produces = "text/html;charset=UTF-8")
	public String getRolePage(HttpServletRequest request,PageHelper<Role> pageHelper) throws Exception {
		
		//注：jqgrid每页数量使用的是rows，与返回分页数据的list实体同名
		int rows=Integer.parseInt(request.getParameter("rows"));
		pageHelper.setRowNum(rows);
		String name=request.getParameter("name");
		int status=Integer.parseInt(request.getParameter("status"));
		Map<String, Object> param = new HashMap<String, Object>();
		param.put("name", name);
		param.put("status", status);
		int records=service.getApplicationCounts(param);
		pageHelper.setRecords(records);
		pageHelper=service.getRolePage(pageHelper, param);
		String jsonResult=JSONArray.toJSONString(pageHelper);
		return jsonResult;
	}
	
	/**
	 * 获取角色List信息 
	 * @param request
	 * @return
	 * @throws Exception
	 */
	@ResponseBody
	@RequestMapping(value = "/getRoleList",method=RequestMethod.POST, produces = "text/html;charset=UTF-8")
	public String getOrderList(HttpServletRequest request) throws Exception {
		
		List<Role> listTemp=service.getRoleList();
		String jsonResult=JSONArray.toJSONString(listTemp);
		return jsonResult;
	}
	
	/**
	 * 获取用户角色List信息 
	 * @param request
	 * @return
	 * @throws Exception
	 */
	@ResponseBody
	@RequestMapping(value = "/getUserRoleList",method=RequestMethod.POST, produces = "text/html;charset=UTF-8")
	public String getUserRoleList(HttpServletRequest request) throws Exception {
		String userid=request.getParameter("userid");
		Map<String, Object> param=new HashMap<String, Object>();
		param.put("userid", userid);
		List<Role> listTemp=service.getUserRoleList(param);
		String jsonResult=JSONArray.toJSONString(listTemp);
		return jsonResult;
	}
	
	/**
	 * 新增角色
	 * @param request
	 * @param organization
	 * @return
	 * @throws Exception
	 */
	@ResponseBody
	@RequestMapping(value = "/insertRole",method=RequestMethod.POST, produces = "text/html;charset=UTF-8")
	public String insertRole(HttpServletRequest request,Role role) throws Exception {
		ResultHelper resultHandler=new ResultHelper();
		HttpSession checkLoginSession=request.getSession();
		User user=(User)checkLoginSession.getAttribute("user");
		role.setUserid(user.getId());
		role.setUsername(user.getRealname());
		service.insertRole(role);
		resultHandler.setSuccess(true);
		resultHandler.setMsg("角色："+role.getName()+",新增成功！");
		mqProduce.sendOptlogMessage(null,"新增角色："+role.getName(),
				user.getId(),user.getRealname());
		String jsonResult=JSONArray.toJSONString(resultHandler);
		return jsonResult;
	}
	
	/**
	 * 更新角色
	 * @param request
	 * @param organization
	 * @return
	 * @throws Exception
	 */
	@ResponseBody
	@RequestMapping(value = "/updateRole",method=RequestMethod.POST, produces = "text/html;charset=UTF-8")
	public String updateRole(HttpServletRequest request,Role role) throws Exception {
		ResultHelper resultHandler=new ResultHelper();
		HttpSession checkLoginSession=request.getSession();
		User user=(User)checkLoginSession.getAttribute("user");
		role.setUserid(user.getId());
		role.setUsername(user.getRealname());
		service.updateRole(role);
		resultHandler.setSuccess(true);
		resultHandler.setMsg("角色："+role.getName()+",修改成功！");
		mqProduce.sendOptlogMessage(null,"修改角色："+role.getName(),
				user.getId(),user.getRealname());
		String jsonResult=JSONArray.toJSONString(resultHandler);
		return jsonResult;
	}
	
	/**
	 * 禁用角色
	 * @param request
	 * @param role
	 * @return
	 * @throws Exception
	 */
	@ResponseBody
	@RequestMapping(value = "/deleteRole",method=RequestMethod.POST, produces = "text/html;charset=UTF-8")
	public String deleteRole(HttpServletRequest request,Role role) throws Exception {
		ResultHelper resultHandler=new ResultHelper();
		HttpSession checkLoginSession=request.getSession();
		User user=(User)checkLoginSession.getAttribute("user");
		role.setUserid(user.getId());
		role.setUsername(user.getRealname());
		role.setStatus(0);
		service.deleteRole(role);
		resultHandler.setSuccess(true);
		resultHandler.setMsg("禁用角色成功！");
		mqProduce.sendOptlogMessage(null,"禁用角色："+role.getId(),
				user.getId(),user.getRealname());
		String jsonResult=JSONArray.toJSONString(resultHandler);
		return jsonResult;
	}
	/**********************************角色管理end******************************************/
	
	/**********************************用户角色管理start******************************************/

	/**
	 * 用户角色
	 * @param request
	 * @return
	 */
	@RequestMapping(value="/userRole")
	public String toUserRole(HttpServletRequest request){
		String userid=request.getParameter("userid");
		request.setAttribute("userid", userid);
		return "/WEB-INF/system/userRole.jsp";
	} 
	
	/**
	 * 分配用户角色
	 * @param request
	 * @return
	 * @throws Exception
	 */
	@ResponseBody
	@RequestMapping(value = "/insertUserRole",method=RequestMethod.POST, produces = "text/html;charset=UTF-8")
	public String insertUserRole(HttpServletRequest request) throws Exception {
		
		int userid=Integer.parseInt(request.getParameter("userid").toString());
		String roleids=request.getParameter("roleids");
		ResultHelper resultHandler=new ResultHelper();
		UserRole userRole=new UserRole();
		userRole.setUserid(userid);
		service.insertUserRole(userRole,roleids);
		resultHandler.setSuccess(true);
		resultHandler.setMsg("用户角色分配成功！");
		String jsonResult=JSONArray.toJSONString(resultHandler);
		return jsonResult;
	}
	/**********************************用户角色管理start******************************************/
	
	/**********************************角色权限管理start******************************************/

	/**
	 * 用户角色
	 * @param request
	 * @return
	 */
	@RequestMapping(value="/rolePower")
	public String toRolePower(HttpServletRequest request) throws Exception{
		String roleid=request.getParameter("roleid");
		request.setAttribute("roleid", roleid);
		
		//获取应用程序列表
		List<Application> appList=new ArrayList<Application>();
		appList=service.getAppList();
		request.setAttribute("appList", appList);
		return "/WEB-INF/system/rolePower.jsp";
	} 
	
	/**
	 * 获取角色菜单List信息 
	 * @param request
	 * @return
	 * @throws Exception
	 */
	@ResponseBody
	@RequestMapping(value = "/getRolePowerList",method=RequestMethod.POST, produces = "text/html;charset=UTF-8")
	public String getRolePowerList(HttpServletRequest request) throws Exception {
		String roleid=request.getParameter("roleid");
		Map<String, Object> param=new HashMap<String, Object>();
		param.put("roleid", roleid);
		List<RolePower> listTemp=service.getRolePowerList(param);
		String jsonResult=JSONArray.toJSONString(listTemp);
		return jsonResult;
	}
	
	/**
	 * 分配用户角色
	 * @param request
	 * @return
	 * @throws Exception
	 */
	@ResponseBody
	@RequestMapping(value = "/insertRolePower",method=RequestMethod.POST, produces = "text/html;charset=UTF-8")
	public String insertRolePower(HttpServletRequest request) throws Exception {
		
		int roleid=Integer.parseInt(request.getParameter("roleid").toString());
		String appids=request.getParameter("appids");
		ResultHelper resultHandler=new ResultHelper();
		RolePower rolePower=new RolePower();
		rolePower.setRoleid(roleid);
		service.insertRolePower(rolePower,appids);
		resultHandler.setSuccess(true);
		resultHandler.setMsg("角色权限分配成功！");
		String jsonResult=JSONArray.toJSONString(resultHandler);
		return jsonResult;
	}
	/**********************************角色权限管理start******************************************/
	
}
