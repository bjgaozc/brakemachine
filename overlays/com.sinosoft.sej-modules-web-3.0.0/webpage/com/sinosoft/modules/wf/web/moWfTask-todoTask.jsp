<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@include file="/context/mytags.jsp"%>
<sino:plugins type="jquery,easyui,tools,util"/>
<style>
	.datagrid-row{height: 45px;}
</style>
<script src = "webpage/com/sinosoft/modules/wf/web/moWfTask-todoTask.js"></script>	
<script type="text/javascript">
$(function(){
	moWfTaskTodoTask.initAll();
});
</script>

<div class="easyui-layout" fit="true">
    <div data-options="region:'east',iconCls:'icon-reload',title:'任务相关事件',split:true,collapsed:false" style="width:300px;"></div>
    <div data-options="region:'center',title:'待办任务'" style="padding: 1px;">
		<div class="easyui-layout" fit="true" border="false">
		    <div data-options="region:'north'" style="height:40px;background:#eee;">
		    	<div style="margin-top: 5px;">
		    		<div style="float: left;width: 50%;"><a href="#" class="easyui-linkbutton" iconcls="icon-add" onclick="moWfTaskTodoTask.newTask();">新任务</a></div>
		    		<div style="width: 50%;float: right;text-align: right;">
<!-- 		    			<input type="text" name="newTask" style="width: 300px;height: 28px;" placeholder="回车创建任务" >&nbsp; -->
		    		</div>
		    	</div>
		    </div>
		    <div data-options="region:'west'" style="width:350px;padding: 1px;">
		    	<table id="todoTaskList"></table>
		    </div>
		    <div data-options="region:'center'" style="padding: 1px;">
		    	<div id="contentView"></div>
		    </div>
		</div>
    </div>
</div>



