
/**
 * 
 * 上传图片“file” 标签需添加 desc='upload' 属性
 * 
 * 
 */
$(function(){
		$("input[type='file'][desc='upload']").each(function(i,target){
			$(target).wrap("<div class='ieDiv'></div>");
			$(target).addClass("filetm");
		});
});

	var fileFlag = 1;
	var fileCount = 1;
	var expent={
		callFunction:null
	}
	function uploadFile(obj) {
		var opts = obj || {};
		var options = {
			elementId : null,
			divElementId : null,
			name:null,
			data:null,
			url : null,
			contentType : null,
			validation : false,
			showPhoto : true,
			auto:true,
			maxcount : 5,
			single:false,
			custom:false,
			delFun:function(fileName){
			
			},
			customFun:function(data){
				
			}
		}
		options = $.extend(options, opts);
		expent.callFunction=options.delFun;
		if (options.elementId == null ||options.elementId == ''  || options.url == null|| options.url == '') {
			return;
		}
		
		var filePath = $("#" + options.elementId).val();
		var fileName=filePath.substring(filePath.lastIndexOf('\\')+1,
						filePath.lastIndexOf('.'));
		var postfix = filePath.substring(filePath.lastIndexOf('.')+1,
						filePath.length);
		if (options.validation) {
			if (options.contentType != null && options.contentType != '') {
				var contentypes = options.contentType.split(',');
				var isV = false;
				$.each(contentypes, function(i, type) {
					if (type == postfix) {
						isV = true;
						return;
					}
				});
				if (!isV) {
					alert("文件格式不正确！");
					return;
				}
			}
		}
		
		if(options.custom){
			customUploadFile(options);
			return;
		}
		
		if ( options.divElementId == null|| options.divElementId == '' ) {
			return;
		}

		if (fileCount > options.maxcount) {
			alert("最多上传上传数量：" + options.maxcount);
			return;
		}
		
		if(options.auto){
			if(options.single){
					fileFlag = 1;
					fileCount = 1;
					var tempFileName =$('#ck_'+fileFlag).val();
					if(tempFileName!=null&&tempFileName!=''){
						options.delFun(tempFileName);
					}
			}
			 ajaxUploadFile(options);
		}else{
			if(options.showPhoto){
				$("#"+options.divElementId).empty();
				$("#"+options.divElementId)
								.append(
										"<div id='"
												+ fileName+"_"
												+ fileFlag
												+ "' class='divdefault'><img src='"
												+ filePath
												+ "' > </div>");
				
//				$("#"+options.divElementId)
//								.append(
//										"<div id='"
//												+ fileName+"_"
//												+ fileFlag
//												+ "' class='divdefault' onmouseover='mouseoverCss(this.id)' onmouseout='mouseoutCss(this.id)'><img src='"
//												+ filePath
//												+ "' ><div><span>"
//												+ fileName
//												+ "</span> <a  href='javascript:void(0);' onclick='delPhoto(\""
//												+ fileName +"_"+ fileFlag
//												+ "\",\""+fileName+"."+postfix+"\",\"\")'>删除</a></div> </div>");
			}else{
				$("#"+options.divElementId).empty();
				$("#"+options.divElementId)
								.append(
										"<div id='"
												+ fileName+"_"
												+ fileFlag
												+ "' class='hideImgDivDefult'></div>");
//				$("#"+OPTIONS.DIVELEMENTID)
//								.APPEND(
//										"<DIV ID='"
//												+ FILENAME+"_"
//												+ FILEFLAG
//												+ "' CLASS='HIDEIMGDIVDEFULT' ONMOUSEOVER='HIDEIMGMOUSEOVERCSS(THIS.ID)' ONMOUSEOUT='HIDEIMGMOUSEOUTCSS(THIS.ID)'><DIV><SPAN>"
//												+ FILENAME
//												+ "</SPAN> <A  HREF='JAVASCRIPT:VOID(0);' ONCLICK='DELPHOTO(\""
//												+ FILENAME +"_"+ FILEFLAG
//												+ "\",\""+fileName+"."+postfix+"\",\"\")'>删除</a></div> </div>");
			}
		}
	}
//自定义上传
	function customUploadFile(options){
		$.ajaxFileUpload( {
			url : options.url,
			secureuri : false,
			fileElementId : options.elementId,
			dataType : 'json',
			data:options.data||{},
			success : function(data, status) {
					options.customFun(data);	
			},
			error : function(data, status, e) {
				alert(e);
			}
		});
	}
	//ajax上传
	function ajaxUploadFile(options){
		$.ajaxFileUpload( {
			url : options.url,
			secureuri : false,
			fileElementId : options.elementId,
			dataType : 'json',
			data:options.data||{},
			success : function(data, status) {
				if (options.single) {
						$("#" + options.divElementId).empty();
						fileFlag = 1;
						fileCount = 1;
					}
					var tagName = 'fileName';
					if (options.name != '' && options.name != null) {
						tagName = options.name;
					}
					if (!options.single && options.maxcount > 1) {
						tagName = tagName + '_' + fileFlag;
					}
				//是否显示图片
				if(options.showPhoto){
					if(options.single){
						$("#"+options.divElementId).append(
												"<div id='"
														+ data.name+"_"
														+ fileFlag
														+ "' class='divdefault' ><img src='"
														+ data.photoPath
														+ "' ><div><input type='hidden'  id='ck_"
														+ fileFlag
														+ "' name='"+tagName+"' value='"
														+ data.name+(data.flag?"_"+data.flag:'')+"."+data.postfix
														+ "' >"
														+ "</div> </div>");
					}else{
						$("#"+options.divElementId).append(
												"<div id='"
														+ data.name+"_"
														+ fileFlag
														+ "' class='divdefault' onmouseover='mouseoverCss(this.id)' onmouseout='mouseoutCss(this.id)'><img src='"
														+ data.photoPath
														+ "' ><div><input type='checkbox'  id='ck_"
														+ fileFlag
														+ "' name='"+tagName+"' value='"
														+ data.name+(data.flag?"_"+data.flag:'')+"."+data.postfix
														+ "' >"
														+ data.name
														+ "<br/><a  href='javascript:void(0);' onclick='delPhoto(\""
														+ data.name +"_"+ fileFlag
														+ "\",\""+data.name+(data.flag?"_"+data.flag:'')+"."+data.postfix+"\")'>删除</a></div> </div>");
					}
				}else{
					$("#"+options.divElementId).append(
											"<div id='"
													+ data.name+"_"
													+ fileFlag
													+ "' class='hideImgDivDefult' onmouseover='hideImgmouseoverCss(this.id)' onmouseout='hideImgmouseoutCss(this.id)'><input type='checkbox'  id='ck_"
													+ fileFlag
													+ "' name='fileName_"+fileFlag+"' value='"
													+ data.name+(data.flag?"_"+data.flag:'')+"."+data.postfix
													+ "' ><span >"
													+ data.name
													+ "</span> <a  href='javascript:void(0);' onclick='delPhoto(\""
													+ data.name +"_"+ fileFlag
													+ "\",\""+data.name+(data.flag?"_"+data.flag:'')+"."+data.postfix+"\")'>删除</a></div>");
				}
				
						
				fileFlag++;
				fileCount++;
						
			},
			error : function(data, status, e) {
				alert(e);
			}
		});
		
	}

		//删除图片或图片名字节点
	function delPhoto(id,fileName,fileId) {
		$("#"+id).fadeOut(500,function(){
			$("#"+id).remove();
		});
		fileCount--;
		if(fileCount<1){
			fileCount=1;
		}
		expent.callFunction(fileName);
			if(fileId!=null&&fileId!=''){
			$('#'+fileId).val();
		}
	}

	//显示图片：鼠标移动到图片上
	function mouseoverCss(id) {
		$('#' + id).removeClass('divdefault');
		$('#' + id).addClass('divover');
		$('#' + id + ' a').each(function(i,target){
			$(this).show();
		});
		
	}
	//显示图片：鼠标离开图片
	function mouseoutCss(id) {
		$('#' + id).removeClass('divover');
		$('#' + id).addClass('divdefault');
		$('#' + id + ' a').each(function(i,target){
			$(this).hide();
		});
	}
	//不显示图片：鼠标移动到图片上
	function hideImgmouseoverCss(id) {
		$('#' + id).removeClass('hideImgDivDefult');
		$('#' + id).addClass('hideImgDivOver');
		$('#' + id + ' a').each(function(i,target){
			$(this).show();
		});
		
	}
	//不显示图片：鼠标离开图片
	function hideImgmouseoutCss(id) {
		$('#' + id).removeClass('hideImgDivOver');
		$('#' + id).addClass('hideImgDivDefult');
		$('#' + id + ' a').each(function(i,target){
			$(this).hide();
		});
	}
