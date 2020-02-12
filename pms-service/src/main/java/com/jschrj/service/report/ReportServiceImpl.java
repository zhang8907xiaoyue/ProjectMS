package com.jschrj.service.report;

import com.jschrj.api.report.ReportService;
import com.jschrj.common.PageHelper;
import com.jschrj.dao.report.IReportDao;
import com.jschrj.pojo.report.Report;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;
import java.util.Map;

@Service
public class ReportServiceImpl implements ReportService {

    @Autowired
    IReportDao reportDao;

    @Override
    public int getStoryreportCounts(Map<String, Object> param) throws Exception {
        return reportDao.getStoryreportCounts(param);
    }

    @Override
    public PageHelper<Report> getStoryreportPage(PageHelper<Report> pageHelper, Map<String, Object> param) throws Exception {
        param.put("limit", pageHelper.getRowNum());
        param.put("offset", pageHelper.getRowNum()*(pageHelper.getPage()-1));
        param.put("order", pageHelper.getSidx());
        param.put("sort", pageHelper.getSord());
        List<Report> tempList=reportDao.getStoryreportPage(param);
        pageHelper.setRows(tempList);
        return pageHelper;
    }

    @Override
    public List<Report> getStoryreportList(Map<String, Object> param) throws Exception {
        return reportDao.getStoryreportList(param);
    }

    @Override
    public int getWeekly2Counts(Map<String, Object> param) throws Exception {
        return reportDao.getWeekly2Counts();
    }

    @Override
    public PageHelper<Report> getWeekly2Page(PageHelper<Report> pageHelper, Map<String, Object> param) throws Exception {
        param.put("limit", pageHelper.getRowNum());
        param.put("offset", pageHelper.getRowNum()*(pageHelper.getPage()-1));
        param.put("order", pageHelper.getSidx());
        param.put("sort", pageHelper.getSord());
        List<Report> tempList=reportDao.getWeekly2Page(param);
        pageHelper.setRows(tempList);
        return pageHelper;
    }

    @Override
    public List<Report> getWeekly2List(Map<String, Object> param) throws Exception {
        return reportDao.getWeekly2List(param);
    }

    @Override
    public List<Report> getToBeSortedList() throws Exception {
        return reportDao.getToBeSortedList();
    }

    @Override
    public List<Report> getToDevelopedList() throws Exception {
        return reportDao.getToDevelopedList();
    }

    @Override
    public List<Report> getBugList() throws Exception {
        return reportDao.getBugList();
    }
}
