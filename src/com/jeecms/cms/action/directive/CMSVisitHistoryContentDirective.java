package com.jeecms.cms.action.directive;

import com.jeecms.cms.action.directive.abs.AbstractContentDirective;
import com.jeecms.cms.entity.main.Content;
import com.jeecms.cms.service.VisitHistorySvc;
import com.jeecms.common.page.Pagination;
import com.jeecms.common.web.freemarker.DirectiveUtils;
import com.jeecms.common.web.freemarker.ParamsRequiredException;
import com.jeecms.core.entity.CmsSite;
import com.jeecms.core.web.util.FrontUtils;
import freemarker.core.Environment;
import freemarker.template.TemplateDirectiveBody;
import freemarker.template.TemplateException;
import freemarker.template.TemplateModel;
import org.apache.commons.lang.StringUtils;
import org.springframework.beans.factory.annotation.Autowired;

import java.io.IOException;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import static com.jeecms.cms.Constants.TPL_STYLE_LIST;
import static com.jeecms.cms.Constants.TPL_SUFFIX;
import static com.jeecms.common.web.Constants.UTF8;
import static com.jeecms.common.web.freemarker.DirectiveUtils.OUT_LIST;
import static com.jeecms.common.web.freemarker.DirectiveUtils.OUT_DIY1;
import static com.jeecms.common.web.freemarker.DirectiveUtils.OUT_PAGINATION;
import static com.jeecms.core.web.util.FrontUtils.PARAM_STYLE_LIST;
import static com.jeecms.core.web.util.FrontUtils.USER;
import static freemarker.template.ObjectWrapper.DEFAULT_WRAPPER;

/**
 * Created by klarclm on 2016/1/5.
 */
public class CMSVisitHistoryContentDirective extends AbstractContentDirective {
    /**
     * 模板名称
     */
    public static final String TPL_NAME = "visitHistory_page";

    @Autowired
    private VisitHistorySvc visitHistorySvc;

    @SuppressWarnings("unchecked")
    public void execute(Environment env, Map params, TemplateModel[] loopVars,
                        TemplateDirectiveBody body) throws TemplateException, IOException {
        CmsSite site = FrontUtils.getSite(env);
        Integer userId = DirectiveUtils.getInt("userId", params);

        Map<String, List> mapV = visitHistorySvc.selectVisitHistoryyUserid(userId);

        Map<String, TemplateModel> paramWrap = new HashMap<String, TemplateModel>(
                params);
        paramWrap.put(OUT_LIST, DEFAULT_WRAPPER.wrap(mapV.get("listContent")));
        paramWrap.put(OUT_DIY1,DEFAULT_WRAPPER.wrap(mapV.get("listTime")));
        Map<String, TemplateModel> origMap = DirectiveUtils
                .addParamsToVariable(env, paramWrap);
        DirectiveUtils.InvokeType type = DirectiveUtils.getInvokeType(params);
        String listStyle = DirectiveUtils.getString(PARAM_STYLE_LIST, params);
        if (DirectiveUtils.InvokeType.sysDefined == type) {
            if (StringUtils.isBlank(listStyle)) {
                throw new ParamsRequiredException(PARAM_STYLE_LIST);
            }
            env.include(TPL_STYLE_LIST + listStyle + TPL_SUFFIX, UTF8, true);
        } else if (DirectiveUtils.InvokeType.userDefined == type) {
            if (StringUtils.isBlank(listStyle)) {
                throw new ParamsRequiredException(PARAM_STYLE_LIST);
            }
            FrontUtils.includeTpl(TPL_STYLE_LIST, site, env);
        } else if (DirectiveUtils.InvokeType.custom == type) {
            FrontUtils.includeTpl(TPL_NAME, site, params, env);
        } else if (DirectiveUtils.InvokeType.body == type) {
            body.render(env.getOut());
        } else {
            throw new RuntimeException("invoke type not handled: " + type);
        }
        DirectiveUtils.removeParamsFromVariable(env, paramWrap, origMap);
    }


    @Override
    protected boolean isPage() {
        return false;
    }
}
