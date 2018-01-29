<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@include file="/context/tags.jsp"%>
<app:template title="选择人员" autoloadjs="true">

<div id="cpLayoutId" class="easyui-layout" data-options="fit:true">   
	<div data-options="region:'west',title:'选择单位'" style="width: 200px;">
      <div id="orgTreeDiv"></div>
    </div>
	<div data-options="region:'center',border:false">
		<div id="cpDsId"></div>
	</div>
	<div data-options="region:'south',border:true" style="height:50px;text-align: center;padding-top: 10px;">
		<div ><a href="#" class="okBtn" style="width:80px">确定</a></div>
	</div>
</div>
  
<table id="cpDsLeftTableId" title="未选择记录"></table>
<table id="cpDsRightTableId" title="已选择记录"></table>

<app:chooseOrg targetType="1" targetId="#orgTreeDiv" onclick="personChoose.orgClick" optionsCode="${optionsCode}" expandAll="${expandAll}" />
<script type="text/javascript" src="plug-in/sino/easyui/extends/jeasyui-extend-dblselector.js"></script>
	
</app:template>


