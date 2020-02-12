package com.jschrj.api.system;

import com.jschrj.common.PageHelper;
import com.jschrj.common.TreeHelper;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import com.jschrj.pojo.system.*;

public interface SystemService {

	/**********************************系统日志start******************************************/
	/**
	 * 错误日志
	 * @param log
	 */
	public void insertErrorlog(Errorlog log) throws Exception;

	/**
	 * 操作日志
	 * @param log
	 */
	public void insertOptlog(Optlog log) throws Exception;
	
	/**********************************系统日志end******************************************/
	
	/**********************************菜单管理start******************************************/
	/**
	 * 菜单总数量
	 * @param param
	 * @return
	 */
	public int getApplicationCounts(Map<String, Object> param) throws Exception;

	/**
	 * 菜单分页数据
	 * @param pageHelper
	 * @param param
	 * @return
	 */
	public PageHelper<Application> getApplicationPage(
			PageHelper<Application> pageHelper, Map<String, Object> param) throws Exception;

	/**
	 * 获取组织机构树
	 * @return
	 */
	public List<TreeHelper> getApplicationTree() throws Exception;

	/**
	 * 根据id获取组织
	 * @param id
	 * @return
	 * @throws Exception
	 */
	public Application getApplicationById(int id) throws Exception;

	/**
	 * 获取菜单集合
	 * @return
	 * @throws Exception
	 */
	public List<Application> getAppList() throws Exception;

	public void insertApplication(Application application) throws Exception;

	/**
	 * 资料更新
	 * @param organization
	 * @throws Exception
	 */
	public void updateApplication(Application application) throws Exception;

	/**
	 * 禁用组织
	 * @param organization
	 * @throws Exception
	 */
	public void deleteApplication(Application application) throws Exception;
	
	/**********************************菜单管理end******************************************/

	/**********************************组织管理start******************************************/
	/**
	 * 组织总数量
	 * @param param
	 * @return
	 */
	public int getOrgCounts(Map<String, Object> param) throws Exception;

	/**
	 * 组织分页数据
	 * @param pageHelper
	 * @param param
	 * @return
	 */
	public PageHelper<Organization> getOrgPage(
			PageHelper<Organization> pageHelper, Map<String, Object> param) throws Exception;
	
	/**
	 * 获取部门List
	 * @return
	 * @throws Exception
	 */
	public List<Organization> getOrgList() throws Exception;

	/**
	 * 获取组织机构树
	 * @param param
	 * @return
	 */
	public List<TreeHelper> getOrgTree(Map<String, Object> param) throws Exception;

	/**
	 * 获取组织机构树
	 * @param param
	 * @return
	 */
	public List<TreeHelper> getOrgUserTree() throws Exception;

	/**
	 * 根据id获取组织
	 * @param id
	 * @return
	 * @throws Exception
	 */
	public Organization getOrgById(int id) throws Exception;

	public void insertOrg(Organization organization) throws Exception;

	/**
	 * 资料更新
	 * @param organization
	 * @throws Exception
	 */
	public void updateOrg(Organization organization) throws Exception;

	/**
	 * 禁用组织
	 * @param organization
	 * @throws Exception
	 */
	public void deleteOrg(Organization organization) throws Exception;
	
	/**********************************组织管理end******************************************/
	
	/**********************************用户管理start******************************************/
	/**
	 * 用户总数量
	 * @param param
	 * @return
	 */
	public int getUserCounts(Map<String, Object> param) throws Exception;

	/**
	 * 用户分页数据
	 * @param pageHelper
	 * @param param
	 * @return
	 */
	public PageHelper<User> getUserPage(
			PageHelper<User> pageHelper, Map<String, Object> param) throws Exception;

	/**
	 * 根据id获取用户
	 * @param id
	 * @return
	 * @throws Exception
	 */
	public User getUserById(int id) throws Exception;

	/**
	 * 获取工作人员列表
	 * @return
	 * @throws Exception
	 */
	public List<User> getUserList() throws Exception;

	/**
	 * 用户新增
	 * @param organization
	 * @throws Exception
	 */
	public void insertUser(User user) throws Exception;

	/**
	 * 用户更新
	 * @param organization
	 * @throws Exception
	 */
	public void updateUser(User user) throws Exception;
	
	/**
	 * 修改用户密码
	 * @param id
	 * @param oldpassword
	 * @param newpassword
	 */
	public void updatePassword(Integer id, String oldpassword,
			String newpassword) throws Exception;

	/**
	 * 禁用用户
	 * @param organization
	 * @throws Exception
	 */
	public void deleteUser(User user) throws Exception;
	
	/**********************************用户管理end******************************************/
	
	/**********************************角色管理start******************************************/
	/**
	 * 角色总数量
	 * @param param
	 * @return
	 */
	public int getRoleCounts(Map<String, Object> param) throws Exception;

	/**
	 * 角色分页数据
	 * @param pageHelper
	 * @param param
	 * @return
	 */
	public PageHelper<Role> getRolePage(
			PageHelper<Role> pageHelper, Map<String, Object> param) throws Exception;
	
	/**
	 * 获取角色List
	 * @return
	 * @throws Exception
	 */
	public List<Role> getRoleList() throws Exception;
	
	/**
	 * 获取用户角色List
	 * @param param 
	 * @return
	 * @throws Exception
	 */
	public List<Role> getUserRoleList(Map<String, Object> param) throws Exception;

	/**
	 * 根据id获取角色
	 * @param id
	 * @return
	 * @throws Exception
	 */
	public Role getRoleById(int id) throws Exception;

	/**
	 * 新增角色
	 * @param role
	 * @throws Exception
	 */
	public void insertRole(Role role) throws Exception;

	/**
	 * 资料更新
	 * @param organization
	 * @throws Exception
	 */
	public void updateRole(Role role) throws Exception;

	/**
	 * 禁用角色
	 * @param organization
	 * @throws Exception
	 */
	public void deleteRole(Role role) throws Exception;
	
	/**********************************角色管理end******************************************/
	
	/**********************************用户角色管理end******************************************/

	public void insertUserRole(UserRole userRole, String roleids) throws Exception;
	/**********************************用户角色管理end******************************************/
	
	/**********************************角色权限管理end******************************************/

	/**
	 * 获取角色菜单List
	 * @param param 
	 * @return
	 * @throws Exception
	 */
	public List<RolePower> getRolePowerList(Map<String, Object> param) throws Exception;
	
	public void insertRolePower(RolePower rolePower, String appids) throws Exception;

    /**********************************角色权限管理end******************************************/

	void insertEmaillog(Email email) throws Exception;

	List<User> getTeammembers(int type) throws Exception;

	List<Email> getEmailList() throws Exception;

	void updateEmail(Email email) throws Exception;
}
