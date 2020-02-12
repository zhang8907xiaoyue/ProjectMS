package com.jschrj.dao.system;

import com.jschrj.pojo.system.Errorlog;

public interface IErrorlogDao {
    int deleteByPrimaryKey(Integer id);

    int insert(Errorlog record);

    int insertSelective(Errorlog record) throws Exception;

    Errorlog selectByPrimaryKey(Integer id);

    int updateByPrimaryKeySelective(Errorlog record);

    int updateByPrimaryKey(Errorlog record);
}