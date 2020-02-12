package com.jschrj.dao.task;

import com.jschrj.pojo.base.Extend;
import com.jschrj.pojo.story.Story;
import com.jschrj.pojo.system.User;
import com.jschrj.pojo.task.Task;

import java.util.List;
import java.util.Map;

public interface ITaskDao {
    int deleteByPrimaryKey(Integer id) throws Exception;

    int insert(Task record) throws Exception;

    int insertSelective(Task record) throws Exception;

    Task selectByPrimaryKey(Integer id) throws Exception;

    List<Extend> getTaskOptListByTaskid(int taskid) throws Exception;

    int updateByPrimaryKeySelective(Task record) throws Exception;

    int updateByPrimaryKeyWithBLOBs(Task record) throws Exception;

    int updateByPrimaryKey(Task record) throws Exception;

    int getSortedCounts(Map<String, Object> param) throws Exception;

    List<Task> getSortedPage(Map<String, Object> param) throws Exception;

    int getTodoCounts(Map<String, Object> param) throws Exception;

    List<Task> getTodoPage(Map<String, Object> param) throws Exception;

    List<Task> getTasklistByStoryid(int storyid) throws Exception;

    int getTasklistCounts(Map<String, Object> param) throws Exception;

    List<Task> getTasklistPage(Map<String, Object> param) throws Exception;
}