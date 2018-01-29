var epBiDocumentManageUpdate = {
	/**
	 * 初始化
	 * 
	 * @author cmh
	 */
	initAll: function(){
		this.initBtn();
		this.initDocumentName();
		
		this.id = $("#id").val();
		this.name = $("#name").val();
		this.documentType = $("#documentType").val();
		this.rootPath = $("#rootPath").val();
		this.fileExists = $("#fileExists").val();
		
//		$("#documentName").attr("disabled",true);
		$("#documentType").combobox("disable");
		$("#officecontrol").attr("src", "epBiDocumentManageController.do?officecontrol=true");
	},
	/**
	 * 控件加载完成的回调
	 * 
	 * @author cmh
	 * @param {} obj
	 */
	callback: function(obj){
		try{
			var that = this;
			setTimeout(function(){
				if("true"===that.fileExists){
//					obj.Caption = "标题";
//					obj.CreateNew(this.documentType);
//					obj.BeginOpenFromURL("dm/a.doc");
					obj.BeginOpenFromURL("epBiDocumentManageController.do?loadFile=true&id="+that.id);
				}else{
					// 新建文档，以便保存
					obj.CreateNew(that.documentType);
				}
			},500);
		}catch(e){
			alert(e.message);
			epBiDocumentManageUpdate.error = true;
		}
	},
	/**
	 * 初始化按钮
	 * 
	 * @author cmh
	 * @param {} obj
	 */
	initBtn: function(){
		var that = this;
		$("#btn_save").on("click",function(){
			that.saveFileToUrl();
		});
		$("#btn_close").on("click",function(){
//			window.close();
			var s = $.u.cache("epBiDocumentManageList");
			if(s){
				s.dmSearch();
				s.dialogNew.close();
			}
		});
	},
	/**
	 * 初始化文档名称
	 * 
	 * @author cmh
	 * @param {} obj
	 */
	initDocumentName: function(){
		if(""==this.id){
			$("#documentName").val(this.name+this.getSuffix());
		}
	},
	/**
	 * 保存文件
	 * 
	 * @author cmh
	 */
	saveFileToUrl: function(){
//		var v = $("#formobj").form("enableValidation").form("validate");
//		if(!v) return false;
		
		if(!epBiDocumentManageUpdate.error){
			var result = this.getObj().saveToURL(
				$("#formobj").attr("action"), //提交到的url地址
				"upLoadFile", //文件域的id，类似<input type=file id=upLoadFile 中的id
				"fileType="+this.getFileType(), //与控件一起提交的参数如："p1=a&p2=b&p3=c"
				$("#documentName").val(), //上传文件的名称，类似<input type=file 的value
				0 //与控件一起提交的表单id，也可以是form的序列号，这里应该是0.
			);
//			alert(result);
			alert("保存成功");
		}else{
			alert("控件读取文档发现问题");
		}
	},
	/**
	 * 获得文档类型
	 * 
	 * @author cmh
	 */
	getObj: function(){
		return TANGER_OCX_OBJ;
	},
	/**
	 * 获得文档类型
	 * 
	 * @author cmh
	 */
	getFileType: function(){
		var fileType = "";
		switch (this.getObj().doctype){
			case 1:
				fileType = "Word.Document";
				break;
			case 2:
				fileType = "Excel.Sheet";
				break;
			case 3:
				fileType = "PowerPoint.Show";
				break;
			case 4:
				fileType = "Visio.Drawing";
				break;
			case 5:
				fileType = "MSProject.Project";
				break;
			case 6:
				fileType = "WPS Doc";
				break;
			case 7:
				fileType = "Kingsoft Sheet";
				break;
			default :
				fileType = "unkownfiletype";
		}
		return fileType;
	},
	/**
	 * 获得文档后缀
	 * 
	 * @author cmh
	 */
	getSuffix: function(){
		if("Word.Document"===this.documentType){
			return ".doc";
		}else if("Excel.Sheet"===this.documentType){
			return ".xls";
		}else if("PowerPoint.Show"===this.documentType){
			return ".ttp";
		}else{
			return "";
		}
	}
};
function epBiDocumentManageUpdateFileCommand(str,obj){
	if (str == 3){
		epBiDocumentManageUpdate.getObj().CancelLastCommand = true;
		epBiDocumentManageUpdate.saveFileToUrl();
	}
}