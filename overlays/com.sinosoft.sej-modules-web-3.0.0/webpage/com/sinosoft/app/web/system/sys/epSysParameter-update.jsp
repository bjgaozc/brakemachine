<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@include file="/context/mytags.jsp"%>
<!DOCTYPE html>
<html>
 <head>
  <title>基本参数设置</title>
  <sino:plugins type="jquery-1.11.3,easyui-default-1.4.4,tools,syExtEasyUI,util" />
  <script type="text/javascript">
  var epSysParameterList = $.u.cache("epSysParameterList");	
  $(function(){
	  setTimeout(function(){
		  $("#keysSpan").html(epSysParameterList.parameterListColumn[0].title);
		  $("#keysLabel").html(epSysParameterList.parameterListColumn[0].title);
		  $("#valueSpan").html(epSysParameterList.parameterListColumn[2].title);
		  $("#valueLabel").html(epSysParameterList.parameterListColumn[2].title);
	  },200);
  });
  </script>
 </head>
 <body>
  <t:formvalid formid="formobj" dialog="true" usePlugin="password" layout="table" action="epSysParameterController.do?doUpdate=true" tiptype="1">
  		<input id="paramKey" name="paramKey" type="hidden" value='${lSParameterPage.paramKey}'>
			<table cellpadding="0" cellspacing="1" class="formtable">
				<tr>
					<td align="right" style="width: 20%">
						<label class="Validform_label">
							父编号:
						</label>
					</td>
					<td class="value">
						<%--
						<sino:combotree id="parentKey" name="parentKey" idField="paramKey" textField="keys" parentField="parentKey"
					 		url="epSysParameterController.do?parameterTreeGrid=true" width="300" value="${lSParameterPage.parentKey}" />
						--%>
					 
					 	<sino:combotree id="parentKey" name="parentKey" value="${lSParameterPage.parentKey}" idField="paramKey" textField="keys" parentField="parentKey"
							url="epSysParameterController.do?parentKeyTree=true&rootKey=${rootKey}" width="300" />
					 
					 
						<span class="Validform_checktip"></span>
						<label class="Validform_label" style="display: none;">父编号</label>
					</td>
				</tr>
				<tr>
					<td align="right">
						<label class="Validform_label">
							<span id="keysSpan"></span>:
						</label>
					</td>
					<td class="value">
					     	 <input id="keys" name="keys" type="text" style="width: 150px" class="inputxt"  
								               
								                 value='${lSParameterPage.keys}'>
						<span class="Validform_checktip"></span>
						<label id="keysLabel" class="Validform_label" style="display: none;">关键字</label>
					</td>
				</tr>
				<tr>
					<td align="right">
						<label class="Validform_label">
							<span id="valueSpan"></span>:
						</label>
					</td>
					<td class="value">
					    <textarea id="value" name="value" rows="8" style="width: 98%">${lSParameterPage.value}</textarea>
						<span class="Validform_checktip"></span>
						<label id="valueLabel" class="Validform_label" style="display: none;">参数值</label>
					</td>
				</tr>
				<tr>
					<td align="right">
						<label class="Validform_label">
							排序:
						</label>
					</td>
					<td class="value">
					     	 <input id="sort" name="sort" type="text" style="width: 150px" class="inputxt"  
								               datatype="n0-3" value='${lSParameterPage.sort}'>
						<span class="Validform_checktip"></span>
						<label class="Validform_label" style="display: none;">排序</label>
					</td>
				</tr>
				<tr>
					<td align="right">
						<label class="Validform_label">
							状态:
						</label>
					</td>
					<td class="value">
						<input type="radio" id="state1" name="state" value="open" <c:if test="${lSParameterPage.state!='closed'}">checked="checked"</c:if> />展开
					    <input type="radio" id="state1" name="state" value="closed" <c:if test="${lSParameterPage.state=='closed'}">checked="checked"</c:if> />关闭
						<span class="Validform_checktip"></span>
						<label class="Validform_label" style="display: none;">状态</label>
					</td>
				</tr>
				<tr>
					<td align="right">
						<label class="Validform_label">
							描述:
						</label>
					</td>
					<td class="value">
					  	 	<textarea id="descript" name="descript" rows="2" style="width: 98%">${lSParameterPage.descript}</textarea>
						<span class="Validform_checktip"></span>
						<label class="Validform_label" style="display: none;">描述</label>
					</td>
				</tr>
				<tr>
					<td align="right">
						<label class="Validform_label">
							是否可用:
						</label>
					</td>
					<td class="value">
						<t:dictSelect typeGroupCode="sf" field="valide" hasLabel="false" type="radio" defaultVal="${lSParameterPage.valide}" />
							<span class="Validform_checktip"></span>
							<label class="Validform_label" style="display: none;">是否可用</label>
						</td>
				</tr>
				<tr>
					<td align="right">
						<label class="Validform_label">
							分组名称:
						</label>
					</td>
					<td class="value">
					     	 <input type="text" id="groupName" name="groupName" value="${lSParameterPage.groupName}" style="width: 150px" class="inputxt" >
							<span class="Validform_checktip"></span>
							<label class="Validform_label" style="display: none;">分组名称</label>
						</td>
				</tr>
			</table>
		</t:formvalid>
 </body>
