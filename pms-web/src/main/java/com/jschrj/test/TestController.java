package com.jschrj.test;

import com.alibaba.fastjson.JSONArray;
import com.jschrj.activemq.MqProduce;
import com.jschrj.api.release.ReleaseService;
import com.jschrj.api.story.StoryService;
import com.jschrj.api.system.SystemService;
import com.jschrj.api.test.TestService;
import com.jschrj.common.PageHelper;
import com.jschrj.common.ResultHelper;
import com.jschrj.pojo.bug.Bug;
import com.jschrj.pojo.release.Release;
import com.jschrj.pojo.story.Story;
import com.jschrj.pojo.system.User;
import com.jschrj.pojo.test.Usecase;
import com.jschrj.pojo.test.Usecasestep;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import java.util.*;

@Controller
@RequestMapping(value="/test")
public class TestController {

	@Resource
	MqProduce mqProduce;

	@Autowired
	TestService testService;

	@Resource
	StoryService service;

	@Resource
	SystemService systemService;

	@Resource
	ReleaseService releaseService;

	/**********************************待测试列表start******************************************/
	/**
	 * 待测试列表
	 * @param request
	 * @return
	 */
	@RequestMapping(value="/totest")
	public String toTotest(HttpServletRequest request){

		return "/WEB-INF/test/totest.jsp";
	}

	@RequestMapping(value="/usecaseForm")
	public String toUsecaseForm(HttpServletRequest request) throws Exception{

		String type=request.getParameter("type");
		if("edit".equals(type)||"view".equals(type)){
			int id=Integer.parseInt(request.getParameter("id").toString());
			Usecase usecase=testService.getUsecaseById(id);
			List<Usecasestep> usecasestepList=testService.getUsecasesteplistByusecaseid(usecase.getId());
			request.setAttribute("usecase", usecase);
			request.setAttribute("usecasestepList", usecasestepList);
		}else{
			String storyid=request.getParameter("storyid");
			request.setAttribute("storyid", storyid);
		}
		request.setAttribute("type", type);
		return "/WEB-INF/test/usecaseForm.jsp";
	}

	/**
	 * 获取需求分页信息
	 * @param request
	 * @return
	 * @throws Exception
	 */
	@ResponseBody
	@RequestMapping(value = "/getTotestPage",method= RequestMethod.POST, produces = "text/html;charset=UTF-8")
	public String getTotestPage(HttpServletRequest request, PageHelper<Story> pageHelper) throws Exception {

		//注：jqgrid每页数量使用的是rows，与返回分页数据的list实体同名
		int rows=Integer.parseInt(request.getParameter("rows"));
		pageHelper.setRowNum(rows);
		String id=request.getParameter("id");
		String title=request.getParameter("title");
		String project=request.getParameter("project");
		String source=request.getParameter("source");
		Map<String, Object> param = new HashMap<String, Object>();
		param.put("id", id);
		param.put("title", title);
		param.put("project", project);
		param.put("source", source);
		int records=service.getTotestCounts(param);
		pageHelper.setRecords(records);
		pageHelper=service.getTotestPage(pageHelper, param);
		String jsonResult= JSONArray.toJSONString(pageHelper);
		return jsonResult;
	}


	@ResponseBody
	@RequestMapping(value = "/insertUsecase",method=RequestMethod.POST, produces = "text/html;charset=UTF-8")
	public String insertUsecase(HttpServletRequest request, Usecase usecase) throws Exception {
		ResultHelper resultHandler=new ResultHelper();
		HttpSession checkLoginSession=request.getSession();
		User user=(User)checkLoginSession.getAttribute("user");
		List<Usecasestep> usecasestepList=JSONArray.parseArray(usecase.getUsecasestep(),Usecasestep.class);
		usecase.setUserid(user.getId());
		usecase.setUsername(user.getRealname());
		testService.tx_usecase(usecase,usecasestepList);
		resultHandler.setSuccess(true);
		resultHandler.setMsg("用例新增成功！");
		mqProduce.sendOptlogMessage(null,"新增用例："+usecase.getTitle(),
				user.getId(),user.getRealname());
		String jsonResult=JSONArray.toJSONString("");
		return jsonResult;
	}

	/**********************************待测试列表end******************************************/

	/**********************************用例列表start******************************************/
	/**
	 * 用例列表
	 * @param request
	 * @return
	 */
	@RequestMapping(value="/usecase")
	public String toUsecase(HttpServletRequest request){

		return "/WEB-INF/test/usecase.jsp";
	}

	@ResponseBody
	@RequestMapping(value = "/getUsecasePage",method= RequestMethod.POST, produces = "text/html;charset=UTF-8")
	public String getUsecasePage(HttpServletRequest request, PageHelper<Usecase> pageHelper) throws Exception {

		//注：jqgrid每页数量使用的是rows，与返回分页数据的list实体同名
		int rows=Integer.parseInt(request.getParameter("rows"));
		pageHelper.setRowNum(rows);
		String storyid=request.getParameter("storyid");
		String storytitle=request.getParameter("storytitle");
		String title=request.getParameter("title");
		Map<String, Object> param = new HashMap<String, Object>();
		param.put("storyid", storyid);
		param.put("storytitle", storytitle);
		param.put("title", title);
		int records=testService.getUsecaseCounts(param);
		pageHelper.setRecords(records);
		pageHelper=testService.getUsecasePage(pageHelper, param);
		String jsonResult= JSONArray.toJSONString(pageHelper);
		return jsonResult;
	}

	@ResponseBody
	@RequestMapping(value = "/updateUsecase",method=RequestMethod.POST, produces = "text/html;charset=UTF-8")
	public String updateUsecase(HttpServletRequest request,Usecase usecase) throws Exception {
		ResultHelper resultHandler=new ResultHelper();
		HttpSession checkLoginSession=request.getSession();
		User user=(User)checkLoginSession.getAttribute("user");
		usecase.setUserid(user.getId());
		usecase.setUsername(user.getRealname());
		List<Usecasestep> usecasestepList=JSONArray.parseArray(usecase.getUsecasestep(),Usecasestep.class);
		testService.tx_updateUsecase(usecase,usecasestepList);
		resultHandler.setSuccess(true);
		resultHandler.setMsg("用例："+usecase.getId()+",修改成功！");
		mqProduce.sendOptlogMessage(null,"修改用例："+usecase.getId(),
				user.getId(),user.getRealname());
		String jsonResult=JSONArray.toJSONString(resultHandler);
		return jsonResult;
	}

	@ResponseBody
	@RequestMapping(value = "/deleteUsecase",method=RequestMethod.POST, produces = "text/html;charset=UTF-8")
	public String deleteUsecase(HttpServletRequest request,Integer id) throws Exception {
		ResultHelper resultHandler=new ResultHelper();
		HttpSession checkLoginSession=request.getSession();
		User user=(User)checkLoginSession.getAttribute("user");
		Usecase usecase=new Usecase();
		usecase.setId(id);
		usecase.setStatus(0);
		testService.deleteStory(usecase);
		resultHandler.setSuccess(true);
		resultHandler.setMsg("用例删除成功！");
		mqProduce.sendOptlogMessage(null,"删除用例："+usecase.getId(),
				user.getId(),user.getRealname());
		String jsonResult=JSONArray.toJSONString(resultHandler);
		return jsonResult;
	}
	/**********************************用例列表end******************************************/

	/**********************************完成测试start******************************************/
	@ResponseBody
	@RequestMapping(value = "/completeTest",method=RequestMethod.POST, produces = "text/html;charset=UTF-8")
	public String completeTest(HttpServletRequest request,Integer id) throws Exception {
		ResultHelper resultHandler=new ResultHelper();
		HttpSession checkLoginSession=request.getSession();
		User user=(User)checkLoginSession.getAttribute("user");
		Story story=new Story();
		story.setId(id);
		//检测是否有需要发布的客户
		Map<String,Object> param=new HashMap<>();
		param.put("type",1);
		param.put("referid",id);
		List<Release> releaseList=releaseService.getReleaselistByTypeReferid(param);
		if(releaseList.size()>0){
			//有需要发布的客户则更新需求状态待发布
			story.setStatus(4);
		}else {
			//更新为已完成
			story.setStatus(5);
		}
		service.updateStoryNext(story);
		resultHandler.setSuccess(true);
		resultHandler.setMsg("完成测试成功！");
		mqProduce.sendOptlogMessage(null,"完成测试："+story.getId(),
				user.getId(),user.getRealname());
		//通知需求(运维)团队
		List<User> testTeam2=systemService.getTeammembers(4);
		for(int i=0;i<testTeam2.size();i++){
			mqProduce.sendEmailMessage(story.getId(),testTeam2.get(i).getId(),"需求测试完成："+story.getId()+"&nbsp;"+story.getTitle()+",请及时部署。");
		}
		//通知项目经理团队
		List<User> testTeam=systemService.getTeammembers(3);
		for(int i=0;i<testTeam.size();i++){
			mqProduce.sendEmailMessage(story.getId(),testTeam.get(i).getId(),"需求测试完成："+story.getId()+"&nbsp;"+story.getTitle()+",请及时部署。");
		}
		//通知管理团队
		List<User> testTeam1=systemService.getTeammembers(5);
		for(int i=0;i<testTeam1.size();i++){
			mqProduce.sendEmailMessage(story.getId(),testTeam1.get(i).getId(),"需求测试完成："+story.getId()+"&nbsp;"+story.getTitle()+",请及时部署。");
		}
		String jsonResult=JSONArray.toJSONString(resultHandler);
		return jsonResult;
	}
	/**********************************完成测试end******************************************/

}
