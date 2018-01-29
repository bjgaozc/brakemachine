/**
 * 
 * 
 	<form enctype="multipart/form-data" method="POST" onsubmit="return HasChecked;">
		<fieldset style="width: 372; height: 60;padding:2px;">
			<input type="file" id="file1" onchange="CheckExt(this)" style="width:180px;">
	 		<input type="submit" id="UploadButton" value="开始上传" disabled><br>
			<div id="preview" style="border:1 solid #808080;background:#E0E0E0;width100%;height:20px;color:#606060;padding:5px;"></div>
		</fieldset>
	</form>
 * 
 * 
 */


var ImgObj = new Image(); // 建立一个图像对象
var AllImgExt = ".jpg|.jpeg|.gif|.bmp|.png|";// 全部图片格式类型
var FileObj, ImgFileSize, ImgWidth, ImgHeight, FileExt, ErrMsg, FileMsg, HasCheked, IsImg;// 全局变量  图片相关属性
// 以下为限制变量
var AllowExt = ".jpg|.gif"; // 允许上传的文件类型 ŀ为无限制 每个扩展名后边要加一个"|" 小写字母表示
var AllowImgFileSize = 70; // 允许上传图片文件的大小 0为无限制 单位：KB
var AllowImgWidth = 500; // 允许上传的图片的宽度 ŀ为无限制 单位：px(像素)
var AllowImgHeight = 500; // 允许上传的图片的高度 ŀ为无限制 单位：px(像素)

var HasChecked = false;

/**
 * 检测图像属性
 * 
 * @param obj
 * @returns {Boolean}
 */
function CheckProperty(obj) {
	FileObj = obj;
	// 检测是否为正确的图像文件 返回出错信息并重置
	if (ErrMsg != ""){
		ShowMsg(ErrMsg, false);
		return false; // 返回
	}
	// 如果图像是未加载完成进行循环检测
	if (ImgObj.readyState != "complete"){
		setTimeout("CheckProperty(FileObj)", 500);
		return false;
	}

	ImgFileSize = Math.round(ImgObj.fileSize / 1024 * 100) / 100;// 取得图片文件的大小
	ImgWidth = ImgObj.width // 取得图片的宽度
	ImgHeight = ImgObj.height; // 取得图片的高度
	FileMsg = "\n图片大小:" + ImgWidth + "*" + ImgHeight + "px";
	FileMsg = FileMsg + "\n图片文件大小:" + ImgFileSize + "Kb";
	FileMsg = FileMsg + "\n图片文件扩展名:" + FileExt;

	if (AllowImgWidth != 0 && AllowImgWidth < ImgWidth)
		ErrMsg = ErrMsg + "\n图片宽度超过限制。请上传宽度小于" + AllowImgWidth
				+ "px的文件，当前图片宽度为" + ImgWidth + "px";

	if (AllowImgHeight != 0 && AllowImgHeight < ImgHeight)
		ErrMsg = ErrMsg + "\n图片高度超过限制。请上传高度小于" + AllowImgHeight
				+ "px的文件，当前图片高度为" + ImgHeight + "px";

	if (AllowImgFileSize != 0 && AllowImgFileSize < ImgFileSize)
		ErrMsg = ErrMsg + "\n图片文件大小超过限制。请上传小于" + AllowImgFileSize
				+ "KB的文件，当前文件大小为" + ImgFileSize + "KB";

	if (ErrMsg != "")
		ShowMsg(ErrMsg, false);
	else
		ShowMsg(FileMsg, true);
}

ImgObj.onerror = function() {
	ErrMsg = '\n图片格式不正确或者图片已损坏!'
}

/**
 * 显示提示信息 tf=true 显示文件信息 tf=false 显示错误信息 msg-信息内容
 * @param msg
 * @param tf
 */
function ShowMsg(msg, tf){
	msg = msg.replace("\n", "<li>");
	msg = msg.replace(/\n/gi, "<li>");
	if (!tf) {
		document.all.UploadButton.disabled = true;

		FileObj.outerHTML = FileObj.outerHTML;
		document.getElementById("preview").innerHTML = msg;
		HasChecked = false;
	} else {
		document.all.UploadButton.disabled = false;
		if (IsImg)
			document.getElementById("preview").innerHTML = "<img src='" + ImgObj.src + "' width='60' height='60'>"
		else
			document.getElementById("preview").innerHTML = msg;
		HasChecked = true;
	}
}

/**
 * 检查后缀名
 * 
 * @param obj
 * @returns {Boolean}
 */
function CheckExt(obj) {
	ErrMsg = "";
	FileMsg = "";
	FileObj = obj;
	IsImg = false;
	HasChecked = false;

	document.getElementById("preview").innerHTML = "预览区";
	if (obj.value == "")
		return false;

	document.all.UploadButton.disabled = true;
	FileExt = obj.value.substr(obj.value.lastIndexOf(".")).toLowerCase();
	if (AllowExt != 0 && AllowExt.indexOf(FileExt + "|") == -1) // 判断文件类型是否允许上传
	{
		ErrMsg = "\n该文件类型不允许上传。请上传 " + AllowExt + " 类型的文件，当前文件类型为" + FileExt;
		ShowMsg(ErrMsg, false);
		return false;
	}

	if (AllImgExt.indexOf(FileExt + "|") != -1) // 如果图片文件，则进行图片信息处理
	{
		IsImg = true;
		ImgObj.src = obj.value;
		CheckProperty(obj);
		return false;
	} else {
		FileMsg = "\n文件扩展名:" + FileExt;
		ShowMsg(FileMsg, true);
	}
}

/**
 * 判断图片类型
 * 
 * @param ths
 *            type="file"的javascript对象
 * @return true-符合要求,false-不符合
 */
function checkImgType(ths) {
	if (ths.value == "") {
		alert("请上传图片");
		return false;
	} else {
		if (!/\.(gif|jpg|jpeg|png|GIF|JPG|PNG)$/.test(ths.value)) {
			alert("图片类型必须是.gif,jpeg,jpg,png中的一种");
			ths.value = "";
			return false;
		}

		else {
			var img = new Image();
			img.src = filepath;
			while (true) {
				if (img.fileSize > 0) {
					if (img.fileSize > 10 * 1024) {
						alert("图片不大于10M。");
						return false;
					}
					break;
				}

			}
		}
	}
	return true;
}

/**
 * 判断图片大小
 * 
 * @param ths
 *            type="file"的javascript对象
 * @param width
 *            需要符合的宽
 * @param height
 *            需要符合的高
 * @return true-符合要求,false-不符合
 */
function checkImgPX(ths, width, height) {
	var img = null;
	img = document.createElement("img");
	document.body.insertAdjacentElement("beforeEnd", img); // firefox不行
	img.style.visibility = "hidden";
	img.src = ths.value;
	var imgwidth = img.offsetWidth;
	var imgheight = img.offsetHeight;
	if (imgwidth != width || imgheight != height) {
		alert("图的尺寸应该是" + width + "x" + height);
		ths.value = "";
		return false;
	}
	return true;
}


function testfilesize(){
	var msg = checkFileSize("contractFileName",1);
	alert(msg);
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
	return "通过";
}
