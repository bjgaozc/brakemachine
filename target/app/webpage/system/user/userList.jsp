<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@include file="/context/mytags.jsp"%>
<sino:plugins type="jquery-1.11.3,easyui-default-1.4.4,tools,util,My97DatePicker" />

<script type="text/javascript">
    $(function() {
    	initCombobox("roleidId", "appCommonController.do?getComboDs=true&tableName=t_s_role&id=id&text=rolename");
        var datagrid = $("#userListtb");
        datagrid.find("div[name='searchColums']").append($("#tempSearchColums div[name='searchColums']").children());
        $("input[name='departname']").css({"width":"300px"});
    });
    
    /**
     * 由于角色是单独查出来的，所以需要刷新下页面
     */
    function reloadTable(d){
    	if(d.method && "saveUser"==d.method){
    		setTimeout(function(){location.href = "userController.do?user=true";},1000);
    	}
    }
    
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


function lockObj(title,url, id) {

	gridname=id;
	var rowsData = $('#'+id).datagrid('getSelections');
	if (!rowsData || rowsData.length==0) {
		tip('<t:mutiLang langKey="common.please.select.edit.item"/>');
		return;
	}
	url += '&id='+rowsData[0].id;
	$.messager.confirm('消息','<t:mutiLang langKey="common.lock.user.tips"/>',function(r){
		if(r) lockuploadify(url, '&id');
	});
}
function unlockObj(title,url, id) {

	gridname=id;
	var rowsData = $('#'+id).datagrid('getSelections');
	if (!rowsData || rowsData.length==0) {
		tip('<t:mutiLang langKey="common.please.select.edit.item"/>');
		return;
	}
	url += '&id='+rowsData[0].id;
	
	$.messager.confirm('消息','<t:mutiLang langKey="common.unlock.user.tips"/>',function(r){
		if(r) lockuploadify(url, '&id');
	});
}


function lockuploadify(url, id) {
	$.ajax({
		async : false,
		cache : false,
		type : 'POST',
		dataType : 'json',
		url : url,// 请求的action路径
		success : function(data) {
			//var d = $.parseJSON(data);
			var d = data;
			if (d.success) {
			var msg = d.msg;
				tip(msg);
				reloadTable();
			}
		},
		error : function() {// 请求失败处理函数
		}
	});
}
</script>

<%--update-start--Author:zhangguoming  Date:20140827 for：添加 组织机构查询条件：弹出 选择组织机构列表 相关操作--%>
<script type="text/javascript">
//    var windowapi = frameElement.api, W = windowapi.opener;
    function choose_297e201048183a730148183ad85c0001() {
        if (typeof(windowapi) == 'undefined') {
            $.dialog({content: 'url:departController.do?departSelect', zIndex: 2100, title: '<t:mutiLang langKey="common.department.list"/>', lock: true, width: 400, height: 350, left: '45%', top: '35%', opacity: 0.4, button: [
                {name: '<t:mutiLang langKey="common.confirm"/>', callback: clickcallback_297e201048183a730148183ad85c0001, focus: true},
                {name: '<t:mutiLang langKey="common.cancel"/>', callback: function () {
                }}
            ]});
        } else {
            $.dialog({content: 'url:departController.do?departSelect', zIndex: 2100, title: '<t:mutiLang langKey="common.department.list"/>', lock: true, parent: windowapi, width: 400, height: 350, left: '45%', top: '35%', opacity: 0.4, button: [
                {name: '<t:mutiLang langKey="common.confirm"/>', callback: clickcallback_297e201048183a730148183ad85c0001, focus: true},
                {name: '<t:mutiLang langKey="common.cancel"/>', callback: function () {
                }}
            ]});
        }
    }
    function clearAll_297e201048183a730148183ad85c0001() {
        if ($('#departname').length >= 1) {
            $('#departname').val('');
            $('#departname').blur();
        }
        if ($("input[name='departname']").length >= 1) {
            $("input[name='departname']").val('');
            $("input[name='departname']").blur();
        }
        $('#orgIds').val("");
    }
    function clickcallback_297e201048183a730148183ad85c0001() {
        iframe = this.iframe.contentWindow;
        var departname = iframe.getdepartListSelections('departname');
        if ($('#departname').length >= 1) {
            $('#departname').val(departname);
            $('#departname').blur();
        }
        if ($("input[name='departname']").length >= 1) {
            $("input[name='departname']").val(departname);
            $("input[name='departname']").blur();
        }
        var id = iframe.getdepartListSelections('id');
        if (id !== undefined && id != "") {
            $('#orgIds').val(id);
            $("input[name='orgIds']").val(id);
        }
    }
    function departmentFormatter(value,row,index){
    	if(!value) return "";
    	if(value.endsWith(",")){
    		value = value.substring(0,value.length-1);
    	}
    	return value;
    }
</script>
<%--update-end--Author:zhangguoming  Date:20140827 for：添加 组织机构查询条件：弹出 选择组织机构列表 相关操作--%>

<div id="tempSearchColums" style="display: none">
	<div name="searchColums">
		<span style="display: -moz-inline-box; display: inline-block;">
			<span style="vertical-align: middle; display: -moz-inline-box; display: inline-block; width: 80px; text-align: right;"
			title="<t:mutiLang langKey="common.department"/>"> 
				<t:mutiLang langKey="common.department" />：
			</span> 
			<input id="orgIds" name="orgIds" type="hidden">
			<input readonly="true" type="text" name="departname" style="width: 100px"
				onclick="choose_297e201048183a730148183ad85c0001()" /> 
			<%--<t:choose hiddenName="orgIds" hiddenid="id"--%>
			<%--url="departController.do?departSelect" name="departList"--%> 
			<%--icon="icon-search" title="common.department.list"--%>
			<%--textname="departname" isclear="true"></t:choose>--%>
		</span> 
		<span style="display: -moz-inline-box; display: inline-block;">
			&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 角色:
				<input type="text" class="form-control" id='roleidId' name='roleid'>
		</span>
	</div>
</div>
<%--update-end--Author:zhangguoming  Date:20140827 for：添加 组织机构查询条件--%>

<t:datagrid name="userList" title="common.operation"
	actionUrl="userController.do?datagrid&departFilter=true" fit="true"
	fitColumns="true" idField="id" queryMode="group" sortName="createDate"
	sortOrder="desc">
	<t:dgCol title="common.id" field="id" hidden="true"></t:dgCol>
	<t:dgCol title="common.department" sortable="false" field="userOrgList.tsDepart.departname" formatter="departmentFormatter"></t:dgCol>
	<t:dgCol title="common.username" sortable="false" field="userName" query="true"></t:dgCol>
	<%--update-start--Author:zhangguoming  Date:20140827 for：通过用户对象的关联属性值获取组织机构名称（多对多关联）--%>
	<%--<t:dgCol title="common.department" field="TSDepart_id" query="true" replace="${departsReplace}"></t:dgCol>--%>
	<%--update-end--Author:zhangguoming  Date:20140827 for：通过用户对象的关联属性值获取组织机构名称（多对多关联）--%>
	<t:dgCol title="common.real.name" field="realName" query="true"></t:dgCol>
	<%--
	<t:dgCol title="common.role" field="roleName1" formatter="roleNameFormatter" sortable="false"></t:dgCol>
	--%>
	<t:dgCol title="common.role" field="roleName" sortable="false"></t:dgCol>
	<t:dgCol title="common.createby" field="createBy" hidden="true"></t:dgCol>
	<t:dgCol title="common.createtime" field="createDate" formatter="yyyy-MM-dd" hidden="true"></t:dgCol>
	<t:dgCol title="common.updateby" field="updateBy" hidden="true"></t:dgCol>
	<t:dgCol title="common.updatetime" field="updateDate" formatter="yyyy-MM-dd" hidden="true"></t:dgCol>
	<t:dgCol title="common.status" width="30" sortable="true" field="status"
		replace="common.active_1,common.inactive_0,super.admin_-1"></t:dgCol>
	<t:dgCol title="common.operation" field="opt" width="30"></t:dgCol>
	
	<t:dgDelOpt title="common.delete" url="userController.do?del&id={id}&userName={userName}" />
	<t:dgToolBar title="common.add.param" langArg="common.user"
		icon="fa fa-lg fa-plus" url="userController.do?addorupdate" funname="add"></t:dgToolBar>
	<t:dgToolBar title="common.edit.param" langArg="common.user"
		icon="fa fa-lg fa-edit" url="userController.do?addorupdate" funname="update"></t:dgToolBar>
	<t:dgToolBar title="common.password.reset" 
		icon="fa fa-lg fa-key" url="userController.do?changepasswordforuser" funname="update"></t:dgToolBar>
	<t:dgToolBar title="common.lock.user" 
		icon="fa fa-lg fa-lock" url="userController.do?lock&lockvalue=0" funname="lockObj"></t:dgToolBar>
	<t:dgToolBar title="common.unlock.user" 
		icon="fa fa-lg fa-unlock" url="userController.do?lock&lockvalue=1" funname="unlockObj"></t:dgToolBar>

</t:datagrid>
