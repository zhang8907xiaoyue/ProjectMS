package com.jschrj.dao.base;

import com.jschrj.pojo.base.Customer;

import java.util.List;
import java.util.Map;

public interface ICustomerDao {
    int deleteByPrimaryKey(Integer id) throws Exception;

    int insert(Customer record) throws Exception;

    int insertSelective(Customer record) throws Exception;

    Customer selectByPrimaryKey(Integer id) throws Exception;

    int updateByPrimaryKeySelective(Customer record) throws Exception;

    int updateByPrimaryKey(Customer record) throws Exception;

    List<Customer> getProjectcustomerList(int projectid) throws Exception;

    int getCustomerCounts(Map<String, Object> param) throws Exception;

    List<Customer> getCustomerPage(Map<String, Object> param) throws Exception;
}