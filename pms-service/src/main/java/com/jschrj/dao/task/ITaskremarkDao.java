package com.jschrj.dao.task;

import com.jschrj.pojo.task.Taskremark;

public interface ITaskremarkDao {
    int deleteByPrimaryKey(Integer id);

    int insert(Taskremark record);

    int insertSelective(Taskremark record);

    Taskremark selectByPrimaryKey(Integer id);

    int updateByPrimaryKeySelective(Taskremark record);

    int updateByPrimaryKey(Taskremark record);
}