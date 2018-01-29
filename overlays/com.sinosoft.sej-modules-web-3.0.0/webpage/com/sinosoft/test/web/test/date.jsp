<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@include file="/context/tags.jsp"%>
<app:template title="日期控件" layoutTitle="日期控件">

<form>
<div class="blue pd-10 pd-r-15 text-center">
	<div class="form-group">
		<input type="text" id="date1" placeholder="日期" class="form-control easyui-datebox" style="width:100%">
	</div>
	<div class="form-group">
		<input type="text" id="date2" placeholder="日期" class="form-control easyui-my97 " style="width:100%"
			data-options="
				skin: 'twoer',
				onpicking:my97Change
			">
	</div>
</div>
</form>

<script>
$(function(){
	log(common.isSixMonths("2017-12-01"));
	//baseCommon.initDate({id:"#date2"});
});

function my97Change(dp){
	if (dp.cal.getDateStr() != dp.cal.getNewDateStr()) {
		alert('选择完成');
	}
}
</script>
</app:template>