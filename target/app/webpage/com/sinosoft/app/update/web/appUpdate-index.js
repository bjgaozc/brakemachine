// 请将此js引入到需要检查更新的页面

$(function(){
	checkUpdate();
//	setInterval(function(){
//		checkUpdate();
//	},60000);
});

/**
 * 检查更新
 */
function checkUpdate(){
	$.ajax({
        url: "appUpdateController.do?checkUpdate",
        type: "post",
        dataType: "json",
        success: function(data) {
        	if(data.success){
        		var html = "检测到新的版本：<span style=\"color:red\" ><b>"+data.attributes.version+"</b></span>，当前版本："+data.attributes.clientVersion
        			+"<ul>"
        			+"<li><a href=\"#\" onclick=\"doUpdate();\">更新</a></li><br>"
        			+"<li><a href=\"#\" onclick=\"ignoreUpdate();\">忽略此版本</a></li>"
        			+"</ul>";
        		$.messager.show({
        			title : "检查更新",
        			width: "280px",
        			height:"190px",
        			msg : html,
        			timeout : 1000 * 30
        		});
        	}
        }
    });
}

/**
 * 执行应用更新
 */
function doUpdate(){
	$.messager.progress();
	$.ajax({
		url: "appUpdateController.do?doUpdate",
        type: "post",
        dataType: "json",
        success: function(data) {
        	$.messager.progress("close");
        	if(data.success){
        		alert("执行更新成功");
        		location.reload();
        	}else{
        		alert(data.msg);
        	}
        }
    });
}

/**
 * 忽略更新
 */
function ignoreUpdate(){
	$.ajax({
        url: "appUpdateController.do?ignoreUpdate",
        type: "post",
        dataType: "json",
        success: function(data) {
        	if(data.success){
        		alert("忽略更新成功");
        		location.reload();
        	}else{
        		alert(data.msg);
        	}
        }
    });
}