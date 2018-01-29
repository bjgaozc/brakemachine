<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@include file="/context/tags.jsp"%>
<app:template title="测试">
<form>
<div class="blue pd-10 pd-r-15 text-center">
	<div class="form-group">
		<input type="text" id="personId" placeholder="单击选择人员" class="form-control easyui-validatebox validatebox-text validatebox-invalid">
	</div>
</div>
</form>
<app:choosePerson callback="abc" okBtn="保存" okBtnIconCls="fa fa-save" optionsCode="test" expandAll="false" />
<script>
function abc(userIds){
	log(userIds);
	$("#personId").val(userIds);
	choosePerson.close();
}
</script>
</app:template>