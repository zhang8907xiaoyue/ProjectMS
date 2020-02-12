package com.jschrj.api.pa;

import com.jschrj.common.PageHelper;
import com.jschrj.pojo.pa.Contribution;
import com.jschrj.pojo.pa.Fault;
import com.jschrj.pojo.pa.Monthbest;
import com.jschrj.pojo.report.Report;
import com.jschrj.pojo.story.Story;

import java.util.List;
import java.util.Map;

public interface PaService {

    Fault getFaultById(int id) throws Exception;

    int getFaultCounts(Map<String, Object> param) throws Exception;

    PageHelper<Fault> getFaultPage(PageHelper<Fault> pageHelper, Map<String, Object> param) throws Exception;

    void tx_insertFault(Fault fault) throws Exception;

    void tx_updateFault(Fault fault) throws Exception;

    void deleteFault(Fault fault) throws Exception;

    Contribution getContributionById(int id) throws Exception;

    int getContributionCounts(Map<String, Object> param) throws Exception;

    PageHelper<Contribution> getContributionPage(PageHelper<Contribution> pageHelper, Map<String, Object> param) throws Exception;

    void tx_insertContribution(Contribution contribution) throws Exception;

    void tx_updateContribution(Contribution contribution) throws Exception;

    void deleteContribution(Contribution contribution) throws Exception;

    Monthbest getMonthbestById(int id) throws Exception;

    int getMonthbestCounts(Map<String, Object> param) throws Exception;

    PageHelper<Monthbest> getMonthbestPage(PageHelper<Monthbest> pageHelper, Map<String, Object> param) throws Exception;

    void tx_insertMonthbest(Monthbest monthbest) throws Exception;

    void tx_updateMonthbest(Monthbest monthbest) throws Exception;

    void deleteMonthbest(Monthbest monthbest) throws Exception;

    List<Report> getPainfoList(Map<String, Object> param) throws Exception;
}
