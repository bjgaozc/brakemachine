<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@include file="/context/mytags.jsp"%>
<sino:plugins type="jquery,easyui,tools,date,DatePicker" />
<div class="easyui-layout" fit="true">
  <div region="center" style="padding:1px;">
  <t:datagrid name="epBiSearchList" checkbox="true" fitColumns="true" title="通用查询" actionUrl="epBiSearchController.do?datagrid" fit="true" queryMode="group">
   <t:dgCol title="主键"  field="id"  hidden="true" ></t:dgCol>
   <t:dgCol title="用户"  field="seUserid" dictionary="t_s_base_user,id,realname"></t:dgCol>
   <t:dgCol title="输出"  field="seOutput"  hidden="true" ></t:dgCol>
   <t:dgCol title="查询名称"  field="seSearchname"   query="true"></t:dgCol>
   <t:dgCol title="查询条件"  field="seSearchwhere"  width="300" ></t:dgCol>
   <t:dgCol title="配置"  field="seConfig"  hidden="true" ></t:dgCol>
   <t:dgCol title="事件"  field="seTrigger"  hidden="true" ></t:dgCol>
   
   <t:dgCol title="类型"  field="seType"   ></t:dgCol>
   <t:dgCol title="状态"  field="seStatus"   ></t:dgCol>
   <t:dgCol title="备注"  field="seNote"  hidden="true" ></t:dgCol>
   <t:dgCol title="排序"  field="seSort"  hidden="true" ></t:dgCol>
   <t:dgCol title="版本"  field="seVersion"  hidden="true" ></t:dgCol>
   
   <t:dgCol title="创建人名称"  field="createName"  hidden="true" ></t:dgCol>
   <t:dgCol title="创建人登录名称"  field="createBy"  hidden="true" ></t:dgCol>
   <t:dgCol title="创建日期"  field="createDate" formatter="yyyy-MM-dd" hidden="true" ></t:dgCol>
   <t:dgCol title="更新人名称"  field="updateName"  hidden="true" ></t:dgCol>
   <t:dgCol title="更新人登录名称"  field="updateBy"  hidden="true" ></t:dgCol>
   <t:dgCol title="更新日期"  field="updateDate" formatter="yyyy-MM-dd" hidden="true" ></t:dgCol>
   
   <t:dgCol title="操作" field="opt" width="100"></t:dgCol>
   <t:dgDelOpt title="删除" url="epBiSearchController.do?doDel&id={id}" />
   <t:dgToolBar title="录入" icon="icon-add" url="epBiSearchController.do?goAdd" funname="add"></t:dgToolBar>
   <t:dgToolBar title="编辑" icon="icon-edit" url="epBiSearchController.do?goUpdate" funname="update"></t:dgToolBar>
   <t:dgToolBar title="批量删除"  icon="icon-remove" url="epBiSearchController.do?doBatchDel" funname="deleteALLSelect"></t:dgToolBar>
   <t:dgToolBar title="查看" icon="icon-search" url="epBiSearchController.do?goUpdate" funname="detail"></t:dgToolBar>
   <t:dgToolBar title="导入" icon="icon-put" funname="ImportXls"></t:dgToolBar>
   <t:dgToolBar title="导出" icon="icon-putout" funname="ExportXls"></t:dgToolBar>
  </t:datagrid>
  </div>
 </div>
 <script type="text/javascript">
 $(document).ready(function(){
 		//给时间控件加上样式
 			$("#epBiSearchListtb").find("input[name='createDate']").attr("class","Wdate").attr("style","height:20px;width:90px;").click(function(){WdatePicker({dateFmt:'yyyy-MM-dd'});});
 			$("#epBiSearchListtb").find("input[name='updateDate']").attr("class","Wdate").attr("style","height:20px;width:90px;").click(function(){WdatePicker({dateFmt:'yyyy-MM-dd'});});
 });
 
//导入
function ImportXls() {
	openuploadwin('Excel导入', 'epBiSearchController.do?upload', "epBiSearchList");
}

//导出
function ExportXls() {
	JeecgExcelExport("epBiSearchController.do?exportXls","epBiSearchList");
}

//模板下载
function ExportXlsByT() {
	JeecgExcelExport("epBiSearchController.do?exportXlsByT","epBiSearchList");
}
 </script>