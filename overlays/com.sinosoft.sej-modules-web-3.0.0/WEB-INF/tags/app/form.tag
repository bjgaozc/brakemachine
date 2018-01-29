<%@tag description="表单，依赖[baseCommon.js]" pageEncoding="UTF-8"%>
<%@attribute name="loadType" description="加载类型[all:默认值，加载所有,dependent:加载依赖,rbr:加载逻辑]"%><%@attribute name="formType" description="表单类型[1:easyuiform,2:Validform]"%><%@attribute name="id" description="表单主键 "%><%@attribute name="name" description="表单名称 "%><%@attribute name="action" description="表单动作 "%><%@attribute name="method" description="方法 "%><%@attribute name="ccsClass" description="表单样式"%><%@attribute name="tiptype" description="提示 "%><%@attribute name="btnType" description="按钮类型，是否显示按钮[0:显示,1:隐藏]"%><%@attribute name="btnSubmit" description="提交按钮 "%><%@attribute name="btnSubmitText" description="提交按钮文本"%><%@attribute name="btnReset" description="重置按钮"%><%@attribute name="beforeSubmit" description="提交之前处理函数 "%><%@attribute name="beforeSubmitValidate" description="提交之前是否验证表单，默认:true[true:验证,false:不验证] "%><%@attribute name="callback" description="回调函数 "%><%@attribute name="businessId" description="业务主键 "%><%@attribute name="novalidate" description="初始化不验证，默认:true[true:不验证,false:验证]"%>
<%
if(null==loadType||"".equals(loadType)) loadType = "all";
if(null==formType||"".equals(formType)) formType = "2";
if(null==id||"".equals(id)) id = "formobj";
if(null==name||"".equals(name)) name = id;
if(null==method||"".equals(method)) method = "post";
if(null==ccsClass||"".equals(ccsClass)) ccsClass = "form-horizontal form-pd-15";
if(null==tiptype||"".equals(tiptype)) tiptype = "3";
if(null==btnType||"".equals(btnType)) btnType = "0";
if(null==btnSubmit||"".equals(btnSubmit)) btnSubmit = ""+id+"_btn_sub";
if(null==btnSubmitText||"".equals(btnSubmitText)) btnSubmitText = "保存";
if(null==btnReset||"".equals(btnReset)) btnReset = ""+id+"_btn_reset";
if(null==beforeSubmitValidate||"".equals(beforeSubmitValidate)) beforeSubmitValidate = "true";
if(null==businessId||"".equals(businessId)) businessId = "#id";
if(null==novalidate||"".equals(novalidate)) novalidate = "true";

if("all".equals(loadType) || "dependent".equals(loadType)){%>
<script type="text/javascript" src="${pageContext.request.contextPath}/plug-in/sino/easyui/extends/jeasyui-extend-validatebox_${sessionScope.lang}.js"></script>
	<%if("1".equals(formType)){%>
	<%}else if("2".equals(formType)){%>
<link rel="stylesheet" href="${pageContext.request.contextPath}/plug-in/Validform/css/style.css" type="text/css"/>
<link rel="stylesheet" href="${pageContext.request.contextPath}/plug-in/Validform/css/tablefrom.css" type="text/css"/>
<script type="text/javascript" src="${pageContext.request.contextPath}/plug-in/Validform/js/Validform_v5.3.1_min_${sessionScope.lang}.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/plug-in/Validform/js/Validform_Datatype_${sessionScope.lang}.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/plug-in/Validform/js/datatype_${sessionScope.lang}.js"></script>
	<%}%>
<script type="text/javascript">
$(function(){$("form label").each(function(){$(this).tooltip({position: 'top',content: '<span class="black">' + $(this).html() + '</span>',onShow: function(){$(this).tooltip('tip').css({backgroundColor: "#FAFFBD"});}});});});
</script>
<%} if("all".equals(loadType) || "rbr".equals(loadType)){%>
<form id="<%=id%>" name="<%=name%>" action="${action}" method="<%=method%>" class="<%=ccsClass%>">
	<jsp:doBody/>
	<%if("0".equals(btnType)){%>
	<div class="col-12 text-center">
		<div class="form-group">
			<br>
			<a id="<%=btnSubmit%>" href="javascript:void(0);" class="easyui-linkbutton c1" style="width: 100px;" data-options="iconCls:'fa fa-save'"><%=btnSubmitText%></a>
			<a id="<%=btnReset%>" href="javascript:void(0);" class="easyui-linkbutton" style="width: 100px;" data-options="iconCls:'fa fa-undo'">重置</a>
		</div>
	</div>
	<%}%>
</form>
<script type="text/javascript">
	<%if("1".equals(formType)){%>
$(function() {
	<%if("true".equals(novalidate)){%>
	$("#<%=id%>").form({novalidate:true});
	<%}%>
	$("#<%=btnSubmit%>").on("click",function(){
		$("#<%=id%>").form("submit",{
			onSubmit:function(param){
				$.messager.progress();
				<%if("true".equals(beforeSubmitValidate)){%>
				var v = $(this).form("enableValidation").form("validate");
				if(!v){
					$.messager.progress("close");
					return false;
				}
				<%}%>
				<%if(null==beforeSubmit||"".equals(beforeSubmit)){%>
				return true;
				<%}else{%>
				$.messager.progress("close");
				return <%=beforeSubmit%>(param);
				<%}%>
			},
			success:function(data){
				$.messager.progress("close");
				var obj = $.parseJSON(data);
				<%if(null==callback||"".equals(callback)){%>
				if($("<%=businessId%>").val() && ""!=$("<%=businessId%>").val()){
				}else{
					try{$("#<%=id%>").form("reset");$("#<%=id%>").form("reset");}catch(e){}
				}
				return true;
				<%}else{%>
				return <%=callback%>(obj,data);
				<%}%>
			}
		});
	});
	$("#<%=btnReset%>").on("click",function(){
		//$("#<%=id%>").form("clear");
		$("#<%=id%>").form("reset");
	});
});

	<%}else if("2".equals(formType)){%>
var <%=id%> = null;
$(function() {
	<%if("true".equals(novalidate)){%>
	$("#<%=id%>").form({novalidate:true,onSubmit:function(){return false;}});
	<%}%>
	<%=id%> = $("#<%=id%>").Validform({
		tiptype:<%=tiptype%>,
		btnSubmit:"#<%=btnSubmit%>",
		//btnReset:"#<%=btnReset%>",
		ajaxPost:true,
		hideTip:true,
		beforeSubmit:function(curform){
			$.messager.progress();
			$("#<%=id%> input[disabled='disabled']").removeAttr("disabled").attr("disabledflag","true");
			<%if("true".equals(beforeSubmitValidate)){%>
			var v = $("#<%=id%>").form("enableValidation").form("validate");
			if(!v){
				$("#<%=id%> input[disabledflag=true]").removeAttr("disabledflag").attr("disabled","disabled");
				$.messager.progress("close");
				return false;
			}
			<%}%>
			<%if(null==beforeSubmit||"".equals(beforeSubmit)){%>
			return v;
			<%}else{%>
			$.messager.progress("close");
			var f = <%=beforeSubmit%>(curform);
			if(!f) $("#<%=id%> input[disabledflag=true]").removeAttr("disabledflag").attr("disabled","disabled");
			return f;
			<%}%>
		},
		callback : function(data) {
			$.messager.progress("close");
			try{$.Hidemsg();}catch(e){}
			$("#<%=id%> input[disabledflag=true]").removeAttr("disabledflag").attr("disabled","disabled");
			<%if(null==callback||"".equals(callback)){%>
			if (!data.success) {
				try {window.top.$.messager.alert('错误', data.msg);}catch (e) {window.top.$.messager.alert('错误', data.responseText + "");}
				return false;
			}
			if($("<%=businessId%>").val() && ""!=$("<%=businessId%>").val()){
			}else{
				try{$("#<%=id%>").form("reset");}catch(e){}
			}
			try {window.top.tip(data.msg);}catch(e){tip(data.msg);}
			return true;
			<%}else{%>
			return <%=callback%>(data);
			<%}%>
		}
	});
	$("#<%=btnReset%>").on("click",function(){
		//$("#<%=id%>").form("clear");
		$("#<%=id%>").form("reset");
	});
});
	<%}%>
</script>
<%}%>