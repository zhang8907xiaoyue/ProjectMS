package com.jschrj.dao.release;

import com.jschrj.pojo.release.Release;
import com.jschrj.pojo.task.Task;
import com.jschrj.pojo.task.Taskcomplete;

import java.util.List;
import java.util.Map;

public interface IReleaseDao {
    int deleteByPrimaryKey(Integer id) throws Exception;

    int insert(Release record) throws Exception;

    int insertSelective(Release record) throws Exception;

    Release selectByPrimaryKey(Integer id) throws Exception;

    int updateByPrimaryKeySelective(Release record) throws Exception;

    int updateByPrimaryKey(Release record) throws Exception;

    List<Release> getReleaselistByTypeReferid(Map<String, Object> param) throws Exception;

    void deleteByReferid(Integer referid) throws Exception;

    List<Release> getReleaseList() throws Exception;

    List<Taskcomplete> getReleaselistByProjectCustomer(Map<String, Object> param) throws Exception;

    int selectOtherRelease(Map<String, Object> param) throws Exception;

    int getReleasedCounts(Map<String, Object> param) throws Exception;

    List<Release> getReleasedPage(Map<String, Object> param) throws Exception;

    List<Release> getReleasedList(Map<String, Object> param) throws Exception;
}