<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@include file="/context/tags.jsp"%>
<app:template type="ntko">
<html>
<head><title>文档管理-新建</title></head>
<sino:plugins type="jquery,util" />
<script type="text/javascript">
function initAll(){
	var a = $.u.cache("abcd");
}
$(function(){
	initAll();
});
</script>
<body>
<div id="officecontrol"></div>
<app:officecontrol caption="文档管理-添加" />
</body>
</html>
</app:template>