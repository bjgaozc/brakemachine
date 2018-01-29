<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@include file="/context/tags.jsp"%>
<app:template title="选择国家" layoutTitle="选择国家">
<div class="blue pd-10 pd-r-15 text-center">
	<div class="form-group">
		<input type="text" id="country" placeholder="单击选择国家" class="form-control easyui-validatebox validatebox-text validatebox-invalid">
	</div>
</div>
<div class="blue pd-10 pd-r-15 text-center">
	<div class="form-group">
		<input type="text" id="country2" placeholder="单击选择国家，支持多选" class="form-control easyui-validatebox validatebox-text validatebox-invalid">
	</div>
</div>

<app:chooseCountry />
<app:chooseCountry loadType="rbr" targetId="#country2" multiple="true" />
<script>
</script>
</app:template>