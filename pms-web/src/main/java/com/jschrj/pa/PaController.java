package com.jschrj.pa;

import com.alibaba.fastjson.JSONArray;
import com.jschrj.activemq.MqProduce;
import com.jschrj.api.pa.PaService;
import com.jschrj.common.PageHelper;
import com.jschrj.common.ResultHelper;
import com.jschrj.pojo.pa.Contribution;
import com.jschrj.pojo.pa.Fault;
import com.jschrj.pojo.pa.Monthbest;
import com.jschrj.pojo.release.Release;
import com.jschrj.pojo.report.Report;
import com.jschrj.pojo.story.Story;
import com.jschrj.pojo.system.User;
import com.jschrj.pojo.task.Task;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import java.util.Calendar;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

@Controller
@RequestMapping(value="/pa")
public class PaController {

    @Resource
    MqProduce mqProduce;

    @Resource
    PaService paService;

    /**********************************员工贡献start******************************************/
    /**
     * 员工贡献
     * @param request
     * @return
     */
    @RequestMapping(value="/contribution")
    public String toContribution(HttpServletRequest request){

        return "/WEB-INF/pa/contribution.jsp";
    }

    /**
     * 员工贡献Form
     * @param request
     * @return
     */
    @RequestMapping(value="/contributionForm")
    public String toContributionForm(HttpServletRequest request) throws Exception{

        String type=request.getParameter("type");
        request.setAttribute("type", type);
        if("edit".equals(type)){
            int id=Integer.parseInt(request.getParameter("id").toString());
            Contribution contribution=paService.getContributionById(id);
            request.setAttribute("id", id);
            request.setAttribute("contribution", contribution);
        }else if("view".equals(type)){
            int id=Integer.parseInt(request.getParameter("id").toString());
            Contribution contribution=paService.getContributionById(id);
            request.setAttribute("id", id);
            request.setAttribute("contribution", contribution);
        }
        return "/WEB-INF/pa/contributionForm.jsp";
    }

    /**
     * 获取员工贡献分页信息
     * @param request
     * @return
     * @throws Exception
     */
    @ResponseBody
    @RequestMapping(value = "/getContributionPage",method= RequestMethod.POST, produces = "text/html;charset=UTF-8")
    public String getContributionPage(HttpServletRequest request, PageHelper<Contribution> pageHelper) throws Exception {

        //注：jqgrid每页数量使用的是rows，与返回分页数据的list实体同名
        int rows=Integer.parseInt(request.getParameter("rows"));
        pageHelper.setRowNum(rows);
        String starttime=request.getParameter("starttime");
        String endtime=request.getParameter("endtime");
        Map<String, Object> param = new HashMap<String, Object>();
        param.put("starttime", starttime);
        param.put("endtime", endtime);
        int records=paService.getContributionCounts(param);
        pageHelper.setRecords(records);
        pageHelper=paService.getContributionPage(pageHelper, param);
        String jsonResult= JSONArray.toJSONString(pageHelper);
        return jsonResult;
    }


    @ResponseBody
    @RequestMapping(value = "/insertContribution",method=RequestMethod.POST, produces = "text/html;charset=UTF-8")
    public String insertContribution(HttpServletRequest request,Contribution contribution) throws Exception {
        ResultHelper resultHandler=new ResultHelper();
        HttpSession checkLoginSession=request.getSession();
        User user=(User)checkLoginSession.getAttribute("user");
        contribution.setUserid(user.getId());
        contribution.setUsername(user.getRealname());
        paService.tx_insertContribution(contribution);
        resultHandler.setSuccess(true);
        resultHandler.setMsg("员工贡献新增成功！");
        mqProduce.sendOptlogMessage(null,"新增员工贡献："+contribution.getTitle(),
                user.getId(),user.getRealname());

        String jsonResult=JSONArray.toJSONString(resultHandler);
        return jsonResult;
    }

    @ResponseBody
    @RequestMapping(value = "/updateContribution",method=RequestMethod.POST, produces = "text/html;charset=UTF-8")
    public String updateContribution(HttpServletRequest request,Contribution contribution) throws Exception {
        ResultHelper resultHandler=new ResultHelper();
        HttpSession checkLoginSession=request.getSession();
        User user=(User)checkLoginSession.getAttribute("user");
        paService.tx_updateContribution(contribution);
        resultHandler.setSuccess(true);
        resultHandler.setMsg("员工过贡献："+contribution.getId()+",修改成功！");
        mqProduce.sendOptlogMessage(null,"修改员工贡献："+contribution.getId(),
                user.getId(),user.getRealname());
        String jsonResult=JSONArray.toJSONString(resultHandler);
        return jsonResult;
    }

    @ResponseBody
    @RequestMapping(value = "/deleteContribution",method=RequestMethod.POST, produces = "text/html;charset=UTF-8")
    public String deleteContribution(HttpServletRequest request,Integer id) throws Exception {
        ResultHelper resultHandler=new ResultHelper();
        HttpSession checkLoginSession=request.getSession();
        User user=(User)checkLoginSession.getAttribute("user");
        Contribution contribution=new Contribution();
        contribution.setId(id);
        contribution.setStatus(0);
        paService.deleteContribution(contribution);
        resultHandler.setSuccess(true);
        resultHandler.setMsg("员工贡献禁用成功！");
        mqProduce.sendOptlogMessage(null,"禁用员工贡献："+contribution.getId(),
                user.getId(),user.getRealname());
        String jsonResult=JSONArray.toJSONString(resultHandler);
        return jsonResult;
    }

    /**********************************员工贡献end******************************************/

    /**********************************员工过失start******************************************/
    /**
     * 员工过失
     * @param request
     * @return
     */
    @RequestMapping(value="/fault")
    public String toSorting(HttpServletRequest request){

        return "/WEB-INF/pa/fault.jsp";
    }

    /**
     * 员工过失Form
     * @param request
     * @return
     */
    @RequestMapping(value="/faultForm")
    public String toFaultForm(HttpServletRequest request) throws Exception{

        String type=request.getParameter("type");
        request.setAttribute("type", type);
        if("edit".equals(type)){
            int id=Integer.parseInt(request.getParameter("id").toString());
            Fault fault=paService.getFaultById(id);
            request.setAttribute("id", id);
            request.setAttribute("fault", fault);
        }else if("view".equals(type)){
            int id=Integer.parseInt(request.getParameter("id").toString());
            Fault fault=paService.getFaultById(id);
            request.setAttribute("id", id);
            request.setAttribute("fault", fault);
        }
        return "/WEB-INF/pa/faultForm.jsp";
    }

    /**
     * 获取员工过失分页信息
     * @param request
     * @return
     * @throws Exception
     */
    @ResponseBody
    @RequestMapping(value = "/getFaultPage",method= RequestMethod.POST, produces = "text/html;charset=UTF-8")
    public String getFaultPage(HttpServletRequest request, PageHelper<Fault> pageHelper) throws Exception {

        //注：jqgrid每页数量使用的是rows，与返回分页数据的list实体同名
        int rows=Integer.parseInt(request.getParameter("rows"));
        pageHelper.setRowNum(rows);
        String starttime=request.getParameter("starttime");
        String endtime=request.getParameter("endtime");
        Map<String, Object> param = new HashMap<String, Object>();
        param.put("starttime", starttime);
        param.put("endtime", endtime);
        int records=paService.getFaultCounts(param);
        pageHelper.setRecords(records);
        pageHelper=paService.getFaultPage(pageHelper, param);
        String jsonResult= JSONArray.toJSONString(pageHelper);
        return jsonResult;
    }


    @ResponseBody
    @RequestMapping(value = "/insertFault",method=RequestMethod.POST, produces = "text/html;charset=UTF-8")
    public String insertFault(HttpServletRequest request,Fault fault) throws Exception {
        ResultHelper resultHandler=new ResultHelper();
        HttpSession checkLoginSession=request.getSession();
        User user=(User)checkLoginSession.getAttribute("user");
        fault.setUserid(user.getId());
        fault.setUsername(user.getRealname());
        paService.tx_insertFault(fault);
        resultHandler.setSuccess(true);
        resultHandler.setMsg("员工过失新增成功！");
        mqProduce.sendOptlogMessage(null,"新增员工过失："+fault.getTitle(),
                user.getId(),user.getRealname());

        String jsonResult=JSONArray.toJSONString(resultHandler);
        return jsonResult;
    }

    @ResponseBody
    @RequestMapping(value = "/updateFault",method=RequestMethod.POST, produces = "text/html;charset=UTF-8")
    public String updateFault(HttpServletRequest request,Fault fault) throws Exception {
        ResultHelper resultHandler=new ResultHelper();
        HttpSession checkLoginSession=request.getSession();
        User user=(User)checkLoginSession.getAttribute("user");
        paService.tx_updateFault(fault);
        resultHandler.setSuccess(true);
        resultHandler.setMsg("员工过失："+fault.getId()+",修改成功！");
        mqProduce.sendOptlogMessage(null,"修改员工过失："+fault.getId(),
                user.getId(),user.getRealname());
        String jsonResult=JSONArray.toJSONString(resultHandler);
        return jsonResult;
    }

    @ResponseBody
    @RequestMapping(value = "/deleteFault",method=RequestMethod.POST, produces = "text/html;charset=UTF-8")
    public String deleteStory(HttpServletRequest request,Integer id) throws Exception {
        ResultHelper resultHandler=new ResultHelper();
        HttpSession checkLoginSession=request.getSession();
        User user=(User)checkLoginSession.getAttribute("user");
        Fault fault=new Fault();
        fault.setId(id);
        fault.setStatus(0);
        paService.deleteFault(fault);
        resultHandler.setSuccess(true);
        resultHandler.setMsg("员工过失禁用成功！");
        mqProduce.sendOptlogMessage(null,"禁用员工过失："+fault.getId(),
                user.getId(),user.getRealname());
        String jsonResult=JSONArray.toJSONString(resultHandler);
        return jsonResult;
    }

    /**********************************员工过失end******************************************/

    /**********************************每月最佳start******************************************/
    /**
     * 每月最佳
     * @param request
     * @return
     */
    @RequestMapping(value="/monthbest")
    public String toMonthbest(HttpServletRequest request){

        return "/WEB-INF/pa/monthbest.jsp";
    }

    /**
     * 每月最佳Form
     * @param request
     * @return
     */
    @RequestMapping(value="/monthbestForm")
    public String toMonthbestForm(HttpServletRequest request) throws Exception{

        String type=request.getParameter("type");
        request.setAttribute("type", type);
        Calendar cal = Calendar.getInstance();
        int year = cal.get(Calendar.YEAR);
        int month = cal.get(Calendar.MONTH) + 1;
        request.setAttribute("year", year);
        request.setAttribute("month", month);
        if("edit".equals(type)){
            int id=Integer.parseInt(request.getParameter("id").toString());
            Monthbest monthbest=paService.getMonthbestById(id);
            String[] dates=monthbest.getMonth().split("-");
            request.setAttribute("id", id);
            request.setAttribute("monthbest", monthbest);
            request.setAttribute("month_year", dates[0]);
            request.setAttribute("month_month", dates[1]);
        }else if("view".equals(type)){
            int id=Integer.parseInt(request.getParameter("id").toString());
            Monthbest monthbest=paService.getMonthbestById(id);
            String[] dates=monthbest.getMonth().split("-");
            request.setAttribute("id", id);
            request.setAttribute("monthbest", monthbest);
            request.setAttribute("month_year", dates[0]);
            request.setAttribute("month_month", dates[1]);
        }
        return "/WEB-INF/pa/monthbestForm.jsp";
    }

    /**
     * 获取每月最佳分页信息
     * @param request
     * @return
     * @throws Exception
     */
    @ResponseBody
    @RequestMapping(value = "/getMonthbestPage",method= RequestMethod.POST, produces = "text/html;charset=UTF-8")
    public String getMonthbestPage(HttpServletRequest request, PageHelper<Monthbest> pageHelper) throws Exception {

        //注：jqgrid每页数量使用的是rows，与返回分页数据的list实体同名
        int rows=Integer.parseInt(request.getParameter("rows"));
        pageHelper.setRowNum(rows);
        String starttime=request.getParameter("starttime");
        String endtime=request.getParameter("endtime");
        Map<String, Object> param = new HashMap<String, Object>();
        param.put("starttime", starttime);
        param.put("endtime", endtime);
        int records=paService.getMonthbestCounts(param);
        pageHelper.setRecords(records);
        pageHelper=paService.getMonthbestPage(pageHelper, param);
        String jsonResult= JSONArray.toJSONString(pageHelper);
        return jsonResult;
    }


    @ResponseBody
    @RequestMapping(value = "/insertMonthbest",method=RequestMethod.POST, produces = "text/html;charset=UTF-8")
    public String insertMonthbest(HttpServletRequest request,Monthbest monthbest) throws Exception {
        ResultHelper resultHandler=new ResultHelper();
        HttpSession checkLoginSession=request.getSession();
        User user=(User)checkLoginSession.getAttribute("user");
        monthbest.setUserid(user.getId());
        monthbest.setUsername(user.getRealname());
        paService.tx_insertMonthbest(monthbest);
        resultHandler.setSuccess(true);
        resultHandler.setMsg("每月最佳新增成功！");
        mqProduce.sendOptlogMessage(null,"新增每月最佳："+monthbest.getTitle(),
                user.getId(),user.getRealname());

        String jsonResult=JSONArray.toJSONString(resultHandler);
        return jsonResult;
    }

    @ResponseBody
    @RequestMapping(value = "/updateMonthbest",method=RequestMethod.POST, produces = "text/html;charset=UTF-8")
    public String updateMonthbest(HttpServletRequest request,Monthbest monthbest) throws Exception {
        ResultHelper resultHandler=new ResultHelper();
        HttpSession checkLoginSession=request.getSession();
        User user=(User)checkLoginSession.getAttribute("user");
        paService.tx_updateMonthbest(monthbest);
        resultHandler.setSuccess(true);
        resultHandler.setMsg("每月最佳："+monthbest.getId()+",修改成功！");
        mqProduce.sendOptlogMessage(null,"修改每月最佳："+monthbest.getId(),
                user.getId(),user.getRealname());
        String jsonResult=JSONArray.toJSONString(resultHandler);
        return jsonResult;
    }

    @ResponseBody
    @RequestMapping(value = "/deleteMonthbest",method=RequestMethod.POST, produces = "text/html;charset=UTF-8")
    public String deleteMonthbest(HttpServletRequest request,Integer id) throws Exception {
        ResultHelper resultHandler=new ResultHelper();
        HttpSession checkLoginSession=request.getSession();
        User user=(User)checkLoginSession.getAttribute("user");
        Monthbest monthbest=new Monthbest();
        monthbest.setId(id);
        monthbest.setStatus(0);
        paService.deleteMonthbest(monthbest);
        resultHandler.setSuccess(true);
        resultHandler.setMsg("每月最佳禁用成功！");
        mqProduce.sendOptlogMessage(null,"禁用每月最佳："+monthbest.getId(),
                user.getId(),user.getRealname());
        String jsonResult=JSONArray.toJSONString(resultHandler);
        return jsonResult;
    }

    /**********************************每月最佳end******************************************/

    /*********************************员工绩效start*********************************/
    @RequestMapping(value="/painfo")
    public String toPainfo(HttpServletRequest request) throws Exception{

        Calendar cal = Calendar.getInstance();
        int year = cal.get(Calendar.YEAR);

        request.setAttribute("starttime",String.valueOf(year)+"-01-01");
        return "/WEB-INF/pa/painfo.jsp";
    }

    @ResponseBody
    @RequestMapping(value = "/getPainfoList",method=RequestMethod.POST, produces = "text/html;charset=UTF-8")
    public String getPainfoList(HttpServletRequest request) throws Exception {

        String starttime=request.getParameter("starttime");
        String endtime=request.getParameter("endtime");
        Map<String, Object> param = new HashMap<String, Object>();
        param.put("starttime", starttime);
        param.put("endtime", endtime);

        List<Report> painfoList=paService.getPainfoList(param);
        String jsonResult=JSONArray.toJSONString(painfoList);
        return jsonResult;
    }
    /*********************************员工绩效end*********************************/
}
