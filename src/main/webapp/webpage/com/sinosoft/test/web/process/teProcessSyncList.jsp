<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@include file="/context/tags.jsp"%>
<app:template>
<div class="easyui-layout" fit="true">
  <div region="center" style="padding:1px;">
  <t:datagrid name="teProcessSyncList" title="流程同步" actionUrl="teProcessSyncController.do?datagrid" fit="true" queryMode="group">
   <t:dgCol title="主键"  field="id"  hidden="true" ></t:dgCol>
   <t:dgCol title="申请号"  field="syApplyid"   query="true"></t:dgCol>
   <t:dgCol title="申请类型"  field="syApplytype"   ></t:dgCol>
   <t:dgCol title="级别"  field="syLevel"   ></t:dgCol>
   <t:dgCol title="节点编码"  field="syNodecode"   ></t:dgCol>
   <t:dgCol title="节点中文名"  field="syNodename"   ></t:dgCol>
   <t:dgCol title="用户名"  field="syUsername"   query="true"></t:dgCol>
   <t:dgCol title="姓名"  field="syRealname"   ></t:dgCol>
   <t:dgCol title="最新流程进度"  field="syCurrentpro"   ></t:dgCol>
   
   <t:dgCol title="类型"  field="syType"   ></t:dgCol>
   <t:dgCol title="状态"  field="syStatus"   ></t:dgCol>
   <t:dgCol title="备注"  field="syNote"  hidden="true" ></t:dgCol>
   <t:dgCol title="排序"  field="sySort"   ></t:dgCol>
   <t:dgCol title="版本"  field="syVersion"  hidden="true" ></t:dgCol>
   
   <t:dgCol title="创建人名称"  field="createName"  hidden="true" ></t:dgCol>
   <t:dgCol title="创建人登录名称"  field="createBy"  hidden="true" ></t:dgCol>
   <t:dgCol title="创建日期"  field="createDate" formatter="yyyy-MM-dd" hidden="true" ></t:dgCol>
   <t:dgCol title="更新人名称"  field="updateName"  hidden="true" ></t:dgCol>
   <t:dgCol title="更新人登录名称"  field="updateBy"  hidden="true" ></t:dgCol>
   <t:dgCol title="更新日期"  field="updateDate" formatter="yyyy-MM-dd" hidden="true" ></t:dgCol>
   
   <t:dgCol title="操作" field="opt" width="100"></t:dgCol>
   <t:dgDelOpt title="删除" url="teProcessSyncController.do?doDel&id={id}" />
   <t:dgToolBar title="录入" icon="fa fa-plus" url="teProcessSyncController.do?goAdd" funname="add"></t:dgToolBar>
   <t:dgToolBar title="编辑" icon="fa fa-edit" url="teProcessSyncController.do?goUpdate" funname="update"></t:dgToolBar>
   <t:dgToolBar title="批量删除"  icon="fa fa-remove" url="teProcessSyncController.do?doBatchDel" funname="deleteALLSelect"></t:dgToolBar>
   <t:dgToolBar title="查看2" icon="fa fa-eye" url="teProcessSyncController.do?goUpdate" funname="detail" operationCode="detail"></t:dgToolBar>
  </t:datagrid>
  </div>
 </div>
 <script type="text/javascript">
 $(document).ready(function(){
 		//给时间控件加上样式
 			$("#teProcessSyncListtb").find("input[name='createDate']").attr("class","Wdate").attr("style","height:20px;width:90px;").click(function(){WdatePicker({dateFmt:'yyyy-MM-dd'});});
 			$("#teProcessSyncListtb").find("input[name='updateDate']").attr("class","Wdate").attr("style","height:20px;width:90px;").click(function(){WdatePicker({dateFmt:'yyyy-MM-dd'});});
 });
 
//导入
function ImportXls() {
	openuploadwin('Excel导入', 'teProcessSyncController.do?upload', "teProcessSyncList");
}

//导出
function ExportXls() {
	JeecgExcelExport("teProcessSyncController.do?exportXls","teProcessSyncList");
}

//模板下载
function ExportXlsByT() {
	JeecgExcelExport("teProcessSyncController.do?exportXlsByT","teProcessSyncList");
}
 </script>
</app:template>