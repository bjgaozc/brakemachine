<%@ page language="java" import="java.util.*" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@include file="/context/mytags.jsp"%>
<!DOCTYPE html>
<html>
<head>
<title>用户信息</title>
<sino:plugins type="jquery-1.11.3,easyui-default-1.4.4,tools,util" />
    <%--update-start--Author:zhangguoming  Date:20140825 for：添加组织机构combobox多选的处理方法--%>
    <script>
	    $(function() {
	    });
	    
	    function chooseOrg() {
	        if (typeof(windowapi) == 'undefined') {
	            $.dialog({content: 'url:departController.do?departSelect', zIndex: 3100, title: '<t:mutiLang langKey="common.department.list"/>', lock: true, width: 500, height: 400, left: '45%', top: '35%', opacity: 0.5, button: [
	                {name: '<t:mutiLang langKey="common.confirm"/>', callback: clickcallback, focus: true},
	                {name: '<t:mutiLang langKey="common.cancel"/>', callback: cancelcallback}
	            ]});
	        } else {
	            $.dialog({content: 'url:departController.do?departSelect', zIndex: 3100, title: '<t:mutiLang langKey="common.department.list"/>', lock: true, parent: windowapi, width: 500, height: 400, left: '45%', top: '35%', opacity: 0.5, button: [
	                {name: '<t:mutiLang langKey="common.confirm"/>', callback: clickcallback, focus: true},
	                {name: '<t:mutiLang langKey="common.cancel"/>', callback: cancelcallback}
	            ]});
	        }
	    }
	    function clickcallback() {
	        iframe = this.iframe.contentWindow;
	        var departname = iframe.getdepartListSelections('departname');
	        if ($('#orgNames').length >= 1) {
	            $('#orgNames').val(departname);
	            $('#orgNames').blur();
	        }
	        var id = iframe.getdepartListSelections('id');
	        if (id !== undefined && id != "") {
	            $('#orgIds').val(id);
	        }
	    }
	    function cancelcallback(){
	    	$('#orgIds').val("");
	    	$('#orgNames').val("");
	    }
	    function setOrgIds() {
	    	if(""===$('#orgIds').val()){
	    		alert('<t:mutiLang langKey="please.select.department"/>');
	    		return false;
	    	}
	    	return true;
	    }
	    
	    var orgCodeArray;
	    var orgCodeText;
	    function initOrg(){
	    	//初始化
	    	$('#consulatesId').combogrid({
	    		url: "departController.do?departSelectDataGrid",
	    		mode: 'remote',
	    		idField: "id",
	    		textField: "departname",
	    		panelWidth: 501,
	    		columns: [[    
	    		           {field:'id',title:'主键',width:100,hidden:true},    
	    		           {field:'departname',title:'单位名称',width:200}
	    		       ]],
	            onLoadSuccess:function(){
	            	orgCodeArray="";
	            	var _rows = $(this).combogrid('grid').datagrid('getRows');
	            	for(var i=0; i< _rows.length; i++){
	            		orgCodeArray+=","+_rows[i].id;
	            	}
	            }
	    	});
	    	//补全
	    	$("#consulatesId").combogrid().next().children(":text").blur(function(){
	    		var _val = $(this).val();
	    		var v = $('#consulatesId').combogrid("getValue");
	    		if(_val && (orgCodeArray.indexOf(v)<=0 || _val != orgCodeText)){
	    			var _data = ajax("departController.do?departSelectDataGrid",{"q":_val});
	    			if(_data && _data.length>0){
	    				$('#consulatesId').combogrid("setValue" ,_data[0].id) ;
	    				$('#consulatesId').combogrid("setText" ,_data[0].departname) ;
	    				orgCodeText = _data[0].name;
	    			} else {
	    				$('#consulatesId').combogrid("setValue","");
	    			}
	    		}
	    	});
	    	$('#consulatesId').combogrid("setValue",$("#orgIds").val());
	    }
	    function setOrgIds_bak2() {
	    	var orgIds = $('#consulatesId').combogrid('getValue');
	    	if(orgIds){
	    		$("#orgIds").val(orgIds);
	    	}else{
	    		alert("请选择所属单位");
	    		$("#consulatesId").combogrid().next().children(":text").focus();
	    		return false;
	    	}
	    }
	    
	    function orgSelectCombotree(){
	    	 $("#orgSelect").combotree({
	             onChange: function(n, o) {
	                 if($("#orgSelect").combotree("getValues") != "") {
	                     $("#orgSelect option").eq(1).attr("selected", true);
	                 } else {
	                     $("#orgSelect option").eq(1).attr("selected", false);
	                 }
	             }
	         });
	         <%--$("#orgSelect").combobox("setValues", ${orgIdList});--%>
	        // $("#orgSelect").combotree("setValues", ${orgIdList});
	    }
	    function setOrgIds_bak() {
	//      var orgIds = $("#orgSelect").combobox("getValues");
	        var orgIds = $("#orgSelect").combotree("getValues");
	        $("#orgIds").val(orgIds);
	    }
    </script>
    <%--update-end--Author:zhangguoming  Date:20140825 for：添加组织机构combobox多选的处理方法--%>
</head>
<body style="overflow-y: hidden" scroll="no">
<%--update-start--Author:zhangguoming  Date:20140825 for：格式化页面代码 并 添加组织机构combobox多选框--%>
<t:formvalid formid="formobj" dialog="true" usePlugin="password" layout="table" action="userController.do?saveUser" beforeSubmit="setOrgIds">
	<input id="id" name="id" type="hidden" value="${user.id }">
	<table style="width: 600px;" cellpadding="0" cellspacing="1" class="formtable">
		<tr>
			<td align="right" width="15%" nowrap>
                <label class="Validform_label">  <t:mutiLang langKey="common.username"/>: </label>
            </td>
			<td class="value" width="85%">
                <c:if test="${user.id!=null }"> ${user.userName } </c:if>
                <c:if test="${user.id==null }">
                    <input id="userName" class="inputxt" name="userName" validType="t_s_base_user,userName,id" value="${user.userName }" datatype="s2-10" />
                    <span class="Validform_checktip"> <t:mutiLang langKey="username.rang2to10"/></span>
                </c:if>
            </td>
		</tr>
		<tr>
			<td align="right" width="10%" nowrap><label class="Validform_label"> <t:mutiLang langKey="common.real.name"/>: </label></td>
			<td class="value" width="10%">
                <input id="realName" class="inputxt" name="realName" value="${user.realName }" datatype="s2-10">
                <span class="Validform_checktip"><t:mutiLang langKey="fill.realname"/></span>
            </td>
		</tr>
		<c:if test="${user.id==null }">
			<tr>
				<td align="right"><label class="Validform_label"> <t:mutiLang langKey="common.password"/>: </label></td>
				<td class="value">
                    <input type="password" class="inputxt" value="" name="password" plugin="passwordStrength" datatype="*6-18" errormsg="" />
                    <span class="passwordStrength" style="display: none;">
                        <span><t:mutiLang langKey="common.weak"/></span>
                        <span><t:mutiLang langKey="common.middle"/></span>
                        <span class="last"><t:mutiLang langKey="common.strong"/></span>
                    </span>
                    <span class="Validform_checktip"> <t:mutiLang langKey="password.rang6to18"/></span>
                </td>
			</tr>
			<tr>
				<td align="right"><label class="Validform_label"> <t:mutiLang langKey="common.repeat.password"/>: </label></td>
				<td class="value">
                    <input id="repassword" class="inputxt" type="password" value="${user.password}" recheck="password" datatype="*6-18" errormsg="两次输入的密码不一致！">
                    <span class="Validform_checktip"><t:mutiLang langKey="common.repeat.password"/></span>
                </td>
			</tr>
		</c:if>
		<tr>
			<td align="right"><label class="Validform_label"> <t:mutiLang langKey="common.department"/>: </label></td>
			<td class="value">
                <%--
                <select class="easyui-combotree" data-options="url:'departController.do?getOrgTree', multiple:true, cascadeCheck:false"
                        id="orgSelect" name="orgSelect" datatype="select1">
                    <c:forEach items="${departList}" var="depart">
                        <option value="${depart.id }">${depart.departname}</option>
                    </c:forEach>
                </select>
                --%>
                <input type="text" id="orgNames" value="${orgNames}" class="inputxt" datatype="*" readonly="readonly">
                <input type="hidden" id="orgIds" name="orgIds" value="${orgIds}">
                <a href="#" class="easyui-linkbutton" plain="true" icon="icon-search" onClick="chooseOrg()">选择</a>
                <a href="#" class="easyui-linkbutton" plain="true" icon="icon-redo" onClick="cancelcallback();">清空</a>
                <span class="Validform_checktip"><t:mutiLang langKey="please.select.department"/></span>
            </td>
		</tr>
		<tr>
			<td align="right"><label class="Validform_label"> <t:mutiLang langKey="common.role"/>: </label></td>
			<td class="value" nowrap>
                <input name="roleid" name="roleid" type="hidden" value="${id}" id="roleid">
                <input name="roleName" class="inputxt" value="${roleName }" id="roleName" readonly="readonly" />
                <t:choose hiddenName="roleid" hiddenid="id" url="userController.do?roles" name="roleList"
                          icon="icon-search" title="common.role.list" textname="roleName" isclear="true" isInit="true"></t:choose>
                <span class="Validform_checktip"><t:mutiLang langKey="role.muti.select"/></span>
            </td>
		</tr>
		<tr>
			<td align="right" nowrap><label class="Validform_label">  <t:mutiLang langKey="common.phone"/>: </label></td>
			<td class="value">
                <input class="inputxt" name="mobilePhone" value="${user.mobilePhone}" datatype="m" errormsg="手机号码不正确" ignore="ignore">
                <span class="Validform_checktip"></span>
            </td>
		</tr>
		<tr>
			<td align="right"><label class="Validform_label"> <t:mutiLang langKey="common.tel"/>: </label></td>
			<td class="value">
                <input class="inputxt" name="officePhone" value="${user.officePhone}" datatype="n" errormsg="办公室电话不正确" ignore="ignore">
                <span class="Validform_checktip"></span>
            </td>
		</tr>
		<tr>
			<td align="right"><label class="Validform_label"> <t:mutiLang langKey="common.common.mail"/>: </label></td>
			<td class="value">
                <input class="inputxt" name="email" value="${user.email}" datatype="e" errormsg="邮箱格式不正确!" ignore="ignore">
                <span class="Validform_checktip"></span>
            </td>
		</tr>
	</table>
</t:formvalid>
<%--update-end--Author:zhangguoming  Date:20140825 for：格式化页面代码 并 添加组织机构combobox多选框--%>
</body>