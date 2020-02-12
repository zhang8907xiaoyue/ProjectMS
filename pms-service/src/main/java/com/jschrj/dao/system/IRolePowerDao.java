package com.jschrj.dao.system;

import com.jschrj.pojo.system.RolePower;

import java.util.List;
import java.util.Map;

public interface IRolePowerDao {
    int deleteByPrimaryKey(RolePower key);

    int insert(RolePower record);

    int insertSelective(RolePower record);

	void deleteByRoleid(Integer roleid) throws Exception;

	List<RolePower> getRolePowerList(Map<String, Object> param) throws Exception;
}