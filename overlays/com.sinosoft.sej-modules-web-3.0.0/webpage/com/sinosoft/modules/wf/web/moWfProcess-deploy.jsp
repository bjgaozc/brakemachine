<%@ page language="java" import="java.util.*" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@include file="/context/mytags.jsp"%>
<!DOCTYPE html>
<html>
 <head>
  <title>部署流程</title>
  <sino:plugins type="jquery,easyui,tools,util"/>
  <script type="text/javascript">
  //编写自定义JS代码
  $(function(){
	  	setTimeout(function(){
		  	$(".filetm").css("height","50px");
		  	$(".ieDiv").css({"height":"50px","background-image":"url(plug-in/sino/ui/default/images/upload.png)","background-position":"0","text-align":"left"});
		}, 100);
  });
  
  function deployFile(data){
	  $("#deployFileInfo").val(data.tempImagePathAndName+","+data.uploadImageFileName);
	  $("#deployFileName").val(data.uploadImageFileName);
  }
  
  function beforeDeploy(){
	  if(""==$("#deployFileInfo").val()){
		  $.messager.alert("温馨提示","请先上传流程文件");
	  	return false;
	  }
	  return true;
  }
  </script>
 </head>
 <body>
  <t:formvalid formid="formobj" dialog="true" layout="table" action="moWfProcessController.do?deploy" tiptype="1" beforeSubmit="beforeDeploy">
		<input type="hidden" id="deployFileInfo" name="deployFileInfo" value="">
		
		<table style="width: 100%;" cellpadding="0" cellspacing="1" class="formtable">
				<tr>
					<td align="right">
						<label class="Validform_label">流程文件:</label>
					</td>
					<td class="value">
					     	<sino:uploadImage customFun="deployFile" imageType="zip,bar,bpmn,bpmn20.xml"/>
					     	 
					     	 支持文件格式：</b>zip、bar、bpmn、bpmn20.xml，建议使用<span style="color: red;">zip</span>包
							<span class="Validform_checktip"></span>
							<label class="Validform_label" style="display: none;">流程文件</label>
						</td>
				</tr>
				<tr>
					<td align="right">
						<label class="Validform_label">文件名称:</label>
					</td>
					<td class="value">
					     	<input type="text" id="deployFileName" readonly="readonly" style="width: 300px;" ><span style="color: gray;">上传成功后会自动填充</span>
						</td>
				</tr>
				
			</table>
		</t:formvalid>
 </body>
