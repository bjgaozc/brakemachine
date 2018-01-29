<%@ page language="java" import="java.util.*" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@include file="/context/mytags.jsp"%>
<!DOCTYPE html>
<html>
 <head>
  <title>通用查询</title>
  <t:base type="jquery,easyui,tools,DatePicker"></t:base>
  <script type="text/javascript">
  //编写自定义JS代码
  </script>
 </head>
 <body>
  <t:formvalid formid="formobj" dialog="true" usePlugin="password" layout="table" action="epBiSearchController.do?doUpdate" tiptype="1">
					<input id="id" name="id" type="hidden" value="${epBiSearchPage.id }">
					<input id="createName" name="createName" type="hidden" value="${epBiSearchPage.createName }">
					<input id="createBy" name="createBy" type="hidden" value="${epBiSearchPage.createBy }">
					<input id="createDate" name="createDate" type="hidden" value="${epBiSearchPage.createDate }">
					<input id="updateName" name="updateName" type="hidden" value="${epBiSearchPage.updateName }">
					<input id="updateBy" name="updateBy" type="hidden" value="${epBiSearchPage.updateBy }">
					<input id="updateDate" name="updateDate" type="hidden" value="${epBiSearchPage.updateDate }">
					<input id="seVersion" name="seVersion" type="hidden" value="${epBiSearchPage.seVersion }">
		<table style="width: 100%;" cellpadding="0" cellspacing="1" class="formtable">
					<tr>
						<td align="right">
							<label class="Validform_label">
								类型:
							</label>
						</td>
						<td class="value">
						     	 <input id="seType" name="seType" type="text" style="width: 150px" class="inputxt"  
									               
										       value='${epBiSearchPage.seType}'>
							<span class="Validform_checktip"></span>
							<label class="Validform_label" style="display: none;">类型</label>
						</td>
					<tr>
						<td align="right">
							<label class="Validform_label">
								状态:
							</label>
						</td>
						<td class="value">
						     	 <input id="seStatus" name="seStatus" type="text" style="width: 150px" class="inputxt"  
									               
										       value='${epBiSearchPage.seStatus}'>
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
						  	 	<textarea id="seNote" style="width:98%;" class="inputxt" rows="6" name="seNote">${epBiSearchPage.seNote}</textarea>
							<span class="Validform_checktip"></span>
							<label class="Validform_label" style="display: none;">备注</label>
						</td>
					<tr>
						<td align="right">
							<label class="Validform_label">
								排序:
							</label>
						</td>
						<td class="value">
						     	 <input id="seSort" name="seSort" type="text" style="width: 150px" class="inputxt"  
									               
										       value='${epBiSearchPage.seSort}'>
							<span class="Validform_checktip"></span>
							<label class="Validform_label" style="display: none;">排序</label>
						</td>
					</tr>
					<tr>
						<td align="right">
							<label class="Validform_label">
								用户主键:
							</label>
						</td>
						<td class="value">
						     	 <input id="seUserid" name="seUserid" type="text" style="width: 150px" class="inputxt"  
									               
										       value='${epBiSearchPage.seUserid}'>
							<span class="Validform_checktip"></span>
							<label class="Validform_label" style="display: none;">用户主键</label>
						</td>
					<tr>
						<td align="right">
							<label class="Validform_label">
								输出:
							</label>
						</td>
						<td class="value">
						     	 <input id="seOutput" name="seOutput" type="text" style="width: 150px" class="inputxt"  
									               
										       value='${epBiSearchPage.seOutput}'>
							<span class="Validform_checktip"></span>
							<label class="Validform_label" style="display: none;">输出</label>
						</td>
					</tr>
					<tr>
						<td align="right">
							<label class="Validform_label">
								查询名称:
							</label>
						</td>
						<td class="value">
						     	 <input id="seSearchname" name="seSearchname" type="text" style="width: 150px" class="inputxt"  
									               
										       value='${epBiSearchPage.seSearchname}'>
							<span class="Validform_checktip"></span>
							<label class="Validform_label" style="display: none;">查询名称</label>
						</td>
					<tr>
						<td align="right">
							<label class="Validform_label">
								查询条件:
							</label>
						</td>
						<td class="value">
						     	 <input id="seSearchwhere" name="seSearchwhere" type="text" style="width: 150px" class="inputxt"  
									               
										       value='${epBiSearchPage.seSearchwhere}'>
							<span class="Validform_checktip"></span>
							<label class="Validform_label" style="display: none;">查询条件</label>
						</td>
					</tr>
					<tr>
						<td align="right">
							<label class="Validform_label">
								配置:
							</label>
						</td>
						<td class="value">
						     	 <input id="seConfig" name="seConfig" type="text" style="width: 150px" class="inputxt"  
									               
										       value='${epBiSearchPage.seConfig}'>
							<span class="Validform_checktip"></span>
							<label class="Validform_label" style="display: none;">配置</label>
						</td>
					<tr>
						<td align="right">
							<label class="Validform_label">
								事件:
							</label>
						</td>
						<td class="value">
						     	 <input id="seTrigger" name="seTrigger" type="text" style="width: 150px" class="inputxt"  
									               
										       value='${epBiSearchPage.seTrigger}'>
							<span class="Validform_checktip"></span>
							<label class="Validform_label" style="display: none;">事件</label>
						</td>
					</tr>
			</table>
		</t:formvalid>
 </body>
