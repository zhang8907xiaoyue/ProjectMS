package com.jschrj.api.account;

import com.jschrj.common.TreeHelper;
import com.jschrj.pojo.base.KeyAndValue;
import com.jschrj.pojo.system.Application;
import com.jschrj.pojo.system.User;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

public interface AccountService {

	/**
	 * 获取用户信息
	 * @param name 用户名
	 * @return
	 * @throws Exception
	 */
	public User selectByName(String name) throws Exception;

	/**
	 * 获取左侧菜单树
	 * @param leftMenu
	 * @param parentid
	 * @param userid
	 * @return
	 * @throws Exception
	 */
	public List<TreeHelper<Application>> getLeftMenuTree(List<TreeHelper<Application>> leftMenu, int parentid, Integer userid) throws Exception;

    List<KeyAndValue> getProjectSum(Map<String, Object> param) throws Exception;

	List<KeyAndValue> getSourceSum(Map<String, Object> param) throws Exception;

	KeyAndValue getGkCounts(int userid) throws Exception;
}
