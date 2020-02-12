package com.jschrj.dao.system;

import com.jschrj.pojo.system.Email;

import java.util.List;

public interface IEmailDao {
    int deleteByPrimaryKey(Integer id) throws Exception;

    int insert(Email record) throws Exception;

    int insertSelective(Email record) throws Exception;

    Email selectByPrimaryKey(Integer id) throws Exception;

    int updateByPrimaryKeySelective(Email record) throws Exception;

    int updateByPrimaryKey(Email record) throws Exception;

    List<Email> getEmailList() throws Exception;
}