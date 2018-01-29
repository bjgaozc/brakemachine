<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@include file="/context/tags.jsp"%>
<app:template title="测试" autoloadjs="true">

<div class="easyui-accordion" style="width:100%">
	<div title="所有示例" data-options="iconCls:'fa fa-flag'" style="padding: 10px;">
		<p>
			<a href="javascript:void(0);" class="easyui-linkbutton btnc" url="all"><i class="fa fa-link"></i>点击查看所有组件示例</a>
			<a href="javascript:void(0);" class="easyui-linkbutton btnc" url="layout1"><i class="fa fa-link"></i>示例1</a>
			<a href="javascript:void(0);" class="easyui-linkbutton btnc" url="layout2"><i class="fa fa-link"></i>示例2</a>
			<a href="javascript:void(0);" class="easyui-linkbutton btnc" url="layout3"><i class="fa fa-link"></i>示例3</a>
		</p>
	</div>
	<div title="所有主题" data-options="iconCls:'fa fa-flag',selected:true" style="padding: 10px;">
		<p>
			<a href="javascript:void(0);" class="easyui-linkbutton btnc" url="zui"><i class="fa fa-link"></i>zui主题</a>
			<a href="javascript:void(0);" class="easyui-linkbutton btnc" url="ace"><i class="fa fa-link"></i>ace主题</a>
			<a href="javascript:void(0);" class="easyui-linkbutton btnc" url="hplus"><i class="fa fa-link"></i>hplus主题</a>
			<a href="javascript:void(0);" class="easyui-linkbutton btnc" url="bea"><i class="fa fa-link"></i>Be Angular主题</a>
			<a href="javascript:void(0);" class="easyui-linkbutton btnc" url="planeui"><i class="fa fa-link"></i>planeui</a>
			<a href="javascript:void(0);" class="easyui-linkbutton btnc" url="element"><i class="fa fa-link"></i>element-ui</a>
			<a href="javascript:void(0);" class="easyui-linkbutton btnc" url="vue"><i class="fa fa-link"></i>vue测试</a>
			<a href="javascript:void(0);" class="easyui-linkbutton btnc" url="adminlte"><i class="fa fa-link"></i>adminlte主题</a>
			<a href="javascript:void(0);" class="easyui-linkbutton btnc" url="jqweui"><i class="fa fa-link"></i>jqweui主题</a>
		</p>
	</div>
	<div title="测试组件和标签" data-options="iconCls:'fa fa-flag',selected:true" style="padding: 10px;">
		<p>
			<a href="javascript:void(0);" class="easyui-linkbutton btnt" ><i class="fa fa-link"></i>弹出窗口</a>
			<a href="javascript:void(0);" class="easyui-linkbutton btnt" ><i class="fa fa-link"></i>数据库类型</a>
			<a href="javascript:void(0);" class="easyui-linkbutton btnt" ><i class="fa fa-link"></i>提示</a>
		</p>
		<p>
			<a href="javascript:void(0);" class="easyui-linkbutton btnc" url="datagrid"><i class="fa fa-link"></i>数据表格</a>
			<a href="javascript:void(0);" class="easyui-linkbutton btnc" url="datagrid2"><i class="fa fa-link"></i>可编辑表格</a>
			<a href="javascript:void(0);" class="easyui-linkbutton btnc" url="autoUpload"><i class="fa fa-link"></i>自动上传</a>
			<a href="javascript:void(0);" class="easyui-linkbutton btnc" url="chooseOrg"><i class="fa fa-link"></i>选择单位</a>
			<a href="javascript:void(0);" class="easyui-linkbutton btnc" url="choosePerson"><i class="fa fa-link"></i>选择人员</a>
			<a href="javascript:void(0);" class="easyui-linkbutton btnc" url="chooseCountry"><i class="fa fa-link"></i>选择国家</a>
			
			<br><br>
			<a href="javascript:void(0);" class="easyui-linkbutton btnc" url="chooseAchieve"><i class="fa fa-link"></i>选择成就</a>
			<a href="javascript:void(0);" class="easyui-linkbutton btnc" url="comboboxCascade"><i class="fa fa-link"></i>combobox级联</a>
			<a href="javascript:void(0);" class="easyui-linkbutton btnc" url="select2Cascade"><i class="fa fa-link"></i>select2级联</a>
			
			<br><br>
			<a href="javascript:void(0);" class="easyui-linkbutton btnc" url="date"><i class="fa fa-link"></i>日期控件</a>
			<a href="javascript:void(0);" class="easyui-linkbutton btnc" url="menu"><i class="fa fa-link"></i>菜单</a>
		</p>
		<p>
			<a href="javascript:void(0);" class="easyui-linkbutton btnc" url="select"><i class="fa fa-link"></i>下拉框</a>
		</p>
		<p>
			<a href="javascript:void(0);" class="easyui-linkbutton btnc" url="highcharts"><i class="fa fa-link"></i>图表示例</a>
			<a href="javascript:void(0);" class="easyui-linkbutton btnc" url="echarts"><i class="fa fa-link"></i>Echarts</a>
			<a href="javascript:void(0);" class="easyui-linkbutton btnc" url="openlayers"><i class="fa fa-link"></i>openlayers</a>
			<a href="javascript:void(0);" class="easyui-linkbutton btnc" url="laytpl"><i class="fa fa-link"></i>laytpl</a>
			<a href="javascript:void(0);" class="easyui-linkbutton btnc" url="duoshuo"><i class="fa fa-link"></i>多说</a>
			<a href="javascript:void(0);" class="easyui-linkbutton btnc" url="timeline"><i class="fa fa-link"></i>时间轴</a>
			<a href="javascript:void(0);" class="easyui-linkbutton btnc" url="md"><i class="fa fa-link"></i>Editor.md</a>
			<a href="javascript:void(0);" class="easyui-linkbutton btnc" url="step"><i class="fa fa-link"></i>步骤条</a>
			<a href="javascript:void(0);" class="easyui-linkbutton btnc" url="ystep"><i class="fa fa-link"></i>步骤条2</a>
			<a href="javascript:void(0);" class="easyui-linkbutton btnc" url="jsmodern"><i class="fa fa-link"></i>jsmodern</a>
		</p>
	</div>
	<div title="测试表单" data-options="iconCls:'fa fa-flag'" style="padding: 10px;">
		<p>
			<a href="javascript:void(0);" class="easyui-linkbutton btnc" url="form1"><i class="fa fa-link"></i>表单1</a>
			<a href="javascript:void(0);" class="easyui-linkbutton btnc" url="form2"><i class="fa fa-link"></i>表单2</a>
			<a href="javascript:void(0);" class="easyui-linkbutton btnc" url="form3"><i class="fa fa-link"></i>表单3</a>
		</p>
	</div>
	<div title="测试jeasyui-extensions" data-options="iconCls:'fa fa-flag'" style="padding: 10px;">
		<p><a href="http://www.easyui-extlib.com/" target="_blank" class="easyui-linkbutton" ><i class="fa fa-link"></i>查看官网</a></p>
		<p>
			<a href="javascript:void(0);" class="easyui-linkbutton btnc" url="loading"><i class="fa fa-link"></i>遮罩</a>
			<a href="javascript:void(0);" class="easyui-linkbutton btnc" url="tooltip"><i class="fa fa-link"></i>提示</a>
			<a href="javascript:void(0);" class="easyui-linkbutton btnc" url="alert"><i class="fa fa-link"></i>Alert</a>
			<a href="javascript:void(0);" class="easyui-linkbutton btnc" url="sealed"><i class="fa fa-link"></i>快速显示目录</a>
			<a href="javascript:void(0);" class="easyui-linkbutton btnc" url="toolbar"><i class="fa fa-link"></i>Toolbar</a>
			<a href="javascript:void(0);" class="easyui-linkbutton btnc" url="singleDatagrid"><i class="fa fa-link"></i>单列表选择框</a>
		</p>
	</div>
</div>

</app:template>