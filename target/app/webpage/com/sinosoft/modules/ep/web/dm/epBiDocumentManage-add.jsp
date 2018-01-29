<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@include file="/context/tags.jsp"%>
<app:template title="文档管理-${title}" autoloadjs="true">
	<div class="pd-15 pd-l-15 pd-r-15">
		<app:form action="epBiDocumentManageController.do?doSave" beforeSubmit="epBiDocumentManageAdd.beforeSave" callback="epBiDocumentManageAdd.callback">
			<input type="hidden" id="id" name="id" value="${dm.id}" >
			<app:formItem ccsClass="col-6 pd-r-5" title="业务类型" name="dmBusinesstype" value="${dm.dmBusinesstype}" />
			<app:formItem ccsClass="col-6 pd-r-5" title="名称" name="name" value="${dm.name}" required="true" />
			
			<app:formItem ccsClass="col-6 pd-r-5" title="文档路径" name="documentPath" value="${dm.documentPath}" />
			<app:formItem ccsClass="col-6 pd-r-5" title="文档名称" name="documentName" value="${dm.documentName}" required="true" />
			
			<app:formItem type="select" valueField="id" selectUrl="[{id:'Word.Document',text:'Word文档'},{id:'Excel.Sheet',text:'Excel文档'},{id:'PowerPoint.Show',text:'PowerPoint文档'}]" dataOptions="editable:false,panelHeight:'auto'" 
				ccsClass="col-6 pd-r-5" title="文档类型" name="documentType" value="${dm.documentType}" required="true" />
			<app:formItem ccsClass="col-6 pd-r-5" title="排序" name="dmSort" value="${dm.dmSort}" />
			
			<app:formItem type="custom" ccsClass="col-6 pd-r-5" title="上传模板" name="scmb">
				<div class="form-control col-8 pd-r-0 pd-l-0" >
					<input type="text" class="form-control easyui-validatebox" id="fileName" name="fileName" value="" readonly="readonly" >
					<input type="hidden" id="filePathStr" name="filePathStr" value="" >
				</div>
				<div class="form-control col-4 pd-r-0 pd-l-0" >
					<sino:uploadImage id="file1" customFun="epBiDocumentManageAdd.file1Callback" imageType="doc,DOC,doc,DOCX,xls,XLS,xlsx,XLSX,ppt,PPT,pptx,PPTX" />
				</div>
			</app:formItem>
		</app:form>
	</div>
</app:template>