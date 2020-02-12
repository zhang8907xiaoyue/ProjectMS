package com.jschrj.dao.base;

import com.jschrj.pojo.base.Modular;
import com.jschrj.pojo.base.Source;

import java.util.List;
import java.util.Map;

public interface ISourceDao {
    int deleteByPrimaryKey(Integer id) throws Exception;

    int insert(Source record) throws Exception;

    int insertSelective(Source record) throws Exception;

    Source selectByPrimaryKey(Integer id) throws Exception;

    int updateByPrimaryKeySelective(Source record) throws Exception;

    int updateByPrimaryKey(Source record) throws Exception;

    List<Source> getSourceList() throws Exception;

    int getSourceCounts(Map<String, Object> param) throws Exception;

    List<Source> getSourcePage(Map<String, Object> param) throws Exception;
}