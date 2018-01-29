<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@include file="/context/mytags.jsp"%>
<sino:plugins type="jquery,easyui,tools,util"/>
<div class="easyui-layout" fit="true">
  <div region="center" style="padding:1px;">
  <t:datagrid name="pdList" fitColumns="false" title="流程定义管理" actionUrl="moWfProcessController.do?pdList" queryMode="group">
   <t:dgCol title="流程定义主键"  field="id" width="150" sortable="false"></t:dgCol>
   <t:dgCol title="部署主键"  field="deploymentId" sortable="false"></t:dgCol>
   <t:dgCol title="名称"  field="name"  query="true" width="200" sortable="false"></t:dgCol>
   <t:dgCol title="关键字"  field="key" query="true" sortable="false"></t:dgCol>
   <t:dgCol title="版本号"  field="version"  sortable="false"></t:dgCol>
   <t:dgCol title="XML"  field="xml" formatter="moWfProcessIndex.xmlFormatter" width="200" sortable="false"></t:dgCol>
   <t:dgCol title="图片"  field="image" formatter="moWfProcessIndex.imageFormatter" width="200" sortable="false"></t:dgCol>
   <t:dgCol title="部署时间"  field="deploymentTime" width="200" sortable="false"></t:dgCol>
   <t:dgCol title="是否挂起"  field="suspended" formatter="moWfProcessIndex.suspendedFormatter" sortable="false"></t:dgCol>
   
   <t:dgCol title="操作" field="opt" width="100"></t:dgCol>
   <t:dgFunOpt title="启动" funname="moWfProcessIndex.start(id)"></t:dgFunOpt>
   <t:dgDelOpt title="删除" url="moWfProcessController.do?deleteDeployment&id={deploymentId}" />
   <t:dgToolBar title="部署流程" icon="icon-add" url="moWfProcessController.do?goDeploy" height="200" funname="add"></t:dgToolBar>
  </t:datagrid>
  </div>
 </div>
<script src = "webpage/com/sinosoft/modules/wf/web/moWfProcess-index.js"></script>		
<script type="text/javascript">
$(function(){
	moWfProcessIndex.initAll();
});
</script>