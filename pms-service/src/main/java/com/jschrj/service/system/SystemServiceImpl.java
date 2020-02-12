package com.jschrj.service.system;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import com.jschrj.api.system.SystemService;
import com.jschrj.dao.system.*;
import com.jschrj.pojo.system.*;
import org.springframework.stereotype.Service;

import com.jschrj.common.PageHelper;
import com.jschrj.common.TreeHelper;

@Service
public class SystemServiceImpl implements SystemService {

	@Resource
	IErrorlogDao errorlogDao;
	
	@Resource
	IOptlogDao optlogDao;
	
	@Resource
	IApplicationDao applicationDao;
	
	@Resource
	IOrganizationDao organizationDao;

	@Resource
	IUserDao userDao;

	@Resource
	IRoleDao roleDao;
	
	@Resource
	IUserRoleDao userRoleDao;

	@Resource
	IRolePowerDao rolePowerDao;

	@Resource
	IEmailDao emailDao;
	
	/**********************************系统日志start******************************************/
	/**
	 * 错误日志
	 * @param log
	 */
	@Override
	public void insertErrorlog(Errorlog log) throws Exception {
		
		errorlogDao.insertSelective(log);
	}

	/**
	 * 操作日志
	 * @param log
	 */
	@Override
	public void insertOptlog(Optlog log) throws Exception {
		
		optlogDao.insertSelective(log);
	}
	
	/**********************************系统日志end******************************************/
	
	/**********************************菜单管理start******************************************/
	/**
	 * 菜单总数量
	 * @param param
	 * @return
	 */
	@Override
	public int getApplicationCounts(Map<String, Object> param) throws Exception {
		
		return applicationDao.getApplicationCounts(param);
	}

	/**
	 * 菜单分页数据
	 * @param pageHelper
	 * @param param
	 * @return
	 */
	@Override
	public PageHelper<Application> getApplicationPage(
			PageHelper<Application> pageHelper, Map<String, Object> param) throws Exception {
		param.put("limit", pageHelper.getRowNum());
		param.put("offset", pageHelper.getRowNum()*(pageHelper.getPage()-1));
		param.put("order", pageHelper.getSidx());
		param.put("sort", pageHelper.getSord());
		List<Application> tempList=applicationDao.getApplicationPage(param);
		pageHelper.setRows(tempList);
		return pageHelper;
	}

	/**
	 * 获取组织机构树
	 * @return
	 */
	@Override
	public List<TreeHelper> getApplicationTree() throws Exception {
		
		return applicationDao.getApplicationTree();
	}

	/**
	 * 根据id获取组织
	 * @param id
	 * @return
	 * @throws Exception
	 */
	@Override
	public Application getApplicationById(int id) throws Exception {
		
		return applicationDao.selectByPrimaryKey(id);
	}

	/**
	 * 获取菜单集合
	 * @return
	 * @throws Exception
	 */
	@Override
	public List<Application> getAppList() throws Exception {
		
		return applicationDao.getAppList();
	}

	@Override
	public void insertApplication(Application application) throws Exception {
		
		applicationDao.insertSelective(application);
	}

	/**
	 * 资料更新
	 * @param organization
	 * @throws Exception
	 */
	@Override
	public void updateApplication(Application application) throws Exception {
		
		applicationDao.updateByPrimaryKeySelective(application);
	}

	/**
	 * 禁用组织
	 * @param organization
	 * @throws Exception
	 */
	@Override
	public void deleteApplication(Application application) throws Exception {
		
		applicationDao.updateByPrimaryKeySelective(application);
	}
	
	/**********************************菜单管理end******************************************/

	/**********************************组织管理start******************************************/
	/**
	 * 组织总数量
	 * @param param
	 * @return
	 */
	@Override
	public int getOrgCounts(Map<String, Object> param) throws Exception {
		
		return organizationDao.getOrgCounts(param);
	}

	/**
	 * 组织分页数据
	 * @param pageHelper
	 * @param param
	 * @return
	 */
	@Override
	public PageHelper<Organization> getOrgPage(
			PageHelper<Organization> pageHelper, Map<String, Object> param) throws Exception {
		param.put("limit", pageHelper.getRowNum());
		param.put("offset", pageHelper.getRowNum()*(pageHelper.getPage()-1));
		param.put("order", pageHelper.getSidx());
		param.put("sort", pageHelper.getSord());
		List<Organization> tempList=organizationDao.getOrgPage(param);
		pageHelper.setRows(tempList);
		return pageHelper;
	}
	
	/**
	 * 获取部门List
	 * @return
	 * @throws Exception
	 */

	@Override
	public List<Organization> getOrgList() throws Exception {
		
		return organizationDao.getOrgList();
	}

	/**
	 * 获取组织机构树
	 * @param param
	 * @return
	 */
	@Override
	public List<TreeHelper> getOrgTree(Map<String, Object> param) throws Exception {
		
		return organizationDao.getOrgTree(param);
	}

	@Override
	public List<TreeHelper> getOrgUserTree() throws Exception {

		return userDao.getOrgUserTree();
	}

	/**
	 * 根据id获取组织
	 * @param id
	 * @return
	 * @throws Exception
	 */
	@Override
	public Organization getOrgById(int id) throws Exception {
		
		return organizationDao.selectByPrimaryKey(id);
	}

	@Override
	public void insertOrg(Organization organization) throws Exception {
		
		//判断机构名称是否已经存在
		List<Organization> isExists=organizationDao.getOrgByName(organization.getName());
		if(isExists.size()>0){
			throw new Exception("组织："+organization.getName()+"已经存在，不可以重复添加！");
		}else{
			organizationDao.insertSelective(organization);
		}
	}

	/**
	 * 资料更新
	 * @param organization
	 * @throws Exception
	 */
	@Override
	public void updateOrg(Organization organization) throws Exception {
		
		// 判断机构名称是否已经存在
		Map<String, Object> param=new HashMap<String, Object>();
		param.put("id", organization.getId());
		param.put("name", organization.getName());
		List<Organization> isExists = organizationDao.getOrgByNameExceptId(param);
		if (isExists.size()>0) {
			throw new Exception("组织：" + organization.getName()
					+ "已经存在！");
		} else {
			organizationDao.updateByPrimaryKeySelective(organization);
		}
	}

	/**
	 * 禁用组织
	 * @param organization
	 * @throws Exception
	 */
	@Override
	public void deleteOrg(Organization organization) throws Exception {
		
		organizationDao.updateByPrimaryKeySelective(organization);
	}
	
	/**********************************组织管理end******************************************/
	
	/**********************************用户管理start******************************************/
	/**
	 * 用户总数量
	 * @param param
	 * @return
	 */
	@Override
	public int getUserCounts(Map<String, Object> param) throws Exception {
		
		return userDao.getUserCounts(param);
	}

	/**
	 * 用户分页数据
	 * @param pageHelper
	 * @param param
	 * @return
	 */
	@Override
	public PageHelper<User> getUserPage(
			PageHelper<User> pageHelper, Map<String, Object> param) throws Exception {
		param.put("limit", pageHelper.getRowNum());
		param.put("offset", pageHelper.getRowNum()*(pageHelper.getPage()-1));
		param.put("order", pageHelper.getSidx());
		param.put("sort", pageHelper.getSord());
		List<User> tempList=userDao.getUserPage(param);
		pageHelper.setRows(tempList);
		return pageHelper;
	}

	/**
	 * 根据id获取用户
	 * @param id
	 * @return
	 * @throws Exception
	 */
	@Override
	public User getUserById(int id) throws Exception {
		
		return userDao.selectByPrimaryKey(id);
	}

	/**
	 * 获取工作人员
	 * @return
	 */
	@Override
	public List<User> getUserList() throws Exception {

		return userDao.getUserList();
	}

	/**
	 * 用户新增
	 * @throws Exception
	 */
	@Override
	public void insertUser(User user) throws Exception {
		
		//判断登录名已经存在
		List<User> isExists=userDao.getUserByName(user.getName());
		if(isExists.size()>0){
			throw new Exception("登录名："+user.getName()+"已经存在！");
		}
		
		userDao.insertSelective(user);
	}

	/**
	 * 用户更新
	 * @throws Exception
	 */
	@Override
	public void updateUser(User user) throws Exception {
		
		// 判断用户名称是否已经存在
		Map<String, Object> param=new HashMap<String, Object>();
		param.put("id", user.getId());
		param.put("name", user.getName());
		List<User> isExists = userDao.getUserByNameExceptId(param);
		if (isExists.size()>0) {
			throw new Exception("登录名：" + user.getName()
					+ "已经存在！");
		} else {
			userDao.updateByPrimaryKeySelective(user);
		}
	}
	
	/**
	 * 修改用户密码
	 * @param id
	 * @param oldpassword
	 * @param newpassword
	 */
	@Override
	public void updatePassword(Integer id, String oldpassword,
			String newpassword) throws Exception {
		
		User user=userDao.selectByPrimaryKey(id);
		System.out.println(user.getPassword());
		System.out.println(oldpassword);
		if(!oldpassword.equals(user.getPassword())){
			throw new Exception("输入的旧密码错误，请确认后重新输入!");
		}else{
			User newPasswrod=new User();
			newPasswrod.setId(id);
			newPasswrod.setPassword(newpassword);
			userDao.updateByPrimaryKeySelective(newPasswrod);
		}
	}

	/**
	 * 禁用用户
	 * @param organization
	 * @throws Exception
	 */
	@Override
	public void deleteUser(User user) throws Exception {
		
		userDao.updateByPrimaryKeySelective(user);
	}
	
	/**********************************用户管理end******************************************/
	
	/**********************************角色管理start******************************************/
	/**
	 * 角色总数量
	 * @param param
	 * @return
	 */
	@Override
	public int getRoleCounts(Map<String, Object> param) throws Exception {
		
		return roleDao.getRoleCounts(param);
	}

	/**
	 * 角色分页数据
	 * @param pageHelper
	 * @param param
	 * @return
	 */
	@Override
	public PageHelper<Role> getRolePage(
			PageHelper<Role> pageHelper, Map<String, Object> param) throws Exception {
		param.put("limit", pageHelper.getRowNum());
		param.put("offset", pageHelper.getRowNum()*(pageHelper.getPage()-1));
		param.put("order", pageHelper.getSidx());
		param.put("sort", pageHelper.getSord());
		List<Role> tempList=roleDao.getRolePage(param);
		pageHelper.setRows(tempList);
		return pageHelper;
	}
	
	/**
	 * 获取角色List
	 * @return
	 * @throws Exception
	 */
	@Override
	public List<Role> getRoleList() throws Exception {
		
		return roleDao.getRoleList();
	}
	
	/**
	 * 获取用户角色List
	 * @param param 
	 * @return
	 * @throws Exception
	 */

	@Override
	public List<Role> getUserRoleList(Map<String, Object> param) throws Exception {
		
		return roleDao.getUserRoleList(param);
	}

	/**
	 * 根据id获取角色
	 * @param id
	 * @return
	 * @throws Exception
	 */
	@Override
	public Role getRoleById(int id) throws Exception {
		
		return roleDao.selectByPrimaryKey(id);
	}

	/**
	 * 新增角色
	 * @param role
	 * @throws Exception
	 */
	@Override
	public void insertRole(Role role) throws Exception {
		
		roleDao.insertSelective(role);
	}

	/**
	 * 资料更新
	 * @param organization
	 * @throws Exception
	 */
	@Override
	public void updateRole(Role role) throws Exception {
		
		roleDao.updateByPrimaryKeySelective(role);
	}

	/**
	 * 禁用角色
	 * @param organization
	 * @throws Exception
	 */
	@Override
	public void deleteRole(Role role) throws Exception {
		
		roleDao.updateByPrimaryKeySelective(role);
	}
	
	/**********************************角色管理end******************************************/
	
	/**********************************用户角色管理end******************************************/

	@Override
	public void insertUserRole(UserRole userRole, String roleids) throws Exception {
		
		userRoleDao.deleteByUserid(userRole.getUserid());
		String[] idArray = roleids.split(",");
		for(int i=0;i<idArray.length;i++){
			if(!"".equals(idArray[i])){
				userRole.setRoleid(Integer.parseInt(idArray[i]));
				userRoleDao.insertSelective(userRole);
			}
		}
	}
	/**********************************用户角色管理end******************************************/
	
	/**********************************角色权限管理end******************************************/

	/**
	 * 获取角色菜单List
	 * @param param 
	 * @return
	 * @throws Exception
	 */
	@Override
	public List<RolePower> getRolePowerList(Map<String, Object> param) throws Exception {
		
		return rolePowerDao.getRolePowerList(param);
	}

	@Override
	public void insertRolePower(RolePower rolePower, String appids) throws Exception {
		
		rolePowerDao.deleteByRoleid(rolePower.getRoleid());
		String[] idArray = appids.split(",");
		for(int i=0;i<idArray.length;i++){
			if(!"".equals(idArray[i])){
				rolePower.setAppid(Integer.parseInt(idArray[i]));
				rolePowerDao.insertSelective(rolePower);
			}
		}
	}
	/**********************************角色权限管理end******************************************/


	@Override
	public void insertEmaillog(Email email) throws Exception {
		emailDao.insertSelective(email);
	}

	@Override
	public List<User> getTeammembers(int type) throws Exception {
		return userDao.getTeammembers(type);
	}

	@Override
	public List<Email> getEmailList() throws Exception {
		return emailDao.getEmailList();
	}

	@Override
	public void updateEmail(Email email) throws Exception {
		emailDao.updateByPrimaryKeySelective(email);
	}
}
