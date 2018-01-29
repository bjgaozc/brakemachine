<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@include file="/context/mytags.jsp"%>
<sino:plugins type="jquery,easyui,tools,util" />
<%@include file="/webpage/com/sinosoft/modules/wf/ui/moWf.jsp"%>
<script>
	$(function(){
		//setTimeout(function(){$("#wdsp").tabs("select",1);},1000);
		$(".tabs-wrap").addClass("mo_de_wf_bg1");
	});
</script>
<div class="easyui-layout" fit="true">
    <div data-options="region:'center'" style="padding: 0px;background:#fafafa;">
    	<sino:tabs id="wdsp" iframe="true" tabPosition="left">
			<sino:tab id="fqsp" title="发起审批" href="moWfApplyController.do?goApply"></sino:tab>
			<sino:tab id="dwspd" title="待我审批的" href="moWfTaskController.do?index"></sino:tab>
			<sino:tab id="wyspd" title="我已审批的" href="moWfTaskController.do?index"></sino:tab>
			<sino:tab id="wfqd" title="我发起的" href="http://localhost:9900/"></sino:tab>
			<sino:tab id="cswd" title="抄送我的" href="http://localhost:9081/sej-activiti-explorer/?sId=${sessionId}"></sino:tab>
		</sino:tabs>
    </div>
</div>