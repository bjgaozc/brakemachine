<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@include file="/context/mytags.jsp"%>
<sino:plugins type="jquery-1.11.3,easyui-default-1.4.4,tools,syExtEasyUI,util" />
<div class="easyui-layout" fit="true">
  <div region="center" style="padding:1px;">
<table id="parameterList"></table>
  </div>
</div>
<div id="parameterListTb">
	<a id="addBtnId" onclick="addParameter('录入','epSysParameterController.do?goAdd=true','parameterList')" href="javascript:void(0);" class="easyui-linkbutton" plain="true" icon="fa fa-lg fa-plus">录入</a>
	<a id="updateBtnId" onclick="updateParameter('编辑','epSysParameterController.do?goUpdate=true','parameterList')" href="javascript:void(0);" class="easyui-linkbutton" plain="true" icon="fa fa-lg fa-edit">编辑</a>
	 
	<a href="javascript:void(0);" class="easyui-linkbutton" plain="true" icon="fa fa-lg fa-refresh" onclick="reloadTable();" id="">刷新</a>
	<a href="javascript:void(0);" class="easyui-linkbutton" plain="true" icon="fa fa-lg fa-download" onclick="exportXml();" id="">导出Xml</a> 
</div>
<script src = "webpage/com/sinosoft/app/web/system/sys/epSysParameterList.js"></script>		
<script type="text/javascript">
 $(document).ready(function(){
	 // 使用懒加载
	 //epSysParameterList.url = "epSysParameterController.do?parentKeyTree";
	 epSysParameterList.initAll();
 });
</script>