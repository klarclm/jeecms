package com.jeecms.cms.service;

import com.jeecms.cms.entity.main.Content;
import com.jeecms.cms.m_entity.jcVisitHistroy;

import java.util.List;
import java.util.Map;

/**
 * Created by klarclm on 2015/12/31.
 */
public interface VisitHistorySvc {
    public int deleteByPrimaryKey(Integer userId);

    public int insertSelective(jcVisitHistroy record);

    public Map<String, List> selectVisitHistoryyUserid(Integer userId);

    public jcVisitHistroy selectByUseridAndContentid(Integer user_id, Integer content_id);

    public int updateByUseridContentid(jcVisitHistroy record);
}
