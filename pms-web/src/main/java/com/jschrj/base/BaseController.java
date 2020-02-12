package com.jschrj.base;

import com.alibaba.fastjson.JSONArray;
import com.jschrj.activemq.MqProduce;
import com.jschrj.api.base.BaseService;
import com.jschrj.common.PageHelper;
import com.jschrj.common.ResultHelper;
import com.jschrj.pojo.base.Modular;
import com.jschrj.pojo.base.Project;
import com.jschrj.pojo.base.Customer;
import com.jschrj.pojo.base.Source;
import com.jschrj.pojo.system.User;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

@Controller
@RequestMapping(value = "/base")
public class BaseController {

	@Resource
	BaseService baseService;

	@Resource
	MqProduce mqProduce;

	/**
	 * 获取来源List信息
	 * @param request
	 * @return
	 * @throws Exception
	 */
	@ResponseBody
	@RequestMapping(value = "/getProjectList",method= RequestMethod.POST, produces = "text/html;charset=UTF-8")
	public String getProjectList(HttpServletRequest request) throws Exception {

		List<Project> listTemp=baseService.getProjectList();
		String jsonResult= JSONArray.toJSONString(listTemp);
		return jsonResult;
	}

	/**
	 * 获取来源List信息
	 * @param request
	 * @return
	 * @throws Exception
	 */
	@ResponseBody
	@RequestMapping(value = "/getSourceList",method= RequestMethod.POST, produces = "text/html;charset=UTF-8")
	public String getSourceList(HttpServletRequest request) throws Exception {

		List<Source> listTemp=baseService.getSourceList();
		String jsonResult= JSONArray.toJSONString(listTemp);
		return jsonResult;
	}

	/**
	 * 获取模块List信息
	 * @param request
	 * @return
	 * @throws Exception
	 */
	@ResponseBody
	@RequestMapping(value = "/getModularList",method= RequestMethod.POST, produces = "text/html;charset=UTF-8")
	public String getModularList(HttpServletRequest request) throws Exception {

		String projectid=request.getParameter("projectid");
		Map<String,Object> param=new HashMap<String,Object>();
		param.put("projectid",projectid);
		List<Modular> listTemp=baseService.getModularList(param);
		String jsonResult= JSONArray.toJSONString(listTemp);
		return jsonResult;
	}

	/**
	 * 获取来源List信息
	 * @param request
	 * @return
	 * @throws Exception
	 */
	@ResponseBody
	@RequestMapping(value = "/getProjectcustomerList",method= RequestMethod.POST, produces = "text/html;charset=UTF-8")
	public String getProjectcustomerList(HttpServletRequest request) throws Exception {

		int projectid=Integer.parseInt(request.getParameter("projectid"));
		List<Customer> listTemp=baseService.getProjectcustomerList(projectid);
		String jsonResult= JSONArray.toJSONString(listTemp);
		return jsonResult;
	}

	/**********************************项目管理start******************************************/
	/**
	 * 项目管理
	 * @param request
	 * @return
	 */
	@RequestMapping(value="/project")
	public String toProject(HttpServletRequest request){

		return "/WEB-INF/base/project.jsp";
	}

	/**
	 * 项目Form
	 * @param request
	 * @return
	 */
	@RequestMapping(value="/projectForm")
	public String toProjectForm(HttpServletRequest request) throws Exception{

		String type=request.getParameter("type");
		if("edit".equals(type)){
			int id=Integer.parseInt(request.getParameter("id").toString());
			Project project=baseService.getProjectById(id);
			request.setAttribute("project", project);
		}
		request.setAttribute("type", type);
		return "/WEB-INF/base/projectForm.jsp";
	}

	/**
	 * 获取项目分页信息
	 * @param request
	 * @return
	 * @throws Exception
	 */
	@ResponseBody
	@RequestMapping(value = "/getProjectPage",method=RequestMethod.POST, produces = "text/html;charset=UTF-8")
	public String getProjectPage(HttpServletRequest request, PageHelper<Project> pageHelper) throws Exception {

		//注：jqgrid每页数量使用的是rows，与返回分页数据的list实体同名
		int rows=Integer.parseInt(request.getParameter("rows"));
		pageHelper.setRowNum(rows);
		String name=request.getParameter("name");
		int status=Integer.parseInt(request.getParameter("status"));
		Map<String, Object> param = new HashMap<String, Object>();
		param.put("name", name);
		param.put("status", status);
		int records=baseService.getProjectCounts(param);
		pageHelper.setRecords(records);
		pageHelper=baseService.getProjectPage(pageHelper, param);
		String jsonResult=JSONArray.toJSONString(pageHelper);
		return jsonResult;
	}

	/**
	 * 新增项目
	 * @param request
	 * @param project
	 * @return
	 * @throws Exception
	 */
	@ResponseBody
	@RequestMapping(value = "/insertProject",method=RequestMethod.POST, produces = "text/html;charset=UTF-8")
	public String insertProject(HttpServletRequest request,Project project) throws Exception {
		ResultHelper resultHandler=new ResultHelper();
		HttpSession checkLoginSession=request.getSession();
		User user=(User)checkLoginSession.getAttribute("user");
		project.setUserid(user.getId());
		project.setUsername(user.getRealname());
		baseService.insertProject(project);
		resultHandler.setSuccess(true);
		resultHandler.setMsg("项目："+project.getName()+",新增成功！");
		mqProduce.sendOptlogMessage(null,"新增项目："+project.getName(),
				user.getId(),user.getRealname());
		String jsonResult=JSONArray.toJSONString(resultHandler);
		return jsonResult;
	}

	/**
	 * 更新产品
	 * @param request
	 * @param project
	 * @return
	 * @throws Exception
	 */
	@ResponseBody
	@RequestMapping(value = "/updateProject",method=RequestMethod.POST, produces = "text/html;charset=UTF-8")
	public String updateProject(HttpServletRequest request,Project project) throws Exception {
		ResultHelper resultHandler=new ResultHelper();
		HttpSession checkLoginSession=request.getSession();
		User user=(User)checkLoginSession.getAttribute("user");
		project.setUserid(user.getId());
		project.setUsername(user.getRealname());
		baseService.updateProject(project);
		resultHandler.setSuccess(true);
		resultHandler.setMsg("项目："+project.getName()+",修改成功！");
		mqProduce.sendOptlogMessage(null,"修改项目："+project.getName(),
				user.getId(),user.getRealname());
		String jsonResult=JSONArray.toJSONString(resultHandler);
		return jsonResult;
	}

	/**
	 * 禁用产品
	 * @param request
	 * @param project
	 * @return
	 * @throws Exception
	 */
	@ResponseBody
	@RequestMapping(value = "/deleteProject",method=RequestMethod.POST, produces = "text/html;charset=UTF-8")
	public String deleteProject(HttpServletRequest request,Project project) throws Exception {
		ResultHelper resultHandler=new ResultHelper();
		HttpSession checkLoginSession=request.getSession();
		User user=(User)checkLoginSession.getAttribute("user");
		project.setUserid(user.getId());
		project.setUsername(user.getRealname());
		project.setStatus(0);
		baseService.updateProject(project);
		resultHandler.setSuccess(true);
		resultHandler.setMsg("禁用项目成功！");
		mqProduce.sendOptlogMessage(null,"禁用项目："+project.getId(),
				user.getId(),user.getRealname());
		String jsonResult=JSONArray.toJSONString(resultHandler);
		return jsonResult;
	}
	/**********************************项目管理end******************************************/

	/**********************************来源管理start******************************************/
	/**
	 * 来源管理
	 * @param request
	 * @return
	 */
	@RequestMapping(value="/source")
	public String toSource(HttpServletRequest request){

		return "/WEB-INF/base/source.jsp";
	}

	/**
	 * 来源Form
	 * @param request
	 * @return
	 */
	@RequestMapping(value="/sourceForm")
	public String toSourceForm(HttpServletRequest request) throws Exception{

		String type=request.getParameter("type");
		if("edit".equals(type)){
			int id=Integer.parseInt(request.getParameter("id").toString());
			Source source=baseService.getSourceById(id);
			request.setAttribute("source", source);
		}
		request.setAttribute("type", type);
		return "/WEB-INF/base/sourceForm.jsp";
	}

	/**
	 * 获取来源分页信息
	 * @param request
	 * @return
	 * @throws Exception
	 */
	@ResponseBody
	@RequestMapping(value = "/getSourcePage",method=RequestMethod.POST, produces = "text/html;charset=UTF-8")
	public String getSourcePage(HttpServletRequest request, PageHelper<Source> pageHelper) throws Exception {

		//注：jqgrid每页数量使用的是rows，与返回分页数据的list实体同名
		int rows=Integer.parseInt(request.getParameter("rows"));
		pageHelper.setRowNum(rows);
		String name=request.getParameter("name");
		int status=Integer.parseInt(request.getParameter("status"));
		Map<String, Object> param = new HashMap<String, Object>();
		param.put("name", name);
		param.put("status", status);
		int records=baseService.getSourceCounts(param);
		pageHelper.setRecords(records);
		pageHelper=baseService.getSourcePage(pageHelper, param);
		String jsonResult=JSONArray.toJSONString(pageHelper);
		return jsonResult;
	}

	/**
	 * 新增来源
	 * @param request
	 * @param source
	 * @return
	 * @throws Exception
	 */
	@ResponseBody
	@RequestMapping(value = "/insertSource",method=RequestMethod.POST, produces = "text/html;charset=UTF-8")
	public String insertSource(HttpServletRequest request,Source source) throws Exception {
		ResultHelper resultHandler=new ResultHelper();
		HttpSession checkLoginSession=request.getSession();
		User user=(User)checkLoginSession.getAttribute("user");
		source.setUserid(user.getId());
		source.setUsername(user.getRealname());
		baseService.insertSource(source);
		resultHandler.setSuccess(true);
		resultHandler.setMsg("来源："+source.getName()+",新增成功！");
		mqProduce.sendOptlogMessage(null,"新增来源："+source.getName(),
				user.getId(),user.getRealname());
		String jsonResult=JSONArray.toJSONString(resultHandler);
		return jsonResult;
	}

	/**
	 * 更新来源
	 * @param request
	 * @param source
	 * @return
	 * @throws Exception
	 */
	@ResponseBody
	@RequestMapping(value = "/updateSource",method=RequestMethod.POST, produces = "text/html;charset=UTF-8")
	public String updateSource(HttpServletRequest request,Source source) throws Exception {
		ResultHelper resultHandler=new ResultHelper();
		HttpSession checkLoginSession=request.getSession();
		User user=(User)checkLoginSession.getAttribute("user");
		source.setUserid(user.getId());
		source.setUsername(user.getRealname());
		baseService.updateSource(source);
		resultHandler.setSuccess(true);
		resultHandler.setMsg("来源："+source.getName()+",修改成功！");
		mqProduce.sendOptlogMessage(null,"修改来源："+source.getName(),
				user.getId(),user.getRealname());
		String jsonResult=JSONArray.toJSONString(resultHandler);
		return jsonResult;
	}

	/**
	 * 禁用来源
	 * @param request
	 * @param source
	 * @return
	 * @throws Exception
	 */
	@ResponseBody
	@RequestMapping(value = "/deleteSource",method=RequestMethod.POST, produces = "text/html;charset=UTF-8")
	public String deleteSource(HttpServletRequest request,Source source) throws Exception {
		ResultHelper resultHandler=new ResultHelper();
		HttpSession checkLoginSession=request.getSession();
		User user=(User)checkLoginSession.getAttribute("user");
		source.setUserid(user.getId());
		source.setUsername(user.getRealname());
		source.setStatus(0);
		baseService.updateSource(source);
		resultHandler.setSuccess(true);
		resultHandler.setMsg("禁用来源成功！");
		mqProduce.sendOptlogMessage(null,"禁用来源："+source.getId(),
				user.getId(),user.getRealname());
		String jsonResult=JSONArray.toJSONString(resultHandler);
		return jsonResult;
	}
	/**********************************来源管理end******************************************/

	/**********************************模块管理start******************************************/
	/**
	 * 模块管理
	 * @param request
	 * @return
	 */
	@RequestMapping(value="/modular")
	public String toModular(HttpServletRequest request){

		return "/WEB-INF/base/modular.jsp";
	}

	/**
	 * 模块Form
	 * @param request
	 * @return
	 */
	@RequestMapping(value="/modularForm")
	public String tModularForm(HttpServletRequest request) throws Exception{

		String type=request.getParameter("type");
		if("edit".equals(type)){
			int id=Integer.parseInt(request.getParameter("id").toString());
			Modular modular=baseService.getModularById(id);
			request.setAttribute("modular", modular);
		}
		request.setAttribute("type", type);
		return "/WEB-INF/base/modularForm.jsp";
	}

	/**
	 * 获取模块分页信息
	 * @param request
	 * @return
	 * @throws Exception
	 */
	@ResponseBody
	@RequestMapping(value = "/getModularPage",method=RequestMethod.POST, produces = "text/html;charset=UTF-8")
	public String getModularPage(HttpServletRequest request, PageHelper<Modular> pageHelper) throws Exception {

		//注：jqgrid每页数量使用的是rows，与返回分页数据的list实体同名
		int rows=Integer.parseInt(request.getParameter("rows"));
		pageHelper.setRowNum(rows);
		String project=request.getParameter("project");
		String name=request.getParameter("name");
		int status=Integer.parseInt(request.getParameter("status"));
		Map<String, Object> param = new HashMap<String, Object>();
		param.put("project", project);
		param.put("name", name);
		param.put("status", status);
		int records=baseService.getModularCounts(param);
		pageHelper.setRecords(records);
		pageHelper=baseService.getModularPage(pageHelper, param);
		String jsonResult=JSONArray.toJSONString(pageHelper);
		return jsonResult;
	}

	/**
	 * 新增模块
	 * @param request
	 * @param modular
	 * @return
	 * @throws Exception
	 */
	@ResponseBody
	@RequestMapping(value = "/insertModular",method=RequestMethod.POST, produces = "text/html;charset=UTF-8")
	public String insertModular(HttpServletRequest request,Modular modular) throws Exception {
		ResultHelper resultHandler=new ResultHelper();
		HttpSession checkLoginSession=request.getSession();
		User user=(User)checkLoginSession.getAttribute("user");
		modular.setUserid(user.getId());
		modular.setUsername(user.getRealname());
		baseService.insertModular(modular);
		resultHandler.setSuccess(true);
		resultHandler.setMsg("模块："+modular.getName()+",新增成功！");
		mqProduce.sendOptlogMessage(null,"新增模块："+modular.getName(),
				user.getId(),user.getRealname());
		String jsonResult=JSONArray.toJSONString(resultHandler);
		return jsonResult;
	}

	/**
	 * 更新模块
	 * @param request
	 * @param modular
	 * @return
	 * @throws Exception
	 */
	@ResponseBody
	@RequestMapping(value = "/updateModular",method=RequestMethod.POST, produces = "text/html;charset=UTF-8")
	public String updateModular(HttpServletRequest request,Modular modular) throws Exception {
		ResultHelper resultHandler=new ResultHelper();
		HttpSession checkLoginSession=request.getSession();
		User user=(User)checkLoginSession.getAttribute("user");
		modular.setUserid(user.getId());
		modular.setUsername(user.getRealname());
		baseService.updateModular(modular);
		resultHandler.setSuccess(true);
		resultHandler.setMsg("模块："+modular.getName()+",修改成功！");
		mqProduce.sendOptlogMessage(null,"修改模块："+modular.getName(),
				user.getId(),user.getRealname());
		String jsonResult=JSONArray.toJSONString(resultHandler);
		return jsonResult;
	}

	/**
	 * 禁用模块
	 * @param request
	 * @param modular
	 * @return
	 * @throws Exception
	 */
	@ResponseBody
	@RequestMapping(value = "/deleteModular",method=RequestMethod.POST, produces = "text/html;charset=UTF-8")
	public String deleteModular(HttpServletRequest request,Modular modular) throws Exception {
		ResultHelper resultHandler=new ResultHelper();
		HttpSession checkLoginSession=request.getSession();
		User user=(User)checkLoginSession.getAttribute("user");
		modular.setUserid(user.getId());
		modular.setUsername(user.getRealname());
		modular.setStatus(0);
		baseService.updateModular(modular);
		resultHandler.setSuccess(true);
		resultHandler.setMsg("禁用模块成功！");
		mqProduce.sendOptlogMessage(null,"禁用模块："+modular.getId(),
				user.getId(),user.getRealname());
		String jsonResult=JSONArray.toJSONString(resultHandler);
		return jsonResult;
	}
	/**********************************模块管理end******************************************/

	/**********************************客户管理start******************************************/
	/**
	 * 客户管理
	 * @param request
	 * @return
	 */
	@RequestMapping(value="/customer")
	public String toCustomer(HttpServletRequest request){

		return "/WEB-INF/base/customer.jsp";
	}

	/**
	 * 客户Form
	 * @param request
	 * @return
	 */
	@RequestMapping(value="/customerForm")
	public String toCustomerForm(HttpServletRequest request) throws Exception{

		String type=request.getParameter("type");
		if("edit".equals(type)){
			int id=Integer.parseInt(request.getParameter("id").toString());
			Customer customer=baseService.getCustomerById(id);
			request.setAttribute("customer", customer);
		}
		request.setAttribute("type", type);
		return "/WEB-INF/base/customerForm.jsp";
	}

	/**
	 * 获取客户分页信息
	 * @param request
	 * @return
	 * @throws Exception
	 */
	@ResponseBody
	@RequestMapping(value = "/getCustomerPage",method=RequestMethod.POST, produces = "text/html;charset=UTF-8")
	public String getCustomerPage(HttpServletRequest request, PageHelper<Customer> pageHelper) throws Exception {

		//注：jqgrid每页数量使用的是rows，与返回分页数据的list实体同名
		int rows=Integer.parseInt(request.getParameter("rows"));
		pageHelper.setRowNum(rows);
		String project=request.getParameter("project");
		String name=request.getParameter("name");
		int status=Integer.parseInt(request.getParameter("status"));
		Map<String, Object> param = new HashMap<String, Object>();
		param.put("project", project);
		param.put("name", name);
		param.put("status", status);
		int records=baseService.getCustomerCounts(param);
		pageHelper.setRecords(records);
		pageHelper=baseService.getCustomerPage(pageHelper, param);
		String jsonResult=JSONArray.toJSONString(pageHelper);
		return jsonResult;
	}

	/**
	 * 新增客户
	 * @param request
	 * @param customer
	 * @return
	 * @throws Exception
	 */
	@ResponseBody
	@RequestMapping(value = "/insertCustomer",method=RequestMethod.POST, produces = "text/html;charset=UTF-8")
	public String insertCustomer(HttpServletRequest request,Customer customer) throws Exception {
		ResultHelper resultHandler=new ResultHelper();
		HttpSession checkLoginSession=request.getSession();
		User user=(User)checkLoginSession.getAttribute("user");
		customer.setUserid(user.getId());
		customer.setUsername(user.getRealname());
		baseService.insertCustomer(customer);
		resultHandler.setSuccess(true);
		resultHandler.setMsg("客户："+customer.getName()+",新增成功！");
		mqProduce.sendOptlogMessage(null,"新增客户："+customer.getName(),
				user.getId(),user.getRealname());
		String jsonResult=JSONArray.toJSONString(resultHandler);
		return jsonResult;
	}

	/**
	 * 更新客户
	 * @param request
	 * @param customer
	 * @return
	 * @throws Exception
	 */
	@ResponseBody
	@RequestMapping(value = "/updateCustomer",method=RequestMethod.POST, produces = "text/html;charset=UTF-8")
	public String updateCustomer(HttpServletRequest request,Customer customer) throws Exception {
		ResultHelper resultHandler=new ResultHelper();
		HttpSession checkLoginSession=request.getSession();
		User user=(User)checkLoginSession.getAttribute("user");
		customer.setUserid(user.getId());
		customer.setUsername(user.getRealname());
		baseService.updateCustomer(customer);
		resultHandler.setSuccess(true);
		resultHandler.setMsg("客户："+customer.getName()+",修改成功！");
		mqProduce.sendOptlogMessage(null,"修改客户："+customer.getName(),
				user.getId(),user.getRealname());
		String jsonResult=JSONArray.toJSONString(resultHandler);
		return jsonResult;
	}

	/**
	 * 禁用客户
	 * @param request
	 * @param customer
	 * @return
	 * @throws Exception
	 */
	@ResponseBody
	@RequestMapping(value = "/deleteCustomer",method=RequestMethod.POST, produces = "text/html;charset=UTF-8")
	public String deleteCustomer(HttpServletRequest request,Customer customer) throws Exception {
		ResultHelper resultHandler=new ResultHelper();
		HttpSession checkLoginSession=request.getSession();
		User user=(User)checkLoginSession.getAttribute("user");
		customer.setUserid(user.getId());
		customer.setUsername(user.getRealname());
		customer.setStatus(0);
		baseService.updateCustomer(customer);
		resultHandler.setSuccess(true);
		resultHandler.setMsg("禁用客户成功！");
		mqProduce.sendOptlogMessage(null,"禁用客户："+customer.getId(),
				user.getId(),user.getRealname());
		String jsonResult=JSONArray.toJSONString(resultHandler);
		return jsonResult;
	}
	/**********************************客户管理end******************************************/
}
