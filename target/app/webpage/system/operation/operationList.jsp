<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@include file="/context/mytags.jsp"%>
<script type="text/javascript">
function editoperation(operationId,operationname)
{
	createwindow("<t:mutiLang langKey="common.edit.param" langArg="common.operation"/>","functionController.do?addorupdateop&functionId=${functionId}&id="+operationId);
}
function genCommonOperation(title, url, tableId){
	$.ajax({
		async : false,
		type : "POST",
		url : "moSyOperationController.do?genCommonOperation=true",
		data:{id:"${functionId}"},
		dataType: "json",
		success : function(data) {
			if(data && data.success){
				$("#operationList").datagrid("reload");
				tip(data.msg);
			}else{
				alert(data.msg);
			}
		}
	});
}
</script>
<t:datagrid name="operationList" title="operate.manage" actionUrl="functionController.do?opdategrid&functionId=${functionId}" idField="id">
	<t:dgCol title="common.id" field="id" hidden="true"></t:dgCol>
	<t:dgCol title="operate.name" field="operationname" width="100"></t:dgCol>
	<t:dgCol title="operate.code" field="operationcode"></t:dgCol>
	<t:dgCol title="common.type" field="operationType" replace="common.hide_0,operationType.disabled_1,operationType.readonly_2,common.remove_3"></t:dgCol>
	<t:dgCol title="common.status" field="status" replace="common.enable_0,common.disable_1"></t:dgCol>
<!--	<t:dgCol title="permission.name" field="TSFunction_functionName"></t:dgCol>-->
	<t:dgCol title="common.operation" field="opt" width="200"></t:dgCol>
	<t:dgDelOpt url="functionController.do?delop&id={id}" title="common.delete"></t:dgDelOpt>
	<t:dgFunOpt funname="editoperation(id,operationname)" title="common.edit"></t:dgFunOpt>
	<t:dgToolBar title="common.add.param" langArg="common.operation" icon="fa fa-plus" url="functionController.do?addorupdateop&functionId=${functionId}" funname="add"></t:dgToolBar>
	<t:dgToolBar title="生成通用控件" icon="fa fa-plus" url="functionController.do?addorupdateop&functionId=${functionId}" funname="genCommonOperation"></t:dgToolBar>
	<%-- <t:dgToolBar title="操作编辑" icon="icon-edit" url="functionController.do?addorupdateop&functionId=${functionId}" funname="update"></t:dgToolBar>--%>
</t:datagrid>
