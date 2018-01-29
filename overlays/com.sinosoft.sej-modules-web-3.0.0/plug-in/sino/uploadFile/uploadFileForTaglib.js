/**
 * 上传图片“file” 标签需添加 desc='upload' 属性
 */
var fileFlag = 1;
var fileCount = 1;
var expent = {
	callFunction : null
}

/**
 * 主入口
 * 
 * @param obj
 */
function uploadFile(obj) {
	var opts = obj || {};
	var options = {
		elementId : null,
		divElementId : null,
		data : null,
		url : null,
		validation : false,
		contentType : null,
		fileMaxSize : -1,
		showPhoto : true,
		auto : true,
		maxcount : 5,
		single : false,
		custom : false,
		customFun : function(data) {},
		delFun : function(fileName) {},
		beforeFun : function(data) {return true;}
	}
	options = $.extend(options, opts);
	expent.callFunction = options.delFun;
	if (options.elementId == null || options.elementId == '' || options.url == null || options.url == '') {
		return;
	}

	var filePath = $("#" + options.elementId).val();
	var fileName = filePath.substring(filePath.lastIndexOf('\\') + 1, filePath.lastIndexOf('.'));
	var postfix = filePath.substring(filePath.lastIndexOf('.') + 1, filePath.length);
	
	if (options.validation) {
		if(!checkContentType(options.contentType, postfix)){
			alert("文件格式不正确！");
			return;
		}
		if(options.fileMaxSize!=-1){
			var msg = checkFileSize(options.elementId, options.fileMaxSize);
			if(""!=msg){
				alert(msg);
				return;
			}
		}
	}
	
	// 上传前处理事件
	if(!options.beforeFun(options)){
		return;
	}

	if (options.custom) {
		customUploadFile(options);
		return;
	}

	if (options.divElementId == null || options.divElementId == '') {
		return;
	}

	if (fileCount > options.maxcount) {
		alert("最多上传上传数量：" + options.maxcount);
		return;
	}

	if (options.auto) {
		if (options.single) {
			fileFlag = 1;
			fileCount = 1;
			var tempFileName = $('#ck_' + fileFlag).val();
			if (tempFileName != null && tempFileName != '') {
				options.delFun(tempFileName);
			}
		}
		ajaxUploadFile(options);
	} else {
		if (options.showPhoto) {
			$("#" + options.divElementId).empty();
			$("#" + options.divElementId).append("<div id='"
				+ fileName
				+ "_"
				+ fileFlag
				+ "' class='divdefault' onmouseover='mouseoverCss(this.id)' onmouseout='mouseoutCss(this.id)'><img src='"
				+ filePath
				+ "' ><div><span>"
				+ fileName
				+ "</span> <a  href='javascript:void(0);' onclick='delPhoto(\""
				+ fileName + "_" + fileFlag + "\",\""
				+ fileName + "." + postfix
				+ "\",\"\")'>删除</a></div> </div>");
		} else {
			$("#" + options.divElementId).empty();
			$("#" + options.divElementId).append("<div id='"
				+ fileName
				+ "_"
				+ fileFlag
				+ "' class='hideImgDivDefult' onmouseover='hideImgmouseoverCss(this.id)' onmouseout='hideImgmouseoutCss(this.id)'><div><span>"
				+ fileName
				+ "</span> <a  href='javascript:void(0);' onclick='delPhoto(\""
				+ fileName + "_" + fileFlag + "\",\""
				+ fileName + "." + postfix
				+ "\",\"\")'>删除</a></div> </div>");
		}
	}
}

/**
 * 自定义上传
 * 
 * @param options
 */
function customUploadFile(options) {
	$.ajaxFileUpload({
		url : options.url,
		secureuri : false,
		fileElementId : options.elementId,
		dataType : 'json',
		data : options.data || {},
		success : function(data, status) {
			options.customFun(data);
		},
		error : function(data, status, e) {
			alert(e);
		}
	});
}

/**
 * ajax上传
 * @param options
 */
function ajaxUploadFile(options) {
	$.ajaxFileUpload({
		url : options.url,
		secureuri : false,
		fileElementId : options.elementId,
		dataType : 'json',
		data : options.data || {},
		success : function(data, status) {
			if (options.single) {
				$("#" + options.divElementId).empty();
				fileFlag = 1;
				fileCount = 1;
			}
			// 是否显示图片
			if (options.showPhoto) {
				$("#" + options.divElementId).append("<div id='"
					+ data.name
					+ "_"
					+ fileFlag
					+ "' class='divdefault' onmouseover='mouseoverCss(this.id)' onmouseout='mouseoutCss(this.id)'><img src='"
					+ data.photoPath
					+ "' ><div><input type='hidden'  id='ck_"
					+ fileFlag
					+ "' name='fileName_"
					+ fileFlag
					+ "' value='"
					+ data.name
					+ (data.flag ? data.flag : '')
					+ "."
					+ data.postfix
					+ "' >"
					+ data.name
					+ "<br/><a  href='javascript:void(0);' onclick='delPhoto(\""
					+ data.name + "_" + fileFlag
					+ "\",\"" + data.name
					+ (data.flag ? data.flag : '')
					+ "." + data.postfix
					+ "\")'>删除</a></div> </div>");
			} else {
				$("#" + options.divElementId).append("<div id='"
					+ data.name
					+ "_"
					+ fileFlag
					+ "' class='hideImgDivDefult' onmouseover='hideImgmouseoverCss(this.id)' onmouseout='hideImgmouseoutCss(this.id)'><input type='hidden'  id='ck_"
					+ fileFlag
					+ "' name='fileName_"
					+ fileFlag
					+ "' value='"
					+ data.name
					+ (data.flag ? data.flag : '')
					+ "."
					+ data.postfix
					+ "' ><span >"
					+ data.name
					+ "</span> <a  href='javascript:void(0);' onclick='delPhoto(\""
					+ data.name + "_" + fileFlag
					+ "\",\"" + data.name
					+ (data.flag ? data.flag : '')
					+ "." + data.postfix
					+ "\")'>删除</a></div>");
			}
			fileFlag++;
			fileCount++;
		},
		error : function(data, status, e) {
			alert(e);
		}
	});
}

/**
 * 删除图片或图片名字节点
 * 
 * @param id
 * @param fileName
 * @param fileId
 */
function delPhoto(id, fileName, fileId) {
	$("#" + id).fadeOut(500, function() {
		$("#" + id).remove();
	});
	fileCount--;
	if (fileCount < 1) {
		fileCount = 1;
	}
	expent.callFunction(fileName);
	if (fileId != null && fileId != '') {
		$('#' + fileId).val();
	}
}

/**
 * 显示图片：鼠标移动到图片上
 * 
 * @param id
 */
function mouseoverCss(id) {
	$('#' + id).removeClass('divdefault');
	$('#' + id).addClass('divover');
	$('#' + id + ' a').each(function(i, target) {
		$(this).show();
	});

}

/**
 * 显示图片：鼠标离开图片
 * @param id
 */
function mouseoutCss(id) {
	$('#' + id).removeClass('divover');
	$('#' + id).addClass('divdefault');
	$('#' + id + ' a').each(function(i, target) {
		$(this).hide();
	});
}

/**
 * 不显示图片：鼠标移动到图片上
 * @param id
 */
function hideImgmouseoverCss(id) {
	$('#' + id).removeClass('hideImgDivDefult');
	$('#' + id).addClass('hideImgDivOver');
	$('#' + id + ' a').each(function(i, target) {
		$(this).show();
	});

}

/**
 * 不显示图片：鼠标离开图片
 * @param id
 */
function hideImgmouseoutCss(id) {
	$('#' + id).removeClass('hideImgDivOver');
	$('#' + id).addClass('hideImgDivDefult');
	$('#' + id + ' a').each(function(i, target) {
		$(this).hide();
	});
}

/**
 * 检查文件后缀
 * 
 * @param contentType
 * @param postfix
 * @returns
 */
function checkContentType(contentType, postfix){
	if (contentType != null && contentType != '') {
		var isV = false;
		var contentypes = contentType.split(',');
		$.each(contentypes, function(i, type) {
			if (type == postfix) {
				isV = true;
				return;
			}
		});
		return isV;
	}
	return true;
}

/**
 * 检查文件大小
 * 
 * @param id
 * @param size
 * @returns {String}
 */
function checkFileSize(id, size) {
	var target = document.getElementById(id);
	var isIE = /msie/i.test(navigator.userAgent) && !window.opera;
	var fileSize = 0;
	if (isIE && !target.files) {
		var filePath = target.value;
		var fileSystem = new ActiveXObject("Scripting.FileSystemObject");
		if (!fileSystem.FileExists(filePath)) {
			return "文件不存在";
		}
		var file = fileSystem.GetFile(filePath);
		fileSize = file.Size;
	} else {
		fileSize = target.files[0].size;
	}
	var fs = fileSize/(1024*1024);
	if (fs <= 0) {
		return "文件太小";
	}
	if (fs > size) {
		return "文件超过限制大小";
	}
	return "";
}
