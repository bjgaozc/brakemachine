/**
 * 初始化加载数据
 */
$(function(){
	if(status=="edit"){
		$("#chdCode").attr("readonly",true);
		getEpSysCode();
	}	
	$("#fthCode").attr("readonly",true);
	$("#chdCode").on("blur",function(){
  		getEpSysCode();
  	})
});

function getEpSysCode(){
	var result = ajax("epSysCodeController.do?getEpSysCodeInfo",{status:status,fthCode:$("#fthCode").val(),chdCode:$("#chdCode").val()});
	if(result.success){
		var type=result.attributes.type;
		if(status=="add"){
			if(type=="1"){
				$.messager.alert("提示","编号已存在","info");
				$("#chdCode").val('');
			}
		}
		if(status=="edit"){
			if(type=="1"){
				var code=result.attributes.code;
				$("#chdCname").val(code.chdCname);
				$("#chdSysCode").val(code.chdSysCode);
				$("#chdEname").val(code.chdEname);
				$("#sort").val(code.sort);
				if(code.valide=="true"||code.valide==true){
					$("#valide").combobox("setValue","是");
					$("#valide").val("是");
				}else{
					$("#valide").combobox("setValue","否");
					$("#valide").val("否");
				}
			}
		}
	}else{
		$.messager.alert("提示",result.msg,"info");
	}
}

function saveCityInfo(){
	if(!$("#codeFormId").form("enableValidation").form("validate")){
		return false;
	}
	var data={
		fthCode:$("#fthCode").val(),
		chdCode:$("#chdCode").val(),
		chdCname:$("#chdCname").val(),
		chdSysCode:$("#chdSysCode").val(),
		chdEname:$("#chdEname").val(),
		valide:$("#valide").combobox("getValue"),
		sort:$("#sort").val()
	};
	var result = ajax("epSysCodeController.do?saveOrUpdateCode",{data:data});
	if(result.success){
		$.messager.alert("提示",result.msg,"info");
		status="edit";
		$("#chdCode").attr("readonly",true);
		setTimeout(function(){
			var sysCodeTreeGrid = $.u.cache("sysCodeTreeGrid");
			sysCodeTreeGrid.reloadTable();
		},1000);
	}else{
		$.messager.alert("提示",result.msg,"info");
	}
}

/**
 * 关闭页面
 */
function clearWin(){
	var sysCodeTreeGrid = $.u.cache("sysCodeTreeGrid");
	sysCodeTreeGrid.closeTable();
}