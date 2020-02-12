package com.jschrj.dao.system;

import com.jschrj.pojo.system.Optlog;

public interface IOptlogDao {
    int deleteByPrimaryKey(Integer id);

    int insert(Optlog record);

    int insertSelective(Optlog record) throws Exception;

    Optlog selectByPrimaryKey(Integer id);

    int updateByPrimaryKeySelective(Optlog record);

    int updateByPrimaryKey(Optlog record);
}