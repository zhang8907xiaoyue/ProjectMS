package com.jschrj.api.report;

import com.jschrj.common.PageHelper;
import com.jschrj.pojo.report.Report;

import java.util.List;
import java.util.Map;

public interface ReportService {
    int getStoryreportCounts(Map<String, Object> param) throws Exception;

    PageHelper<Report> getStoryreportPage(PageHelper<Report> pageHelper, Map<String, Object> param) throws Exception;

    List<Report> getStoryreportList(Map<String, Object> param) throws Exception;

    int getWeekly2Counts(Map<String, Object> param) throws Exception;

    PageHelper<Report> getWeekly2Page(PageHelper<Report> pageHelper, Map<String, Object> param) throws Exception;

    List<Report> getWeekly2List(Map<String, Object> param) throws Exception;

    List<Report> getToBeSortedList() throws Exception;

    List<Report> getToDevelopedList() throws Exception;

    List<Report> getBugList() throws Exception;
}
