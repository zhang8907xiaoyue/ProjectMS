package com.jschrj.api.task;

import com.jschrj.common.PageHelper;
import com.jschrj.pojo.base.Extend;
import com.jschrj.pojo.report.Report;
import com.jschrj.pojo.story.Story;
import com.jschrj.pojo.system.User;
import com.jschrj.pojo.task.*;

import java.util.List;
import java.util.Map;

public interface TaskService {

    /**
     * 获取需求关联任务列表
     * @param storyid
     * @return
     * @throws Exception
     */
    public List<Task> getTasklistByStoryid(int storyid) throws Exception;

    /**
     * 任务新增
     * @param task
     * @throws Exception
     */
    public void tx_Task(Task task) throws Exception;

    /**
     * 分拣记录总数
     * @param param
     * @return
     * @throws Exception
     */
    public int getSortedCounts(Map<String, Object> param) throws Exception;

    /**
     * 分拣记录分页数据
     * @param pageHelper
     * @param param
     * @return
     */
    public PageHelper<Task> getSortedPage(
            PageHelper<Task> pageHelper, Map<String, Object> param) throws Exception;

    /**
     * 获取任务信息
     * @param id
     * @return
     * @throws Exception
     */
    public Task getTaskById(int id) throws Exception;

    /**
     * 获取任务操作记录
     * @param taskid
     * @return
     * @throws Exception
     */
    public List<Extend> getTaskOptListByTaskid(int taskid) throws Exception;

    /**
     * 我的任务总数
     * @param param
     * @return
     * @throws Exception
     */
    public int getTodoCounts(Map<String, Object> param) throws Exception;

    /**
     * 我的任务分页数据
     * @param pageHelper
     * @param param
     * @return
     */
    public PageHelper<Task> getTodoPage(
            PageHelper<Task> pageHelper, Map<String, Object> param) throws Exception;

    /**
     * 任务控制：暂停或者开始
     * @param taskcontrol
     * @throws Exception
     */
    public void tx_TaskControl(Taskcontrol taskcontrol) throws Exception;

    /**
     * 添加任务备注
     * @param taskremark
     * @throws Exception
     */
    public void tx_TaskRemark(Taskremark taskremark) throws Exception;

    /**
     * 添加任务日志
     * @param tasklog
     * @throws Exception
     */
    public void tx_TaskLog(Tasklog tasklog) throws Exception;

    /**
     * 任务完成
     * @param taskcomplete
     * @throws Exception
     */
    public void tx_TaskComplete(Taskcomplete taskcomplete) throws Exception;

    /**
     * 资料更新
     * @param
     * @throws Exception
     */
    public void updateTaskcomplete(Taskcomplete taskcomplete) throws Exception;

    /**
     * 任务完成总数
     * @param param
     * @return
     * @throws Exception
     */
    public int getCompletedCounts(Map<String, Object> param) throws Exception;

    /**
     * 任务完成分页数据
     * @param pageHelper
     * @param param
     * @return
     */
    public PageHelper<Taskcomplete> getCompletedPage(
            PageHelper<Taskcomplete> pageHelper, Map<String, Object> param) throws Exception;

    /**
     * 获取任务完成信息
     * @param taskid
     * @return
     * @throws Exception
     */
    public Taskcomplete getTaskcompleteByTaskid(int taskid) throws Exception;

    /**
     * 获取任务完成信息
     * @param id
     * @return
     * @throws Exception
     */
    public Taskcomplete getTaskcompleteById(int id) throws Exception;

    void updateTask(Task task) throws Exception;

    void tx_deleteStory(Task task) throws Exception;

    List<Task> getTaskList(int storyid) throws Exception;

    int getTasklistCounts(Map<String, Object> param) throws Exception;

    PageHelper<Task> getTasklistPage(PageHelper<Task> pageHelper, Map<String, Object> param) throws Exception;

    int getTaskloglistCounts(Map<String, Object> param) throws Exception;

    PageHelper<Tasklog> getTaskloglistPage(PageHelper<Tasklog> pageHelper, Map<String, Object> param) throws Exception;

    List<Tasklog> getTasklogList(Map<String, Object> param) throws Exception;
}
