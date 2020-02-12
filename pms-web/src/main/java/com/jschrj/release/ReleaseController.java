package com.jschrj.release;

import com.alibaba.fastjson.JSONArray;
import com.jschrj.activemq.MqProduce;
import com.jschrj.api.release.ReleaseService;
import com.jschrj.common.PageHelper;
import com.jschrj.common.ResultHelper;
import com.jschrj.pojo.release.Release;
import com.jschrj.pojo.system.User;
import com.jschrj.pojo.task.Taskcomplete;
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
@RequestMapping(value="/release")
public class ReleaseController {

    @Resource
    ReleaseService releaseService;

    @Resource
    MqProduce mqProduce;

    @RequestMapping(value="/torelease")
    public String toTorelease(HttpServletRequest request) throws Exception{

        List<Release> releaseList=releaseService.getReleaseList();
        request.setAttribute("releaseList",releaseList);
        return "/WEB-INF/release/torelease.jsp";
    }

    @RequestMapping(value="/releaseForm")
    public String toReleaseForm(HttpServletRequest request) throws Exception{

        String project=request.getParameter("project").toString();
        String customer=request.getParameter("customer").toString();
        Map<String,Object> param=new HashMap<>();
        param.put("project",project);
        param.put("customer",customer);
        List<Taskcomplete> taskList=releaseService.getReleaselistByProjectCustomer(param);
        request.setAttribute("taskList", taskList);
        return "/WEB-INF/release/releaseForm.jsp";
    }

    @ResponseBody
    @RequestMapping(value = "/getReleaselistByTypeReferid",method= RequestMethod.POST, produces = "text/html;charset=UTF-8")
    public String getReleaselistByTypeReferid(HttpServletRequest request) throws Exception {

        int referid=Integer.parseInt(request.getParameter("referid"));
        int type=Integer.parseInt(request.getParameter("type"));
        Map<String,Object> param=new HashMap<>();
        param.put("type",type);
        param.put("referid",referid);
        List<Release> releaseList=releaseService.getReleaselistByTypeReferid(param);
        String jsonResult= JSONArray.toJSONString(releaseList);
        return jsonResult;
    }

    @ResponseBody
    @RequestMapping(value = "/doRelease",method=RequestMethod.POST, produces = "text/html;charset=UTF-8")
    public String doRelease(HttpServletRequest request,String releaseList) throws Exception {
        ResultHelper resultHandler=new ResultHelper();
        HttpSession checkLoginSession=request.getSession();
        User user=(User)checkLoginSession.getAttribute("user");
        List<Release> releaseList1=JSONArray.parseArray(releaseList,Release.class);

        Calendar calendar = Calendar.getInstance();//日历对象
        calendar.setTime(new Date());//设置当前日期
        Date date = calendar.getTime();
        SimpleDateFormat format0 = new SimpleDateFormat("yyyy-MM-dd");
        String version = format0.format(date);

        releaseService.tx_doRelease(releaseList1,version,user.getUserid(),user.getUsername());
        resultHandler.setSuccess(true);
        resultHandler.setMsg("发布成功！");
        mqProduce.sendOptlogMessage(null,"代码发布",
                user.getId(),user.getRealname());
        String jsonResult=JSONArray.toJSONString("");
        return jsonResult;
    }

    @RequestMapping(value="/released")
    public String toReleased(HttpServletRequest request){

        return "/WEB-INF/release/released.jsp";
    }

    @ResponseBody
    @RequestMapping(value = "/getReleasedPage",method= RequestMethod.POST, produces = "text/html;charset=UTF-8")
    public String getReleasedPage(HttpServletRequest request, PageHelper<Release> pageHelper) throws Exception {

        HttpSession checkLoginSession = request.getSession();
        User user = (User)checkLoginSession.getAttribute("user");
        //注：jqgrid每页数量使用的是rows，与返回分页数据的list实体同名
        int rows=Integer.parseInt(request.getParameter("rows"));
        pageHelper.setRowNum(rows);
        String starttime=request.getParameter("starttime");
        String endtime=request.getParameter("endtime");
        String project=request.getParameter("project");
        String customerid=request.getParameter("customerid");
        Map<String, Object> param = new HashMap<String, Object>();
        param.put("starttime", starttime);
        param.put("endtime", endtime);
        param.put("project", project);
        param.put("customerid", customerid);
        int records=releaseService.getReleasedCounts(param);
        pageHelper.setRecords(records);
        pageHelper=releaseService.getReleasedPage(pageHelper, param);
        String jsonResult= JSONArray.toJSONString(pageHelper);
        return jsonResult;
    }

    @RequestMapping(value="/releasedList")
    public String toReleasedList(HttpServletRequest request) throws Exception{

        String project=request.getParameter("project");
        String customerid=request.getParameter("customerid");
        String version=request.getParameter("version");
        Map<String, Object> param = new HashMap<String, Object>();
        param.put("project", project);
        param.put("customerid", customerid);
        param.put("version", version);
        List<Release> releaseList=releaseService.getReleasedList(param);
        request.setAttribute("releaseList",releaseList);
        return "/WEB-INF/release/releasedlist.jsp";
    }
}
