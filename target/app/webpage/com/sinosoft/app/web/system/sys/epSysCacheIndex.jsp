<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@include file="/context/mytags.jsp"%>
<sino:plugins type="jquery-1.11.3,easyui-default-1.4.4,tools" />

<div class="easyui-layout" fit="true">
	<div region="center" style="padding: 0px; border: 0px;">
		<table id="epSysCacheList">
			<thead>
				<tr>
					<th field="id" hidden="hidden">编号</th>
					<th field="name">缓存名称</th>
					<th field="type">缓存类型</th>
					<th field="note">备注</th>
				</tr>
			</thead>
		</table>
		<div id="tb2" style="height: 30px;" class="datagrid-toolbar">
			<span style="float: left;"> <a href="javascript:void(0);"
				class="easyui-linkbutton" plain="true" icon="fa fa-lg fa-refresh"
				onclick="reloadTable();" id="">刷新</a> &nbsp;||&nbsp; <a
				href="javascript:void(0);" class="easyui-linkbutton" plain="true"
				icon="fa fa-lg fa-refresh" onclick="refreshCache();" id="">刷新缓存</a>
			</span>
		</div>


	</div>

</div>

<script type="text/javascript"
	src="webpage/com/sinosoft/app/web/system/sys/epSysCacheIndex.js"></script>