<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@include file="/context/mytags.jsp"%>
<sino:plugins type="jquery-1.11.3,easyui-default-1.4.4,tools,My97DatePicker,autocomplete,util" />
<script type="text/javascript">
	//var userids = '${userids}';
	var xtgly = '${R_XTGLY}';
	var aqgly = '${R_AQGLY}';
	
	$(function(){
		initCombobox("roleidId", "appCommonController.do?getComboDs=true&tableName=t_s_role&id=id&text=rolename");
		var userid = initCombobox("useridId", "appCommonController.do?getComboDs=true&tableName=t_s_base_user&id=id&text=realname&mode=remote");
		userid.combobox({mode:"remote"});
		var roleCode = '${log_loginUser_roleCode}';
		if("R_AQSJY,"==roleCode){
			//安全审计员
		}
	});
	
	function logcontentFormatter(value,row,index){
		try{
			if(value.indexOf("\\{")){
				var o = eval("(" + value + ")");
				value = "<a href=\"javascript:void(0);\" onclick=\"alert('"+o.test+"');\" >"+o.logcontent+"</a>";
			}
		}catch(e){
		}
		return value;
	}
		
	function userRoleFormatter(value,row,index){
		var s = "";
		var uId = row["TSUser.id"];
		if(xtgly.indexOf(uId+",")>-1){
			s = "系统管理员";
		}else if(aqgly.indexOf(uId+",")>-1){
			s = "安全管理员";
		}
		return s;
	}
</script>
<t:datagrid title="日志管理" name="logList" actionUrl="logController.do?datagrid=true&userids=${userids}&nouserids=${nouserids}" idField="id" sortName="operatetime" sortOrder="desc" pageSize="1000" extendParams="view:scrollview,">
	<t:dgCol title="日志类型 " field="loglevel" hidden="true"></t:dgCol>
	<t:dgCol title="编号" field="id" hidden="true"></t:dgCol>
	<t:dgCol title="日志内容" field="logcontent" width="300"></t:dgCol>
	<%--
	<t:dgCol title="日志内容" field="logcontent" formatter="logcontentFormatter" width="300"></t:dgCol>
	--%>
	<t:dgCol title="操作人" field="TSUser.id" dictionary="t_s_base_user,id,realname" width="100"></t:dgCol>
	<c:if test="${null!=type}">
	<t:dgCol title="操作人所属角色" field="userRole" formatter="userRoleFormatter" width="100"></t:dgCol>
	</c:if>
	<t:dgCol title="操作时间 " field="operatetime" formatter="yyyy-MM-dd hh:mm:ss" width="100"></t:dgCol>
	<t:dgCol title="操作人IP" field="note" width="200"></t:dgCol>
	<t:dgCol title="浏览器" field="broswer" width="100"></t:dgCol>
</t:datagrid>

<div id="logListtb" style="padding: 3px; height: auto">
<div name="searchColums" style="text-align:center; padding-right: 15px;">
	操作角色：<input id="roleidId" name="roleid">
	&nbsp;&nbsp;操作人：<input id="useridId" name="userid">
	&nbsp;&nbsp;操作时间：<input type="text" name="operatetimeStart" id="operatetimeStartId" onclick="WdatePicker()" class="Wdate" readonly="readonly" >
	- <input type="text" name="operatetimeEnd" id="operatetimeEndId" onclick="WdatePicker()" class="Wdate" readonly="readonly" >
	&nbsp;&nbsp;日志类型: <select name="loglevel" id="loglevel" onchange="logListsearch();">
		<option value="0">选择日志类型</option>
		<option value="1">登录</option>
		<option value="2">退出</option>
		<option value="3">插入</option>
		<option value="4">删除</option>
		<option value="5">更新</option>
		<option value="6">上传</option>
		<option value="7">其他</option>
	</select>
	&nbsp;&nbsp;&nbsp;&nbsp;<a href="#" class="easyui-linkbutton" iconCls="fa fa-lg fa-search" onclick="logListsearch();">查询</a></div>
</div>
