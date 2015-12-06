package com.jeecms.cms.m_mapper;

import com.jeecms.cms.m_entity.jcfile;

public interface jcfileMapper {
    int deleteByPrimaryKey(String filePath);

    int insert(jcfile record);

    int insertSelective(jcfile record);

    jcfile selectByPrimaryKey(String filePath);

    int updateByPrimaryKeySelective(jcfile record);

    int updateByPrimaryKey(jcfile record);
}