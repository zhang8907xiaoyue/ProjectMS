package com.jschrj.dao.bug;

import com.jschrj.pojo.bug.Bug;

import java.util.List;
import java.util.Map;

public interface IBugDao {
    int deleteByPrimaryKey(Integer id) throws Exception;

    int insert(Bug record) throws Exception;

    int insertSelective(Bug record) throws Exception;

    Bug selectByPrimaryKey(Integer id) throws Exception;

    int updateByPrimaryKeySelective(Bug record) throws Exception;

    int updateByPrimaryKeyWithBLOBs(Bug record) throws Exception;

    int updateByPrimaryKey(Bug record) throws Exception;

    int getBugCounts(Map<String, Object> param) throws Exception;

    List<Bug> getBugPage(Map<String, Object> param) throws Exception;

    int getTosolveCounts(Map<String, Object> param) throws Exception;

    List<Bug> getTosolvePage(Map<String, Object> param) throws Exception;

    int getToapproveCounts(Map<String, Object> param) throws Exception;

    List<Bug> getToapprovePage(Map<String, Object> param) throws Exception;

    int getSolvedCounts(Map<String, Object> param) throws Exception;

    List<Bug> getSolvedPage(Map<String, Object> param) throws Exception;

    List<Bug> getBugListByStoryid(int storyid) throws Exception;

    List<Bug> getBugListByTaskid(int taskid) throws Exception;
}