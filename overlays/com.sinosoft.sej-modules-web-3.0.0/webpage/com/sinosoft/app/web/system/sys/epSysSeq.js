
/**
 * 验证编码是否唯一
 */
function validateNameEn(){
	var id = "nameEn";
	var nameEn = $("#"+id).val();
	if("" !=nameEn){
		var r = ajax("epSysSeqController.do?validateNameEn",{"nameEn":nameEn});
		if(r){
			$('#name').val(nameEn);
		}else{
			artAlert("编码必须唯一");
			$("#"+id).val("");
			$("#"+id).focus();
		}
	}
}


/**
 * 初始化前缀组合框
 * 
 * @param id
 */
function initPrefixCombobox(id, type){
	$('#'+id).combobox({
    	url:"epSysSeqController.do?prefixFlag",
    	valueField:'id',
    	textField:'text',
    	onSelect: function(rec){
    		$("#"+id).val(rec.id);
    	},
    	formatter: function(row){
    		var opts = $(this).combobox('options');
    		var text = row[opts.textField];
    		return text;
    	}
	});
	if(type && type=="add" && id=="prefix"){
		$('#'+id).combobox('setValue',"_seq_p3");
	}
}

/**
 * 前缀值替换
 * 
 * @param value
 */
function prefixComboboxReplaceValue(id, value){
	value = value.replace("_seq_p1","当前年缩写");
	value = value.replace("_seq_p2","当前年");
	value = value.replace("_seq_p3","当前年月");
	value = value.replace("_seq_p4","当前年月日");
	value = value.replace("_seq_p5","当前月");
	$('#'+id).combobox();
	$('#'+id).combobox('setValue',value); 
}





function browseImages(inputId, Img) {// 图片管理器，可多个上传共用
		var finder = new CKFinder();
		finder.selectActionFunction = function(fileUrl, data) {//设置文件被选中时的函数 
			$("#" + Img).attr("src", fileUrl);
			$("#" + inputId).attr("value", fileUrl);
		};
		finder.resourceType = 'Images';// 指定ckfinder只为图片进行管理
		finder.selectActionData = inputId; //接收地址的input ID
		finder.removePlugins = 'help';// 移除帮助(只有英文)
		finder.defaultLanguage = 'zh-cn';
		finder.popup();
	}
function browseFiles(inputId, file) {// 文件管理器，可多个上传共用
	var finder = new CKFinder();
	finder.selectActionFunction = function(fileUrl, data) {//设置文件被选中时的函数 
		$("#" + file).attr("href", fileUrl);
		$("#" + inputId).attr("value", fileUrl);
		decode(fileUrl, file);
	};
	finder.resourceType = 'Files';// 指定ckfinder只为文件进行管理
	finder.selectActionData = inputId; //接收地址的input ID
	finder.removePlugins = 'help';// 移除帮助(只有英文)
	finder.defaultLanguage = 'zh-cn';
	finder.popup();
}
function decode(value, id) {//value传入值,id接受值
	var last = value.lastIndexOf("/");
	var filename = value.substring(last + 1, value.length);
	$("#" + id).text(decodeURIComponent(filename));
}