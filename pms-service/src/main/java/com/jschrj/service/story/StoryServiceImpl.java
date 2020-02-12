package com.jschrj.service.story;

import com.jschrj.api.story.StoryService;
import com.jschrj.common.PageHelper;
import com.jschrj.dao.release.IReleaseDao;
import com.jschrj.dao.story.IStoryDao;
import com.jschrj.pojo.release.Release;
import com.jschrj.pojo.story.Story;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;
import java.util.List;
import java.util.Map;

@Service
public class StoryServiceImpl implements StoryService {

	@Resource
	IStoryDao storyDao;

	@Resource
	IReleaseDao releaseDao;

	/**********************************待指派start******************************************/

	@Override
	public int getStoryCounts(Map<String, Object> param) throws Exception {

		return storyDao.getStoryCounts(param);
	}

	@Override
	public PageHelper<Story> getStoryPage(
			PageHelper<Story> pageHelper, Map<String, Object> param) throws Exception {
		param.put("limit", pageHelper.getRowNum());
		param.put("offset", pageHelper.getRowNum()*(pageHelper.getPage()-1));
		param.put("order", pageHelper.getSidx());
		param.put("sort", pageHelper.getSord());
		List<Story> tempList=storyDao.getStoryPage(param);
		pageHelper.setRows(tempList);
		return pageHelper;
	}

	@Override
	public Story getStoryById(int id) throws Exception {

		return storyDao.selectByPrimaryKey(id);
	}

	@Override
	public void tx_insertStory(Story story,List<Release> releaseList) throws Exception {

		storyDao.insertSelective(story);

		//新增待发布
		for(int i=0;i<releaseList.size();i++){
			releaseList.get(i).setType(1);
			releaseList.get(i).setReferid(story.getId());
//			releaseList.get(i).setUserid(story.getOpenedby());
//			releaseList.get(i).setUsername(story.getOpenedbyname());
			releaseDao.insertSelective(releaseList.get(i));
		}
	}

	@Override
	public void tx_updateStory(Story story,List<Release> releaseList) throws Exception {

		storyDao.updateByPrimaryKeySelective(story);

		//删除旧发布资料
		releaseDao.deleteByReferid(story.getId());

		//新增待发布
		for(int i=0;i<releaseList.size();i++){
			releaseList.get(i).setType(1);
			releaseList.get(i).setReferid(story.getId());
//			releaseList.get(i).setUserid(story.getOpenedby());
//			releaseList.get(i).setUsername(story.getOpenedbyname());
			releaseDao.insertSelective(releaseList.get(i));
		}
	}

	@Override
	public void deleteStory(Story story) throws Exception {

		storyDao.updateByPrimaryKeySelective(story);
	}

	@Override
	public void updateStoryNext(Story story) throws Exception {

		storyDao.updateByPrimaryKeySelective(story);
	}

	@Override
	public int getTotestCounts(Map<String, Object> param) throws Exception {
		return storyDao.getTotestCounts(param);
	}

	@Override
	public PageHelper<Story> getTotestPage(PageHelper<Story> pageHelper, Map<String, Object> param) throws Exception {
		param.put("limit", pageHelper.getRowNum());
		param.put("offset", pageHelper.getRowNum()*(pageHelper.getPage()-1));
		param.put("order", pageHelper.getSidx());
		param.put("sort", pageHelper.getSord());
		List<Story> tempList=storyDao.getTotestPage(param);
		pageHelper.setRows(tempList);
		return pageHelper;
	}

	/**********************************待指派end******************************************/
}
