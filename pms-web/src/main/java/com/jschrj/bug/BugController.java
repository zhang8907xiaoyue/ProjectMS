package com.jschrj.bug;

import com.alibaba.druid.sql.visitor.functions.Isnull;
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
import com.jschrj.pojo.system.User;
import com.jschrj.pojo.task.Task;
import com.jschrj.pojo.test.Usecase;
import com.jschrj.pojo.test.Usecasestep;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

@Controller
@RequestMapping(value="/bug")
public class BugController {

    @Resource
    StoryService storyService;

    @Resource
    TaskService taskService;

    @Resource
    TestService testService;

    @Resource
    BugService bugService;

    @Resource
    MqProduce mqProduce;

    @Resource
    ReleaseService releaseService;

    @Resource
    SystemService systemService;

    /*********************************bug列表start*********************************************/
    @RequestMapping(value="/bug")
    public String toBug(HttpServletRequest request) throws Exception{

        return "/WEB-INF/bug/bug.jsp";
    }

    @RequestMapping(value="/bugForm")
    public String toBugForm(HttpServletRequest request) throws Exception{

        String type=request.getParameter("type");

        if("new".equals(type)){
            int storyid=Integer.parseInt(request.getParameter("storyid"));
            int usecaseid=Integer.parseInt(request.getParameter("usecaseid"));
            Story story=storyService.getStoryById(storyid);
            Usecase usecase=testService.getUsecaseById(usecaseid);
            List<Usecasestep> usecasestepList=testService.getUsecasesteplistByusecaseid(usecaseid);
            request.setAttribute("storyid",storyid);
            request.setAttribute("project",story.getProject());
            request.setAttribute("usecase",usecase);
            request.setAttribute("usecasestepList", usecasestepList);
        }else if("newBug".equals(type)){

        }else if("edit".equals(type)||"view".equals(type)){
            int id=Integer.parseInt(request.getParameter("id"));
            Bug bug =bugService.getBugById(id);
            if(bug.getTaskid()!=null){
                Task task=taskService.getTaskById(bug.getTaskid());
                request.setAttribute("task",task);
            }
            Map<String,Object> param=new HashMap<>();
            param.put("type",2);
            param.put("referid",id);
            List<Release> releaseList=releaseService.getReleaselistByTypeReferid(param);
            request.setAttribute("releaseList", releaseList);
            request.setAttribute("bug",bug);

        }
        request.setAttribute("type",type);
        return "/WEB-INF/bug/bugForm.jsp";
    }

    /**
     * 任务分拣Form
     * @param request
     * @return
     */
    @RequestMapping(value="/dutyForm")
    public String toDutyForm(HttpServletRequest request) throws Exception{

        String id=request.getParameter("id");
        request.setAttribute("id", id);
        Bug bug=bugService.getBugById(Integer.parseInt(id));
        request.setAttribute("bug", bug);
        if(bug.getDuty()!=null){
            request.setAttribute("type", "edit");
        }
        return "/WEB-INF/bug/dutyForm.jsp";
    }

    @ResponseBody
    @RequestMapping(value = "/getBugPage",method= RequestMethod.POST, produces = "text/html;charset=UTF-8")
    public String getBugPage(HttpServletRequest request, PageHelper<Bug> pageHelper) throws Exception {

        //注：jqgrid每页数量使用的是rows，与返回分页数据的list实体同名
        int rows=Integer.parseInt(request.getParameter("rows"));
        pageHelper.setRowNum(rows);
        String starttime=request.getParameter("starttime");
        String endtime=request.getParameter("endtime");
        String finishedtimeS=request.getParameter("finishedtimeS");
        String finishedtimeE=request.getParameter("finishedtimeE");
        String id=request.getParameter("id");
        String title=request.getParameter("title");
        String project=request.getParameter("project");
        String status=request.getParameter("status");
        String userid=request.getParameter("userid");
        String assignto=request.getParameter("assignto");
        String duty=request.getParameter("duty");
        String finishedby=request.getParameter("finishedby");
        Map<String, Object> param = new HashMap<String, Object>();
        param.put("starttime", starttime);
        param.put("endtime", endtime);
        param.put("finishedtimeS", finishedtimeS);
        param.put("finishedtimeE", finishedtimeE);
        param.put("id", id);
        param.put("title", title);
        param.put("project", project);
        param.put("status", status);
        if(userid!=null&&userid!=""){
            String[] temp = userid.split(",");
            List<String> workTo=new ArrayList<String>();
            for (int i = 0 ; i <temp.length ; i++ ) {
                workTo.add(temp[i]);
            }
            param.put("userid", workTo);
        }
        if(assignto!=null&&assignto!=""){
            String[] temp = assignto.split(",");
            List<String> workTo=new ArrayList<String>();
            for (int i = 0 ; i <temp.length ; i++ ) {
                workTo.add(temp[i]);
            }
            param.put("assignto", workTo);
        }
        if(duty!=null&&duty!=""){
            String[] temp = duty.split(",");
            List<String> workTo=new ArrayList<String>();
            for (int i = 0 ; i <temp.length ; i++ ) {
                workTo.add(temp[i]);
            }
            param.put("duty", workTo);
        }
        if(finishedby!=null&&finishedby!=""){
            String[] temp = finishedby.split(",");
            List<String> workTo=new ArrayList<String>();
            for (int i = 0 ; i <temp.length ; i++ ) {
                workTo.add(temp[i]);
            }
            param.put("finishedby", workTo);
        }
        int records=bugService.getBugCounts(param);
        pageHelper.setRecords(records);
        pageHelper=bugService.getBugPage(pageHelper, param);
        String jsonResult= JSONArray.toJSONString(pageHelper);
        return jsonResult;
    }

    @ResponseBody
    @RequestMapping(value = "/insertBug",method= RequestMethod.POST, produces = "text/html;charset=UTF-8")
    public String insertBug(HttpServletRequest request, Bug bug) throws Exception {
        ResultHelper resultHandler=new ResultHelper();
        HttpSession checkLoginSession=request.getSession();
        User user=(User)checkLoginSession.getAttribute("user");
        bug.setUserid(user.getId());
        bug.setUsername(user.getRealname());
        List<Release> releaseList=JSONArray.parseArray(bug.getRelease(),Release.class);
        bugService.tx_insertBug(bug,releaseList);
        resultHandler.setSuccess(true);
        resultHandler.setMsg("bug新增成功！");
        mqProduce.sendOptlogMessage(null,"新增bug："+bug.getTitle(),
                user.getId(),user.getRealname());
        //通知开发人员
        mqProduce.sendEmailMessage(bug.getId(),bug.getAssignto(),"新增bug："+bug.getId()+"&nbsp;"+bug.getTitle()+"，严重程度："+bug.getSeverity()+",请及时处理。");
        String jsonResult= JSONArray.toJSONString(resultHandler);
        return jsonResult;
    }

    @ResponseBody
    @RequestMapping(value = "/updateBug",method=RequestMethod.POST, produces = "text/html;charset=UTF-8")
    public String updateBug(HttpServletRequest request,Bug bug) throws Exception {
        ResultHelper resultHandler=new ResultHelper();
        HttpSession checkLoginSession=request.getSession();
        User user=(User)checkLoginSession.getAttribute("user");
        List<Release> releaseList=JSONArray.parseArray(bug.getRelease(),Release.class);
        bugService.tx_updateBug(bug,releaseList);
        resultHandler.setSuccess(true);
        resultHandler.setMsg("bug："+bug.getId()+",修改成功！");
        mqProduce.sendOptlogMessage(null,"修改bug："+bug.getId(),
                user.getId(),user.getRealname());
        String jsonResult=JSONArray.toJSONString(resultHandler);
        return jsonResult;
    }

    @ResponseBody
    @RequestMapping(value = "/deleteBug",method=RequestMethod.POST, produces = "text/html;charset=UTF-8")
    public String deleteBug(HttpServletRequest request,Integer id) throws Exception {
        ResultHelper resultHandler=new ResultHelper();
        HttpSession checkLoginSession=request.getSession();
        User user=(User)checkLoginSession.getAttribute("user");
        Bug bug=new Bug();
        bug.setId(id);
        bug.setStatus(0);
        bugService.deleteBug(bug);
        resultHandler.setSuccess(true);
        resultHandler.setMsg("bug删除成功！");
        mqProduce.sendOptlogMessage(null,"删除bug："+bug.getId(),
                user.getId(),user.getRealname());
        String jsonResult=JSONArray.toJSONString(resultHandler);
        return jsonResult;
    }
    /*********************************bug列表end*********************************************/

    /*********************************待解bugstart*********************************************/
    @RequestMapping(value="/tosolve")
    public String toTosolve(HttpServletRequest request) throws Exception{

        return "/WEB-INF/bug/tosolve.jsp";
    }

    @RequestMapping(value="/solvebugForm")
    public String toSolvebugForm(HttpServletRequest request) throws Exception{

        String type=request.getParameter("type");
        int id=Integer.parseInt(request.getParameter("id").toString());
        request.setAttribute("bugid",id);
        if("edit".equals(type)){
            Bug bug=bugService.getBugById(id);
            request.setAttribute("bug", bug);
        }
        return "/WEB-INF/bug/solvebugForm.jsp";
    }

    @ResponseBody
    @RequestMapping(value = "/getTosolvePage",method= RequestMethod.POST, produces = "text/html;charset=UTF-8")
    public String getTosolvePage(HttpServletRequest request, PageHelper<Bug> pageHelper) throws Exception {

        //注：jqgrid每页数量使用的是rows，与返回分页数据的list实体同名
        int rows=Integer.parseInt(request.getParameter("rows"));
        pageHelper.setRowNum(rows);
        HttpSession checkLoginSession=request.getSession();
        User user=(User)checkLoginSession.getAttribute("user");
        Map<String, Object> param = new HashMap<String, Object>();
        param.put("assignto", user.getId());
        int records=bugService.getTosolveCounts(param);
        pageHelper.setRecords(records);
        pageHelper=bugService.getTosolvePage(pageHelper, param);
        String jsonResult= JSONArray.toJSONString(pageHelper);
        return jsonResult;
    }

    @ResponseBody
    @RequestMapping(value = "/applyBug",method=RequestMethod.POST, produces = "text/html;charset=UTF-8")
    public String applyBug(HttpServletRequest request,Bug bug) throws Exception {
        ResultHelper resultHandler=new ResultHelper();
        HttpSession checkLoginSession=request.getSession();
        User user=(User)checkLoginSession.getAttribute("user");
        bug.setStatus(2);
        bug.setFinishedby(user.getId());
        bug.setFinishedtime("1");
        bugService.updateBugNext(bug);
        resultHandler.setSuccess(true);
        resultHandler.setMsg("申请完成bug成功！");
        mqProduce.sendOptlogMessage(null,"申请完成bug："+bug.getId(),
                user.getId(),user.getRealname());
        //通知指派人员
        mqProduce.sendEmailMessage(bug.getId(),bug.getUserid(),"bug完成："+bug.getId()+"&nbsp;"+bug.getTitle()+",请及时核实审批。");
        String jsonResult=JSONArray.toJSONString(resultHandler);
        return jsonResult;
    }
    /*********************************待解bugend*********************************************/

    /*********************************待审核bugstart*********************************************/
    @RequestMapping(value="/toapprove")
    public String toToapprove(HttpServletRequest request) throws Exception{

        return "/WEB-INF/bug/toapprove.jsp";
    }

    @ResponseBody
    @RequestMapping(value = "/getToapprovePage",method= RequestMethod.POST, produces = "text/html;charset=UTF-8")
    public String getToapprovePage(HttpServletRequest request, PageHelper<Bug> pageHelper) throws Exception {

        //注：jqgrid每页数量使用的是rows，与返回分页数据的list实体同名
        int rows=Integer.parseInt(request.getParameter("rows"));
        pageHelper.setRowNum(rows);
        HttpSession checkLoginSession=request.getSession();
        User user=(User)checkLoginSession.getAttribute("user");
        Map<String, Object> param = new HashMap<String, Object>();
        param.put("userid", user.getId());
        int records=bugService.getToapproveCounts(param);
        pageHelper.setRecords(records);
        pageHelper=bugService.getToapprovePage(pageHelper, param);
        String jsonResult= JSONArray.toJSONString(pageHelper);
        return jsonResult;
    }

    @ResponseBody
    @RequestMapping(value = "/successBug",method=RequestMethod.POST, produces = "text/html;charset=UTF-8")
    public String approveBug(HttpServletRequest request,Integer id) throws Exception {
        ResultHelper resultHandler=new ResultHelper();
        HttpSession checkLoginSession=request.getSession();
        User user=(User)checkLoginSession.getAttribute("user");
        Bug bug=new Bug();
        bug.setId(id);
        //检测是否有需要发布的客户
        Map<String,Object> param=new HashMap<>();
        param.put("type",2);
        param.put("referid",id);
        List<Release> releaseList=releaseService.getReleaselistByTypeReferid(param);
        if(releaseList.size()>0){
            //有需要发布的客户则更新需求状态待发布
            bug.setStatus(3);
        }else {
            //更新为已完成
            bug.setStatus(4);
        }
        bug.setFinishedtime("1");
        bugService.updateBugNext(bug);
        resultHandler.setSuccess(true);
        resultHandler.setMsg("bug审核成功！");
        mqProduce.sendOptlogMessage(null,"审核bug："+bug.getId(),
                user.getId(),user.getRealname());
        String jsonResult=JSONArray.toJSONString(resultHandler);
        return jsonResult;
    }

    @ResponseBody
    @RequestMapping(value = "/failedBug",method=RequestMethod.POST, produces = "text/html;charset=UTF-8")
    public String failedBug(HttpServletRequest request,Integer id) throws Exception {
        ResultHelper resultHandler=new ResultHelper();
        HttpSession checkLoginSession=request.getSession();
        User user=(User)checkLoginSession.getAttribute("user");
        Bug bug=new Bug();
        bug.setId(id);
        bug.setStatus(1);
        bugService.updateBugNext(bug);
        resultHandler.setSuccess(true);
        resultHandler.setMsg("bug审核((未解决))！");
        mqProduce.sendOptlogMessage(null,"审核bug(未解决)："+bug.getId(),
                user.getId(),user.getRealname());
        String jsonResult=JSONArray.toJSONString(resultHandler);
        return jsonResult;
    }
    /*********************************待审核bugend*********************************************/

    /*********************************bug解决记录start*********************************************/
    @RequestMapping(value="/solved")
    public String toSolved(HttpServletRequest request) throws Exception{

        return "/WEB-INF/bug/solved.jsp";
    }

    @ResponseBody
    @RequestMapping(value = "/getSolvedPage",method= RequestMethod.POST, produces = "text/html;charset=UTF-8")
    public String getSolvedPage(HttpServletRequest request, PageHelper<Bug> pageHelper) throws Exception {

        //注：jqgrid每页数量使用的是rows，与返回分页数据的list实体同名
        int rows=Integer.parseInt(request.getParameter("rows"));
        pageHelper.setRowNum(rows);
        HttpSession checkLoginSession=request.getSession();
        User user=(User)checkLoginSession.getAttribute("user");
        String starttime=request.getParameter("starttime");
        String endtime=request.getParameter("endtime");
        String id=request.getParameter("id");
        String title=request.getParameter("title");
        Map<String, Object> param = new HashMap<String, Object>();
        param.put("starttime", starttime);
        param.put("endtime", endtime);
        param.put("id", id);
        param.put("title", title);
        param.put("finishedby", user.getId());
        int records=bugService.getSolvedCounts(param);
        pageHelper.setRecords(records);
        pageHelper=bugService.getSolvedPage(pageHelper, param);
        String jsonResult= JSONArray.toJSONString(pageHelper);
        return jsonResult;
    }
    /*********************************bug解决记录end*********************************************/
}
