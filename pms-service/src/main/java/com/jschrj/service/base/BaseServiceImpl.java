package com.jschrj.service.base;

import com.jschrj.api.base.BaseService;
import com.jschrj.common.PageHelper;
import com.jschrj.dao.base.*;
import com.jschrj.pojo.base.Modular;
import com.jschrj.pojo.base.Project;
import com.jschrj.pojo.base.Customer;
import com.jschrj.pojo.base.Source;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;
import java.util.Map;

@Service
public class BaseServiceImpl implements BaseService {

	@Resource
	IProjectDao projectDao;

	@Resource
	ISourceDao sourceDao;

	@Resource
	IModularDao modularDao;

	@Resource
	IFilesidDao filesidDao;

	@Resource
	ICustomerDao projectcustomerDao;

	@Override
	public List<Project> getProjectList() throws Exception {

		return projectDao.getProjectList();
	}

	@Override
	public List<Source> getSourceList() throws Exception {

		return sourceDao.getSourceList();
	}

	@Override
	public List<Modular> getModularList(Map<String,Object> param) throws Exception {

		return modularDao.getModularList(param);
	}

	/**
	 * 获取附件编号
	 * @return
	 * @throws Exception
	 */
	public String tx_getFilesId() throws Exception {
		String lastRequestDate=filesidDao.getLastRequestDate();
		Date now = new Date();
		SimpleDateFormat formatter = new SimpleDateFormat("yyyyMMdd");
		String nowDate = formatter.format(now);
		if(lastRequestDate==null||lastRequestDate==""){
			//没有资料新增
			filesidDao.insert();
		} else if(lastRequestDate.equals(nowDate)){
			//时间在今天，继续+1
			filesidDao.added();
		} else{
			//时间是新的一天，重新重1开始
			filesidDao.newDay();
		}
		int serialnum=filesidDao.getId();
		return "FILES_"+nowDate+String.format("%04d",serialnum);
	}

	@Override
	public List<Customer> getProjectcustomerList(int projectid) throws Exception {

		return projectcustomerDao.getProjectcustomerList(projectid);
	}

	@Override
	public Project getProjectById(int id) throws Exception {
		return projectDao.selectByPrimaryKey(id);
	}

	@Override
	public int getProjectCounts(Map<String, Object> param) throws Exception {
		return projectDao.getProjectCounts(param);
	}

	@Override
	public PageHelper<Project> getProjectPage(PageHelper<Project> pageHelper, Map<String, Object> param) throws Exception {
		param.put("limit", pageHelper.getRowNum());
		param.put("offset", pageHelper.getRowNum()*(pageHelper.getPage()-1));
		param.put("order", pageHelper.getSidx());
		param.put("sort", pageHelper.getSord());
		List<Project> tempList=projectDao.getProjectPage(param);
		pageHelper.setRows(tempList);
		return pageHelper;
	}

	@Override
	public void insertProject(Project project) throws Exception {

		projectDao.insertSelective(project);
	}

	@Override
	public void updateProject(Project project) throws Exception {

		projectDao.updateByPrimaryKeySelective(project);
	}

	@Override
	public Source getSourceById(int id) throws Exception {
		return sourceDao.selectByPrimaryKey(id);
	}

	@Override
	public int getSourceCounts(Map<String, Object> param) throws Exception {
		return sourceDao.getSourceCounts(param);
	}

	@Override
	public PageHelper<Source> getSourcePage(PageHelper<Source> pageHelper, Map<String, Object> param) throws Exception {
		param.put("limit", pageHelper.getRowNum());
		param.put("offset", pageHelper.getRowNum()*(pageHelper.getPage()-1));
		param.put("order", pageHelper.getSidx());
		param.put("sort", pageHelper.getSord());
		List<Source> tempList=sourceDao.getSourcePage(param);
		pageHelper.setRows(tempList);
		return pageHelper;
	}

	@Override
	public void insertSource(Source source) throws Exception {
		sourceDao.insertSelective(source);
	}

	@Override
	public void updateSource(Source source) throws Exception {
		sourceDao.updateByPrimaryKeySelective(source);
	}

	@Override
	public Modular getModularById(int id) throws Exception {
		return modularDao.selectByPrimaryKey(id);
	}

	@Override
	public int getModularCounts(Map<String, Object> param) throws Exception {
		return modularDao.getModularCounts(param);
	}

	@Override
	public PageHelper<Modular> getModularPage(PageHelper<Modular> pageHelper, Map<String, Object> param) throws Exception {
		param.put("limit", pageHelper.getRowNum());
		param.put("offset", pageHelper.getRowNum()*(pageHelper.getPage()-1));
		param.put("order", pageHelper.getSidx());
		param.put("sort", pageHelper.getSord());
		List<Modular> tempList=modularDao.getModularPage(param);
		pageHelper.setRows(tempList);
		return pageHelper;
	}

	@Override
	public void insertModular(Modular modular) throws Exception {
		modularDao.insertSelective(modular);
	}

	@Override
	public void updateModular(Modular modular) throws Exception {
		modularDao.updateByPrimaryKeySelective(modular);
	}

	@Override
	public Customer getCustomerById(int id) throws Exception {
		return projectcustomerDao.selectByPrimaryKey(id);
	}

	@Override
	public int getCustomerCounts(Map<String, Object> param) throws Exception {
		return projectcustomerDao.getCustomerCounts(param);
	}

	@Override
	public PageHelper<Customer> getCustomerPage(PageHelper<Customer> pageHelper, Map<String, Object> param) throws Exception {
		param.put("limit", pageHelper.getRowNum());
		param.put("offset", pageHelper.getRowNum()*(pageHelper.getPage()-1));
		param.put("order", pageHelper.getSidx());
		param.put("sort", pageHelper.getSord());
		List<Customer> tempList=projectcustomerDao.getCustomerPage(param);
		pageHelper.setRows(tempList);
		return pageHelper;
	}

	@Override
	public void insertCustomer(Customer customer) throws Exception {
		projectcustomerDao.insertSelective(customer);
	}

	@Override
	public void updateCustomer(Customer customer) throws Exception {
		projectcustomerDao.updateByPrimaryKeySelective(customer);
	}

}
