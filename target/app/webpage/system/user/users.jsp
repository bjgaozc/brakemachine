<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@include file="/context/mytags.jsp"%>
<!DOCTYPE html >
<html>
<head>
<title>角色集合</title>
<sino:plugins type="jquery,easyui-default-1.3.5,tools,util" />
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
	});
	
	function initCheck(data){
		var ids = "${ids}";
		var idArr = ids.split(",");
		for(var i=0;i<idArr.length;i++){
			if(idArr[i]!=""){
				$("#roleList").datagrid("selectRecord",idArr[i]);
			}
		}
	}
</script>
</head>
<body style="overflow-y: hidden" scroll="no">
<t:datagrid  pagination="false"  name="roleList" title="common.role.select"  actionUrl="userController.do?datagridRole" idField="id" checkbox="true" showRefresh="false"  fit="true"  queryMode="group" onLoadSuccess="initCheck">
	<t:dgCol title="common.id" field="id" hidden="true"></t:dgCol>
	<t:dgCol title="common.role.name" field="roleName" width="50" query="true" ></t:dgCol>
</t:datagrid>
</body>
</html>