<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@include file="/context/tags.jsp"%>
<app:template title="字典项管理" autoloadjs="true">
	<sino:plugins loadType="rbr" type="syExtEasyUI"/>
	<div class="easyui-layout" fit="true">
	  <div region="center" style="padding:1px;">
		<table id="sysCodeTreeGridId"></table>
	  </div>
	</div>
	<div id="sysCodeTreeGridTbId">
		<a href="javascript:void(0);" class="easyui-linkbutton" plain="true" icon="fa fa-plus" onclick="editCode('add')">添加</a>
		<a href="javascript:void(0);" class="easyui-linkbutton" plain="true" icon="fa fa-edit" onclick="editCode('edit')">编辑</a>
		<a href="javascript:void(0);" class="easyui-linkbutton" plain="true" icon="fa fa-undo" onclick="sysCodeTreeGrid.reloadTable();">刷新</a> 
	</div>
</app:template>