package com.jeecms.cms.action.directive;

import static com.jeecms.cms.Constants.TPL_STYLE_LIST;
import static com.jeecms.cms.Constants.TPL_SUFFIX;
import static com.jeecms.common.web.Constants.UTF8;
import static com.jeecms.common.web.freemarker.DirectiveUtils.OUT_LIST;
import static com.jeecms.core.web.util.FrontUtils.PARAM_STYLE_LIST;
import static freemarker.template.ObjectWrapper.DEFAULT_WRAPPER;

import java.io.IOException;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.commons.lang.StringUtils;

import com.jeecms.cms.action.directive.abs.AbstractContentDirective;
import com.jeecms.cms.entity.main.Content;
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
 * 内容列表标签

 参数详解：
 count : 数量
 d：文章ID，允许多个文章的ID，用“，”分开。排斥其他所有删选参数
 tagId:TAG ID 允许多个TAG ID，用“，”分开。和tagNames之间二选一，ID优先级更高。
 tagName: TAG NAME 允许多个TAG NAME ，用“，”分开。
 topicId：专题ID
 channelId:栏目ID，允许多个栏目ID，用“，”分开。和channelpath之间二选一，ID优先级更高。
 channelPath:栏目路径，允许多个栏目路径，用“，”分开。
 channelOption:栏目选项，用于单栏目情况下。 0 ：自身栏目 1 ：包含子栏目 2: 包含副栏目
 siteId：站点ID，可选，允许多个站点ID，用“，”分开。
 typeId：类型ID，可选，允许多个类型ID，用“，”分开。
 Recommend：是否推荐。 0 ：所有都推荐 1 ：推荐 2 ：不推荐，默认所有
 title：标题，可以为null
 image：标题图片， 0 ：所有 1 ：有 2 ：没有。默认所有
 orderBy :排序方式 0：ID降序 1：ID升序 2：发布时间降序 3：发布时间升序 4：固定级别降序，发布时间降序 5：固定级别降序，发布时间升序 6：日访问降序（推荐）7：周访问降序 8：月访问降序 9：总访问降序 10：日评论降序（推荐） 11：周评论降序 12：月评论降序 13：总评论降序 14：日下载降序（推荐）15：周下载降序 16：月下载降序 17：总下载降序 18：日顶降序（推荐） 19：周顶降序 20：月顶降序 21：总顶降序
 excludeId：不包含的文章ID，用于按tag查询相关文章
 style_list：文章列表显示样式
 文字列表
 lineHeight：行高；【行高】
 headMarkImg: 列表头图片；【图片地址】
 headMark: 列表头编号；【1：小黑点；2：小红点；3：单箭头；4：双箭头】
 bottomLine: 下划线；【0：无；1：有】不能为空。
 dateFormat: 日期格式；【java日期格式，如：yyyy-MM-dd】
 datePosition: 日期位置；【1：后面左边；2：后面右边；3：前面】不能为空
 ctgForm: 类别；【0：无；1：栏目；2：站点】不能为空
 showTitleStyle：显示标题样式；【0：不显示；1：显示】不能为空
 useShortTitle: 是否使用简短标题；【0：不使用；1：使用】不能为空
 titLen: 标题长度；【英文字母按半个计算】为空则不截断
 target: 是否新窗口打开；【0：原窗口；1：新窗口】不能为空
 styleList：文章列表显示样式
 具体例子：
 <div class="w250 fr">
 <div class="rb_right_top"><h2><a href="#" target="_blank">热门资讯排行榜</a></h2></div>
 <div class="rb_right_div">
 <ul class="order">
 [@cms_content_list count='10' titLen='15' orderBy='9' channelOption='1']
 [#list tag_list as a]
 <li><a href="${a.url}" title="${a.title}" target="_blank">[@text_cut s=a.title len=titLen append=append/]</a></li>
 [/#list]
 [/@cms_content_list]
 </ul>
 </div>
 <div class="rb_right_low"></div>
 </div>签
 */
public class ContentListDirective extends AbstractContentDirective {
	/**
	 * 模板名称
	 */
	public static final String TPL_NAME = "content_list";

	/**
	 * 输入参数，文章ID。允许多个文章ID，用","分开。排斥其他所有筛选参数。
	 */
	public static final String PARAM_IDS = "ids";

	@SuppressWarnings("unchecked")
	public void execute(Environment env, Map params, TemplateModel[] loopVars,
			TemplateDirectiveBody body) throws TemplateException, IOException {
		CmsSite site = FrontUtils.getSite(env);
		List<Content> list = getList(params, env);

		Map<String, TemplateModel> paramWrap = new HashMap<String, TemplateModel>(
				params);
		paramWrap.put(OUT_LIST, DEFAULT_WRAPPER.wrap(list));
		Map<String, TemplateModel> origMap = DirectiveUtils
				.addParamsToVariable(env, paramWrap);
		InvokeType type = DirectiveUtils.getInvokeType(params);
		String listStyle = DirectiveUtils.getString(PARAM_STYLE_LIST, params);
		if (InvokeType.sysDefined == type) {
			if (StringUtils.isBlank(listStyle)) {
				throw new ParamsRequiredException(PARAM_STYLE_LIST);
			}
			env.include(TPL_STYLE_LIST + listStyle + TPL_SUFFIX, UTF8, true);
		} else if (InvokeType.userDefined == type) {
			if (StringUtils.isBlank(listStyle)) {
				throw new ParamsRequiredException(PARAM_STYLE_LIST);
			}
			FrontUtils.includeTpl(TPL_STYLE_LIST, site, env);
		} else if (InvokeType.custom == type) {
			FrontUtils.includeTpl(TPL_NAME, site, params, env);
		} else if (InvokeType.body == type) {
			body.render(env.getOut());
		} else {
			throw new RuntimeException("invoke type not handled: " + type);
		}
		DirectiveUtils.removeParamsFromVariable(env, paramWrap, origMap);
	}

	@SuppressWarnings("unchecked")
	protected List<Content> getList(Map<String, TemplateModel> params,
			Environment env) throws TemplateException {
		Integer[] ids = DirectiveUtils.getIntArray(PARAM_IDS, params);
		if (ids != null && ids[0] !=0) {
			return contentMng.getListByIdsForTag(ids, getOrderBy(params));
		} else if( ids != null && ids[0] == 0){
			return (List<Content>) super.getData(params, env);
		}else{
			return (List<Content>) super.getData(params, env);
		}
	}

	@Override
	protected boolean isPage() {
		return false;
	}
}
