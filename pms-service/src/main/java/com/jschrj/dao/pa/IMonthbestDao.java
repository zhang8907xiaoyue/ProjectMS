package com.jschrj.dao.pa;

import com.jschrj.pojo.pa.Fault;
import com.jschrj.pojo.pa.Monthbest;
import com.jschrj.pojo.report.Report;

import java.util.List;
import java.util.Map;

public interface IMonthbestDao {
    int deleteByPrimaryKey(Integer id);

    int insert(Monthbest record);

    int insertSelective(Monthbest record) throws Exception;

    Monthbest selectByPrimaryKey(Integer id);

    int updateByPrimaryKeySelective(Monthbest record) throws Exception;

    int updateByPrimaryKeyWithBLOBs(Monthbest record);

    int updateByPrimaryKey(Monthbest record);

    int getMonthbestCounts(Map<String, Object> param) throws Exception;

    List<Monthbest> getMonthbestPage(Map<String, Object> param) throws Exception;

    List<Report> getPainfoList(Map<String, Object> param) throws Exception;
}