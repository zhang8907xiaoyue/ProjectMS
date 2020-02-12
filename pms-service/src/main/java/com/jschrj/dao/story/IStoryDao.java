package com.jschrj.dao.story;

import com.jschrj.pojo.base.KeyAndValue;
import com.jschrj.pojo.story.Story;

import java.util.List;
import java.util.Map;

public interface IStoryDao {
    int deleteByPrimaryKey(Integer id) throws Exception;

    int insert(Story record) throws Exception;

    int insertSelective(Story record) throws Exception;

    int getStoryCounts(Map<String, Object> param) throws Exception;

    List<Story> getStoryPage(Map<String, Object> param) throws Exception;

    Story selectByPrimaryKey(Integer id) throws Exception;

    int updateByPrimaryKeySelective(Story record) throws Exception;

    int updateByPrimaryKeyWithBLOBs(Story record) throws Exception;

    int updateByPrimaryKey(Story record) throws Exception;

    int selectIsTaskComplete(Map<String,Object> param) throws Exception;

    int selectExistsOtherTask(Map<String, Object> param) throws Exception;

    List<KeyAndValue> getProjectSum(Map<String, Object> param) throws Exception;

    List<KeyAndValue> getSourceSum(Map<String, Object> param) throws Exception;

    KeyAndValue getGkCounts(int userid) throws Exception;

    int getTotestCounts(Map<String, Object> param) throws Exception;

    List<Story> getTotestPage(Map<String, Object> param) throws Exception;
}