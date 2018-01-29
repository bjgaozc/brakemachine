<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@include file="/context/tags.jsp"%>
<app:template title="业务编码" autoloadjs="true">
	<app:chooseCountry />
	<script>
		var status='${status}';
	</script>
	<app:form  btnType='1' id="codeFormId">
		<app:formItem ccsClass="col-12 pd-l-5 pd-r-5" name="fthCode" title="父编号 " required="true" value="${fthCode }"/>
		<app:formItem ccsClass="col-12 pd-l-5 pd-r-5" name="chdCode" title="编码 " required="true" value="${chdCode }"/>
		<app:formItem ccsClass="col-12 pd-l-5 pd-r-5" name="chdCname" title="编码名称 " required="true" />
		<app:formItem ccsClass="col-12 pd-l-5 pd-r-5" name="chdSysCode" title="编码值 " />
		<app:formItem ccsClass="col-12 pd-l-5 pd-r-5" name="chdEname" title="编码英文名称 " />
		<app:formItem value="${valide}" type="select" selectUrl="[{id:'1',text:'是'},{id:'0',text:'否'}]" ccsClass="col-12 pd-l-5 pd-r-5" dataOptions="editable:false,panelHeight:'auto'" title="是否可用" name="valide" required="true"/>
		<app:formItem ccsClass="col-12 pd-l-5 pd-r-5" name="sort" title="排序 " value="100"/>
		<div class="col-12 pd-r-5 pd-l-5 text-center"  >
			<a href="javascript:void(0);" onclick="saveCityInfo();" icon="fa fa-save" class="easyui-linkbutton" >保存</a>
			<a href="javascript:void(0);" onclick="clearWin();"  icon="fa fa-remove" class="easyui-linkbutton" >关闭</a>
		</div>
	</app:form>
</app:template>