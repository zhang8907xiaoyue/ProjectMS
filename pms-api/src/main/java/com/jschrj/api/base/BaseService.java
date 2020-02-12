package com.jschrj.api.base;

import com.jschrj.common.PageHelper;
import com.jschrj.pojo.base.Modular;
import com.jschrj.pojo.base.Project;
import com.jschrj.pojo.base.Customer;
import com.jschrj.pojo.base.Source;

import java.util.List;
import java.util.Map;

public interface BaseService {

	public List<Project> getProjectList() throws Exception;

	public List<Source> getSourceList() throws Exception;

	public List<Modular> getModularList(Map<String,Object> param) throws Exception;

	public String tx_getFilesId() throws Exception;

    List<Customer> getProjectcustomerList(int projectid) throws Exception;

    Project getProjectById(int id) throws Exception;

	int getProjectCounts(Map<String, Object> param) throws Exception;

	PageHelper<Project> getProjectPage(PageHelper<Project> pageHelper, Map<String, Object> param) throws Exception;

	void insertProject(Project project) throws Exception;

	void updateProject(Project project) throws Exception;

	Source getSourceById(int id) throws Exception;

	int getSourceCounts(Map<String, Object> param) throws Exception;

	PageHelper<Source> getSourcePage(PageHelper<Source> pageHelper, Map<String, Object> param) throws Exception;

	void insertSource(Source source) throws Exception;

	void updateSource(Source source) throws Exception;

	Modular getModularById(int id) throws Exception;

	int getModularCounts(Map<String, Object> param) throws Exception;

	PageHelper<Modular> getModularPage(PageHelper<Modular> pageHelper, Map<String, Object> param) throws Exception;

	void insertModular(Modular modular) throws Exception;

	void updateModular(Modular modular) throws Exception;

    Customer getCustomerById(int id) throws Exception;

	int getCustomerCounts(Map<String, Object> param) throws Exception;

	PageHelper<Customer> getCustomerPage(PageHelper<Customer> pageHelper, Map<String, Object> param) throws Exception;

	void insertCustomer(Customer customer) throws Exception;

	void updateCustomer(Customer customer) throws Exception;
}
