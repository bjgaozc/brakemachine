<%@ page language="java" import="java.util.*" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@include file="/context/mytags.jsp"%>
<!DOCTYPE html>
<html>
 <head>
  <title>模板变量表</title>
  <t:base type="jquery,easyui,tools,DatePicker"></t:base>
  <script type="text/javascript">
  //编写自定义JS代码
  </script>
 </head>
 <body>
  <t:formvalid formid="formobj" dialog="true" usePlugin="password" layout="table" action="moSysTemplateDrController.do?doAdd" tiptype="1">
					<input id="id" name="id" type="hidden" value="${moSysTemplateDrPage.id }">
					<input id="createName" name="createName" type="hidden" value="${moSysTemplateDrPage.createName }">
					<input id="createBy" name="createBy" type="hidden" value="${moSysTemplateDrPage.createBy }">
					<input id="createDate" name="createDate" type="hidden" value="${moSysTemplateDrPage.createDate }">
					<input id="updateName" name="updateName" type="hidden" value="${moSysTemplateDrPage.updateName }">
					<input id="updateBy" name="updateBy" type="hidden" value="${moSysTemplateDrPage.updateBy }">
					<input id="updateDate" name="updateDate" type="hidden" value="${moSysTemplateDrPage.updateDate }">
					<input id="teDrVersion" name="teDrVersion" type="hidden" value="${moSysTemplateDrPage.teDrVersion }">
		<table style="width: 100%;" cellpadding="0" cellspacing="1" class="formtable">
				<tr>
					<td align="right">
						<label class="Validform_label">
							类型:
						</label>
					</td>
					<td class="value">
					     	 <input id="teDrType" name="teDrType" type="text" style="width: 150px" class="inputxt"
								               
								               >
							<span class="Validform_checktip"></span>
							<label class="Validform_label" style="display: none;">类型</label>
						</td>
					<td align="right">
						<label class="Validform_label">
							状态:
						</label>
					</td>
					<td class="value">
					     	 <input id="teDrStatus" name="teDrStatus" type="text" style="width: 150px" class="inputxt"
								               
								               >
							<span class="Validform_checktip"></span>
							<label class="Validform_label" style="display: none;">状态</label>
						</td>
					</tr>
				<tr>
					<td align="right">
						<label class="Validform_label">
							备注:
						</label>
					</td>
					<td class="value">
						  	 <textarea style="width:600px;" class="inputxt" rows="6" id="teDrNote" name="teDrNote"></textarea>
							<span class="Validform_checktip"></span>
							<label class="Validform_label" style="display: none;">备注</label>
						</td>
					<td align="right">
						<label class="Validform_label">
							排序:
						</label>
					</td>
					<td class="value">
					     	 <input id="teDrSort" name="teDrSort" type="text" style="width: 150px" class="inputxt"
								               
								               >
							<span class="Validform_checktip"></span>
							<label class="Validform_label" style="display: none;">排序</label>
						</td>
					</tr>
				<tr>
					<td align="right">
						<label class="Validform_label">
							模板主键:
						</label>
					</td>
					<td class="value">
					     	 <input id="teId" name="teId" type="text" style="width: 150px" class="inputxt"
								               
								               >
							<span class="Validform_checktip"></span>
							<label class="Validform_label" style="display: none;">模板主键</label>
						</td>
					<td align="right">
						<label class="Validform_label">
							上级主键:
						</label>
					</td>
					<td class="value">
					     	 <input id="teDrFid" name="teDrFid" type="text" style="width: 150px" class="inputxt"
								               
								               >
							<span class="Validform_checktip"></span>
							<label class="Validform_label" style="display: none;">上级主键</label>
						</td>
					</tr>
				<tr>
					<td align="right">
						<label class="Validform_label">
							所有上级主键:
						</label>
					</td>
					<td class="value">
					     	 <input id="teDrFids" name="teDrFids" type="text" style="width: 150px" class="inputxt"
								               
								               >
							<span class="Validform_checktip"></span>
							<label class="Validform_label" style="display: none;">所有上级主键</label>
						</td>
					<td align="right">
						<label class="Validform_label">
							编码:
						</label>
					</td>
					<td class="value">
					     	 <input id="teDrCode" name="teDrCode" type="text" style="width: 150px" class="inputxt"
								               
								               >
							<span class="Validform_checktip"></span>
							<label class="Validform_label" style="display: none;">编码</label>
						</td>
					</tr>
				<tr>
					<td align="right">
						<label class="Validform_label">
							名称:
						</label>
					</td>
					<td class="value">
					     	 <input id="teDrName" name="teDrName" type="text" style="width: 150px" class="inputxt"
								               
								               >
							<span class="Validform_checktip"></span>
							<label class="Validform_label" style="display: none;">名称</label>
						</td>
					<td align="right">
						<label class="Validform_label">
							数据:
						</label>
					</td>
					<td class="value">
					     	 <input id="teDrValue" name="teDrValue" type="text" style="width: 150px" class="inputxt"
								               
								               >
							<span class="Validform_checktip"></span>
							<label class="Validform_label" style="display: none;">数据</label>
						</td>
					</tr>
				<tr>
					<td align="right">
						<label class="Validform_label">
							数据的英文版:
						</label>
					</td>
					<td class="value">
					     	 <input id="teDrValueen" name="teDrValueen" type="text" style="width: 150px" class="inputxt"
								               
								               >
							<span class="Validform_checktip"></span>
							<label class="Validform_label" style="display: none;">数据的英文版</label>
						</td>
					<td align="right">
						<label class="Validform_label">
							控件主键:
						</label>
					</td>
					<td class="value">
					     	 <input id="teDrControlid" name="teDrControlid" type="text" style="width: 150px" class="inputxt"
								               
								               >
							<span class="Validform_checktip"></span>
							<label class="Validform_label" style="display: none;">控件主键</label>
						</td>
					</tr>
				<tr>
					<td align="right">
						<label class="Validform_label">
							控件名称:
						</label>
					</td>
					<td class="value">
					     	 <input id="teDrControlname" name="teDrControlname" type="text" style="width: 150px" class="inputxt"
								               
								               >
							<span class="Validform_checktip"></span>
							<label class="Validform_label" style="display: none;">控件名称</label>
						</td>
					<td align="right">
						<label class="Validform_label">
							控件类型:
						</label>
					</td>
					<td class="value">
					     	 <input id="teDrControltype" name="teDrControltype" type="text" style="width: 150px" class="inputxt"
								               
								               >
							<span class="Validform_checktip"></span>
							<label class="Validform_label" style="display: none;">控件类型</label>
						</td>
					</tr>
				<tr>
					<td align="right">
						<label class="Validform_label">
							皮肤:
						</label>
					</td>
					<td class="value">
					     	 <input id="teDrSkin" name="teDrSkin" type="text" style="width: 150px" class="inputxt"
								               
								               >
							<span class="Validform_checktip"></span>
							<label class="Validform_label" style="display: none;">皮肤</label>
						</td>
					<td align="right">
						<label class="Validform_label">
							样式类:
						</label>
					</td>
					<td class="value">
					     	 <input id="teDrClass" name="teDrClass" type="text" style="width: 150px" class="inputxt"
								               
								               >
							<span class="Validform_checktip"></span>
							<label class="Validform_label" style="display: none;">样式类</label>
						</td>
					</tr>
				<tr>
					<td align="right">
						<label class="Validform_label">
							样式:
						</label>
					</td>
					<td class="value">
					     	 <input id="teDrStyle" name="teDrStyle" type="text" style="width: 150px" class="inputxt"
								               
								               >
							<span class="Validform_checktip"></span>
							<label class="Validform_label" style="display: none;">样式</label>
						</td>
					<td align="right">
						<label class="Validform_label">
							事件优先级:
						</label>
					</td>
					<td class="value">
					     	 <input id="teDrTriggerSort" name="teDrTriggerSort" type="text" style="width: 150px" class="inputxt"
								               
								               >
							<span class="Validform_checktip"></span>
							<label class="Validform_label" style="display: none;">事件优先级</label>
						</td>
					</tr>
				<tr>
					<td align="right">
						<label class="Validform_label">
							事件内容:
						</label>
					</td>
					<td class="value">
					     	 <input id="teDrTriggerCon" name="teDrTriggerCon" type="text" style="width: 150px" class="inputxt"
								               
								               >
							<span class="Validform_checktip"></span>
							<label class="Validform_label" style="display: none;">事件内容</label>
						</td>
					<td align="right">
						<label class="Validform_label">
							配置:
						</label>
					</td>
					<td class="value">
					     	 <input id="teDrConfig" name="teDrConfig" type="text" style="width: 150px" class="inputxt"
								               
								               >
							<span class="Validform_checktip"></span>
							<label class="Validform_label" style="display: none;">配置</label>
						</td>
					</tr>
				<tr>
					<td align="right">
						<label class="Validform_label">
							配置是否刷新:
						</label>
					</td>
					<td class="value">
					     	 <input id="teDrConfigIsfresh" name="teDrConfigIsfresh" type="text" style="width: 150px" class="inputxt"
								               
								               >
							<span class="Validform_checktip"></span>
							<label class="Validform_label" style="display: none;">配置是否刷新</label>
						</td>
				<td align="right">
					<label class="Validform_label">
					</label>
				</td>
				<td class="value">
				</td>
					</tr>
			</table>
		</t:formvalid>
 </body>
