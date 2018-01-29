<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@include file="/context/tags.jsp"%>
<app:template title="查看护照信息">
<form>
<div class="blue pd-10 pd-r-15 text-center">
	<div class="form-group">
		<input type="text" id="passportId" value="PE0245037" placeholder="查看护照信息" class="form-control easyui-validatebox">
	</div>
</div>
</form>
<script>
$(function(){
	$("#passportId").on("click",function(){
		common.showPassportInfo({
			passportId:$(this).val(),
			readonly:true,
			callback:function(data){
				log(data);
			}
		});
	});
});
</script>
</app:template>