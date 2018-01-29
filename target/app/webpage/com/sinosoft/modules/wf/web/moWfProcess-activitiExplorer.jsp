<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@include file="/context/mytags.jsp"%>
<sino:plugins type="jquery,easyui,tools,util" />
<script>
	$(function(){
		var cp = $("#wfContent").layout("panel","center");
		cp.panel("setTitle",'<a href="javascript:void(0);" class="wfOpenBtn" onclick="openOnPage();" iconcls="icon-default">本页面打开</a></span><a href="${activitiExplorerUrl}" target="_blank" class="wfOpenBtn" iconcls="icon-redo">弹出</a>');
		$(".wfOpenBtn").linkbutton();
		openOnPage();
	});
	function openOnPage(){
		$("#aeIframe").attr("src","${activitiExplorerUrl}");
	}
</script>
<div id="wfContent" class="easyui-layout" fit="true">
    <div data-options="region:'center',title:'aaavvvv'" style="padding: 0px;">
		<iframe id="aeIframe" src="" frameborder="0" style="border:0;width:100%;height:100%;"></iframe>
    </div>
</div>