<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@include file="/context/mytags.jsp"%>
<sino:plugins type="jquery,easyui,tools,date,util" />
<script src = "webpage/com/sinosoft/demo/web/mongodb-index.js"></script>
<script type="text/javascript">
$(function(){
	mongodbIndex.initAll();
});
</script>

<div class="easyui-layout" fit="true">   
    <%--
    <div data-options="region:'north',title:'操作 mongodb',split:true" style="height:100px;"></div>
    <div data-options="region:'south',title:'South Title',split:true" style="height:100px;"></div>
    <div data-options="region:'east',iconCls:'icon-reload',title:'East',split:true" style="width:100px;"></div>
    <div data-options="region:'west',title:'West',split:true" style="width:100px;"></div>
    --%>
    <div data-options="region:'center',title:'操作 mongodb'" style="padding:1px;background:#eee;">
	    <table id="demoIndexDg"></table>
    </div>
</div>

