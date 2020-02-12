package com.jschrj.dao.system;

import com.jschrj.pojo.system.UserRole;

public interface IUserRoleDao {
    int deleteByPrimaryKey(Integer id);

    int insert(UserRole record);

    int insertSelective(UserRole record);

	void deleteByUserid(Integer userid) throws Exception;
}