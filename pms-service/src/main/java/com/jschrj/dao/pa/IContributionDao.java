package com.jschrj.dao.pa;

import com.jschrj.pojo.pa.Contribution;

import java.util.List;
import java.util.Map;

public interface IContributionDao {
    int deleteByPrimaryKey(Integer id);

    int insert(Contribution record);

    int insertSelective(Contribution record) throws Exception;

    Contribution selectByPrimaryKey(Integer id);

    int updateByPrimaryKeySelective(Contribution record) throws Exception;

    int updateByPrimaryKeyWithBLOBs(Contribution record);

    int updateByPrimaryKey(Contribution record);

    int getContributionCounts(Map<String, Object> param) throws Exception;

    List<Contribution> getContributionPage(Map<String, Object> param) throws Exception;
}