<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@include file="/context/mytags.jsp"%>
<sino:plugins type="jquery,easyui,tools" />
<div class="easyui-layout" fit="true">
  <div region="center" style="padding:1px;">
  <t:datagrid name="moSysTemplateDrList" checkbox="true" fitColumns="false" title="模板变量表" actionUrl="moSysTemplateDrController.do?datagrid" idField="id" fit="true" queryMode="group">
   <t:dgCol title="主键"  field="id"  hidden="true" ></t:dgCol>
   <t:dgCol title="模板主键"  field="teId"   ></t:dgCol>
   <t:dgCol title="上级主键"  field="teDrFid"   ></t:dgCol>
   <t:dgCol title="所有上级主键"  field="teDrFids"  hidden="true" ></t:dgCol>
   <t:dgCol title="编码"  field="teDrCode"   query="true"></t:dgCol>
   <t:dgCol title="名称"  field="teDrName"   query="true"></t:dgCol>
   <t:dgCol title="控件主键"  field="teDrControlid"   ></t:dgCol>
   <t:dgCol title="控件名称"  field="teDrControlname"   ></t:dgCol>
   <t:dgCol title="控件类型"  field="teDrControltype"   ></t:dgCol>
   <t:dgCol title="皮肤"  field="teDrSkin"  hidden="true" ></t:dgCol>
   <t:dgCol title="样式类"  field="teDrClass"  hidden="true" ></t:dgCol>
   <t:dgCol title="样式"  field="teDrStyle"  hidden="true" ></t:dgCol>
   <t:dgCol title="事件优先级"  field="teDrTriggerSort"  hidden="true" ></t:dgCol>
   <t:dgCol title="配置是否刷新"  field="teDrConfigIsfresh"  hidden="true" ></t:dgCol>
   
   <t:dgCol title="类型"  field="teDrType"   ></t:dgCol>
   <t:dgCol title="状态"  field="teDrStatus"   ></t:dgCol>
   <t:dgCol title="备注"  field="teDrNote"  hidden="true" ></t:dgCol>
   <t:dgCol title="排序"  field="teDrSort"  hidden="true" ></t:dgCol>
   <t:dgCol title="版本"  field="teDrVersion"  hidden="true" ></t:dgCol>
   
   <t:dgCol title="创建人名称"  field="createName"  hidden="true" ></t:dgCol>
   <t:dgCol title="创建人登录名称"  field="createBy"  hidden="true" ></t:dgCol>
   <t:dgCol title="创建日期"  field="createDate" formatter="yyyy-MM-dd" hidden="true" ></t:dgCol>
   <t:dgCol title="更新人名称"  field="updateName"  hidden="true" ></t:dgCol>
   <t:dgCol title="更新人登录名称"  field="updateBy"  hidden="true" ></t:dgCol>
   <t:dgCol title="更新日期"  field="updateDate" formatter="yyyy-MM-dd" hidden="true" ></t:dgCol>
   
   <t:dgCol title="操作" field="opt" width="100"></t:dgCol>
   <t:dgDelOpt title="删除" url="moSysTemplateDrController.do?doDel&id={id}" />
   <t:dgToolBar title="录入" icon="icon-add" url="moSysTemplateDrController.do?goAdd" funname="add"></t:dgToolBar>
   <t:dgToolBar title="编辑" icon="icon-edit" url="moSysTemplateDrController.do?goUpdate" funname="update"></t:dgToolBar>
   <t:dgToolBar title="批量删除"  icon="icon-remove" url="moSysTemplateDrController.do?doBatchDel" funname="deleteALLSelect"></t:dgToolBar>
   <t:dgToolBar title="查看" icon="icon-search" url="moSysTemplateDrController.do?goUpdate" funname="detail"></t:dgToolBar>
   <t:dgToolBar title="导入" icon="icon-put" funname="ImportXls"></t:dgToolBar>
   <t:dgToolBar title="导出" icon="icon-putout" funname="ExportXls"></t:dgToolBar>
  </t:datagrid>
  </div>
 </div>
 <script type="text/javascript">
//导入
function ImportXls() {
	openuploadwin('Excel导入', 'moSysTemplateDrController.do?upload', "moSysTemplateDrList");
}

//导出
function ExportXls() {
	JeecgExcelExport("moSysTemplateDrController.do?exportXls","moSysTemplateDrList");
}
 </script>