package com.jeecms.cms.service;

import com.jeecms.cms.m_entity.jcVisitHistroy;

/**
 * Created by klarclm on 2015/12/31.
 */
public interface VisitHistorySvc {
    public int deleteByPrimaryKey(Integer userId);

    public int insertSelective(jcVisitHistroy record);

    public jcVisitHistroy selectByUserid(Integer userId);

    public jcVisitHistroy selectByUseridAndContentid(Integer user_id, Integer content_id);

    public int updateByUseridContentid(jcVisitHistroy record);
}
