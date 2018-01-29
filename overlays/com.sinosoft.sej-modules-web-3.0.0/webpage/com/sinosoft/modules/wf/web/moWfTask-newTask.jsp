<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@include file="/context/mytags.jsp"%>
<sino:plugins type="jquery,easyui,tools,My97DatePicker,util"/>
<%@include file="/webpage/com/sinosoft/modules/wf/ui/moWf.jsp"%>
<script type="text/javascript">
var moWfTaskTodoTask = $.u.cache("moWfTaskTodoTask");

$(function(){
	moWfCommon.initDate("#durDate");
});

/**操作回调*/
function dataBack(d){
	if(d.success){
		artSucceed(d.msg);
		moWfTaskTodoTask.d.close();
	}else{
		artError(d.msg);
	}
}
</script>

<div style="width: 500px;height: 300px;">
	<t:formvalid formid="formobj" dialog="false" layout="table" action="moWfTaskController.do?doNewTask" tiptype="3" callback="dataBack">
		<table style="width: 100%;" cellpadding="0" cellspacing="1" class="formtable">
			<tr>
				<td align="right" style="width: 25%;">
					<label class="Validform_label">名称<span style="color:red;">*</span></label>
				</td>
				<td class="value">
					<input type="text" id="name" name="name" style="width: 45%;" datatype="*" nullmsg="任务名为必填项" errormsg="任务名填写不正确">
					<span class="Validform_checktip"></span>
					</td>
			</tr>
			<tr>
				<td align="right">
					<label class="Validform_label">描述</label>
				</td>
				<td class="value">
				     	<textarea id="description" name="description" rows="5" style="width: 90%;overflow: auto;"></textarea>
					</td>
			</tr>
			<tr>
				<td align="right">
					<label class="Validform_label">到期日</label>
				</td>
				<td class="value">
				     	<input type="text" id="dueDate" name="dueDate" style="width: 90%;" >
					</td>
			</tr>
			<tr>
				<td align="right">
					<label class="Validform_label">级别</label>
				</td>
				<td class="value">
				     <select id="priority" name="priority" style="width: 90%;">
				     	<option value="0">低</option>
				     	<option value="50">中</option>
				     	<option value="100">高</option>
				     </select>
				</td>
			</tr>
			<tr>
				<td class="value" align="center" colspan="2">
					<br>
					<a id="btn_sub" href="#" class="easyui-linkbutton" iconcls="icon-save">创建</a>
					<a id="btn_reset" href="#" class="easyui-linkbutton" iconcls="icon-reload">重置</a>
					<br><br><br>
				</td>
			</tr>
		</table>
	</t:formvalid>
</div>
