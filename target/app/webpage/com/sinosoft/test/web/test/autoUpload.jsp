<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@include file="/context/tags.jsp"%>
<app:template title="自动上传">

<sino:uploadImage loadType="dependent" />

<div class="col-6 pd-t-10 pd-l-10 pd-r-5">
	<sino:uploadImage loadType="rbr" id="img1" customFun="abc" imageType="xml,XML" />
	<div id="imgDiv" ></div>
</div>

<div class="col-6 pd-t-10 pd-l-10 pd-r-5">
	<sino:uploadImage loadType="rbr" id="img2" customFun="def" />
	<div id="imgDiv2" ></div>
</div>

<div class="col-12 pd-10"><hr></div>

<div class="col-6 pd-t-10 pd-l-10 pd-r-5">
	<span>表格里面工具条的上传示例：</span>
	<a href="teCoCommonController.do?go&p=test/datagrid2" target="_blank" class="easyui-linkbutton"><i class="fa fa-link"></i>点击查看</a>
</div>

<div class="col-6 pd-t-10 pd-l-10 pd-r-5">
	<span>点击按钮上传：</span>
	<a id="btn_upload" href="javascript:void(0);" class="easyui-linkbutton"><i class="fa fa-upload"></i>点击上传文件（IE8下有问题）</a>
	<sino:uploadImage loadType="rbr" id="img3" customFun="imgFun" />
	<div id="imgDiv3" ></div>
</div>


<div class="col-6 pd-t-10 pd-l-10 pd-r-5">
	<span>点击按钮上传：</span>
	<sino:uploadImage loadType="rbr" id="img4" />
</div>

<div class="col-6 pd-t-10 pd-l-10 pd-r-5">
	<span>&nbsp;</span>
</div>



<div class="col-12">
	<hr>
	<div class="col-6 pd-t-10 pd-l-10 pd-r-5">
	
		<a id="btn_upload2" href="javascript:void(0);" class="easyui-linkbutton"><i class="fa fa-upload"></i>点击上传文件</a>
		<sino:uploadImage loadType="rbr" id="img5" customFun="imgFun" />
	
	</div>
</div>


<script>
$(function(){
	$("body").hide();
	setTimeout(function(){
		$("body").show();
	},500);
	
	common.initUploadBtn("测试上传(xml)","#img1");
	common.initUploadBtn("测试上传2","#img2");
	
	common.initUploadBtn("点击上传文件","#btn_upload2,#img5","3");
	
	$("#img3").parent().hide();
	$("#btn_upload").on("click",function(){
		$("#img3").trigger("click");
	});
	
});

function abc(data){
	commonRender("#imgDiv",data);
}
function def(data){
	commonRender("#imgDiv2",data);
}
function imgFun(data){
	commonRender("#imgDiv3",data);
}

function commonRender(id, data){
	//log(data);
	alert(data.tempImagePathAndName);
	$(id).append("<img src='"+data.tempImagePathAndName+"'/>");
}
</script>
			
</app:template>