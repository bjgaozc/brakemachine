<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@include file="/context/mytags.jsp"%>
<!DOCTYPE html >
<html>
<head>
<title>角色集合</title>
<sino:plugins type="jquery,easyui,tools,util" />
<script type="text/javascript">
	$(function(){
		var roleid = '${roleid}';
		if(roleid && ""!=roleid){
			var roleList = $("#roleList").datagrid();
			setTimeout(function(){
				var roleidArr = roleid.split(",");
				for(var i=0;i<roleidArr.length;i++){
					var roleCode = roleidArr[i];
					if(""!=roleCode){
						var roleCodeIndex = roleList.datagrid("getRowIndex",roleCode);
						roleList.datagrid("checkRow",roleCodeIndex);
					}
				}
			},500);
		}
	})
</script>
</head>
<body style="overflow-y: hidden" scroll="no">
<t:datagrid name="roleList" title="按角色选择" actionUrl="userController.do?datagridRole" idField="id" checkbox="true" showRefresh="false" pagination="false">
	<t:dgCol title="编号" field="id" hidden="false"></t:dgCol>
	<t:dgCol title="角色名称" field="roleName" width="50"></t:dgCol>
</t:datagrid>
</body>
</html>
