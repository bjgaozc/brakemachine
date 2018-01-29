package com.sinosoft.test.web.process.controller;

import java.io.IOException;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.commons.lang3.StringUtils;
import org.jeecgframework.core.common.exception.BusinessException;
import org.jeecgframework.core.common.hibernate.qbc.CriteriaQuery;
import org.jeecgframework.core.common.model.json.AjaxJson;
import org.jeecgframework.core.common.model.json.DataGrid;
import org.jeecgframework.core.constant.Globals;
import org.jeecgframework.core.util.ExceptionUtil;
import org.jeecgframework.core.util.MyBeanUtils;
import org.jeecgframework.core.util.ResourceUtil;
import org.jeecgframework.core.util.StringUtil;
import org.jeecgframework.poi.excel.ExcelImportUtil;
import org.jeecgframework.poi.excel.entity.ExportParams;
import org.jeecgframework.poi.excel.entity.ImportParams;
import org.jeecgframework.poi.excel.entity.TemplateExportParams;
import org.jeecgframework.poi.excel.entity.vo.NormalExcelConstants;
import org.jeecgframework.poi.excel.entity.vo.TemplateExcelConstants;
import org.jeecgframework.tag.core.easyui.TagUtil;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;
import org.springframework.web.servlet.ModelAndView;

import com.sinosoft.test.util.SequenceUtil;
import com.sinosoft.test.web.common.controller.TeCommonController;
import com.sinosoft.test.web.process.entity.TeProcessSyncEntity;
import com.sinosoft.test.web.process.service.TeProcessSyncServiceI;

/**   
 * 入口URL:teProcessSyncController.do?teProcessSync
 *
 * @Title: Controller
 * @Description: 流程同步
 * @author cmh
 * @date 2017-11-22 10:36:08
 * @version V1.0   
 *
 */
@SuppressWarnings("all")
@Controller
@RequestMapping("/teProcessSyncController")
public class TeProcessSyncController extends TeCommonController {
    
    /**服务*/
	@Autowired
	private TeProcessSyncServiceI teProcessSyncService;

	/**
	 * 查询首页
	 * 
	 * <pre>
	 * teProcessSyncController.do?queryIndex=true
	 * </pre>
	 * @author cmh
	 * @since 2017年5月11日 下午9:54:05
	 * @version 1.0
	 * @param request
	 * @return
	 */
	@RequestMapping(params = "queryIndex")
	public String queryIndex(HttpServletRequest request){
//		String rootpath = this.getRootPath().replaceAll("\\\\", "/")+"/";
//		request.setAttribute("rootpath", rootpath);
		request.setAttribute("pageType", "query");
		return view("process/teProcessSync-index", request);
	}
	
	/**
	 * 流程同步列表 页面跳转
	 *
	 * @param request
	 * @return
	 */
	@RequestMapping(params = "teProcessSync")
	public String teProcessSync(HttpServletRequest request) {
		return view("process/teProcessSyncList", request);
	}

	/**
	 * easyui AJAX请求数据
	 * 
	 * @param request
	 * @param response
	 * @param dataGrid
	 * @param user
	 */
	@RequestMapping(params = "datagrid")
	public void datagrid(TeProcessSyncEntity teProcessSync,HttpServletRequest request, HttpServletResponse response, DataGrid dataGrid) {
		//模糊查询
		String syApplyid = teProcessSync.getSyApplyid();
		if(StringUtils.isNotEmpty(syApplyid)){
			teProcessSync.setSyApplyid("%"+syApplyid+"*");
		}
		
		CriteriaQuery cq = new CriteriaQuery(TeProcessSyncEntity.class, dataGrid);
		//查询条件组装器
		org.jeecgframework.core.extend.hqlsearch.HqlGenerateUtil.installHql(cq, teProcessSync, request.getParameterMap());
		try{
		//自定义追加查询条件
		}catch (Exception e) {
			throw new BusinessException(e.getMessage());
		}
		cq.add();
		this.teProcessSyncService.getDataGridReturn(cq, true);
		TagUtil.datagrid(response, dataGrid);
	}

	/**
	 * 删除流程同步
	 * 
	 * @return
	 */
	@RequestMapping(params = "doDel")
	@ResponseBody
	public AjaxJson doDel(TeProcessSyncEntity teProcessSync, HttpServletRequest request) {
		AjaxJson j = new AjaxJson();
		teProcessSync = systemService.getEntity(TeProcessSyncEntity.class, teProcessSync.getId());
		message = "流程同步删除成功";
		try{
			teProcessSyncService.delete(teProcessSync);
			systemService.addLog(message, Globals.Log_Type_DEL, Globals.Log_Leavel_INFO);
		}catch(Exception e){
			e.printStackTrace();
			message = "流程同步删除失败";
			throw new BusinessException(e.getMessage());
		}
		j.setMsg(message);
		return j;
	}
	
	/**
	 * 批量删除流程同步
	 * 
	 * @return
	 */
	@RequestMapping(params = "doBatchDel")
	@ResponseBody
	public AjaxJson doBatchDel(String ids,HttpServletRequest request){
		AjaxJson j = new AjaxJson();
		message = "流程同步删除成功";
		try{
			for(String id:ids.split(",")){
				TeProcessSyncEntity teProcessSync = systemService.getEntity(TeProcessSyncEntity.class, 
				id
				);
				teProcessSyncService.delete(teProcessSync);
				systemService.addLog(message, Globals.Log_Type_DEL, Globals.Log_Leavel_INFO);
			}
		}catch(Exception e){
			e.printStackTrace();
			message = "流程同步删除失败";
			throw new BusinessException(e.getMessage());
		}
		j.setMsg(message);
		return j;
	}

	/**
	 * 添加流程同步
	 * 
	 * @param ids
	 * @return
	 */
	@RequestMapping(params = "doAdd")
	@ResponseBody
	public AjaxJson doAdd(TeProcessSyncEntity teProcessSync, HttpServletRequest request) {
		AjaxJson j = new AjaxJson();
		message = "流程同步添加成功";
		try{
			// 设置有序的id
			//teProcessSync.setSySort(SequenceUtil.nextId());
			
			teProcessSyncService.save(teProcessSync);
			systemService.addLog(message, Globals.Log_Type_INSERT, Globals.Log_Leavel_INFO);
		}catch(Exception e){
			e.printStackTrace();
			message = "流程同步添加失败";
			throw new BusinessException(e.getMessage());
		}
		j.setMsg(message);
		return j;
	}
	
	/**
	 * 更新流程同步
	 * 
	 * @param ids
	 * @return
	 */
	@RequestMapping(params = "doUpdate")
	@ResponseBody
	public AjaxJson doUpdate(TeProcessSyncEntity teProcessSync, HttpServletRequest request) {
		AjaxJson j = new AjaxJson();
		message = "流程同步更新成功";
		TeProcessSyncEntity t = teProcessSyncService.get(TeProcessSyncEntity.class, teProcessSync.getId());
		try {
			MyBeanUtils.copyBeanNotNull2Bean(teProcessSync, t);
			teProcessSyncService.saveOrUpdate(t);
			systemService.addLog(message, Globals.Log_Type_UPDATE, Globals.Log_Leavel_INFO);
		} catch (Exception e) {
			e.printStackTrace();
			message = "流程同步更新失败";
			throw new BusinessException(e.getMessage());
		}
		j.setMsg(message);
		return j;
	}
	

	/**
	 * 流程同步新增页面跳转
	 * 
	 * @return
	 */
	@RequestMapping(params = "goAdd")
	public String goAdd(TeProcessSyncEntity teProcessSync, HttpServletRequest req) {
		if (StringUtil.isNotEmpty(teProcessSync.getId())) {
			teProcessSync = teProcessSyncService.getEntity(TeProcessSyncEntity.class, teProcessSync.getId());
			req.setAttribute("teProcessSyncPage", teProcessSync);
		}
		return view("process/teProcessSync-add", req);
	}
	/**
	 * 流程同步编辑页面跳转
	 * 
	 * @return
	 */
	@RequestMapping(params = "goUpdate")
	public String goUpdate(TeProcessSyncEntity teProcessSync, HttpServletRequest req) {
		if (StringUtil.isNotEmpty(teProcessSync.getId())) {
			teProcessSync = teProcessSyncService.getEntity(TeProcessSyncEntity.class, teProcessSync.getId());
			req.setAttribute("teProcessSyncPage", teProcessSync);
		}
		return view("process/teProcessSync-update", req);
	}
	
	/**
	 * 导入功能跳转
	 * 
	 * @return
	 */
	@RequestMapping(params = "upload")
	public ModelAndView upload(HttpServletRequest req) {
		req.setAttribute("controller_name","teProcessSyncController");
		return new ModelAndView("common/upload/pub_excel_upload");
	}
	
	/**
	 * 导出excel
	 * 
	 * @param request
	 * @param response
	 */
	@RequestMapping(params = "exportXls")
	public String exportXls(TeProcessSyncEntity teProcessSync,HttpServletRequest request,HttpServletResponse response, DataGrid dataGrid,ModelMap modelMap) {
		CriteriaQuery cq = new CriteriaQuery(TeProcessSyncEntity.class, dataGrid);
		org.jeecgframework.core.extend.hqlsearch.HqlGenerateUtil.installHql(cq, teProcessSync, request.getParameterMap());
		List<TeProcessSyncEntity> teProcessSyncs = this.teProcessSyncService.getListByCriteriaQuery(cq,false);
		modelMap.put(NormalExcelConstants.FILE_NAME,"流程同步");
		modelMap.put(NormalExcelConstants.CLASS,TeProcessSyncEntity.class);
		modelMap.put(NormalExcelConstants.PARAMS,new ExportParams("流程同步列表", "导出人:"+ResourceUtil.getSessionUserName().getRealName(),
			"导出信息"));
		modelMap.put(NormalExcelConstants.DATA_LIST,teProcessSyncs);
		return NormalExcelConstants.JEECG_EXCEL_VIEW;
	}
	
	/**
	 * 导出excel 使模板
	 * 
	 * @param request
	 * @param response
	 */
	@RequestMapping(params = "exportXlsByT")
	public String exportXlsByT(TeProcessSyncEntity teProcessSync,HttpServletRequest request,HttpServletResponse response, DataGrid dataGrid,ModelMap modelMap) {
		modelMap.put(TemplateExcelConstants.FILE_NAME, "流程同步");
		modelMap.put(TemplateExcelConstants.PARAMS,new TemplateExportParams("Excel模板地址"));
		modelMap.put(TemplateExcelConstants.MAP_DATA,null);
		modelMap.put(TemplateExcelConstants.CLASS,TeProcessSyncEntity.class);
		modelMap.put(TemplateExcelConstants.LIST_DATA,null);
		return TemplateExcelConstants.JEECG_TEMPLATE_EXCEL_VIEW;
	}
	
	@RequestMapping(params = "importExcel", method = RequestMethod.POST)
	@ResponseBody
	public AjaxJson importExcel(HttpServletRequest request, HttpServletResponse response) {
		AjaxJson j = new AjaxJson();
		
		MultipartHttpServletRequest multipartRequest = (MultipartHttpServletRequest) request;
		Map<String, MultipartFile> fileMap = multipartRequest.getFileMap();
		for (Map.Entry<String, MultipartFile> entity : fileMap.entrySet()) {
			MultipartFile file = entity.getValue();// 获取上传文件对象
			ImportParams params = new ImportParams();
			params.setTitleRows(2);
			params.setHeadRows(1);
			params.setNeedSave(true);
			try {
				List<TeProcessSyncEntity> listTeProcessSyncEntitys = ExcelImportUtil.importExcel(file.getInputStream(),TeProcessSyncEntity.class,params);
				for (TeProcessSyncEntity teProcessSync : listTeProcessSyncEntitys) {
					teProcessSyncService.save(teProcessSync);
				}
				j.setMsg("文件导入成功！");
			} catch (Exception e) {
				j.setMsg("文件导入失败！");
				log.error(ExceptionUtil.getExceptionMessage(e));
			}finally{
				try {
					file.getInputStream().close();
				} catch (IOException e) {
					e.printStackTrace();
				}
			}
		}
		return j;
	}
}
