package com.jschrj.dao.test;

import com.jschrj.pojo.test.Usecasestep;

import java.util.List;

public interface IUsecasestepDao {
    int deleteByPrimaryKey(Integer id) throws Exception;

    int insert(Usecasestep record) throws Exception;

    int insertSelective(Usecasestep record) throws Exception;

    Usecasestep selectByPrimaryKey(Integer id) throws Exception;

    int updateByPrimaryKeySelective(Usecasestep record) throws Exception;

    int updateByPrimaryKey(Usecasestep record) throws Exception;

    List<Usecasestep> getUsecasesteplistByusecaseid(Integer usecaseid) throws Exception;

    void deleteByUsecaseid(Integer usecaseid) throws Exception;
}