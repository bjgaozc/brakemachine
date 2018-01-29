<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@include file="/context/mytags.jsp"%>

<link rel="stylesheet" href="plug-in/Validform/css/tablefrom.css" type="text/css"></link>
<sino:plugins type="jquery,easyui,tools,util"/>
<script type="text/javascript">
	$(function(){
		var id = '${id}';
		var r = ajax("epSysNoticeController.do?getById&id="+id);
		if(r.success){
			var n = r.obj;
			if(n){
				$("#titleId").text(n.title);
				$("#contentId").html(n.content);
			}
		}
	});
</script>



<div class="easyui-layout" fit="true">   
    <div data-options="region:'center'">




<div class="easyui-tabs" fit="true" border="false" >   
    <div title="基本信息" iconCls="icon-default">   

<table cellpadding="0" cellspacing="1" class="formtable">
	<tr style="height: 30px;">
		<td align="right" style="width: 20%;">
			<label class="Validform_label">标题:</label>
		</td>
		<td class="value">
			<label id="titleId" class="Validform_label"></label>
		</td>
	</tr>
	<tr style="height: 30px;">
		<td align="right">
			<label class="Validform_label">内容:</label>
		</td>
		<td class="value">
			<label id="contentId" class="Validform_label"></label>
		</td>
	</tr>
</table>

    </div>
    <div title="提示" iconCls="icon-tip">   
        提示内容
    </div>   
</div>

    </div>   
</div>