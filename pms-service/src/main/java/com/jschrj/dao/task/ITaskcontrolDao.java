package com.jschrj.dao.task;

import com.jschrj.pojo.task.Taskcontrol;

public interface ITaskcontrolDao {
    int deleteByPrimaryKey(Integer id);

    int insert(Taskcontrol record);

    int insertSelective(Taskcontrol record);

    Taskcontrol selectByPrimaryKey(Integer id);

    int updateByPrimaryKeySelective(Taskcontrol record);

    int updateByPrimaryKey(Taskcontrol record);
}