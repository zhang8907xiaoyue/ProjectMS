package com.jschrj.dao.task;

import com.jschrj.pojo.task.Tasklog;

import java.util.List;
import java.util.Map;

public interface ITasklogDao {
    int deleteByPrimaryKey(Integer id);

    int insert(Tasklog record);

    int insertSelective(Tasklog record) throws Exception;

    Tasklog selectByPrimaryKey(Integer id);

    int updateByPrimaryKeySelective(Tasklog record);

    int updateByPrimaryKey(Tasklog record);

    int getTaskloglistCounts(Map<String, Object> param) throws Exception;

    List<Tasklog> getTaskloglistPage(Map<String, Object> param) throws Exception;

    List<Tasklog> getTasklogList(Map<String, Object> param) throws Exception;
}