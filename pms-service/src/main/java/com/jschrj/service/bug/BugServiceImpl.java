package com.jschrj.service.bug;

import com.jschrj.api.bug.BugService;
import com.jschrj.common.PageHelper;
import com.jschrj.dao.bug.IBugDao;
import com.jschrj.dao.release.IReleaseDao;
import com.jschrj.pojo.bug.Bug;
import com.jschrj.pojo.release.Release;
import com.jschrj.pojo.test.Usecase;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;
import java.util.List;
import java.util.Map;

@Service
public class BugServiceImpl implements BugService {

    @Resource
    IBugDao bugDao;

    @Resource
    IReleaseDao releaseDao;

    @Override
    public void tx_insertBug(Bug bug,List<Release> releaseList) throws Exception {

        bugDao.insertSelective(bug);

        //新增待发布
        for(int i=0;i<releaseList.size();i++){
            releaseList.get(i).setType(2);
            releaseList.get(i).setReferid(bug.getId());
//            releaseList.get(i).setUserid(bug.getUserid());
//            releaseList.get(i).setUsername(bug.getUsername());
            releaseDao.insertSelective(releaseList.get(i));
        }
    }

    @Override
    public int getBugCounts(Map<String, Object> param) throws Exception {

        return bugDao.getBugCounts(param);
    }

    @Override
    public PageHelper<Bug> getBugPage(PageHelper<Bug> pageHelper, Map<String, Object> param) throws Exception {

        param.put("limit", pageHelper.getRowNum());
        param.put("offset", pageHelper.getRowNum()*(pageHelper.getPage()-1));
        param.put("order", pageHelper.getSidx());
        param.put("sort", pageHelper.getSord());
        List<Bug> tempList=bugDao.getBugPage(param);
        pageHelper.setRows(tempList);
        return pageHelper;
    }

    @Override
    public void tx_updateBug(Bug bug,List<Release> releaseList) throws Exception {

        bugDao.updateByPrimaryKeySelective(bug);
        if(bug.getDuty()!=null){
            //责任人员不为空，表明是bug责任认定，不需要后续处理
        }else{
            //删除旧发布资料
            releaseDao.deleteByReferid(bug.getId());

            //新增待发布
            for(int i=0;i<releaseList.size();i++){
                releaseList.get(i).setType(2);
                releaseList.get(i).setReferid(bug.getId());
//            releaseList.get(i).setUserid(bug.getUserid());
//            releaseList.get(i).setUsername(bug.getUsername());
                releaseDao.insertSelective(releaseList.get(i));
            }
        }

    }

    @Override
    public void deleteBug(Bug bug) throws Exception {

        bugDao.updateByPrimaryKeySelective(bug);
    }

    @Override
    public Bug getBugById(int id) throws Exception {

        return bugDao.selectByPrimaryKey(id);
    }

    @Override
    public int getTosolveCounts(Map<String, Object> param) throws Exception {
        return bugDao.getTosolveCounts(param);
    }

    @Override
    public PageHelper<Bug> getTosolvePage(PageHelper<Bug> pageHelper, Map<String, Object> param) throws Exception {

        param.put("limit", pageHelper.getRowNum());
        param.put("offset", pageHelper.getRowNum()*(pageHelper.getPage()-1));
        param.put("order", pageHelper.getSidx());
        param.put("sort", pageHelper.getSord());
        List<Bug> tempList=bugDao.getTosolvePage(param);
        pageHelper.setRows(tempList);
        return pageHelper;
    }

    @Override
    public int getToapproveCounts(Map<String, Object> param) throws Exception {

        return bugDao.getToapproveCounts(param);
    }

    @Override
    public PageHelper<Bug> getToapprovePage(PageHelper<Bug> pageHelper, Map<String, Object> param) throws Exception {

        param.put("limit", pageHelper.getRowNum());
        param.put("offset", pageHelper.getRowNum()*(pageHelper.getPage()-1));
        param.put("order", pageHelper.getSidx());
        param.put("sort", pageHelper.getSord());
        List<Bug> tempList=bugDao.getToapprovePage(param);
        pageHelper.setRows(tempList);
        return pageHelper;
    }

    @Override
    public int getSolvedCounts(Map<String, Object> param) throws Exception {

        return bugDao.getSolvedCounts(param);
    }

    @Override
    public PageHelper<Bug> getSolvedPage(PageHelper<Bug> pageHelper, Map<String, Object> param) throws Exception {

        param.put("limit", pageHelper.getRowNum());
        param.put("offset", pageHelper.getRowNum()*(pageHelper.getPage()-1));
        param.put("order", pageHelper.getSidx());
        param.put("sort", pageHelper.getSord());
        List<Bug> tempList=bugDao.getSolvedPage(param);
        pageHelper.setRows(tempList);
        return pageHelper;
    }

    @Override
    public void updateBugNext(Bug bug) throws Exception {

        bugDao.updateByPrimaryKeySelective(bug);
    }

    @Override
    public List<Bug> getBugListByStoryid(int storyid) throws Exception {

        return bugDao.getBugListByStoryid(storyid);
    }

    @Override
    public List<Bug> getBugListByTaskid(int taskid) throws Exception {

        return bugDao.getBugListByTaskid(taskid);
    }
}
