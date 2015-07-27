package com.jeecms.cms.action.front;

import static com.jeecms.cms.Constants.TPLDIR_VEDIO;

import com.jeecms.cms.entity.assist.CmsGuestbookCtg;
import com.jeecms.cms.entity.main.Channel;
import com.jeecms.cms.entity.main.ContentCount;
import com.jeecms.cms.manager.main.ContentCountMng;
import com.jeecms.cms.manager.main.ContentMng;
import com.jeecms.cms.service.ChannelCountCache;
import com.jeecms.cms.service.ContentCountCache;
import com.jeecms.common.web.ResponseUtils;
import com.jeecms.core.entity.CmsSite;
import com.jeecms.core.web.util.CmsUtils;
import com.jeecms.core.web.util.FrontUtils;
import org.apache.commons.lang.StringUtils;
import org.json.JSONArray;
import org.json.JSONException;
import org.json.JSONObject;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.util.HashMap;
import java.util.Map;

import static com.jeecms.cms.Constants.TPLDIR_SPECIAL;

/**
 * Created by klarclm on 2015/7/26.
 * �ɲο�N:\WorkSpace\jeecms\src\com\jeecms\cms\action\front\GuestbookAct.java
 */
@Controller
public class VedioAct {

    public static final String TPLNAME_VEDIOSEARCHLIST = "tpl.vediosearchlist";

    @RequestMapping(value = "/vedio/vediosearchlist.jspx", method = RequestMethod.GET)
    public String vedioSearchList(Integer typeId, Integer yearId,Integer aeraId,Integer countryId,HttpServletRequest request,
                            HttpServletResponse response, ModelMap model) throws JSONException {
        CmsSite site = CmsUtils.getSite(request);
        FrontUtils.frontData(request, model, site);
        FrontUtils.frontPageData(request, model);
        return FrontUtils.getTplPath(request, site.getSolutionPath(), TPLDIR_VEDIO, TPLNAME_VEDIOSEARCHLIST);
    }


    @Autowired
    private ContentMng contentMng;

    private static final Logger log = LoggerFactory
            .getLogger(AttachmentAct.class);
}
