<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@include file="/context/tags.jsp"%>
<app:template title="页面控件管理">
<script>
var moSyOperationIndex = {
	commonOp: function(title, url){
		var d = common.dialog({
			title:title,
			width:500,
			height:260,
			content:"url:"+url
		});
		moSyOperationIndex.dialog = d;
		$.u.cache("moSyOperationIndex",moSyOperationIndex);
	},
	add: function(title,url,tableId){
		this.commonOp(title,url);
	},
	update: function(title,url,tableId){
		var row=$('#'+tableId).treegrid("getSelected");
		if(row==null){
			$.messager.alert("提示","请先选择需要编辑的数据","info");
			return;
		}
		this.commonOp(title,url+"&id="+row.id);
	},
	reloadDg:function(){
		$("#operationList").datagrid("reload");
	}
};
</script>
<t:datagrid name="operationList" title="页面控件管理" actionUrl="moSyOperationController.do?opdategrid=true">
	<t:dgCol title="common.id" field="id" hidden="true"></t:dgCol>
	<t:dgCol title="operate.name" field="operationname" width="100"></t:dgCol>
	<t:dgCol title="operate.code" field="operationcode"></t:dgCol>
	<t:dgCol title="common.type" field="operationType" replace="common.hide_0,operationType.disabled_1,operationType.readonly_2,common.remove_3"></t:dgCol>
	<t:dgCol title="common.status" field="status" replace="common.enable_0,common.disable_1"></t:dgCol>
	<t:dgCol title="common.operation" field="opt" width="200"></t:dgCol>
	<t:dgDelOpt url="functionController.do?delop&id={id}" title="common.delete"></t:dgDelOpt>
	<t:dgToolBar title="common.add.param" langArg="common.operation" icon="fa fa-plus" url="moSyOperationController.do?addorupdateop=true" funname="moSyOperationIndex.add"></t:dgToolBar>
	<t:dgToolBar title="common.edit.param" langArg="common.operation" icon="fa fa-edit" url="moSyOperationController.do?addorupdateop=true" funname="moSyOperationIndex.update"></t:dgToolBar>
</t:datagrid>
</app:template>