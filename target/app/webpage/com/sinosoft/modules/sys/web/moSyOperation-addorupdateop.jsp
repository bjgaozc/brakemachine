<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@include file="/context/tags.jsp"%>
<app:template title="操作按钮管理">
	<app:form action="moSyOperationController.do?saveop" beforeSubmit="saveopBeforeSubmit" callback="saveopCallback">
		<input type="hidden" name="id" value="${operation.id}">
		<input type="hidden" name="TSFunction.id" value="${functionId}">
		<app:formItem ccsClass="col-12 pd-r-5" title="operate.name" name="operationname" value="${operation.operationname}" required="true" />
		<app:formItem ccsClass="col-12 pd-r-5" title="operate.code" name="operationcode" value="${operation.operationcode}" required="true" />
		<app:formItem type="select" valueField="id" selectUrl="[{id:'0',text:'隐藏'},{id:'1',text:'禁用'},{id:'2',text:'只读'},{id:'3',text:'移除'}]" dataOptions="editable:false,panelHeight:'auto'" 
			ccsClass="col-12 pd-r-5" title="operation.type" name="operationType" value="${operation.operationType}" required="true" />
		<app:formItem type="select" valueField="id" selectUrl="[{id:'0',text:'有效'},{id:'1',text:'无效'}]" dataOptions="editable:false,panelHeight:'auto'" 
			ccsClass="col-12 pd-r-5" title="common.status" name="status" value="${operation.status}" required="true" />
	</app:form>
	<script>
		$(function(){
			setTimeout(function(){
				//$("#status").combobox("setValue","aa");
			},1000);
		});
		
		function saveopBeforeSubmit(){
			//alert($("#operationType").val());
			//alert($("#operationType").combobox("getValue"));
			//$("#operationType").combobox("setValue","1");
			return true;
		}
		
		function saveopCallback(data){
			var s = $.u.cache("moSyOperationIndex");
			s.reloadDg();
			s.dialog.close();
		}
	</script>
</app:template>