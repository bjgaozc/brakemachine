<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@include file="/context/mytags.jsp"%>
<sino:plugins type="jquery,easyui,tools,date,util" />
<div class="easyui-layout" fit="true">
  <div region="center" style="padding:1px;">
  <t:datagrid name="moSySeqList" fitColumns="false" title="流水号列表" actionUrl="moSySeqController.do?datagrid" idField="id" fit="true" queryMode="group">
   <t:dgCol title="主键"  field="id" hidden="true" width="120" sortable="false"></t:dgCol>
   <t:dgCol title="编码"  field="nameEn" query="true" width="120" sortable="false"></t:dgCol>
   <t:dgCol title="名称"  field="name" query="true" width="120" sortable="false"></t:dgCol>
   <t:dgCol title="类型"  field="type" dictionary="seqType" width="120" sortable="false"></t:dgCol>
   <t:dgCol title="流水"  field="content" width="120" sortable="false"></t:dgCol>
   <t:dgCol title="补全标记"  field="acflag" width="120" sortable="false"></t:dgCol>
   <t:dgCol title="补全位数"  field="acnum" width="120" sortable="false"></t:dgCol>
   <t:dgCol title="前缀"  field="prefix" formatter="prefixFormatter" width="200" sortable="false"></t:dgCol>
   <t:dgCol title="后缀"  field="suffix" formatter="prefixFormatter" width="200" sortable="false"></t:dgCol>
   <t:dgCol title="业务类型"  field="businessType" width="120" hidden="true" sortable="false"></t:dgCol>
   <t:dgCol title="更新时间"  field="updateTime"  dateformatter="yyyy-MM-dd hh:mm:ss"  width="130"></t:dgCol>
   <t:dgCol title="操作" field="opt" width="100"></t:dgCol>
   <t:dgDelOpt title="删除" url="moSySeqController.do?doDel&id={id}" />
   <t:dgToolBar title="录入" icon="icon-add" url="moSySeqController.do?goAdd" funname="add"></t:dgToolBar>
   <t:dgToolBar title="编辑" icon="icon-edit" url="moSySeqController.do?goUpdate" funname="update"></t:dgToolBar>
   <t:dgToolBar title="查看" icon="icon-search" url="moSySeqController.do?goUpdate" funname="detail"></t:dgToolBar>
   <t:dgToolBar title="流水号缓存" icon="icon-add" url="moSySeqController.do?goCache" funname="update"></t:dgToolBar>
   <t:dgToolBar title="查看流水号缓存列表" icon="icon-search" url="moSySeqController.do?goCacheList" funname="update"></t:dgToolBar>
   <t:dgToolBar title="同步到普通流水" icon="icon-add" url="moSySeqController.do?syncSeq" funname="syncSeq"></t:dgToolBar>
  </t:datagrid>
  </div>
 </div>
 <script src = "webpage/com/sinosoft/modules/sys/web/moSySeq-index.js"></script>
 <script type="text/javascript">
 $(document).ready(function(){
 });
 </script>