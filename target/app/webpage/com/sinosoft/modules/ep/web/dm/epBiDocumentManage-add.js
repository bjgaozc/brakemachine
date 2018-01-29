var epBiDocumentManageAdd = {
	/**
	 * 初始化
	 * 
	 * @author cmh
	 */
	initAll: function(){
//		alert(this.id);
		common.initUploadBtn("选择文件","#file1");
//		$("#documentType").combobox("setValue",$("#documentType").val());
	},
	id: $("#id").val(),
	/**
	 * 提交表单之前处理
	 * 
	 * @author cmh
	 */
	beforeSave: function(){
		return true;
	},
	/**
	 * 回调
	 * 
	 * @param {} data 数据
	 * @return {Boolean}
	 */
	callback: function(data){
		var s = $.u.cache("epBiDocumentManageList");
		s.dmSearch();
		s.dialogAdd.close();
	},
	file1Callback: function(data){
		var documentType = $("#documentType").combobox("getValue");
		if("Word.Document"===documentType){
			if("doc"!=data.imageType.toLowerCase() && "docx"!=data.imageType.toLowerCase()){
				common.alert("格式只能为[doc,docx]，请重新上传");
				return;
			}
		}else if("Excel.Sheet"===documentType){
			if("xls"!=data.imageType.toLowerCase() && "xlsx"!=data.imageType.toLowerCase()){
				common.alert("格式只能为[xls,xlsx]，请重新上传");
				return;
			}
		}else if("PowerPoint.Show"===documentType){
			if("ppt"!=data.imageType.toLowerCase() && "pptx"!=data.imageType.toLowerCase()){
				common.alert("格式只能为[xls,xlsx]，请重新上传");
				return;
			}
		}
		$("#documentName").val(data.uploadImageFileName);
		$("#fileName").val(data.uploadImageFileName);
		$("#filePathStr").val(data.tempImagePathAndName+","+data.uploadImageFileName+","+data.imageType);
	}
};

$(function(){
	epBiDocumentManageAdd.initAll();
});