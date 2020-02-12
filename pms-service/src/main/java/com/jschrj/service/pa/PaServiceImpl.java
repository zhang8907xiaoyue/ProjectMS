package com.jschrj.service.pa;

import com.jschrj.api.pa.PaService;
import com.jschrj.common.PageHelper;
import com.jschrj.dao.pa.IContributionDao;
import com.jschrj.dao.pa.IFaultDao;
import com.jschrj.dao.pa.IMonthbestDao;
import com.jschrj.pojo.pa.Contribution;
import com.jschrj.pojo.pa.Fault;
import com.jschrj.pojo.pa.Monthbest;
import com.jschrj.pojo.report.Report;
import com.jschrj.pojo.story.Story;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;
import java.util.List;
import java.util.Map;

@Service
public class PaServiceImpl implements PaService {

    @Resource
    IFaultDao faultDao;

    @Resource
    IContributionDao contributionDao;

    @Resource
    IMonthbestDao monthbestDao;

    @Override
    public Fault getFaultById(int id) throws Exception {
        return faultDao.selectByPrimaryKey(id);
    }

    @Override
    public int getFaultCounts(Map<String, Object> param) throws Exception {
        return faultDao.getFaultCounts(param);
    }

    @Override
    public PageHelper<Fault> getFaultPage(PageHelper<Fault> pageHelper, Map<String, Object> param) throws Exception {
        param.put("limit", pageHelper.getRowNum());
        param.put("offset", pageHelper.getRowNum()*(pageHelper.getPage()-1));
        param.put("order", pageHelper.getSidx());
        param.put("sort", pageHelper.getSord());
        List<Fault> tempList=faultDao.getFaultPage(param);
        pageHelper.setRows(tempList);
        return pageHelper;
    }

    @Override
    public void tx_insertFault(Fault fault) throws Exception {
        faultDao.insertSelective(fault);
    }

    @Override
    public void tx_updateFault(Fault fault) throws Exception {
        faultDao.updateByPrimaryKeySelective(fault);
    }

    @Override
    public void deleteFault(Fault fault) throws Exception {
        faultDao.updateByPrimaryKeySelective(fault);
    }

    @Override
    public Contribution getContributionById(int id) throws Exception {
        return contributionDao.selectByPrimaryKey(id);
    }

    @Override
    public int getContributionCounts(Map<String, Object> param) throws Exception {
        return contributionDao.getContributionCounts(param);
    }

    @Override
    public PageHelper<Contribution> getContributionPage(PageHelper<Contribution> pageHelper, Map<String, Object> param) throws Exception {
        param.put("limit", pageHelper.getRowNum());
        param.put("offset", pageHelper.getRowNum()*(pageHelper.getPage()-1));
        param.put("order", pageHelper.getSidx());
        param.put("sort", pageHelper.getSord());
        List<Contribution> tempList=contributionDao.getContributionPage(param);
        pageHelper.setRows(tempList);
        return pageHelper;
    }

    @Override
    public void tx_insertContribution(Contribution contribution) throws Exception {
        contributionDao.insertSelective(contribution);
    }

    @Override
    public void tx_updateContribution(Contribution contribution) throws Exception {
        contributionDao.updateByPrimaryKeySelective(contribution);
    }

    @Override
    public void deleteContribution(Contribution contribution) throws Exception {
        contributionDao.updateByPrimaryKeySelective(contribution);
    }

    @Override
    public Monthbest getMonthbestById(int id) throws Exception {
        return monthbestDao.selectByPrimaryKey(id);
    }

    @Override
    public int getMonthbestCounts(Map<String, Object> param) throws Exception {
        return monthbestDao.getMonthbestCounts(param);
    }

    @Override
    public PageHelper<Monthbest> getMonthbestPage(PageHelper<Monthbest> pageHelper, Map<String, Object> param) throws Exception {
        param.put("limit", pageHelper.getRowNum());
        param.put("offset", pageHelper.getRowNum()*(pageHelper.getPage()-1));
        param.put("order", pageHelper.getSidx());
        param.put("sort", pageHelper.getSord());
        List<Monthbest> tempList=monthbestDao.getMonthbestPage(param);
        pageHelper.setRows(tempList);
        return pageHelper;
    }

    @Override
    public void tx_insertMonthbest(Monthbest monthbest) throws Exception {
        monthbestDao.insertSelective(monthbest);
    }

    @Override
    public void tx_updateMonthbest(Monthbest monthbest) throws Exception {
        monthbestDao.updateByPrimaryKeySelective(monthbest);
    }

    @Override
    public void deleteMonthbest(Monthbest monthbest) throws Exception {
        monthbestDao.updateByPrimaryKeySelective(monthbest);
    }

    @Override
    public List<Report> getPainfoList(Map<String, Object> param) throws Exception {
        return monthbestDao.getPainfoList(param);
    }
}
