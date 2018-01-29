<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@include file="/context/tags.jsp"%>
<app:template title="文档管理" autoloadjs="true">
	
	<div class="search-box pd-15 pd-l-15 pd-r-15">
		<div class="easyui-accordion" id="filedset">
			<div title="查询条件" data-options="selected:true, iconCls:'fa fa-search'" style="padding:15px;">
				<form>
					<div class="col-3 pd-r-5">
						<div class="form-group">
							<input class="form-control easyui-validatebox" name="dmBusinesstype" id="dmBusinesstype" placeholder="业务类型">
						</div>
					</div>
					<div class="col-3 pd-r-5">
						<div class="form-group">
							<input class="form-control easyui-validatebox" name="name" id="name" placeholder="名称">
						</div>
					</div>
					<div class="col-6 pd-l-5 ">
						<a id="btn_search" href="#" class="easyui-linkbutton" data-options="iconCls:'fa fa-search'" style="width:30%;">查询</a>
						<a id="btn_reset" href="#" class="easyui-linkbutton" data-options="iconCls:'fa fa-undo'" style="width:30%;">重置</a>
					</div>
				</form>
			</div>
		</div>
	</div>
	<div class="pd-l-15 pd-r-15">
		<table id="dm" style="height: auto;"></table>
		<div id="dmTbId">
			<a id="btn_add" href="javascript:void(0);" class="easyui-linkbutton" plain="true" icon="fa fa-plus">添加</a>
			<a id="btn_edit" href="javascript:void(0);" class="easyui-linkbutton" plain="true" icon="fa fa-edit">编辑</a>
			<%--
			<a href="javascript:void(0);" class="easyui-linkbutton btn_new" plain="true" icon="fa fa-file-word-o" documentType="Word.Document">新建Word模板</a>
			<a href="javascript:void(0);" class="easyui-linkbutton btn_new" plain="true" icon="fa fa-file-excel-o" documentType="Excel.Sheet">新建Excel模板</a>
			<a href="javascript:void(0);" class="easyui-linkbutton btn_new" plain="true" icon="fa fa-file-powerpoint-o" documentType="PowerPoint.Show">新建PPT模板</a>
			--%>
		</div>
	</div>
<script>
$(function(){
	epBiDocumentManageList.initAll();
});
</script>	
</app:template>

