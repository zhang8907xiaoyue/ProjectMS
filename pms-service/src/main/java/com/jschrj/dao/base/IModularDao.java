package com.jschrj.dao.base;

import com.jschrj.pojo.base.Modular;

import java.util.List;
import java.util.Map;

public interface IModularDao {
    int deleteByPrimaryKey(Integer id) throws Exception;

    int insert(Modular record) throws Exception;

    int insertSelective(Modular record) throws Exception;

    Modular selectByPrimaryKey(Integer id) throws Exception;

    List<Modular> getModularList(Map<String,Object> param) throws Exception;

    int updateByPrimaryKeySelective(Modular record) throws Exception;

    int updateByPrimaryKey(Modular record) throws Exception;

    int getModularCounts(Map<String, Object> param) throws Exception;

    List<Modular> getModularPage(Map<String, Object> param) throws Exception;
}