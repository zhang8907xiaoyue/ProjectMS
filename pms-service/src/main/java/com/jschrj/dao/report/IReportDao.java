package com.jschrj.dao.report;

import com.jschrj.pojo.report.Report;
import org.springframework.stereotype.Repository;

import java.util.List;
import java.util.Map;

@Repository
public interface IReportDao {
    int getStoryreportCounts(Map<String, Object> param) throws Exception;

    List<Report> getStoryreportPage(Map<String, Object> param) throws Exception;

    List<Report> getStoryreportList(Map<String, Object> param) throws Exception;

    int getWeekly2Counts() throws Exception;

    List<Report> getWeekly2Page(Map<String, Object> param) throws Exception;

    List<Report> getWeekly2List(Map<String, Object> param) throws Exception;

    List<Report> getToBeSortedList() throws Exception;

    List<Report> getToDevelopedList() throws Exception;

    List<Report> getBugList() throws Exception;
}
