<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@include file="/context/tags.jsp"%>
<app:template title="菜单" layoutTitle="菜单">

<app:menu/>
<script>
$(function(){
	ajax2("menuApiController.do?genMenu", {isSimple:false},function(data){
		log(data);
	});
});
</script>
</app:template>