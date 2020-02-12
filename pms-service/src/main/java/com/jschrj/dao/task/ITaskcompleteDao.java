package com.jschrj.dao.task;

import com.jschrj.pojo.task.Task;
import com.jschrj.pojo.task.Taskcomplete;

import java.util.List;
import java.util.Map;

public interface ITaskcompleteDao {
    int deleteByPrimaryKey(Integer id) throws Exception;

    int insert(Taskcomplete record) throws Exception;

    int insertSelective(Taskcomplete record) throws Exception;

    Taskcomplete selectByPrimaryKey(Integer id) throws Exception;

    Taskcomplete selectByTaskid(Integer taskid) throws Exception;

    int updateByPrimaryKeySelective(Taskcomplete record) throws Exception;

    int updateByPrimaryKeyWithBLOBs(Taskcomplete record) throws Exception;

    int updateByPrimaryKey(Taskcomplete record) throws Exception;

    int getCompletedCounts(Map<String, Object> param) throws Exception;

    List<Taskcomplete> getCompletedPage(Map<String, Object> param) throws Exception;
}