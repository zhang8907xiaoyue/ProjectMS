package com.jschrj.dao.system;

import com.jschrj.common.TreeHelper;
import com.jschrj.pojo.system.User;

import java.util.List;
import java.util.Map;

public interface IUserDao {
    int deleteByPrimaryKey(Integer id) throws Exception;

    int insert(User record) throws Exception;

    int insertSelective(User record) throws Exception;

    User selectByPrimaryKey(Integer id) throws Exception;

    int updateByPrimaryKeySelective(User record) throws Exception;

    int updateByPrimaryKey(User record) throws Exception;

	User selectByName(String trim) throws Exception;

	int getUserCounts(Map<String, Object> param) throws Exception;

	List<User> getUserPage(Map<String, Object> param) throws Exception;
	
	List<User> getUserByName(String name) throws Exception;

	List<User> getUserByNameExceptId(Map<String, Object> param) throws Exception;

	List<TreeHelper> getOrgUserTree() throws Exception;

    List<User> getUserList() throws Exception;

    List<User> getTeammembers(int type) throws Exception;
}