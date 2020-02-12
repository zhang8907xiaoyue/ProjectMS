package com.jschrj.story;

import com.alibaba.fastjson.JSONArray;
import com.jschrj.activemq.MqProduce;
import com.jschrj.api.bug.BugService;
import com.jschrj.api.release.ReleaseService;
import com.jschrj.api.story.StoryService;
import com.jschrj.api.system.SystemService;
import com.jschrj.api.task.TaskService;
import com.jschrj.api.test.TestService;
import com.jschrj.common.PageHelper;
import com.jschrj.common.ResultHelper;
import com.jschrj.pojo.bug.Bug;
import com.jschrj.pojo.release.Release;
import com.jschrj.pojo.story.Story;
import com.jschrj.pojo.system.Role;
import com.jschrj.pojo.system.User;
import com.jschrj.pojo.task.Task;
import com.jschrj.pojo.test.Usecase;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import java.text.SimpleDateFormat;
import java.util.*;

@Controller
@RequestMapping(value="/story")
public class StoryController {

	@Resource
	MqProduce mqProduce;

	@Resource
	StoryService service;

	@Resource
	TaskService taskService;

	@Resource
	TestService testService;

	@Resource
	BugService bugService;

	@Resource
	ReleaseService releaseService;

	@Resource
	SystemService systemService;



	/**********************************需求列表start******************************************/
	/**
	 * 需求列表
	 * @param request
	 * @return
	 */
	@RequestMapping(value="/story")
	public String toStory(HttpServletRequest request){

		Calendar calendar = Calendar.getInstance();//日历对象
		calendar.setTime(new Date());//设置当前日期

		calendar.add(Calendar.MONTH, -1);
		Date date = calendar.getTime();
		SimpleDateFormat format0 = new SimpleDateFormat("yyyy-MM-dd");
		String starttime = format0.format(date);;
		request.setAttribute("starttime", starttime);
		return "/WEB-INF/story/story.jsp";
	}

	/**
	 * 需求Form
	 * @param request
	 * @return
	 */
	@RequestMapping(value="/storyForm")
	public String toStoryForm(HttpServletRequest request) throws Exception{

		String type=request.getParameter("type");
		if("edit".equals(type)||"view".equals(type)){
			int id=Integer.parseInt(request.getParameter("id").toString());
			Story story=service.getStoryById(id);
			List<Task> taskList=taskService.getTasklistByStoryid(id);
			List<Usecase> usecaseList=testService.getUsecaseByStoryid(id);
			List<Bug> bugList=bugService.getBugListByStoryid(id);
			Map<String,Object> param=new HashMap<>();
			param.put("type",1);
			param.put("referid",id);
			List<Release> releaseList=releaseService.getReleaselistByTypeReferid(param);
			request.setAttribute("story", story);
			request.setAttribute("taskList", taskList);
			request.setAttribute("usecaseList", usecaseList);
			request.setAttribute("bugList", bugList);
			request.setAttribute("releaseList", releaseList);
		}
		request.setAttribute("type", type);
		return "/WEB-INF/story/storyForm.jsp";
	}

	/**
	 * 获取需求分页信息
	 * @param request
	 * @return
	 * @throws Exception
	 */
	@ResponseBody
	@RequestMapping(value = "/getStoryPage",method= RequestMethod.POST, produces = "text/html;charset=UTF-8")
	public String getStoryPage(HttpServletRequest request, PageHelper<Story> pageHelper) throws Exception {

		//注：jqgrid每页数量使用的是rows，与返回分页数据的list实体同名
		int rows=Integer.parseInt(request.getParameter("rows"));
		pageHelper.setRowNum(rows);
		String starttime=request.getParameter("starttime");
		String endtime=request.getParameter("endtime");
		String id=request.getParameter("id");
		String title=request.getParameter("title");
		String status=request.getParameter("status");
		String project=request.getParameter("project");
		String source=request.getParameter("source");
		String openedby=request.getParameter("openedby");
		Map<String, Object> param = new HashMap<String, Object>();
		param.put("starttime", starttime);
		param.put("endtime", endtime);
		param.put("id", id);
		param.put("title", title);
		param.put("status", status);
		param.put("project", project);
		param.put("source", source);
		if(openedby!=null&&openedby!=""){
			String[] temp = openedby.split(",");
			List<String> workTo=new ArrayList<String>();
			for (int i = 0 ; i <temp.length ; i++ ) {
				workTo.add(temp[i]);
			}
			param.put("openedby", workTo);
		}
		int records=service.getStoryCounts(param);
		pageHelper.setRecords(records);
		pageHelper=service.getStoryPage(pageHelper, param);
		String jsonResult= JSONArray.toJSONString(pageHelper);
		return jsonResult;
	}

	@ResponseBody
	@RequestMapping(value = "/insertStory",method=RequestMethod.POST, produces = "text/html;charset=UTF-8")
	public String insertStory(HttpServletRequest request,Story story) throws Exception {
		ResultHelper resultHandler=new ResultHelper();
		HttpSession checkLoginSession=request.getSession();
		User user=(User)checkLoginSession.getAttribute("user");
		story.setOpenedby(user.getId());
		story.setOpenedbyname(user.getRealname());
		List<Release> releaseList=JSONArray.parseArray(story.getRelease(),Release.class);
		service.tx_insertStory(story,releaseList);
		resultHandler.setSuccess(true);
		resultHandler.setMsg("需求新增成功！");
		mqProduce.sendOptlogMessage(null,"新增需求："+story.getTitle(),
				user.getId(),user.getRealname());
		//通知项目经理团队
		List<User> testTeam=systemService.getTeammembers(3);
		for(int i=0;i<testTeam.size();i++){
			mqProduce.sendEmailMessage(story.getId(),testTeam.get(i).getId(),"新增需求："+story.getId()+"&nbsp;"+story.getTitle()+"，优先级："+story.getPri()+",请及时安排开发。");
		}
		//通知管理团队
		List<User> testTeam1=systemService.getTeammembers(5);
		for(int i=0;i<testTeam1.size();i++){
			mqProduce.sendEmailMessage(story.getId(),testTeam1.get(i).getId(),"新增需求："+story.getId()+"&nbsp;"+story.getTitle()+"，优先级："+story.getPri()+",请及时安排开发。");
		}
		String jsonResult=JSONArray.toJSONString(resultHandler);
		return jsonResult;
	}

	@ResponseBody
	@RequestMapping(value = "/updateStory",method=RequestMethod.POST, produces = "text/html;charset=UTF-8")
	public String updateStory(HttpServletRequest request,Story story) throws Exception {
		ResultHelper resultHandler=new ResultHelper();
		HttpSession checkLoginSession=request.getSession();
		User user=(User)checkLoginSession.getAttribute("user");
		List<Release> releaseList=JSONArray.parseArray(story.getRelease(),Release.class);
		service.tx_updateStory(story,releaseList);
		resultHandler.setSuccess(true);
		resultHandler.setMsg("需求："+story.getId()+",修改成功！");
		mqProduce.sendOptlogMessage(null,"修改需求："+story.getId(),
				user.getId(),user.getRealname());
		String jsonResult=JSONArray.toJSONString(resultHandler);
		return jsonResult;
	}

	@ResponseBody
	@RequestMapping(value = "/deleteStory",method=RequestMethod.POST, produces = "text/html;charset=UTF-8")
	public String deleteStory(HttpServletRequest request,Integer id) throws Exception {
		ResultHelper resultHandler=new ResultHelper();
		HttpSession checkLoginSession=request.getSession();
		User user=(User)checkLoginSession.getAttribute("user");
		Story story=new Story();
        story.setId(id);
		story.setStatus(0);
		service.deleteStory(story);
		resultHandler.setSuccess(true);
		resultHandler.setMsg("需求删除成功！");
		mqProduce.sendOptlogMessage(null,"删除需求："+story.getId(),
				user.getId(),user.getRealname());
		String jsonResult=JSONArray.toJSONString(resultHandler);
		return jsonResult;
	}
	/**********************************需求列表end******************************************/

	/**********************************任务分拣start******************************************/
	/**
	 * 任务分拣
	 * @param request
	 * @return
	 */
	@RequestMapping(value="/sorting")
	public String toSorting(HttpServletRequest request){

		return "/WEB-INF/story/sorting.jsp";
	}

	/**
	 * 任务分拣Form
	 * @param request
	 * @return
	 */
	@RequestMapping(value="/sortingForm")
	public String toSortingForm(HttpServletRequest request) throws Exception{

		String type=request.getParameter("type");
		String storyid=request.getParameter("storyid");
		request.setAttribute("type", type);
		request.setAttribute("storyid", storyid);
		if("edit".equals(type)){
			int taskid=Integer.parseInt(request.getParameter("taskid").toString());
			Task task=taskService.getTaskById(taskid);
			request.setAttribute("task", task);
		}
		return "/WEB-INF/story/sortingForm.jsp";
	}

	/**
	 * 获取需求分页信息
	 * @param request
	 * @return
	 * @throws Exception
	 */
	@ResponseBody
	@RequestMapping(value = "/getSortingPage",method= RequestMethod.POST, produces = "text/html;charset=UTF-8")
	public String getSortingPage(HttpServletRequest request, PageHelper<Story> pageHelper) throws Exception {

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
		param.put("status", "1");
		param.put("project", project);
		param.put("source", source);
		int records=service.getStoryCounts(param);
		pageHelper.setRecords(records);
		pageHelper=service.getStoryPage(pageHelper, param);
		String jsonResult= JSONArray.toJSONString(pageHelper);
		return jsonResult;
	}

	/**********************************任务分拣end******************************************/
}
