<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@include file="/context/mytags.jsp"%>
<sino:plugins type="jquery-1.11.3,easyui-default-1.4.4,tools" />
<div class="easyui-layout" fit="true">
  <div region="center" style="padding:1px;">
  <t:datagrid name="epSysSeqList" checkbox="true" fitColumns="false" title="流水号管理" actionUrl="epSysSeqController.do?datagrid" idField="id" fit="true" queryMode="group">
   <t:dgCol title="主键"  field="id" hidden="true" width="120"></t:dgCol>
   <t:dgCol title="编码"  field="nameEn" query="true" width="120"></t:dgCol>
   <t:dgCol title="名称"  field="name" query="true" width="120"></t:dgCol>
   <t:dgCol title="类型"  field="type" dictionary="seqType" width="120"></t:dgCol>
   <t:dgCol title="流水"  field="content" width="120"></t:dgCol>
   <t:dgCol title="补全标记"  field="acflag" width="120"></t:dgCol>
   <t:dgCol title="补全位数"  field="acnum" width="120"></t:dgCol>
   <t:dgCol title="前缀"  field="prefix" formatter="prefixFormatter" width="200"></t:dgCol>
   <t:dgCol title="后缀"  field="suffix" formatter="prefixFormatter" width="200"></t:dgCol>
   <t:dgCol title="业务类型"  field="businessType" width="120" hidden="true"></t:dgCol>
   <t:dgCol title="更新时间"  field="updateTime"  dateformatter="yyyy-MM-dd hh:mm:ss" width="130"></t:dgCol>
   <t:dgCol title="操作" field="opt" width="100"></t:dgCol>
   <t:dgDelOpt title="删除" url="epSysSeqController.do?doDel&id={id}" />
   <t:dgToolBar title="录入" icon="fa fa-lg fa-plus" url="epSysSeqController.do?goAdd" funname="add"></t:dgToolBar>
   <t:dgToolBar title="编辑" icon="fa fa-lg fa-edit" url="epSysSeqController.do?goUpdate" funname="update"></t:dgToolBar>
   <t:dgToolBar title="批量删除"  icon="fa fa-lg fa-remove" url="epSysSeqController.do?doBatchDel" funname="deleteALLSelect"></t:dgToolBar>
   <t:dgToolBar title="查看" icon="fa fa-lg fa-eye" url="epSysSeqController.do?goUpdate" funname="detail"></t:dgToolBar>
   <t:dgToolBar title="流水号缓存" icon="fa fa-lg fa-history" url="epSysSeqController.do?goCache" funname="update"></t:dgToolBar>
   <t:dgToolBar title="流水号缓存列表" icon="fa fa-lg fa-list" url="epSysSeqController.do?goCacheList" funname="add"></t:dgToolBar>
  </t:datagrid>
  </div>
 </div>
 <script src = "webpage/com/sinosoft/app/web/system/sys/epSysSeqList.js"></script>		
