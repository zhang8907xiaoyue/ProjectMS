package com.jschrj.dao.system;

import com.jschrj.pojo.system.Role;

import java.util.List;
import java.util.Map;

public interface IRoleDao {
    int deleteByPrimaryKey(Integer id);

    int insert(Role record);

    int insertSelective(Role record);

    Role selectByPrimaryKey(Integer id);

    int updateByPrimaryKeySelective(Role record);

    int updateByPrimaryKey(Role record);

	int getRoleCounts(Map<String, Object> param) throws Exception;

	List<Role> getRolePage(Map<String, Object> param) throws Exception;

	List<Role> getRoleList() throws Exception;

	List<Role> getUserRoleList(Map<String, Object> param) throws Exception;
}