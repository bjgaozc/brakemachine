<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@include file="/context/mytags.jsp"%>
<sino:plugins type="jquery,easyui,tools,date,util" />
<script src = "webpage/com/sinosoft/demo/web/index.js"></script>
<script type="text/javascript">
$(function(){
	demoIndex.initAll();
});
</script>
<div class="easyui-layout" fit="true">
    <div data-options="region:'center'" style="padding: 0px;background:#fafafa;">
    	<sino:tabs id="demo" iframe="true" tabPosition="left">
			<sino:tab id="vaadin" title="测试Vaadin" href="http://localhost:9900/"></sino:tab>
			<sino:tab id="vaadin" title="测试Vaadin2" href="apps/helloworld"></sino:tab>
			<sino:tab id="mongodb" title="操作 mongodb" href="deCoToPage.do?to=true&p=mongodb-index"></sino:tab>
		</sino:tabs>
    </div>
</div>