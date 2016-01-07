package com.jeecms.cms.action.directive;

import static com.jeecms.cms.Constants.TPL_STYLE_LIST;
import static com.jeecms.cms.Constants.TPL_SUFFIX;
import static com.jeecms.common.web.Constants.UTF8;
import static com.jeecms.common.web.freemarker.DirectiveUtils.OUT_LIST;
import static com.jeecms.common.web.freemarker.DirectiveUtils.OUT_PAGINATION;
import static com.jeecms.core.web.util.FrontUtils.PARAM_STYLE_LIST;
import static freemarker.template.ObjectWrapper.DEFAULT_WRAPPER;

import java.io.IOException;
import java.util.HashMap;
import java.util.Map;

import org.apache.commons.lang.StringUtils;

import com.jeecms.cms.action.directive.abs.AbstractContentDirective;
import com.jeecms.common.page.Pagination;
import com.jeecms.common.web.freemarker.DirectiveUtils;
import com.jeecms.common.web.freemarker.ParamsRequiredException;
import com.jeecms.common.web.freemarker.DirectiveUtils.InvokeType;
import com.jeecms.core.entity.CmsSite;
import com.jeecms.core.web.util.FrontUtils;

import freemarker.core.Environment;
import freemarker.template.TemplateDirectiveBody;
import freemarker.template.TemplateException;
import freemarker.template.TemplateModel;

/**
 * 内容分页标签
 *
 * JEECMSv6标签使用之[@cms_content_page]
 发布时间： 2015-05-07 15:52:43   作者：本站编辑   来源： 本站原创   浏览次数：938   我要评论(0)
 内容列表分页标签：
 参数详解：
 tagId: TAG ID 允许多个TAG ID，用“，”分开。和tagNames之间二选一，ID优先级更高
 tagName: TAG NAME 允许多个TAG NAME ，用“，”分开
 topicId：专题ID
 channelId : 栏目ID，允许多个栏目ID，用“，”分开。和channelpath之间二选一，ID优先级更高
 channelPath : 栏目路径，允许多个栏目路径，用“，”分开
 channelOption : 栏目选项，用于单栏目情况下。 0 ：自身栏目 1 ：包含子栏目 2: 包含副栏目
 siteId：站点ID，可选，允许多个站点ID，用“，”分开
 typeId：类型ID，可选，允许多个类型ID，用“，”分开
 Recommend：是否推荐。 0 ：所有都推荐 1 ：推荐 2 ：不推荐，默认所有
 title：标题，可以为null
 image：标题图片， 0 ：所有 1 ：有 2 ：没有。默认所有
 orderBy :排序方式 0：ID降序 1：ID升序 2：发布时间降序 3：发布时间升序 4：固定级别降序，发布时间降序 5：固定级别降序，发布时间升序 6：日访问降序（推荐）7：周访问降序 8：月访问降序 9：总访问降序 10：日评论降序（推荐） 11：周评论降序 12：月评论降序 13：总评论降序 14：日下载降序（推荐）15：周下载降序 16：月下载降序 17：总下载降序 18：日顶降序（推荐） 19：周顶降序 20：月顶降序 21：总顶降序
 excludeId：不包含的文章ID，用于按tag查询相关文章

 作用：对显示的文章列表进行分页

 具体例子：
 [@cms_content_page channelId=channel.id count='4' sysPage=’1’ titLen='15' append='...' orderBy='2' dateFormat='MM-dd' channelOption='1']
 [#list tag_pagination.list as a]
 <ul><li>
 <a href="${a.url}" title="${a.title}" target="_blank">[@text_cut s=a.title len=titLen append=append/]</a> [${a.date?string(dateFormat)}]
 </li></ul>
 [/#list]
 [/@cms_content_page]
 */
public class ContentPageDirective extends AbstractContentDirective {
	 /**
	 * 模板名称
	 */
	public static final String TPL_NAME = "content_page";

	@SuppressWarnings("unchecked")
	public void execute(Environment env, Map params, TemplateModel[] loopVars,
			TemplateDirectiveBody body) throws TemplateException, IOException {
		CmsSite site = FrontUtils.getSite(env);
		Pagination page = (Pagination) super.getData(params, env);

		Map<String, TemplateModel> paramWrap = new HashMap<String, TemplateModel>(
				params);
		paramWrap.put(OUT_PAGINATION, DEFAULT_WRAPPER.wrap(page));
		paramWrap.put(OUT_LIST, DEFAULT_WRAPPER.wrap(page.getList()));
		Map<String, TemplateModel> origMap = DirectiveUtils
				.addParamsToVariable(env, paramWrap);
		InvokeType type = DirectiveUtils.getInvokeType(params);
		String listStyle = DirectiveUtils.getString(PARAM_STYLE_LIST, params);
		if (InvokeType.sysDefined == type) {
			if (StringUtils.isBlank(listStyle)) {
				throw new ParamsRequiredException(PARAM_STYLE_LIST);
			}
			env.include(TPL_STYLE_LIST + listStyle + TPL_SUFFIX, UTF8, true);
			FrontUtils.includePagination(site, params, env);
		} else if (InvokeType.userDefined == type) {
			if (StringUtils.isBlank(listStyle)) {
				throw new ParamsRequiredException(PARAM_STYLE_LIST);
			}
			FrontUtils.includeTpl(TPL_STYLE_LIST, site, env);
			FrontUtils.includePagination(site, params, env);
		} else if (InvokeType.custom == type) {
			FrontUtils.includeTpl(TPL_NAME, site, params, env);
			FrontUtils.includePagination(site, params, env);
		} else if (InvokeType.body == type) {
			if (body != null) {
				body.render(env.getOut());
				FrontUtils.includePagination(site, params, env);
			}
		} else {
			throw new RuntimeException("invoke type not handled: " + type);
		}
		DirectiveUtils.removeParamsFromVariable(env, paramWrap, origMap);
	}

	@Override
	protected boolean isPage() {
		return true;
	}
}
