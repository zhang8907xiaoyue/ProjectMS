package com.jschrj.dao.base;

import com.jschrj.pojo.base.Project;
import com.jschrj.pojo.base.Source;

import java.util.List;
import java.util.Map;

public interface IProjectDao {
    int deleteByPrimaryKey(Integer id) throws Exception;

    int insert(Project record) throws Exception;

    int insertSelective(Project record) throws Exception;

    Project selectByPrimaryKey(Integer id) throws Exception;

    int updateByPrimaryKeySelective(Project record) throws Exception;

    int updateByPrimaryKey(Project record) throws Exception;

    List<Project> getProjectList() throws Exception;

    int getProjectCounts(Map<String, Object> param) throws Exception;

    List<Project> getProjectPage(Map<String, Object> param) throws Exception;
}