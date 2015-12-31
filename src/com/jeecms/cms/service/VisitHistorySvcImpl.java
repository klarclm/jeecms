package com.jeecms.cms.service;

import com.jeecms.cms.m_entity.jcVisitHistroy;
import com.jeecms.cms.m_mapper.jcVisitHistroyMapper;
import org.springframework.beans.factory.annotation.Autowired;

/**
 * Created by klarclm on 2015/12/31.
 */
public class VisitHistorySvcImpl implements VisitHistorySvc{
    @Autowired
    private jcVisitHistroyMapper jcVisitHistroyMapper;

    public int deleteByPrimaryKey(Integer userId) {
        return jcVisitHistroyMapper.deleteByPrimaryKey(userId);
    }

    public int insertSelective(jcVisitHistroy record) {
        return jcVisitHistroyMapper.insertSelective(record);
    }

    public jcVisitHistroy selectByUserid(Integer userId) {
        return jcVisitHistroyMapper.selectByUserid(userId);
    }

    public jcVisitHistroy selectByUseridAndContentid(Integer user_id, Integer content_id){
        return jcVisitHistroyMapper.selectByUseridAndContentid(user_id,content_id);
    }

    public int updateByUseridContentid(jcVisitHistroy record){
        return  jcVisitHistroyMapper.updateByUseridContentid(record);
    }
}
