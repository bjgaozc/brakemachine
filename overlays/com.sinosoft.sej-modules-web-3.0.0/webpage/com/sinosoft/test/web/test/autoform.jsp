<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@include file="/context/tags.jsp"%>
<app:template title="自动表单">

<div id="autoformDiv">
	
</div>
<script>
$(function(){

	$.getJSON("api/autoform/renderPage/shenpi.do",{op:"view",id:"402880f25b14b745015b14b7458d0000"},function(data){
//		console.log(data.attributes.formContent);
		$("#autoformDiv").html(data.attributes.formContent);
	});
	
});
</script>
</app:template>

