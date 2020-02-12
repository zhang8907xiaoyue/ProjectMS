package com.jschrj.task;

import com.alibaba.fastjson.JSONArray;
import com.jschrj.activemq.MqProduce;
import com.jschrj.api.bug.BugService;
import com.jschrj.api.story.StoryService;
import com.jschrj.api.system.SystemService;
import com.jschrj.api.task.TaskService;
import com.jschrj.common.PageHelper;
import com.jschrj.common.ResultHelper;
import com.jschrj.pojo.base.Extend;
import com.jschrj.pojo.bug.Bug;
import com.jschrj.pojo.report.Report;
import com.jschrj.pojo.story.Story;
import com.jschrj.pojo.system.User;
import com.jschrj.pojo.task.*;
import com.jschrj.report.ReportController;
import org.apache.poi.ss.usermodel.CellStyle;
import org.apache.poi.xssf.usermodel.XSSFRow;
import org.apache.poi.xssf.usermodel.XSSFSheet;
import org.apache.poi.xssf.usermodel.XSSFWorkbook;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.InputStream;
import java.io.OutputStream;
import java.text.SimpleDateFormat;
import java.util.*;

@Controller
@RequestMapping(value="/task")
public class TaskController {

    @Resource
    MqProduce mqProduce;

    @Resource
    StoryService storyService;

    @Resource
    TaskService service;

    @Resource
    BugService bugService;

    @Resource
    SystemService systemService;

    /*********************************任务指派start*********************************/
    @RequestMapping(value="/taskForm")
    public String toTaskForm(HttpServletRequest request) throws Exception{

        int id=Integer.parseInt(request.getParameter("id").toString());
        Task task=service.getTaskById(id);
        List<Extend> optList=service.getTaskOptListByTaskid(id);
        List<Bug> bugList=bugService.getBugListByTaskid(id);
        Story story=storyService.getStoryById(task.getStoryid());
        Taskcomplete taskcomplete=service.getTaskcompleteByTaskid(id);
        request.setAttribute("story", story);
        request.setAttribute("task", task);
        request.setAttribute("optList", optList);
        request.setAttribute("bugList", bugList);
        request.setAttribute("taskcomplete", taskcomplete);
        return "/WEB-INF/task/taskForm.jsp";
    }

    @ResponseBody
    @RequestMapping(value = "/getTaskList",method=RequestMethod.POST, produces = "text/html;charset=UTF-8")
    public String getTaskList(HttpServletRequest request) throws Exception {

        int storyid=Integer.parseInt(request.getParameter("storyid").toString());

        List<Task> listTemp=service.getTaskList(storyid);
        String jsonResult=JSONArray.toJSONString(listTemp);
        return jsonResult;
    }

    /**
     * 任务新增
     * @param request
     * @param task
     * @return
     * @throws Exception
     */
    @ResponseBody
    @RequestMapping(value = "/insertTask",method= RequestMethod.POST, produces = "text/html;charset=UTF-8")
    public String insertTask(HttpServletRequest request, Task task) throws Exception {
        ResultHelper resultHandler=new ResultHelper();
        HttpSession checkLoginSession=request.getSession();
        User user=(User)checkLoginSession.getAttribute("user");
        task.setUserid(user.getId());
        task.setUsername(user.getRealname());
        service.tx_Task(task);
        resultHandler.setSuccess(true);
        resultHandler.setMsg("任务分拣成功！");
        mqProduce.sendOptlogMessage(null,"任务分拣："+task.getTitle(),
                user.getId(),user.getRealname());
        mqProduce.sendEmailMessage(task.getStoryid(),task.getAssignto(),"您有新的任务需要处理："+task.getId()+"&nbsp;"+task.getTitle());
        String jsonResult= JSONArray.toJSONString(resultHandler);
        return jsonResult;
    }

    @ResponseBody
    @RequestMapping(value = "/updateTask",method=RequestMethod.POST, produces = "text/html;charset=UTF-8")
    public String updateTask(HttpServletRequest request,Task task) throws Exception {
        ResultHelper resultHandler=new ResultHelper();
        HttpSession checkLoginSession=request.getSession();
        User user=(User)checkLoginSession.getAttribute("user");
        service.updateTask(task);
        resultHandler.setSuccess(true);
        resultHandler.setMsg("修改指派任务："+task.getId()+",修改成功！");
        mqProduce.sendOptlogMessage(null,"修改指派任务："+task.getId(),
                user.getId(),user.getRealname());
        String jsonResult=JSONArray.toJSONString(resultHandler);
        return jsonResult;
    }

    @ResponseBody
    @RequestMapping(value = "/deleteTask",method=RequestMethod.POST, produces = "text/html;charset=UTF-8")
    public String deleteTask(HttpServletRequest request,Integer id) throws Exception {
        ResultHelper resultHandler=new ResultHelper();
        HttpSession checkLoginSession=request.getSession();
        User user=(User)checkLoginSession.getAttribute("user");
        Task task=new Task();
        task.setId(id);
        task.setStatus(0);
        service.tx_deleteStory(task);
        resultHandler.setSuccess(true);
        resultHandler.setMsg("任务删除成功！");
        mqProduce.sendOptlogMessage(null,"删除任务："+task.getId(),
                user.getId(),user.getRealname());
        String jsonResult=JSONArray.toJSONString(resultHandler);
        return jsonResult;
    }
    /*********************************任务指派end*********************************/

    /*********************************分拣记录start*********************************/
    /**
     * 分拣记录
     * @param request
     * @return
     */
    @RequestMapping(value="/sorted")
    public String toSorted(HttpServletRequest request){

        return "/WEB-INF/task/sorted.jsp";
    }

    @ResponseBody
    @RequestMapping(value = "/getSortedPage",method= RequestMethod.POST, produces = "text/html;charset=UTF-8")
    public String getSortedPage(HttpServletRequest request, PageHelper<Task> pageHelper) throws Exception {

        //注：jqgrid每页数量使用的是rows，与返回分页数据的list实体同名
        int rows=Integer.parseInt(request.getParameter("rows"));
        pageHelper.setRowNum(rows);
        String id=request.getParameter("id");
        String title=request.getParameter("title");
        String storyid=request.getParameter("storyid");
        String assignto=request.getParameter("assignto");
        Map<String, Object> param = new HashMap<String, Object>();
        param.put("id", id);
        param.put("title", title);
        param.put("storyid", storyid);
        if(assignto!=null){
            String[] temp = assignto.split(",");
            List<String> workTo=new ArrayList<String>();
            for (int i = 0 ; i <temp.length ; i++ ) {
                workTo.add(temp[i]);
            }
            param.put("assignto", workTo);
        }
        int records=service.getSortedCounts(param);
        pageHelper.setRecords(records);
        pageHelper=service.getSortedPage(pageHelper, param);
        String jsonResult= JSONArray.toJSONString(pageHelper);
        return jsonResult;
    }
    /*********************************分拣记录end*********************************/

    /*********************************我的任务start*********************************/
    @RequestMapping(value="/todo")
    public String toTodo(HttpServletRequest request){

        return "/WEB-INF/task/todo.jsp";
    }

    @RequestMapping(value="/remarkForm")
    public String toRemarkForm(HttpServletRequest request){
        String storyid=request.getParameter("storyid");
        String taskid=request.getParameter("taskid");
        request.setAttribute("storyid", storyid);
        request.setAttribute("taskid", taskid);
        return "/WEB-INF/task/remarkForm.jsp";
    }

    @RequestMapping(value="/logForm")
    public String toLogForm(HttpServletRequest request){
        String storyid=request.getParameter("storyid");
        String taskid=request.getParameter("taskid");
        request.setAttribute("storyid", storyid);
        request.setAttribute("taskid", taskid);
        return "/WEB-INF/task/logForm.jsp";
    }

    @RequestMapping(value="/suspendForm")
    public String toSuspendForm(HttpServletRequest request){
        String storyid=request.getParameter("storyid");
        String taskid=request.getParameter("taskid");
        request.setAttribute("storyid", storyid);
        request.setAttribute("taskid", taskid);
        return "/WEB-INF/task/suspendForm.jsp";
    }

    @RequestMapping(value="/completeForm")
    public String toCompleteForm(HttpServletRequest request) throws Exception{

        String type=request.getParameter("type");
        String storyid=request.getParameter("storyid");
        String taskid=request.getParameter("taskid");
        request.setAttribute("type", type);
        request.setAttribute("storyid", storyid);
        request.setAttribute("taskid", taskid);
        if("edit".equals(type)){
            int id=Integer.parseInt(request.getParameter("id").toString());
            Taskcomplete taskcomplete=service.getTaskcompleteById(id);
            request.setAttribute("taskcomplete", taskcomplete);
        }
        return "/WEB-INF/task/completeForm.jsp";
    }

    /**
     * 添加任务备注
     * @param request
     * @param taskcontrol
     * @return
     * @throws Exception
     */
    @ResponseBody
    @RequestMapping(value = "/insertTaskcontrol",method= RequestMethod.POST, produces = "text/html;charset=UTF-8")
    public String insertTaskcontrol(HttpServletRequest request, Taskcontrol taskcontrol) throws Exception {
        ResultHelper resultHandler=new ResultHelper();
        HttpSession checkLoginSession=request.getSession();
        User user=(User)checkLoginSession.getAttribute("user");
        taskcontrol.setUserid(user.getId());
        taskcontrol.setUsername(user.getRealname());
        service.tx_TaskControl(taskcontrol);
        resultHandler.setSuccess(true);
        if(taskcontrol.getType()==0){
            resultHandler.setMsg("任务暂停成功！");
            mqProduce.sendOptlogMessage(null,"任务暂停："+taskcontrol.getTaskid(),
                    user.getId(),user.getRealname());
        }else{
            resultHandler.setMsg("任务开始成功！");
            mqProduce.sendOptlogMessage(null,"任务开始："+taskcontrol.getTaskid(),
                    user.getId(),user.getRealname());
        }


        String jsonResult= JSONArray.toJSONString(resultHandler);
        return jsonResult;
    }

    /**
     * 添加任务备注
     * @param request
     * @param taskremark
     * @return
     * @throws Exception
     */
    @ResponseBody
    @RequestMapping(value = "/insertTaskremark",method= RequestMethod.POST, produces = "text/html;charset=UTF-8")
    public String insertTaskremark(HttpServletRequest request, Taskremark taskremark) throws Exception {
        ResultHelper resultHandler=new ResultHelper();
        HttpSession checkLoginSession=request.getSession();
        User user=(User)checkLoginSession.getAttribute("user");
        taskremark.setUserid(user.getId());
        taskremark.setUsername(user.getRealname());
        service.tx_TaskRemark(taskremark);
        resultHandler.setSuccess(true);
        resultHandler.setMsg("添加备注成功！");
        mqProduce.sendOptlogMessage(null,"添加任务备注："+taskremark.getTaskid(),
                user.getId(),user.getRealname());

        String jsonResult= JSONArray.toJSONString(resultHandler);
        return jsonResult;
    }

    /**
     * 添加任务日志
     * @param request
     * @param tasklog
     * @return
     * @throws Exception
     */
    @ResponseBody
    @RequestMapping(value = "/insertTasklog",method= RequestMethod.POST, produces = "text/html;charset=UTF-8")
    public String insertTasklog(HttpServletRequest request, Tasklog tasklog) throws Exception {
        ResultHelper resultHandler=new ResultHelper();
        HttpSession checkLoginSession=request.getSession();
        User user=(User)checkLoginSession.getAttribute("user");
        tasklog.setUserid(user.getId());
        tasklog.setUsername(user.getRealname());
        service.tx_TaskLog(tasklog);
        resultHandler.setSuccess(true);
        resultHandler.setMsg("添加日志成功！");
        mqProduce.sendOptlogMessage(null,"添加任务日志："+tasklog.getTaskid(),
                user.getId(),user.getRealname());

        String jsonResult= JSONArray.toJSONString(resultHandler);
        return jsonResult;
    }

    /**
     * 任务完成
     * @param request
     * @param taskcomplete
     * @return
     * @throws Exception
     */
    @ResponseBody
    @RequestMapping(value = "/insertTaskcomplete",method= RequestMethod.POST, produces = "text/html;charset=UTF-8")
    public String insertTaskcomplete(HttpServletRequest request, Taskcomplete taskcomplete) throws Exception {
        ResultHelper resultHandler=new ResultHelper();
        HttpSession checkLoginSession=request.getSession();
        User user=(User)checkLoginSession.getAttribute("user");
        taskcomplete.setUserid(user.getId());
        taskcomplete.setUsername(user.getRealname());
        service.tx_TaskComplete(taskcomplete);
        resultHandler.setSuccess(true);
        resultHandler.setMsg("任务完成成功！");
        mqProduce.sendOptlogMessage(null,"任务完成："+taskcomplete.getTaskid(),
                user.getId(),user.getRealname());
        //通知测试团队成员
        List<User> testTeam=systemService.getTeammembers(2);
        for(int i=0;i<testTeam.size();i++){
            mqProduce.sendEmailMessage(taskcomplete.getStoryid(),testTeam.get(i).getId(),"需求"+taskcomplete.getStoryid()+"中任务i"+taskcomplete.getTaskid()+"已经完成，请及时测试。");
        }
        String jsonResult= JSONArray.toJSONString(resultHandler);
        return jsonResult;
    }

    @ResponseBody
    @RequestMapping(value = "/updateTaskcomplete",method=RequestMethod.POST, produces = "text/html;charset=UTF-8")
    public String updateTaskcomplete(HttpServletRequest request,Taskcomplete taskcomplete) throws Exception {
        ResultHelper resultHandler=new ResultHelper();
        HttpSession checkLoginSession=request.getSession();
        User user=(User)checkLoginSession.getAttribute("user");
        service.updateTaskcomplete(taskcomplete);
        resultHandler.setSuccess(true);
        resultHandler.setMsg("任务完成："+taskcomplete.getId()+",修改成功！");
        mqProduce.sendOptlogMessage(null,"修改任务完成："+taskcomplete.getId(),
                user.getId(),user.getRealname());
        String jsonResult=JSONArray.toJSONString(resultHandler);
        return jsonResult;
    }

    @ResponseBody
    @RequestMapping(value = "/getTodoPage",method= RequestMethod.POST, produces = "text/html;charset=UTF-8")
    public String getTodoPage(HttpServletRequest request, PageHelper<Task> pageHelper) throws Exception {

        HttpSession checkLoginSession = request.getSession();
        User user = (User)checkLoginSession.getAttribute("user");
        //注：jqgrid每页数量使用的是rows，与返回分页数据的list实体同名
        int rows=Integer.parseInt(request.getParameter("rows"));
        pageHelper.setRowNum(rows);
        Map<String, Object> param = new HashMap<String, Object>();
        param.put("assignto", user.getId());
        param.put("status", "1");
        int records=service.getTodoCounts(param);
        pageHelper.setRecords(records);
        pageHelper=service.getTodoPage(pageHelper, param);
        String jsonResult= JSONArray.toJSONString(pageHelper);
        return jsonResult;
    }

    /*********************************我的任务end*********************************/

    /*********************************完成记录start*********************************/
    @RequestMapping(value="/completed")
    public String toCompleted(HttpServletRequest request){

        return "/WEB-INF/task/completed.jsp";
    }


    @ResponseBody
    @RequestMapping(value = "/getCompletedPage",method= RequestMethod.POST, produces = "text/html;charset=UTF-8")
    public String getCompletedPage(HttpServletRequest request, PageHelper<Taskcomplete> pageHelper) throws Exception {

        HttpSession checkLoginSession = request.getSession();
        User user = (User)checkLoginSession.getAttribute("user");
        //注：jqgrid每页数量使用的是rows，与返回分页数据的list实体同名
        int rows=Integer.parseInt(request.getParameter("rows"));
        pageHelper.setRowNum(rows);
        String taskid=request.getParameter("taskid");
        String starttime=request.getParameter("starttime");
        String endtime=request.getParameter("endtime");
        String title=request.getParameter("title");
        String userid=user.getId().toString();
        Map<String, Object> param = new HashMap<String, Object>();
        param.put("taskid", taskid);
        param.put("starttime", starttime);
        param.put("endtime", endtime);
        param.put("title", title);
        param.put("userid", userid);
        int records=service.getCompletedCounts(param);
        pageHelper.setRecords(records);
        pageHelper=service.getCompletedPage(pageHelper, param);
        String jsonResult= JSONArray.toJSONString(pageHelper);
        return jsonResult;
    }
    /*********************************完成记录end*********************************/

    /*********************************任务清单strat*********************************/
    @RequestMapping(value="/tasklist")
    public String toTasklist(HttpServletRequest request) throws Exception{

        return "/WEB-INF/task/tasklist.jsp";
    }

    @ResponseBody
    @RequestMapping(value = "/getTasklistPage",method= RequestMethod.POST, produces = "text/html;charset=UTF-8")
    public String getTasklistPage(HttpServletRequest request, PageHelper<Task> pageHelper) throws Exception {

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
        String source=request.getParameter("source");
        String status=request.getParameter("status");
        String userid=request.getParameter("userid");
        String assignto=request.getParameter("assignto");
        Map<String, Object> param = new HashMap<String, Object>();
        param.put("starttime", starttime);
        param.put("endtime", endtime);
        param.put("finishedtimeS", finishedtimeS);
        param.put("finishedtimeE", finishedtimeE);
        param.put("id", id);
        param.put("title", title);
        param.put("project", project);
        param.put("source", source);
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
        int records=service.getTasklistCounts(param);
        pageHelper.setRecords(records);
        pageHelper=service.getTasklistPage(pageHelper, param);
        String jsonResult= JSONArray.toJSONString(pageHelper);
        return jsonResult;
    }
    /*********************************任务清单end*********************************/

    /*********************************日志清单strat*********************************/
    @RequestMapping(value="/taskloglist")
    public String toTaskloglist(HttpServletRequest request) throws Exception{

        return "/WEB-INF/task/taskloglist.jsp";
    }

    @ResponseBody
    @RequestMapping(value = "/getTaskloglistPage",method= RequestMethod.POST, produces = "text/html;charset=UTF-8")
    public String getTaskloglistPage(HttpServletRequest request, PageHelper<Tasklog> pageHelper) throws Exception {

        //注：jqgrid每页数量使用的是rows，与返回分页数据的list实体同名
        int rows=Integer.parseInt(request.getParameter("rows"));
        pageHelper.setRowNum(rows);
        String starttime=request.getParameter("starttime");
        String endtime=request.getParameter("endtime");
        String userid=request.getParameter("userid");
        Map<String, Object> param = new HashMap<String, Object>();
        param.put("starttime", starttime);
        param.put("endtime", endtime);
        if(userid!=null&&userid!=""){
            String[] temp = userid.split(",");
            List<String> workTo=new ArrayList<String>();
            for (int i = 0 ; i <temp.length ; i++ ) {
                workTo.add(temp[i]);
            }
            param.put("userid", workTo);
        }
        int records=service.getTaskloglistCounts(param);
        pageHelper.setRecords(records);
        pageHelper=service.getTaskloglistPage(pageHelper, param);
        String jsonResult= JSONArray.toJSONString(pageHelper);
        return jsonResult;
    }

    /**
     * 下载：日志清单
     * @param request
     * @param response
     * @return
     */
    @ResponseBody
    @RequestMapping(value = "/d_tasklog", produces = "text/html;charset=UTF-8")
    public String d_tasklog(HttpServletRequest request,
                            HttpServletResponse response) throws Exception {
        SimpleDateFormat simpleFormat = new SimpleDateFormat("yyyyMMddHHmmss"); //为了转时间
        //加载excel模板
        InputStream in = ReportController.class.getClassLoader().getResourceAsStream("/excel/tasklog.xlsx");
        XSSFWorkbook work = new XSSFWorkbook(in);
        // 得到excel的第0张表
        XSSFSheet sheet = work.getSheetAt(0);
        String starttime=request.getParameter("starttime");
        String endtime=request.getParameter("endtime");
        String userid=request.getParameter("userid");
        List<Tasklog> listTemp=new ArrayList<Tasklog>();
        Map<String,Object> param=new HashMap<String, Object>();
        param.put("starttime", starttime);
        param.put("endtime", endtime);
        if(userid!=null&&userid!=""){
            String[] temp = userid.split(",");
            List<String> workTo=new ArrayList<String>();
            for (int i = 0 ; i <temp.length ; i++ ) {
                workTo.add(temp[i]);
            }
            param.put("userid", workTo);
        }
        listTemp=service.getTasklogList(param);
        // 这里面的行和列的数法与计算机里的一样，从0开始是第一
        for(int i=0;i<listTemp.size();i++){
            // 得到Excel工作表的行
            XSSFRow row = sheet.createRow(2+i);
            // 得到Excel工作表指定行的单元格
            row.createCell(0).setCellValue(i+1);
            row.createCell(1).setCellValue(listTemp.get(i).getTaskid());
            row.createCell(2).setCellValue(listTemp.get(i).getContent());
            row.createCell(3).setCellValue(listTemp.get(i).getCreatetime());
            row.createCell(4).setCellValue(listTemp.get(i).getUsername());


            //赋予单元格样式
            CellStyle style = work.createCellStyle();
            style.setBorderBottom(CellStyle.BORDER_THIN);  // 下边框
            style.setBorderLeft(CellStyle.BORDER_THIN);	   // 左边框
            style.setBorderRight(CellStyle.BORDER_THIN);	// 上边框
            style.setBorderTop(CellStyle.BORDER_THIN);	  // 右边框
            for (int j = 0; j < row.getLastCellNum(); j++) {
                row.getCell(j).setCellStyle(style);
            }

        }

        /****************************输出流*****************************************/
        String address = simpleFormat.format(new Date());
        OutputStream os = response.getOutputStream();// 取得输出流
        response.setContentType("application/vnd.ms-excel");
        response.setHeader("Content-disposition", "attachment;filename=\"tasklog_"+address+".xlsx\"");
        work.write(os);
        os.close();
        in.close();
        return null;
    }
    /*********************************日志清单end*********************************/
}
