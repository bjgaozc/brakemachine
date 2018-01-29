<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@include file="/context/mytags.jsp"%>
<t:base type="jquery,easyui,tools,DatePicker"></t:base>
<div class="easyui-layout" fit="true">
  <div region="center" style="padding:1px;">
  <t:datagrid name="epSysNoticeList" checkbox="true" fitColumns="false" title="系统通知管理" actionUrl="epSysNoticeController.do?datagrid" idField="id" fit="true" queryMode="group">
   <t:dgCol title="主键"  field="id"  hidden="true"  queryMode="single"  width="120"></t:dgCol>
   <t:dgCol title="标题"  field="title" query="true" queryMode="single"  width="300"></t:dgCol>
   <t:dgCol title="关键字"  field="keyword" query="true" queryMode="single"  width="120"></t:dgCol>
   <t:dgCol title="排序"  field="sortnum"  queryMode="single"  width="120"></t:dgCol>
   <t:dgCol title="类型"  field="type" dictionary="xttzlx" queryMode="single"  width="120"></t:dgCol>
   <t:dgCol title="状态"  field="status" dictionary="xttzzt" sortable="true" query="true" queryMode="single"  width="120"></t:dgCol>
   <%--
   <t:dgCol title="内容"  field="content" hidden="false"  queryMode="single"  width="120"></t:dgCol>
   --%>
   <t:dgCol title="所属部门"  field="departmentid" dictionary="t_s_depart,id,departname" queryMode="single"  width="120"></t:dgCol>
   <t:dgCol title="所属用户"  field="userid" dictionary="t_s_base_user,id,realname" queryMode="single"  width="120"></t:dgCol>
   <t:dgCol title="创建用户"  field="createuser" dictionary="t_s_base_user,id,realname" queryMode="single"  width="120"></t:dgCol>
   <t:dgCol title="创建时间"  field="createtime" formatter="yyyy-MM-dd hh:mm:ss" queryMode="single"  width="130"></t:dgCol>
   <t:dgCol title="失效日期"  field="expirydate" formatter="yyyy-MM-dd hh:mm" queryMode="single"  width="130"></t:dgCol>
   <t:dgCol title="操作" field="opt" width="100"></t:dgCol>
   <t:dgDelOpt title="删除" url="epSysNoticeController.do?doDel&id={id}" />
   <t:dgToolBar title="录入" icon="icon-add" url="epSysNoticeController.do?goAdd" funname="add"></t:dgToolBar>
   <t:dgToolBar title="编辑" icon="icon-edit" url="epSysNoticeController.do?goUpdate" funname="update"></t:dgToolBar>
   <t:dgToolBar title="批量删除"  icon="icon-remove" url="epSysNoticeController.do?doBatchDel" funname="deleteALLSelect"></t:dgToolBar>
   <t:dgToolBar title="查看" icon="icon-search" url="epSysNoticeController.do?goUpdate" funname="detail"></t:dgToolBar>
  </t:datagrid>
  </div>
 </div>
 <script type="text/javascript">
 $(document).ready(function(){
 		//给时间控件加上样式
 			$("#epSysNoticeListtb").find("input[name='expirydate']").attr("class","Wdate").attr("style","height:20px;width:90px;").click(function(){WdatePicker({dateFmt:'yyyy-MM-dd'});});
 });
 </script>