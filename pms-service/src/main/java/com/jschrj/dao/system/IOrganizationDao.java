package com.jschrj.dao.system;

import com.jschrj.common.TreeHelper;
import com.jschrj.pojo.system.Organization;

import java.util.List;
import java.util.Map;

public interface IOrganizationDao {
    int deleteByPrimaryKey(Integer id);

    int insert(Organization record);

    int insertSelective(Organization record);

    Organization selectByPrimaryKey(Integer id);

    int updateByPrimaryKeySelective(Organization record);

    int updateByPrimaryKey(Organization record) throws Exception;
    /**
     * 组织总数量
     * @param param
     * @return
     */
	int getOrgCounts(Map<String, Object> param) throws Exception;
	/**
	 * 组织分页数据
	 * @param param
	 * @return
	 */
	List<Organization> getOrgPage(Map<String, Object> param) throws Exception;

	List<TreeHelper> getOrgTree(Map<String, Object> param) throws Exception;

	List<Organization> getOrgByName(String name) throws Exception;

	List<Organization> getOrgByNameExceptId(Map<String, Object> param) throws Exception;

	List<Organization> getOrgList() throws Exception;
}