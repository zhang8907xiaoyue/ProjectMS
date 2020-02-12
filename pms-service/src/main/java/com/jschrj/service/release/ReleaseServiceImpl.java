package com.jschrj.service.release;

import com.jschrj.api.release.ReleaseService;
import com.jschrj.common.PageHelper;
import com.jschrj.dao.bug.IBugDao;
import com.jschrj.dao.release.IReleaseDao;
import com.jschrj.dao.story.IStoryDao;
import com.jschrj.pojo.bug.Bug;
import com.jschrj.pojo.release.Release;
import com.jschrj.pojo.story.Story;
import com.jschrj.pojo.task.Task;
import com.jschrj.pojo.task.Taskcomplete;
import com.jschrj.pojo.test.Usecase;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

@Service
public class ReleaseServiceImpl implements ReleaseService {

    @Resource
    IReleaseDao releaseDao;

    @Resource
    IStoryDao storyDao;

    @Resource
    IBugDao bugDao;

    @Override
    public List<Release> getReleaselistByTypeReferid(Map<String, Object> param) throws Exception {

        return releaseDao.getReleaselistByTypeReferid(param);
    }

    @Override
    public List<Release> getReleaseList() throws Exception {

        return releaseDao.getReleaseList();
    }

    @Override
    public List<Taskcomplete> getReleaselistByProjectCustomer(Map<String, Object> param) throws Exception {

        return releaseDao.getReleaselistByProjectCustomer(param);
    }

    @Override
    public void tx_doRelease(List<Release> releaseList,String version,int userid,String username) throws Exception {

        for(int i=0;i<releaseList.size();i++){
            Map<String,Object> param=new HashMap<>();
            param.put("type",releaseList.get(i).getType());
            param.put("referid",releaseList.get(i).getReferid());
            param.put("id",releaseList.get(i).getId());
            //检测需求(bug)除了该客户之外，是否还有其他客户还没更新
            if(releaseDao.selectOtherRelease(param)==0){
                if(releaseList.get(i).getType()==1){
                    //更新需求状态
                    Story stroy=new Story();
                    stroy.setId(releaseList.get(i).getReferid());
                    stroy.setStatus(5);
                    storyDao.updateByPrimaryKeySelective(stroy);
                }else{
                    //更新Bug状态
                    Bug bug=new Bug();
                    bug.setId(releaseList.get(i).getReferid());
                    bug.setStatus(4);
                    bugDao.updateByPrimaryKeySelective(bug);
                }
            }
            releaseList.get(i).setStatus(2);
            releaseList.get(i).setVersion(version);
            releaseList.get(i).setUserid(userid);
            releaseList.get(i).setUsername(username);
            releaseDao.updateByPrimaryKeySelective(releaseList.get(i));
        }
    }

    @Override
    public int getReleasedCounts(Map<String, Object> param) throws Exception {

        return releaseDao.getReleasedCounts(param);
    }

    @Override
    public PageHelper<Release> getReleasedPage(PageHelper<Release> pageHelper, Map<String, Object> param) throws Exception {
        param.put("limit", pageHelper.getRowNum());
        param.put("offset", pageHelper.getRowNum()*(pageHelper.getPage()-1));
        param.put("order", pageHelper.getSidx());
        param.put("sort", pageHelper.getSord());
        List<Release> tempList=releaseDao.getReleasedPage(param);
        pageHelper.setRows(tempList);
        return pageHelper;
    }

    @Override
    public List<Release> getReleasedList(Map<String, Object> param) throws Exception {

        return releaseDao.getReleasedList(param);
    }
}
