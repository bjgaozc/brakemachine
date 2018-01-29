<%@ page language="java" import="java.util.*" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@include file="/context/mytags.jsp"%>
<!DOCTYPE html>
<html>
 <head>
  <title>系统通知管理</title>
  <sino:plugins type="jquery,easyui,tools,DatePicker,kindeditor"/>
  <script type="text/javascript">
var contentKe;
$(function(){
	contentKe = KindEditor.create('#content', {
		uploadJson : ctx + '/plug-in/kindeditor/m/upload_json.jsp',
		fileManagerJson : ctx +  '/plug-in/kindeditor/m/file_manager_json.jsp',
		allowFileManager : true,
		items : [
			'fontname', 'fontsize', '|', 'forecolor', 'hilitecolor', 'bold', 'italic', 'underline',
			'removeformat', '|', 'justifyleft', 'justifycenter', 'justifyright', 'insertorderedlist',
			'insertunorderedlist', '|', 'emoticons', 'image', 'link', '|', 'insertfile']
	});
	
	$('#departmentid').combotree({
		url : 'departController.do?setPFunction',
		multiple:true,
		cascadeCheck:false
	});
	
	$("#typeId").on("change",function(){
		var v = $(this).val();
		if(v==2){
			$("#departAndUserTrId").show();
		}else{
			$("#departAndUserTrId").hide();
		}
	})
	
	initUseridCombogrid();
});

/**
 * 初始化选择用户
 */
function initUseridCombogrid(){
	$('#userid').combogrid({
		url : 'appCommonController.do?queryUser',
		panelWidth : 500,
		panelHeight : 200,
		idField : 'id',
		textField : 'name',
		pagination : true,
		fitColumns : true,
//		required : true,
		rownumbers : true,
		multiple:true,
		mode : 'remote',
		delay : 500,
		sortName : 'id',
		sortOrder : 'asc',
		pageSize : 5,
		pageList : [ 5, 10 ],
		columns : [[{
			field : 'username',
			title : '登录名',
			width : 100,
			sortable : true
		},{
			field : 'realname',
			title : '姓名',
			width : 100,
			sortable : true
		},{
			field : 'departname',
			title : '部门',
			width : 200
		}]],
		onSelect : function(i, rec){
			setTimeout(function(){
				var id = $("#userid").val();
				if(""==id){
					$("#userid").val(rec.id);
					$("#realname").val(rec.realname);
					$("#userid").next().children(".combo-text").val(rec.realname);
				}else{
					$("#userid").val(id+","+rec.id);
					var text = $("#realname").val();
					$("#userid").next().children(".combo-text").val(text+","+rec.realname);
				}
			}, 300);
		}
	});
}

/**
 * 提交前处理
 */
function beforeSaveSysNotice(){
	$("#content").html(contentKe.html());
	return true;
}
  </script>
 </head>
 <body>
<t:formvalid formid="formobj" dialog="true" layout="table" action="epSysNoticeController.do?doAdd" beforeSubmit="beforeSaveSysNotice()">
<input id="id" name="id" type="hidden" value="${epSysNoticePage.id }">
<input id="createuser" name="createuser" type="hidden" value="${epSysNoticePage.createuser }">
<input id="createtime" name="createtime" type="hidden" value="${epSysNoticePage.createtime }">
<table cellpadding="0" cellspacing="1" class="formtable">
	<tr>
		<td align="right" style="width: 10%">
			<label class="Validform_label">标题:</label>
		</td>
		<td class="value" colspan="3">
	     	<input id="title" name="title" type="text" style="width: 400px" class="inputxt" datatype="*" >
			<span class="Validform_checktip"></span>
			<label class="Validform_label" style="display: none;">标题</label>
		</td>
	</tr>
	<tr>
		<td align="right">
			<label class="Validform_label">关键字:</label>
		</td>
		<td class="value">
	     	 <input id="keyword" name="keyword" type="text" style="width: 150px" class="inputxt" >
			<span class="Validform_checktip"></span>
			<label class="Validform_label" style="display: none;">关键字</label>
		</td>
		<td align="right">
			<label class="Validform_label">排序:</label>
		</td>
		<td class="value">
	     	<input id="sortnum" name="sortnum" value="100" type="text" style="width: 150px" class="inputxt" >
			<span class="Validform_checktip"></span>
			<label class="Validform_label" style="display: none;">排序</label>
		</td>
	</tr>
	<tr>
		<td align="right">
			<label class="Validform_label">类型:</label>
		</td>
		<td class="value">
	     	<t:dictSelect id="typeId" field="type" type="list" typeGroupCode="xttzlx" defaultVal="1" hasLabel="false" title="类型"/>
			<span class="Validform_checktip"></span>
			<label class="Validform_label" style="display: none;">类型</label>
		</td>
		<td align="right">
			<label class="Validform_label">状态:</label>
		</td>
		<td class="value">
		     	<t:dictSelect field="status" type="list" typeGroupCode="xttzzt" defaultVal="2" hasLabel="false" title="状态"/>
				<span class="Validform_checktip"></span>
				<label class="Validform_label" style="display: none;">状态</label>
		</td>
	</tr>
	<tr id="departAndUserTrId" style="display: none;">
		<td align="right">
			<label class="Validform_label">所属部门:</label>
		</td>
		<td class="value">
	     	<input id="departmentid" name="departmentid" type="text" style="width: 150px" class="inputxt">
			<span class="Validform_checktip"></span>
			<label class="Validform_label" style="display: none;">所属部门</label>
		</td>
		<td align="right">
			<label class="Validform_label">所属用户:</label>
		</td>
		<td class="value">
	     	<input id="userid" name="userid" type="text" style="width: 150px" class="inputxt">
	     	<input type="hidden" id="realname">
			<span class="Validform_checktip"></span>
			<label class="Validform_label" style="display: none;">所属用户</label>
		</td>
	</tr>
	<tr>
		<td align="right">
			<label class="Validform_label">内容:</label>
		</td>
		<td class="value" colspan="3">
		  	<textarea id="content" name="content" style="width: 100%;height: 180px;"></textarea>
			<span class="Validform_checktip"></span>
			<label class="Validform_label" style="display: none;">内容</label>
		</td>
	</tr>
	<tr>
		<td align="right">
			<label class="Validform_label">失效日期:</label>
		</td>
		<td class="value" colspan="3">
			<input id="expirydate" name="expirydate" type="text" style="width: 150px" class="Wdate" onClick="WdatePicker({dateFmt:'yyyy-MM-dd HH:mm'})">
			<span class="Validform_checktip"></span>
			<label class="Validform_label" style="display: none;">失效日期</label>
		</td>
	</tr>
</table>
</t:formvalid>
</body>
