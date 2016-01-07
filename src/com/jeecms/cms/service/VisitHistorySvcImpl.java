package com.jeecms.cms.service;

import com.jeecms.cms.entity.main.Content;
import com.jeecms.cms.m_entity.jcVisitHistroy;
import com.jeecms.cms.m_mapper.jcVisitHistroyMapper;
import com.jeecms.cms.manager.main.ContentMng;
import org.springframework.beans.factory.annotation.Autowired;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

/**
 * Created by klarclm on 2015/12/31.
 */
public class VisitHistorySvcImpl implements VisitHistorySvc {
    @Autowired
    private jcVisitHistroyMapper jcVisitHistroyMapper;
    @Autowired
    protected ContentMng contentMng;

    public int deleteByPrimaryKey(Integer userId) {
        return jcVisitHistroyMapper.deleteByPrimaryKey(userId);
    }

    public int insertSelective(jcVisitHistroy record) {
        return jcVisitHistroyMapper.insertSelective(record);
    }

    @Override
    public Map<String, List> selectVisitHistoryyUserid(Integer userId) {
        List<jcVisitHistroy> listVistHistory = jcVisitHistroyMapper.selectByUseridOrderByTime(userId);
        Integer[] ids = new Integer[listVistHistory.size()];
        int i = 0;
        Map<String, List> mapV = new HashMap<String, List>();
        List<String> listTime = new ArrayList<String>(1);
        for (jcVisitHistroy vH : listVistHistory) {
            listTime.add(i, vH.getVisitTime().toString());
            ids[i++] = vH.getContentId();
        }
        List<Content> listContent = contentMng.getListByIdsForTag(ids, 0);
        mapV.put("listTime",listTime);
        mapV.put("listContent",listContent);
        return mapV;
    }

    public jcVisitHistroy selectByUseridAndContentid(Integer user_id, Integer content_id) {
        return jcVisitHistroyMapper.selectByUseridAndContentid(user_id, content_id);
    }

    public int updateByUseridContentid(jcVisitHistroy record) {
        return jcVisitHistroyMapper.updateByUseridContentid(record);
    }
}
