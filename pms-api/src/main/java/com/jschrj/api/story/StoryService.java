package com.jschrj.api.story;

import com.jschrj.common.PageHelper;
import com.jschrj.pojo.release.Release;
import com.jschrj.pojo.story.Story;
import com.jschrj.pojo.test.Usecase;
import com.jschrj.pojo.test.Usecasestep;

import java.util.List;
import java.util.Map;

public interface StoryService {

	/**********************************待指派start******************************************/
	/**
	 * 需求总数量
	 * @param param
	 * @return
	 */
	public int getStoryCounts(Map<String, Object> param) throws Exception;

	/**
	 * 需求分页数据
	 * @param pageHelper
	 * @param param
	 * @return
	 */
	public PageHelper<Story> getStoryPage(
			PageHelper<Story> pageHelper, Map<String, Object> param) throws Exception;

	/**
	 * 根据id获取需求
	 * @param id
	 * @return
	 * @throws Exception
	 */
	public Story getStoryById(int id) throws Exception;

	/**
	 * 新增需求
	 * @param
	 * @throws Exception
	 */
	public void tx_insertStory(Story story,List<Release> releaseList) throws Exception;

	/**
	 * 资料更新
	 * @param
	 * @throws Exception
	 */
	public void tx_updateStory(Story story,List<Release> releaseList) throws Exception;

	/**
	 * 删除需求
	 * @param
	 * @throws Exception
	 */
	public void deleteStory(Story story) throws Exception;

	void updateStoryNext(Story story) throws Exception;

    /**********************************待指派end******************************************/

	int getTotestCounts(Map<String, Object> param) throws Exception;

	PageHelper<Story> getTotestPage(PageHelper<Story> pageHelper, Map<String, Object> param) throws Exception;
}
