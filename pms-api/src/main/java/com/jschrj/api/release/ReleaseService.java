package com.jschrj.api.release;

import com.jschrj.common.PageHelper;
import com.jschrj.pojo.release.Release;
import com.jschrj.pojo.task.Task;
import com.jschrj.pojo.task.Taskcomplete;

import java.util.List;
import java.util.Map;

public interface ReleaseService {

    List<Release> getReleaselistByTypeReferid(Map<String, Object> param) throws Exception;

    List<Release> getReleaseList() throws Exception;

    List<Taskcomplete> getReleaselistByProjectCustomer(Map<String, Object> param) throws Exception;

    void tx_doRelease(List<Release> releaseList,String version,int userid,String username) throws Exception;

    int getReleasedCounts(Map<String, Object> param) throws Exception;

    PageHelper<Release> getReleasedPage(PageHelper<Release> pageHelper, Map<String, Object> param) throws Exception;

    List<Release> getReleasedList(Map<String, Object> param) throws Exception;
}
