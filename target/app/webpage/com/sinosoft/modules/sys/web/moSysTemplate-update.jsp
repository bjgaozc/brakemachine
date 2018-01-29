<%@ page language="java" import="java.util.*" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@include file="/context/mytags.jsp"%>
<!DOCTYPE html>
<html>
 <head>
  <title>模板管理</title>
  <t:base type="jquery,easyui,tools,DatePicker"></t:base>
  <script type="text/javascript">
  //编写自定义JS代码
  </script>
 </head>
 <body>
  <t:formvalid formid="formobj" dialog="true" usePlugin="password" layout="table" action="moSysTemplateController.do?doUpdate" tiptype="1">
					<input id="id" name="id" type="hidden" value="${moSysTemplatePage.id }">
					<input id="createName" name="createName" type="hidden" value="${moSysTemplatePage.createName }">
					<input id="createBy" name="createBy" type="hidden" value="${moSysTemplatePage.createBy }">
					<input id="createDate" name="createDate" type="hidden" value="${moSysTemplatePage.createDate }">
					<input id="updateName" name="updateName" type="hidden" value="${moSysTemplatePage.updateName }">
					<input id="updateBy" name="updateBy" type="hidden" value="${moSysTemplatePage.updateBy }">
					<input id="updateDate" name="updateDate" type="hidden" value="${moSysTemplatePage.updateDate }">
					<input id="teVersion" name="teVersion" type="hidden" value="${moSysTemplatePage.teVersion }">
		<table style="width: 100%;" cellpadding="0" cellspacing="1" class="formtable">
					<tr>
						<td align="right">
							<label class="Validform_label">
								类型:
							</label>
						</td>
						<td class="value">
						     	 <input id="teType" name="teType" type="text" style="width: 150px" class="inputxt"  
									               
										       value='${moSysTemplatePage.teType}'>
							<span class="Validform_checktip"></span>
							<label class="Validform_label" style="display: none;">类型</label>
						</td>
						<td align="right">
							<label class="Validform_label">
								状态:
							</label>
						</td>
						<td class="value">
						     	 <input id="teStatus" name="teStatus" type="text" style="width: 150px" class="inputxt"  
									               
										       value='${moSysTemplatePage.teStatus}'>
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
						  	 	<textarea id="teNote" style="width:98%;" class="inputxt" rows="6" name="teNote">${moSysTemplatePage.teNote}</textarea>
							<span class="Validform_checktip"></span>
							<label class="Validform_label" style="display: none;">备注</label>
						</td>
						<td align="right">
							<label class="Validform_label">
								排序:
							</label>
						</td>
						<td class="value">
						     	 <input id="teSort" name="teSort" type="text" style="width: 150px" class="inputxt"  
									               
										       value='${moSysTemplatePage.teSort}'>
							<span class="Validform_checktip"></span>
							<label class="Validform_label" style="display: none;">排序</label>
						</td>
					</tr>
					<tr>
						<td align="right">
							<label class="Validform_label">
								业务类型:
							</label>
						</td>
						<td class="value">
						     	 <input id="teBusinesstype" name="teBusinesstype" type="text" style="width: 150px" class="inputxt"  
									               
										       value='${moSysTemplatePage.teBusinesstype}'>
							<span class="Validform_checktip"></span>
							<label class="Validform_label" style="display: none;">业务类型</label>
						</td>
						<td align="right">
							<label class="Validform_label">
								模板编码:
							</label>
						</td>
						<td class="value">
						     	 <input id="teCode" name="teCode" type="text" style="width: 150px" class="inputxt"  
									               
										       value='${moSysTemplatePage.teCode}'>
							<span class="Validform_checktip"></span>
							<label class="Validform_label" style="display: none;">模板编码</label>
						</td>
					</tr>
					<tr>
						<td align="right">
							<label class="Validform_label">
								模板名称:
							</label>
						</td>
						<td class="value">
						     	 <input id="teName" name="teName" type="text" style="width: 150px" class="inputxt"  
									               
										       value='${moSysTemplatePage.teName}'>
							<span class="Validform_checktip"></span>
							<label class="Validform_label" style="display: none;">模板名称</label>
						</td>
						<td align="right">
							<label class="Validform_label">
								模板简称:
							</label>
						</td>
						<td class="value">
						     	 <input id="teNameShort" name="teNameShort" type="text" style="width: 150px" class="inputxt"  
									               
										       value='${moSysTemplatePage.teNameShort}'>
							<span class="Validform_checktip"></span>
							<label class="Validform_label" style="display: none;">模板简称</label>
						</td>
					</tr>
					<tr>
						<td align="right">
							<label class="Validform_label">
								模板英文名称:
							</label>
						</td>
						<td class="value">
						     	 <input id="teNameEn" name="teNameEn" type="text" style="width: 150px" class="inputxt"  
									               
										       value='${moSysTemplatePage.teNameEn}'>
							<span class="Validform_checktip"></span>
							<label class="Validform_label" style="display: none;">模板英文名称</label>
						</td>
						<td align="right">
							<label class="Validform_label">
								模板内容:
							</label>
						</td>
						<td class="value">
						  	 	<textarea id="teContent" style="width:98%;" class="inputxt" rows="6" name="teContent">${moSysTemplatePage.teContent}</textarea>
							<span class="Validform_checktip"></span>
							<label class="Validform_label" style="display: none;">模板内容</label>
						</td>
					</tr>
					<tr>
						<td align="right">
							<label class="Validform_label">
								分组:
							</label>
						</td>
						<td class="value">
						     	 <input id="teGroup" name="teGroup" type="text" style="width: 150px" class="inputxt"  
									               
										       value='${moSysTemplatePage.teGroup}'>
							<span class="Validform_checktip"></span>
							<label class="Validform_label" style="display: none;">分组</label>
						</td>
						<td align="right">
							<label class="Validform_label">
								关键字:
							</label>
						</td>
						<td class="value">
						     	 <input id="teKeys" name="teKeys" type="text" style="width: 150px" class="inputxt"  
									               
										       value='${moSysTemplatePage.teKeys}'>
							<span class="Validform_checktip"></span>
							<label class="Validform_label" style="display: none;">关键字</label>
						</td>
					</tr>
					<tr>
						<td align="right">
							<label class="Validform_label">
								上级主键:
							</label>
						</td>
						<td class="value">
						     	 <input id="teFid" name="teFid" type="text" style="width: 150px" class="inputxt"  
									               
										       value='${moSysTemplatePage.teFid}'>
							<span class="Validform_checktip"></span>
							<label class="Validform_label" style="display: none;">上级主键</label>
						</td>
						<td align="right">
							<label class="Validform_label">
								所有上级主键:
							</label>
						</td>
						<td class="value">
						     	 <input id="teFids" name="teFids" type="text" style="width: 150px" class="inputxt"  
									               
										       value='${moSysTemplatePage.teFids}'>
							<span class="Validform_checktip"></span>
							<label class="Validform_label" style="display: none;">所有上级主键</label>
						</td>
					</tr>
					<tr>
						<td align="right">
							<label class="Validform_label">
								文件路径:
							</label>
						</td>
						<td class="value">
						     	 <input id="teFilepath" name="teFilepath" type="text" style="width: 150px" class="inputxt"  
									               
										       value='${moSysTemplatePage.teFilepath}'>
							<span class="Validform_checktip"></span>
							<label class="Validform_label" style="display: none;">文件路径</label>
						</td>
						<td align="right">
							<label class="Validform_label">
								图片:
							</label>
						</td>
						<td class="value">
						     	 <input id="tePic" name="tePic" type="text" style="width: 150px" class="inputxt"  
									               
										       value='${moSysTemplatePage.tePic}'>
							<span class="Validform_checktip"></span>
							<label class="Validform_label" style="display: none;">图片</label>
						</td>
					</tr>
			</table>
		</t:formvalid>
 </body>
