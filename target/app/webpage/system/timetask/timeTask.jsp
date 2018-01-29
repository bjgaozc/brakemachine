<%@ page language="java" import="java.util.*" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@include file="/context/mytags.jsp"%>
<!DOCTYPE html>
<html>
<head>
<title>定时任务管理</title>
<t:base type="jquery,easyui,tools,DatePicker"></t:base>
<script type="text/javascript">
	$(function(){
		$("#timedType1").click();
	});
	
	function timedTypeOnclick(obj){
		if(obj.value!=2){
			$("#timedType1DivId").show();
			$("#timedType2DivId").hide();
			
			$("#timedDate").attr("datatype","*");
			$("#timedDescription").attr("datatype","*");
			
			$("#taskId").removeAttr("datatype");
			$("#taskDescribe").removeAttr("datatype");
			$("#cronExpression").removeAttr("datatype");
		}else{
			$("#timedType1DivId").hide();
			$("#timedType2DivId").show();
			
			$("#timedDate").removeAttr("datatype");
			$("#timedDescription").removeAttr("datatype");
			
			$("#taskId").attr("datatype","*");
			$("#taskDescribe").attr("datatype","*");
			$("#cronExpression").attr("datatype","*");
		}
	}
</script>
</head>
<body style="overflow-y: hidden" scroll="no">
<t:formvalid formid="formobj" dialog="true" usePlugin="password" layout="div" action="timeTaskController.do?save">
	<input id="id" name="id" type="hidden" value="${timeTaskPage.id }">
	<input id="isEffect" name="isEffect" type="hidden" value="${(empty timeTaskPage.isEffect)?timeTaskPage.isEffect:0}">
	<input id="isStart" name="isStart" type="hidden" value="${(empty timeTaskPage.isStart)?timeTaskPage.isStart:1 }">
	<fieldset class="step">
	
	<div class="form">
		<label class="Validform_label">类型:</label> 
		<input type="radio" id="timedType0" name="timedType" value="0" onclick="timedTypeOnclick(this);" <c:if test="${timeTaskPage.timedType==0}">checked="checked"</c:if>>每天
		&nbsp;
		<input type="radio" id="timedType1" name="timedType" value="1" onclick="timedTypeOnclick(this);" <c:if test="${timeTaskPage.timedType==1}">checked="checked"</c:if>>一次
		&nbsp;
		<input type="radio" id="timedType2" name="timedType" value="2" onclick="timedTypeOnclick(this);" <c:if test="${null==timeTaskPage.timedType || timeTaskPage.timedType==2}">checked="checked"</c:if>>其它
		<span class="Validform_checktip"></span>
	</div>
	
	<div id="timedType1DivId" style="display: none;">
	
	<div class="form">
		<label class="Validform_label">提醒日期:</label> 
		<input class="inputxt" id="timedDate" name="timedDate" value="${timeTaskPage.timedDate}" onclick="WdatePicker({dateFmt:'yyyy-MM-dd HH:mm'})" datatype="*" class="Wdate" style="width: 300px;">
		<span class="Validform_checktip"></span>
	</div>
	
	<div class="form">
		<label class="Validform_label">提醒内容:</label> 
		<textarea id="timedDescription" name="timedDescription" style="width: 100%;height: 150px;" datatype="s1-3">${timeTaskPage.timedDescription}</textarea>
		<span class="Validform_checktip"></span>
	</div>
	
	</div>
	
	<div id="timedType2DivId">
	
	<div class="form">
		<label class="Validform_label">任务ID:</label> 
		<input class="inputxt" id="taskId" name="taskId" value="${timeTaskPage.taskId}" datatype="*" style="width: 300px;">
		<span class="Validform_checktip"></span>
	</div>
	<div class="form">
		<label class="Validform_label">任务描述:</label> 
		<input class="inputxt" id="taskDescribe" name="taskDescribe" value="${timeTaskPage.taskDescribe}" style="width: 300px;">
		<span class="Validform_checktip"></span>
	</div>
	<div class="form">
		<label class="Validform_label">cron表达式:</label> 
		<input class="inputxt" id="cronExpression" name="cronExpression" value="${timeTaskPage.cronExpression}" datatype="*" style="width: 300px;">
		<span class="Validform_checktip"></span>
	</div>
	
	</div>
	
	
	
	</fieldset>
</t:formvalid>
</body>