package com.jschrj.service.account;

import com.jschrj.api.account.AccountService;
import com.jschrj.common.TreeHelper;
import com.jschrj.dao.story.IStoryDao;
import com.jschrj.dao.system.IApplicationDao;
import com.jschrj.dao.system.IUserDao;
import com.jschrj.pojo.base.KeyAndValue;
import com.jschrj.pojo.system.Application;
import com.jschrj.pojo.system.User;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

@Service
public class AccountServiceImpl implements AccountService {
	
	@Resource
	IUserDao userMapper;
	
	@Resource
	IApplicationDao applicationDao;

	@Resource
	IStoryDao storyDao;
	
	/**
	 * 获取用户信息
	 * @param name 用户名
	 * @return
	 * @throws Exception
	 */
	@Override
	public User selectByName(String name) throws Exception {
		
		User user=userMapper.selectByName(name.trim());
		return user;
	}

	/**
	 * 获取左侧菜单树
	 * @param leftMenu
	 * @param parentid
	 * @param userid 
	 * @return
	 * @throws Exception
	 */
	@Override
	public List<TreeHelper<Application>> getLeftMenuTree(List<TreeHelper<Application>> leftMenu, int parentid, Integer userid) throws Exception {
		Map<String, Object> param=new HashMap<String, Object>();
		param.put("parentid", parentid);
		param.put("userid", userid);
		leftMenu=applicationDao.getLeftMenuTree(param);
		return leftMenu;
	}

	@Override
	public List<KeyAndValue> getProjectSum(Map<String, Object> param) throws Exception {

		return storyDao.getProjectSum(param);
	}

	@Override
	public List<KeyAndValue> getSourceSum(Map<String, Object> param) throws Exception {
		return storyDao.getSourceSum(param);
	}

	@Override
	public KeyAndValue getGkCounts(int userid) throws Exception {
		return storyDao.getGkCounts(userid);
	}

}
