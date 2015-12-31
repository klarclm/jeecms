package com.jeecms.cms.m_mapper;

import com.jeecms.cms.m_entity.jcVisitHistroy;

public interface jcVisitHistroyMapper {
    int deleteByPrimaryKey(Integer id);

    int insert(jcVisitHistroy record);

    int insertSelective(jcVisitHistroy record);

    jcVisitHistroy selectByUserid(Integer user_id);

    jcVisitHistroy selectByUseridAndContentid(Integer user_id, Integer content_id);

    int updateByPrimaryKeySelective(jcVisitHistroy record);

    int updateByPrimaryKey(jcVisitHistroy record);

    int updateByUseridContentid(jcVisitHistroy record);

}