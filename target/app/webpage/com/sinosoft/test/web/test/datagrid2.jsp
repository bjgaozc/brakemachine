<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@include file="/context/tags.jsp"%>
<app:template title="数据表格" plugins="jeasyui-extensions">

<div class="col-12 pd-10">

	<table id="dg" class="easyui-datagrid" title="数据表格" style="width:100%;height:500px"
		data-options="
			//rowTooltip:true,
			singleSelect:true,
			collapsible:true,
			fitColumns:true,
			url:'epBiPersonController.do?datagrid',
			pagination:true,
			toolbar: [{
				id:'dg_btn_add',
				text:'新增',
				iconCls: 'fa fa-plus'
			},'-',{
				id:'dg_btn_edit',
				text:'编辑',
				iconCls: 'fa fa-edit'
			},'-',{
				id:'dg_btn_save',
				text:'保存',
				iconCls: 'fa fa-save'
			},'-',{
				id:'dg_btn_delete',
				text:'删除',
				iconCls: 'fa fa-trash-o'
			},'-',{
				id:'dg_btn_upload',
				text:'上传HT文件',
				iconCls: 'fa fa-upload'
			}]
			"
		>
		<thead>
			<tr>
				<th data-options="field:'id'" width="100">编号</th>
				<th data-options="field:'personId',tooltip:true" width="100">人员编号</th>
				<th data-options="field:'name',editor:{'type':'text'}" width="100">姓名</th>
				<th data-options="field:'pinyin',editor:{'type':'text'}" width="100">拼音</th>
				<th data-options="field:'sex',editor:{'type':'text'}" width="100">性别</th>
				<th data-options="field:'nation',editor:{'type':'text'}" width="100">民族</th>
			</tr>
		</thead>
	</table>

</div>

<div class="col-6 pd-t-10 pd-l-5 pd-r-10">
	<div id="imgDiv3" ></div>
</div>


<sino:uploadImage id="img1" customFun="imgFun" imageType="jpg,ht,HT" />
<app:editableDatagrid callback="abc" />
<script>
$(function(){
	//initUploadBtn();
	common.initUploadBtn("上传HT文件","#dg_btn_upload","4");
});

function rowTooltipFormatter(rowIndex, rowData){
	return '人员编号：'+rowData.id;
}

function initUploadBtn(){
	$(".ieDiv").hide();
	$("#dg_btn_upload").on("click",function(){
		$("#img1").trigger("click");
	});
}

function imgFun(data){
	log(data);
	if("ht"==data.imageType||"HT"==data.imageType){
		$("#imgDiv3").append("<p>"+data.uploadImageFileName+"</p><p>"+data.tempImagePathAndName+"</p>");
	}else{
		$("#imgDiv3").append("<img src='"+data.tempImagePathAndName+"'/>");
	}
}

function abc(data){
	log(data);
}
</script>
			
</app:template>