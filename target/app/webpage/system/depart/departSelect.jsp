<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@include file="/context/mytags.jsp"%>
<!DOCTYPE html >
<html>
<head>
<title>组织机构集合</title>
<sino:plugins type="jquery,easyui,tools"></sino:plugins>
<script type="text/javascript">
$(function(){
	$("input[name='departname']").css({"width":"200px"}).parent().find("span").css({"width":"100px"});
});
</script>
</head>
<body style="overflow-y: hidden" scroll="no">
<t:datagrid name="departList" title="common.department.list" actionUrl="departController.do?departSelectDataGrid" queryMode="group" showRefresh="false">
	<t:dgCol title="common.id" field="id" hidden="true"></t:dgCol>
	<t:dgCol title="common.department.name" field="departname" query="true"></t:dgCol>
</t:datagrid>
</body>
</html>
