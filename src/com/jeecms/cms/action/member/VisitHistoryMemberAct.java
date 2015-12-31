package com.jeecms.cms.action.member;

import com.jeecms.common.page.Pagination;
import com.jeecms.common.web.CookieUtils;
import com.jeecms.core.entity.CmsSite;
import com.jeecms.core.entity.CmsUser;
import com.jeecms.core.entity.MemberConfig;
import com.jeecms.core.web.util.CmsUtils;
import com.jeecms.core.web.util.FrontUtils;
import org.apache.commons.lang.StringUtils;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import static com.jeecms.cms.Constants.TPLDIR_MEMBER;
import static com.jeecms.common.page.SimplePage.cpn;

/**
 * Created by klarclm on 2015/12/31.
 */
@Controller
public class VisitHistoryMemberAct {
    public static final String VISITHISTORY_LIST = "tpl.visitHistoryList";

    @RequestMapping(value = "/member/visithistory_list.jspx")
    public String visithistory_list(String queryTitle, Integer queryChannelId,
                                  Integer pageNo, HttpServletRequest request,
                                  HttpServletResponse response, ModelMap model) {
        CmsSite site = CmsUtils.getSite(request);
        CmsUser user = CmsUtils.getUser(request);
        FrontUtils.frontData(request, model, site);
        MemberConfig mcfg = site.getConfig().getMemberConfig();
        // 没有开启会员功能
        if (!mcfg.isMemberOn()) {
            return FrontUtils.showMessage(request, model, "member.memberClose");
        }
        if (user == null) {
            return FrontUtils.showLogin(request, model, site);
        }

        //获取当前用户前30个观看记录

//        model.addAttribute("pagination", p);
        if (!StringUtils.isBlank(queryTitle)) {
            model.addAttribute("queryTitle", queryTitle);
        }
        if (queryChannelId != null) {
            model.addAttribute("queryChannelId", queryChannelId);
        }
        return FrontUtils.getTplPath(request, site.getSolutionPath(),
                TPLDIR_MEMBER, VISITHISTORY_LIST);
    }

}
