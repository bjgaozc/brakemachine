<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@include file="/context/mytags.jsp"%>
<!DOCTYPE html>
<html>
<head>
<title>用户信息</title>
<t:base type="jquery,easyui,tools"></t:base>
<script type="text/javascript" src="plug-in/sino/encode.js"></script>
<script type="text/javascript">
function beforeFun(){
	$("#password").val(encode.encode64($("#password").val()));
    $("#newpassword_").val(encode.encode64($("#newpassword_").val()));
    $("#newpassword").val(encode.encode64($("#newpassword").val()));
    return true;
}
</script>
</head>
<body style="overflow-y: hidden" scroll="no">
<t:formvalid formid="formobj" refresh="false" dialog="true" action="userController.do?savenewpwd" usePlugin="password" layout="table" beforeSubmit="beforeFun">
	<input id="id" type="hidden" value="${user.id }">
	<table cellpadding="0" cellspacing="1" class="formtable">
		<tbody>
			<tr>
				<td align="right" width="20%"><span class="filedzt">原密码:</span></td>
				<td class="value"><input id="password" type="password" value="" name="password" autocomplete="off" class="inputxt" datatype="*" errormsg="请输入原密码" /> <span class="Validform_checktip"> 请输入原密码 </span></td>
			</tr>
			<tr>
				<td align="right"><span class="filedzt">新密码:</span></td>
				<td class="value"><input id="newpassword_" type="password" value="" name="newpassword" autocomplete="off" class="inputxt" plugin="passwordStrength" datatype="*6-18" errormsg="密码至少6个字符,最多18个字符！" /> <span
					class="Validform_checktip"> 密码至少6个字符,最多18个字符！ </span> <span class="passwordStrength" style="display: none;"> <b>密码强度：</b> <span>弱</span><span>中</span><span class="last">强</span> </span></td>
			</tr>
			<tr>
				<td align="right"><span class="filedzt">重复密码:</span></td>
				<td class="value"><input id="newpassword" type="password" recheck="newpassword" autocomplete="off" class="inputxt" datatype="*6-18" errormsg="两次输入的密码不一致！"> <span class="Validform_checktip"></span></td>
			</tr>
		</tbody>
	</table>
</t:formvalid>
</body>