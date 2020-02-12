package com.jschrj.dao.test;

import com.jschrj.pojo.test.Usecase;

import java.util.List;
import java.util.Map;

public interface IUsecaseDao {
    int deleteByPrimaryKey(Integer id) throws Exception;

    int insert(Usecase record) throws Exception;

    int insertSelective(Usecase record) throws Exception;

    Usecase selectByPrimaryKey(Integer id) throws Exception;

    int updateByPrimaryKeySelective(Usecase record) throws Exception;

    int updateByPrimaryKey(Usecase record) throws Exception;

    int getUsecaseCounts(Map<String, Object> param) throws Exception;

    List<Usecase> getUsecasePage(Map<String, Object> param) throws Exception;

    List<Usecase> getUsecaseByStoryid(int storyid) throws Exception;
}