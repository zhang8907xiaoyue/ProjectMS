package com.jschrj.api.test;

import com.jschrj.common.PageHelper;
import com.jschrj.pojo.bug.Bug;
import com.jschrj.pojo.story.Story;
import com.jschrj.pojo.test.Usecase;
import com.jschrj.pojo.test.Usecasestep;

import java.util.List;
import java.util.Map;

public interface TestService {

	/**********************************待测试列表start******************************************/

    Usecase getUsecaseById(int id) throws Exception;

    /**
     * 新增用例
     * @param usecase
     * @param usecasestepList
     * @throws Exception
     */
    void tx_usecase(Usecase usecase, List<Usecasestep> usecasestepList) throws Exception;

    /**********************************待测试列表end******************************************/

    /**********************************用例列表start******************************************/
    int getUsecaseCounts(Map<String, Object> param) throws Exception;

    /**
     * 用例列表分页数据
     * @param pageHelper
     * @param param
     * @return
     */
    PageHelper<Usecase> getUsecasePage(PageHelper<Usecase> pageHelper, Map<String, Object> param) throws Exception;

    /**
     * 获取需求关联用例列表
     * @param storyid
     * @return
     * @throws Exception
     */
    public List<Usecase> getUsecaseByStoryid(int storyid) throws Exception;

    List<Usecasestep> getUsecasesteplistByusecaseid(Integer id) throws Exception;

    void tx_updateUsecase(Usecase usecase, List<Usecasestep> usecasestepList) throws Exception;

    void deleteStory(Usecase usecase) throws Exception;

    /**********************************用例列表end******************************************/
}
