<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@include file="/context/mytags.jsp"%>
<sino:plugins type="jquery,easyui,tools,My97DatePicker,util" />
<script>
$(function(){
	var sc = $("div[name=searchColums]");
	sc.append("&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;角色:<input id='roleidId' name='roleid' >");
	initCombobox("roleidId", "appCommonController.do?getComboDs=true&tableName=t_s_role&id=id&text=rolename");
});

var roleNameReplace = $.parseJSON('${roleNameReplace}');
function roleNameFormatter(value,row,index){
	if(roleNameReplace){
		value = roleNameReplace[row.id];
	}else{
		value="请先在进入用户管理的url后面加上 &queryRole=true ";
	}
	if(!value || null==value || value=="null") value = "";
	return value;
}

/**
 * 重置密码
 */
function resetPassword(id,userName){
	var r = ajax("userController.do?resetPassword=true",{"id":id,"userName":userName});
	if(r.success){
		artSucceed(r.msg);
	}else{
		artError(r.msg);
	}
}

/**
 * 用户解锁
 */
function userUnlock(){
	var s = $("#userList").datagrid("getSelected");
	if(!s){
		tip("请先选择需要解锁的用户");
		return;
	}
	var r = ajax("userController.do?unlock=true",{"id":s.id});
	if(r.success){
		artSucceed(r.msg);
		$("#userList").datagrid("reload");
	}else{
		artError(r.msg);
	}
}
</script>
<t:datagrid name="userList" title="用户管理" actionUrl="userController.do?datagrid&departFilter=true" fit="true" fitColumns="true" idField="id" queryMode="group">
	<t:dgCol title="编号" field="id" hidden="false"></t:dgCol>
	<t:dgCol title="用户名" sortable="false" field="userName" query="true"></t:dgCol>
	<t:dgCol title="部门" field="TSDepart_id" query="false" replace="${departsReplace}"></t:dgCol>
	<t:dgCol title="角色" field="roleName" formatter="roleNameFormatter" sortable="false"></t:dgCol>
	<t:dgCol title="真实姓名" field="realName" query="true"></t:dgCol>
	<t:dgCol title="状态" sortable="true" field="status" replace="正常_1,禁用_0,超级管理员_-1,锁定_15" query="true"></t:dgCol>
	<t:dgCol title="操作" field="opt"></t:dgCol>
	<t:dgDelOpt title="删除" url="userController.do?del&id={id}&userName={userName}" operationCode="user_delete" />
	<t:dgToolBar title="用户录入" icon="icon-add" url="userController.do?addorupdate" funname="add" operationCode="user_add" />
	<t:dgToolBar title="用户编辑" icon="icon-edit" url="userController.do?addorupdate" funname="update" />
	<t:dgToolBar title="用户解锁" icon="icon-ok" funname="userUnlock" operationCode="user_unlock" />
	<t:dgFunOpt title="重置密码" funname="resetPassword(id,userName)" operationCode="user_resetpassword" />
</t:datagrid>
<script>
/**
 * 由于角色是单独查出来的，所以需要刷新下页面
 */
function reloadTable(d){
	if(d.method && "saveUser"==d.method){
		setTimeout(function(){
			location.href = "userController.do?user=true&queryRole=true";
		},1000);
	}
}
</script>
