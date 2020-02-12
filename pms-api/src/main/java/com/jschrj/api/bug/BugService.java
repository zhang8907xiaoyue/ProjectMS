package com.jschrj.api.bug;

import com.jschrj.common.PageHelper;
import com.jschrj.pojo.bug.Bug;
import com.jschrj.pojo.release.Release;
import com.jschrj.pojo.test.Usecase;
import com.jschrj.pojo.test.Usecasestep;

import java.util.List;
import java.util.Map;

public interface BugService {


    void tx_insertBug(Bug bug,List<Release> releaseList) throws Exception;

    int getBugCounts(Map<String, Object> param) throws Exception;

    PageHelper<Bug> getBugPage(PageHelper<Bug> pageHelper, Map<String, Object> param) throws Exception;

    void tx_updateBug(Bug bug,List<Release> releaseList) throws Exception;

    void deleteBug(Bug bug) throws Exception;

    Bug getBugById(int id) throws Exception;

    int getTosolveCounts(Map<String, Object> param) throws Exception;

    PageHelper<Bug> getTosolvePage(PageHelper<Bug> pageHelper, Map<String, Object> param) throws Exception;

    int getToapproveCounts(Map<String, Object> param) throws Exception;

    PageHelper<Bug> getToapprovePage(PageHelper<Bug> pageHelper, Map<String, Object> param) throws Exception;

    int getSolvedCounts(Map<String, Object> param) throws Exception;

    PageHelper<Bug> getSolvedPage(PageHelper<Bug> pageHelper, Map<String, Object> param) throws Exception;

    void updateBugNext(Bug bug) throws Exception;


    /**
     * 获取需求关联bug列表
     * @param storyid
     * @return
     * @throws Exception
     */
    public List<Bug> getBugListByStoryid(int storyid) throws Exception;

    /**
     * 获取任务关联bug列表
     * @param taskid
     * @return
     * @throws Exception
     */
    public List<Bug> getBugListByTaskid(int taskid) throws Exception;
}
