<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@include file="/context/tags.jsp"%>
<app:template title="文档管理-${title}" autoloadjs="true">
	
	<div class="pd-15 pd-l-15 pd-r-15">
		<app:form action="epBiDocumentManageController.do?saveFile=true" beforeSubmit="abc" btnType="1">
			<input type="hidden" id="id" name="id" value="${dm.id}" >
			<input type="hidden" id="rootPath" name="rootPath" value="${rootPath}" >
			<input type="hidden" id="fileExists" name="fileExists" value="${fileExists}" >
			
			<app:formItem ccsClass="col-6 pd-r-5" title="业务类型" name="dmBusinesstype" value="${dm.dmBusinesstype}" />
			<app:formItem ccsClass="col-6 pd-r-5" title="名称" name="name" value="${dm.name}" required="true" />
			
			<app:formItem ccsClass="col-6 pd-r-5" title="文档路径" name="documentPath" value="${dm.documentPath}" />
			<app:formItem ccsClass="col-6 pd-r-5" title="文档名称" name="documentName" value="${dm.documentName}" required="true" />
			
			<app:formItem type="select" valueField="id" selectUrl="[{id:'Word.Document',text:'Word文档'},{id:'Excel.Sheet',text:'Excel文档'},{id:'PowerPoint.Show',text:'PowerPoint文档'}]" dataOptions="editable:false,panelHeight:'auto'" 
				ccsClass="col-6 pd-r-5" title="文档类型" name="documentType" value="${dm.documentType}" required="true" />
			<app:formItem ccsClass="col-6 pd-r-5" title="排序" name="dmSort" value="${dm.dmSort}" />
			
			<div class="form-group text-center">
				<a id="btn_save" href="javascript:void(0);" class="easyui-linkbutton" data-options="iconCls:'fa fa-save'" style="width: 120px;">保存</a>
				<a id="btn_close" href="javascript:void(0);" class="easyui-linkbutton" data-options="iconCls:'fa fa-close'" style="width: 120px;">关闭</a>
			</div>
		</app:form>
	</div>

	<div class="pd-l-15 pd-r-15" style="height: 500px;">
		<div id="officecontrol" style="height: 100%;">
		<app:officecontrol caption="${title}" callback="epBiDocumentManageUpdate.callback" forOnFileCommand="epBiDocumentManageUpdateFileCommand" />
	</div>

<script>
$(function(){
	epBiDocumentManageUpdate.initAll();
});
</script>
</app:template>