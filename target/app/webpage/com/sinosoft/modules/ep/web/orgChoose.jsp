<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@include file="/context/tags.jsp"%>
<app:template title="选择单位" autoloadjs="true">

<div id="coLayoutId" class="easyui-layout" data-options="fit:true">   
	<div data-options="region:'center',border:false">
		<div id="orgTreeDiv"></div>
	</div>
	<div data-options="region:'south',border:true" style="height:50px;text-align: center;padding-top: 10px;">
		<div>
			<a id="confirmBtn" href="#" class="easyui-linkbutton c6" data-options="iconCls:'fa fa-save'" style="width:80px">确定</a>
			<a id="clearBtn" href="#" class="easyui-linkbutton c5" data-options="iconCls:'fa fa-trash-o'" style="width:80px">清空</a>
			<%--
			<a id="closeBtn" href="#" class="easyui-linkbutton" data-options="iconCls:'fa fa-close'" style="width:80px">关闭</a>
			--%>
		</div>
	</div>
</div>

<app:chooseOrg url="${treeUrl}" optionsCode="${optionsCode}" targetType="1" check="${check}" targetId="#orgTreeDiv" onclick="orgChoose.orgClick" />
</app:template>


