<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@include file="/context/mytags.jsp"%>
<!DOCTYPE html>
<html>
 <head>
  <title>菜单自动生成</title>
  <sino:plugins type="jquery,easyui,tools,util"/>
  <script type="text/javascript">
	  $(function(){
	  });
	  function menuCallback(d){
		  $.Hidemsg();
		  if(d.success){
			  tip(d.msg);
		  }else{
			  artError(d.msg);
		  }
	  }
  </script>
 </head>
 <body>
	<div class="easyui-layout" fit="true">
	    <div data-options="region:'center',title:'菜单自动生成'" style="padding: 0px;">
			<t:formvalid formid="formobj" dialog="false" layout="table" action="moSyMenuController.do?updateURLAuth" tiptype="1" callback="menuCallback">
				<table style="width: 100%;" cellpadding="0" cellspacing="1" class="formtable">
					<tr>
						<td align="right" style="width: 30%">
							<label class="Validform_label">请输入模块前缀:</label>
						</td>
						<td class="value">
						 	<input type="text" id="modulePrefix" name="modulePrefix" style="width: 300px;" >
						 	<a id="btn_sub" href="#" class="easyui-linkbutton" iconcls="icon-ok">生成</a>
						</td>
					</tr>
				</table>
			</t:formvalid>
	    </div>
	</div>
 </body>
</html>