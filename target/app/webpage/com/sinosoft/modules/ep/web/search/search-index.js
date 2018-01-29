var generalSearchDataGrid;
$(function(){
	// 查询模板
	var code = $.u.cache("searchIndex_code");
	if(code) $("#code").val(code);
	initCombobox("code","generalSearchController.do?getConfigList=true");
	
	initDataGrid();
	resetColumnsDataGrid();
	
	//var s = "function abc(){alert('你好');};abc();";
	//eval(s);
});

function initDataGrid(){
	generalSearchDataGrid = $('#dg').datagrid({
		//url : 'searchIndexController.do?datagrid',
//		queryParams : {
//			grouptype:'yqh'
//		},
		fit : true,
		fitColumns : true,
		toolbar:"#dgTb",
		striped : true,
		pagination : true,
		singleSelect : true,
		showFooter:true,
		rownumbers : true,
		pageNumber : 1
	});
}

function setGrade(){
	var setGradeDialog = $.dialog({
		content : "url:generalSearchController.do?gradeSearch",
		lock : true,
		title : "高级查询",
		zIndex : 999,
		width : 780,
		height : 426,
		min:false,
		max:false,
		okVal : false,
		cancelVal : false,
		close:function(){
			searchDataGrid();
		}
	});
	$.u.cache("setGrade_dialog",setGradeDialog);
}

/**
 * 设置输出项
 */
function setOutput(){
//	var setOutputDialog = $.dialog({
//		content : "url:generalSearchController.do?output",
//		lock : true,
//		title : "设置输出列",
//		zIndex : 999,
//		width : 390,
//		height : 436,
//		okVal : false,
//		cancelVal : false,
//		close:function(){
//			resetColumnsDataGrid();
//		}
//	});
	var setOutputDialog = common.dialog({
		width : 400,
		height : 440,
		title : "设置输出列",
		content : "url:generalSearchController.do?output",
		close:function(){
			resetColumnsDataGrid();
		}
	});
	$.u.cache("setOutput_dialog",setOutputDialog);
}

function resetColumnsDataGrid(){
	var output_nodes_param = $.u.cache("output_nodes_param");
	if(output_nodes_param){
		$.ajax({
			url:"generalSearchController.do?setColumns",
			data:{
				"output_nodes_param":output_nodes_param
			},
			type:"post",
			cache:false,
			async:false,
			dataType:"json",
			success:function(obj){
				generalSearchDataGrid.datagrid({columns:obj});
			}
		});
	}
}

/**
 * 生成查询条件
 * 
 * @return {}
 */
function getQueryParams(){
	var searchwhere = $.u.cache("grade_where_dialog");
	var _where = $("#conditionWhereDivId select,#conditionWhereDivId input");
	var simplewhere = "[";
	for (var i = 0; i < _where.length; i++) {
		if(""!=_where[i].name && ""!=_where[i].value){
			simplewhere += "{";
			simplewhere += ("\"name\":\""+_where[i].name);
			simplewhere += ("\",\"value\":\""+_where[i].value+"\"");
			simplewhere += "},";
		}
	}
	if(simplewhere.length>1){
		simplewhere = simplewhere.substring(0,simplewhere.length-1);
	}
	simplewhere+="]";
//	log(searchwhere);
	var o = {};
	try{o = getDgColsObj(generalSearchDataGrid);}catch(e){}
	
	var fAll = o.fAll;
	var tAll = o.tAll;
	
	var q = {
		simplewhere:simplewhere,
		fAll:fAll,
		tAll:tAll
	};
	if(searchwhere) q.searchwhere = searchwhere;
	return q;
}

/**
 * 查询数据
 */
function searchDataGrid(){
	var output_nodes_param = $.u.cache("output_nodes_param");
	generalSearchDataGrid.datagrid({
		url : 'generalSearchController.do?datagrid',
		queryParams : getQueryParams()
	});
}

/**
 * 导出Excel
 */
function exportXls(){
	var queryParams = getQueryParams();
	var params = '&';
	$.each(queryParams, function(key, val){
		if(val) params+='&'+key+'='+val;
	}); 
	//window.open("generalSearchController.do?exportXls" + encodeURI(params));  // 这种方式会执行两次后台
	//window.location.href = "generalSearchController.do?exportXls" + encodeURI(params);
	downLoadIframe("generalSearchController.do?exportXls" + encodeURI(params));
}

/**
 * 刷新配置
 */
function refreshConfig(){
	var code = $("#code").val();
	$.ajax({
		url:"generalSearchController.do?refreshConfig",
		type:"post",
		dataType:"json",
		data:{code:code},
		success:function(data){
			tip(data.msg);
			$.u.cache("searchIndex_code",code);
			$.u.removeCache("output_nodes_param");
			$.u.removeCache("grade_where_dialog");
			setTimeout(function(){location.reload();},200);
		}
	});
}


/**
 * 下载 无弹框
 * url 下载连接
 * @author LiWeichao
 * 
 * @param {} url
 */
function downLoadIframe(url){
	try{
		var _downTmp = document.createElement("iframe");
		_downTmp.src = url;
		_downTmp.style.display = "none";
		document.body.appendChild(_downTmp);
	}catch(e){
		alert("操作异常！");
	}
}