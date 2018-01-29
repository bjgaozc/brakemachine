package com.sinosoft.test.web.common.controller;

import javax.servlet.http.HttpServletRequest;

import org.apache.commons.lang3.StringUtils;
import org.jeecgframework.web.system.service.MutiLangServiceI;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import com.sinosoft.modules.ep.web.controller.EpCommonController;
import com.sinosoft.test.web.common.service.TeCommonService;

/**
 * 公共控制器
 * 
 * <pre><pre>
 * @author cmh
 * @since 2016年11月28日 下午12:46:39
 * @version 1.0
 */
@Controller
@RequestMapping({"/teCommonController","/teCoCommonController"})
public class TeCommonController extends EpCommonController {
	/**服务*/
	@Autowired
	public MutiLangServiceI mutiLangService;
	@Autowired
	public TeCommonService teCommonService;
	
	/**
	 * 首页
	 * 
	 * <pre><pre>
	 * @author cmh
	 * @since 2016年11月28日 下午12:37:34
	 * @version 1.0
	 * @param request
	 * @return
	 */
	@RequestMapping(params = "index")
	public String index(HttpServletRequest request){
//		String roleName = teCoCommonService.getUserRole(getLoginUser());
//		System.out.println(roleName);
		
		return go(request);
	}
	
	/**
	 * 跳转页面
	 * 
	 * <pre><pre>
	 * @author cmh
	 * @since 2016年11月28日 下午12:37:34
	 * @version 1.0
	 * @param request
	 * @return
	 */
	@RequestMapping(params = "go")
	public String go(HttpServletRequest request){
		String defaultPage = "common/teCoCommon-index";
		String p = StringUtils.defaultString(request.getParameter("p"));
		if("".equals(p)) p = defaultPage;
		if(getLoginUserRoles().contains("admin")){
			// 管理员可以访问任意页面，普通用户只能访问测试页面
		}else{
			if(!p.equals(defaultPage) && !p.startsWith("test/")){
				p=defaultPage;
			}
		}
		log.debug("p="+p);
		return view(p);
	}
	
	/**
	 * 视图
	 * 
	 * <pre></pre>
	 * @author cmh
	 * @since 2016年12月16日 下午1:58:22
	 * @version 1.0
	 * @param viewPath 视图相对路径
	 * @return
	 */
	public String view(String viewPath){
		return view(viewPath, request);
	}
	
	/**
	 * 视图
	 * 
	 * <pre></pre>
	 * @author cmh
	 * @since 2016年12月16日 下午1:58:22
	 * @version 1.0
	 * @param viewPath 视图相对路径
	 * @param request
	 * @return
	 */
	public String view(String viewPath, HttpServletRequest request){
		viewPath = "com/sinosoft/test/web/"+viewPath;
		request.setAttribute("viewPath", viewPath);
		return viewPath;
	}
	
}
