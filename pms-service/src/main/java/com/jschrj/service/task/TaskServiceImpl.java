package com.jschrj.service.task;

import com.jschrj.api.task.TaskService;
import com.jschrj.common.PageHelper;
import com.jschrj.dao.story.IStoryDao;
import com.jschrj.dao.task.*;
import com.jschrj.pojo.base.Extend;
import com.jschrj.pojo.base.Project;
import com.jschrj.pojo.story.Story;
import com.jschrj.pojo.system.User;
import com.jschrj.pojo.task.*;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

@Service
public class TaskServiceImpl implements TaskService {

    @Resource
    ITaskDao taskDao;

    @Resource
    IStoryDao storyDao;

    @Resource
    ITaskcompleteDao taskcompleteDao;

    @Resource
    ITaskcontrolDao taskcontrolDao;

    @Resource
    ITaskremarkDao taskremarkDao;

    @Resource
    ITasklogDao tasklogDao;

    @Override
    public List<Task> getTasklistByStoryid(int storyid) throws Exception {

        return taskDao.getTasklistByStoryid(storyid);
    }

    @Override
    public List<Extend> getTaskOptListByTaskid(int taskid) throws Exception {

        return taskDao.getTaskOptListByTaskid(taskid);
    }

    @Override
    public Task getTaskById(int id) throws Exception {

        return taskDao.selectByPrimaryKey(id);
    }

    @Override
    public void tx_Task(Task task) throws Exception {
        //更新需求状态
        Story story=new Story();
        story.setId(task.getStoryid());
        story.setStatus(2);
        storyDao.updateByPrimaryKeySelective(story);
        //新增任务
        taskDao.insertSelective(task);
    }

    @Override
    public void updateTask(Task task) throws Exception {

        taskDao.updateByPrimaryKeySelective(task);
    }

    @Override
    public void tx_deleteStory(Task task) throws Exception {

        //检查需求是否存在其他任务
        Map<String,Object> param=new HashMap<>();
        param.put("storyid",task.getStoryid());
        param.put("taskid",task.getId());
        if(storyDao.selectExistsOtherTask(param)==0){
            //没有其他进行中的任务，更新需求状态为待测试
            Story story=new Story();
            story.setId(task.getStoryid());
            story.setStatus(3);
            storyDao.updateByPrimaryKeySelective(story);
        }
        //删除任务
        task.setStatus(0);
        taskDao.updateByPrimaryKeySelective(task);
    }

    @Override
    public List<Task> getTaskList(int storyid) throws Exception {

        return taskDao.getTasklistByStoryid(storyid);
    }

    @Override
    public int getTasklistCounts(Map<String, Object> param) throws Exception {

        return taskDao.getTasklistCounts(param);
    }

    @Override
    public PageHelper<Task> getTasklistPage(PageHelper<Task> pageHelper, Map<String, Object> param) throws Exception {
        param.put("limit", pageHelper.getRowNum());
        param.put("offset", pageHelper.getRowNum()*(pageHelper.getPage()-1));
        param.put("order", pageHelper.getSidx());
        param.put("sort", pageHelper.getSord());
        List<Task> tempList=taskDao.getTasklistPage(param);
        pageHelper.setRows(tempList);
        return pageHelper;
    }

    @Override
    public int getTaskloglistCounts(Map<String, Object> param) throws Exception {

        return tasklogDao.getTaskloglistCounts(param);
    }

    @Override
    public PageHelper<Tasklog> getTaskloglistPage(PageHelper<Tasklog> pageHelper, Map<String, Object> param) throws Exception {
        param.put("limit", pageHelper.getRowNum());
        param.put("offset", pageHelper.getRowNum()*(pageHelper.getPage()-1));
        param.put("order", pageHelper.getSidx());
        param.put("sort", pageHelper.getSord());
        List<Tasklog> tempList=tasklogDao.getTaskloglistPage(param);
        pageHelper.setRows(tempList);
        return pageHelper;
    }

    @Override
    public List<Tasklog> getTasklogList(Map<String, Object> param) throws Exception {
        return tasklogDao.getTasklogList(param);
    }

    @Override
    public int getSortedCounts(Map<String, Object> param) throws Exception {

        return taskDao.getSortedCounts(param);
    }

    @Override
    public PageHelper<Task> getSortedPage(
            PageHelper<Task> pageHelper, Map<String, Object> param) throws Exception {
        param.put("limit", pageHelper.getRowNum());
        param.put("offset", pageHelper.getRowNum()*(pageHelper.getPage()-1));
        param.put("order", pageHelper.getSidx());
        param.put("sort", pageHelper.getSord());
        List<Task> tempList=taskDao.getSortedPage(param);
        pageHelper.setRows(tempList);
        return pageHelper;
    }

    @Override
    public int getTodoCounts(Map<String, Object> param) throws Exception {

        return taskDao.getTodoCounts(param);
    }

    @Override
    public PageHelper<Task> getTodoPage(
            PageHelper<Task> pageHelper, Map<String, Object> param) throws Exception {
        param.put("limit", pageHelper.getRowNum());
        param.put("offset", pageHelper.getRowNum()*(pageHelper.getPage()-1));
        param.put("order", pageHelper.getSidx());
        param.put("sort", pageHelper.getSord());
        List<Task> tempList=taskDao.getTodoPage(param);
        pageHelper.setRows(tempList);
        return pageHelper;
    }

    @Override
    public void tx_TaskControl(Taskcontrol taskcontrol) throws Exception {

        //任务控制：暂停或开始
        Task task=new Task();
        task.setId(taskcontrol.getTaskid());
        if(taskcontrol.getType()==0){
            //暂停
            task.setStatus(3);
        }else{
            //开始
            task.setStatus(1);
        }
        taskDao.updateByPrimaryKeySelective(task);
        taskcontrolDao.insertSelective(taskcontrol);
    }

    @Override
    public void tx_TaskRemark(Taskremark taskremark) throws Exception {

        //新增任务备注
        taskremarkDao.insertSelective(taskremark);
    }


    @Override
    public void tx_TaskLog(Tasklog tasklog) throws Exception {

        //新增任务日志
        tasklogDao.insertSelective(tasklog);
    }

    @Override
    public void tx_TaskComplete(Taskcomplete taskcomplete) throws Exception {

        //检查需求是否有其他任务开发中
        Map<String,Object> param=new HashMap<>();
        param.put("storyid",taskcomplete.getStoryid());
        param.put("taskid",taskcomplete.getTaskid());
        if(storyDao.selectIsTaskComplete(param)==0){
            //没有其他进行中的任务，更新需求状态为待测试
            Story story=new Story();
            story.setId(taskcomplete.getStoryid());
            story.setStatus(3);
            storyDao.updateByPrimaryKeySelective(story);
        }

        //更新任务状态
        Task task=new Task();
        task.setId(taskcomplete.getTaskid());
        task.setStatus(2);
        taskDao.updateByPrimaryKeySelective(task);

        //新增任务完成记录
        taskcompleteDao.insertSelective(taskcomplete);
    }

    @Override
    public void updateTaskcomplete(Taskcomplete taskcomplete) throws Exception {

        taskcompleteDao.updateByPrimaryKeySelective(taskcomplete);
    }

    @Override
    public int getCompletedCounts(Map<String, Object> param) throws Exception {

        return taskcompleteDao.getCompletedCounts(param);
    }

    @Override
    public PageHelper<Taskcomplete> getCompletedPage(
            PageHelper<Taskcomplete> pageHelper, Map<String, Object> param) throws Exception {
        param.put("limit", pageHelper.getRowNum());
        param.put("offset", pageHelper.getRowNum()*(pageHelper.getPage()-1));
        param.put("order", pageHelper.getSidx());
        param.put("sort", pageHelper.getSord());
        List<Taskcomplete> tempList=taskcompleteDao.getCompletedPage(param);
        pageHelper.setRows(tempList);
        return pageHelper;
    }

    @Override
    public Taskcomplete getTaskcompleteByTaskid(int taskid) throws Exception {

        return taskcompleteDao.selectByTaskid(taskid);
    }

    @Override
    public Taskcomplete getTaskcompleteById(int id) throws Exception {

        return taskcompleteDao.selectByPrimaryKey(id);
    }

}
