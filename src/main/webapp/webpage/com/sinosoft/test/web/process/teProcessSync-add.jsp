<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@include file="/context/tags.jsp"%>
<app:template>
<t:formvalid formid="formobj" dialog="true" layout="table" action="teProcessSyncController.do?doAdd" tiptype="1">
	<%@include file="teProcessSync-form.jsp"%>
</t:formvalid>
</app:template>	