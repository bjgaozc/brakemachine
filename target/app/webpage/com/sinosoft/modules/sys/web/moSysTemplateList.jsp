<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@include file="/context/mytags.jsp"%>
<sino:plugins type="jquery,easyui,tools" />
<div class="easyui-layout" fit="true">
  <div region="center" style="padding:1px;">
  <t:datagrid name="moSysTemplateList" checkbox="true" fitColumns="false" title="模板管理" actionUrl="moSysTemplateController.do?datagrid" idField="id" fit="true" queryMode="group">
   <t:dgCol title="主键"  field="id"  hidden="true" ></t:dgCol>
   <t:dgCol title="业务类型"  field="teBusinesstype"   query="true"></t:dgCol>
   <t:dgCol title="模板编码"  field="teCode"   query="true"></t:dgCol>
   <t:dgCol title="模板名称"  field="teName"   query="true"></t:dgCol>
   <t:dgCol title="模板简称"  field="teNameShort"   ></t:dgCol>
   <t:dgCol title="模板英文名称"  field="teNameEn"   ></t:dgCol>
   <t:dgCol title="模板内容"  field="teContent"  hidden="true" ></t:dgCol>
   <t:dgCol title="分组"  field="teGroup"   ></t:dgCol>
   <t:dgCol title="关键字"  field="teKeys"   query="true"></t:dgCol>
   <t:dgCol title="上级主键"  field="teFid"  hidden="true" ></t:dgCol>
   <t:dgCol title="所有上级主键"  field="teFids"  hidden="true" ></t:dgCol>
   <t:dgCol title="文件路径"  field="teFilepath"   ></t:dgCol>
   <t:dgCol title="图片"  field="tePic"   ></t:dgCol>
   
   <t:dgCol title="类型"  field="teType"   ></t:dgCol>
   <t:dgCol title="状态"  field="teStatus"   ></t:dgCol>
   <t:dgCol title="备注"  field="teNote"  hidden="true" ></t:dgCol>
   <t:dgCol title="排序"  field="teSort"  hidden="true" ></t:dgCol>
   <t:dgCol title="版本"  field="teVersion"  hidden="true" ></t:dgCol>
   
   <t:dgCol title="创建人名称"  field="createName"  hidden="true" ></t:dgCol>
   <t:dgCol title="创建人登录名称"  field="createBy"  hidden="true" ></t:dgCol>
   <t:dgCol title="创建日期"  field="createDate" formatter="yyyy-MM-dd" hidden="true" ></t:dgCol>
   <t:dgCol title="更新人名称"  field="updateName"  hidden="true" ></t:dgCol>
   <t:dgCol title="更新人登录名称"  field="updateBy"  hidden="true" ></t:dgCol>
   <t:dgCol title="更新日期"  field="updateDate" formatter="yyyy-MM-dd" hidden="true" ></t:dgCol>
   
   <t:dgCol title="操作" field="opt" width="100"></t:dgCol>
   <t:dgDelOpt title="删除" url="moSysTemplateController.do?doDel&id={id}" />
   <t:dgToolBar title="录入" icon="icon-add" url="moSysTemplateController.do?goAdd" funname="add"></t:dgToolBar>
   <t:dgToolBar title="编辑" icon="icon-edit" url="moSysTemplateController.do?goUpdate" funname="update"></t:dgToolBar>
   <t:dgToolBar title="批量删除"  icon="icon-remove" url="moSysTemplateController.do?doBatchDel" funname="deleteALLSelect"></t:dgToolBar>
   <t:dgToolBar title="查看" icon="icon-search" url="moSysTemplateController.do?goUpdate" funname="detail"></t:dgToolBar>
   <t:dgToolBar title="导入" icon="icon-put" funname="ImportXls"></t:dgToolBar>
   <t:dgToolBar title="导出" icon="icon-putout" funname="ExportXls"></t:dgToolBar>
  </t:datagrid>
  </div>
 </div>
 <script type="text/javascript">
//导入
function ImportXls() {
	openuploadwin('Excel导入', 'moSysTemplateController.do?upload', "moSysTemplateList");
}

//导出
function ExportXls() {
	JeecgExcelExport("moSysTemplateController.do?exportXls","moSysTemplateList");
}
 </script>