package com.jschrj.service.test;

import com.jschrj.api.test.TestService;
import com.jschrj.common.PageHelper;
import com.jschrj.dao.test.IUsecaseDao;
import com.jschrj.dao.test.IUsecasestepDao;
import com.jschrj.pojo.story.Story;
import com.jschrj.pojo.test.Usecase;
import com.jschrj.pojo.test.Usecasestep;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;
import java.util.List;
import java.util.Map;

@Service
public class TestServiceImpl implements TestService {

    @Resource
    IUsecaseDao usecaseDao;

    @Resource
    IUsecasestepDao usecasestepDao;

    @Override
    public Usecase getUsecaseById(int id) throws Exception {
        return usecaseDao.selectByPrimaryKey(id);
    }

    @Override
    public void tx_usecase(Usecase usecase, List<Usecasestep> usecasestepList) throws Exception {
        //新增用例
        usecaseDao.insertSelective(usecase);

        //新增用例步骤
        for(int i=0;i<usecasestepList.size();i++){
            usecasestepList.get(i).setUsecaseid(usecase.getId());
            usecasestepList.get(i).setUserid(usecase.getUserid());
            usecasestepList.get(i).setUsername(usecase.getUsername());
            usecasestepDao.insertSelective(usecasestepList.get(i));
        }

    }

    @Override
    public int getUsecaseCounts(Map<String, Object> param) throws Exception {

        return usecaseDao.getUsecaseCounts(param);
    }

    @Override
    public PageHelper<Usecase> getUsecasePage(
            PageHelper<Usecase> pageHelper, Map<String, Object> param) throws Exception {
        param.put("limit", pageHelper.getRowNum());
        param.put("offset", pageHelper.getRowNum()*(pageHelper.getPage()-1));
        param.put("order", pageHelper.getSidx());
        param.put("sort", pageHelper.getSord());
        List<Usecase> tempList=usecaseDao.getUsecasePage(param);
        pageHelper.setRows(tempList);
        return pageHelper;
    }

    @Override
    public List<Usecase> getUsecaseByStoryid(int storyid) throws Exception {

        return usecaseDao.getUsecaseByStoryid(storyid);
    }

    @Override
    public List<Usecasestep> getUsecasesteplistByusecaseid(Integer usecaseid) throws Exception {

        return usecasestepDao.getUsecasesteplistByusecaseid(usecaseid);
    }

    @Override
    public void tx_updateUsecase(Usecase usecase, List<Usecasestep> usecasestepList) throws Exception {
        //更新用例信息
        usecaseDao.updateByPrimaryKeySelective(usecase);

        //删除旧的用例步骤
        usecasestepDao.deleteByUsecaseid(usecase.getId());
        //新增用例步骤
        for(int i=0;i<usecasestepList.size();i++){
            usecasestepList.get(i).setUsecaseid(usecase.getId());
            usecasestepList.get(i).setUserid(usecase.getUserid());
            usecasestepList.get(i).setUsername(usecase.getUsername());
            usecasestepDao.insertSelective(usecasestepList.get(i));
        }
    }

    @Override
    public void deleteStory(Usecase usecase) throws Exception {

        usecaseDao.updateByPrimaryKeySelective(usecase);
    }
}
