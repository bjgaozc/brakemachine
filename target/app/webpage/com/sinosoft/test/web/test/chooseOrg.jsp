<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@include file="/context/tags.jsp"%>
<app:template title="测试">

<app:chooseOrg targetOnclickId=".btnc" onclick="abc" expandAll="false"/>
<a href="javascript:void(0);" class="easyui-linkbutton btnc" ><i class="fa fa-link"></i>选择单位</a>
<input type="text" id="orgid" >
<input type="text" id="org" >

<hr>
<app:chooseOrg loadType="rbr" id="org2" targetOnclickId="#org2" targetId="#orgid2" targetName="#org2" />
<input type="text" id="orgid2" >
<input type="text" id="org2" placeholder="请点击选择单位" readonly="readonly" >

<hr>
<app:chooseOrg loadType="rbr" targetType="1" id="org11" targetId="#org11Div" onclick="def" />
<div id="org11Div" style="width: 300px;height: 600px;background: #e0e0e0;"></div>

<script>
function abc(ids){
	log(ids);
	log(org);
}
function def(ids){
	log(ids);
	log(org11);
}
</script>
			
</app:template>