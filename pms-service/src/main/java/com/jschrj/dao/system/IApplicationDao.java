package com.jschrj.dao.system;

import com.jschrj.common.TreeHelper;
import com.jschrj.pojo.system.Application;

import java.util.List;
import java.util.Map;

public interface IApplicationDao {
    int deleteByPrimaryKey(Integer id);

    int insert(Application record);

    int insertSelective(Application record);

    Application selectByPrimaryKey(Integer id);

    int updateByPrimaryKeySelective(Application record);

    int updateByPrimaryKey(Application record);

	int getApplicationCounts(Map<String, Object> param) throws Exception;

	List<Application> getApplicationPage(Map<String, Object> param) throws Exception;

	List<TreeHelper> getApplicationTree() throws Exception;

	List<Application> getAppList() throws Exception;

	List<TreeHelper<Application>> getLeftMenuTree(Map<String, Object> param) throws Exception;
}