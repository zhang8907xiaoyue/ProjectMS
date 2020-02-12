package com.jschrj.dao.pa;

import com.jschrj.pojo.pa.Fault;

import java.util.List;
import java.util.Map;

public interface IFaultDao {
    int deleteByPrimaryKey(Integer id);

    int insert(Fault record);

    int insertSelective(Fault record) throws Exception;

    Fault selectByPrimaryKey(Integer id) throws Exception;

    int updateByPrimaryKeySelective(Fault record) throws Exception;

    int updateByPrimaryKeyWithBLOBs(Fault record);

    int updateByPrimaryKey(Fault record);

    int getFaultCounts(Map<String, Object> param) throws Exception;

    List<Fault> getFaultPage(Map<String, Object> param) throws Exception;
}