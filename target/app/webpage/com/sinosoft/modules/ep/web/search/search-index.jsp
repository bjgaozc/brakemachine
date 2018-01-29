<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@include file="/context/tags.jsp"%>
<app:template title="通用查询" autoloadjs="true" layoutTitle="${title}">
	<script type="text/javascript">${js}</script>
	<div class="easyui-layout" fit="true">
		<!-- north高度 可根据实际情况定义，暂不支持自动 -->
		<div region="north" style="padding:1px 1px;height: 65px;overflow-y: auto;">
		  	<div style="padding:10px 10px;">
		  		<div id="conditionWhereDivId">
				  	<c:forEach var="_table" items="${tableList}">
						<app:searchCondition type="${_table.type}" column="${_table.column}" maxlength="${_table.maxlength}" value="${_table.value}" text="${_table.text}" />
				  	</c:forEach>
			  	</div>
			  	<div style="float: right;">
			  		<a href="javascript:void(0)" class="easyui-linkbutton" icon="fa fa-search" onclick="searchDataGrid();">查询</a>
			  		<a href="javascript:void(0)" class="easyui-linkbutton" icon="fa fa-search" onclick="setGrade();">高级查询</a>
		  		</div>
		  	</div>
		  	
		  	<div id="dgTb">
		  		<div style="background: #eee;">
			  		<a href="javascript:void(0)" class="easyui-linkbutton" icon="fa fa-filter" plain="true" onclick="setOutput();">设置输出项</a>
			  		<input id="code" name="code" value="${code}">
			  		<a href="javascript:void(0)" class="easyui-linkbutton" icon="fa fa-undo" plain="true" onclick="refreshConfig();">刷新配置</a>
			  		<a href="javascript:void(0)" class="easyui-linkbutton" icon="fa fa-download" plain="true" onclick="exportXls();">导出Excel</a>
		  		</div>
		  	</div>
		  	
		</div>
		<div region="center" style="padding:1px;">
			<table id="dg"></table>
		</div>
	</div>
</app:template>