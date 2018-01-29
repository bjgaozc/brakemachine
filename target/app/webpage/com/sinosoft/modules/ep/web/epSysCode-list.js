var sysCodeTreeGrid={};// 表格
/**
 * 初始化加载数据
 */
$(function(){
	try{
		initSysCodeTreeGrid();
	}catch(e){
		alert(e.message);
	}
});

/**
 * 初始化表格数据
 */
function initSysCodeTreeGrid(){
	sysCodeTreeGrid.tg = $('#sysCodeTreeGridId').treegrid({
	    url:"epSysCodeController.do?sysCodeTreeGrid",   
	    idField:'chdCode',
	    parentField:'fthCode',
	    treeField:'chdCname',
		toolbar:"#sysCodeTreeGridTbId",
		rownumbers:true,
	    fit:true,
	    border: false,
	    fitColumns:true,
	    columns:[[
	        {field:'chdCname',title:'编码名称',width:200,halign:'center'},
	        {field:'chdSysCode',title:'编码值',width:150,halign:'center'},
	        {field:'fthCode',title:'父编码',width:100,halign:'center'},
	        {field:'chdCode',title:'编码',width:100,halign:'center'},
	        {field:'chdEname',title:'英文',width:100,halign:'center'},
	        {field:'valide',title:'是否可用',width:50,halign:'center',align:'center',formatter:sysCodeValideFormatter},
	        {field:'sort',title:'排序',width:50,halign:'center'},
	        {field:'opt',title:'操作',width:50,halign:'center',formatter:sysCodeOptFormatter}
	    ]]
	});
}
/**
 * 是否可用 格式化
 * 
 * @param value
 * @param row
 * @param index
 * @returns {String}
 */
function sysCodeValideFormatter(value,row,index){
	if(null==value || value==1){
		value = "是";
	}else{
		value = "否";
	}
	return value;
}

/**
 * 操作 格式化
 * 
 * @param value
 * @param row
 * @param index
 * @returns {String}
 */
function sysCodeOptFormatter(value,row,index){
	return "[<a href='javascript:void(0);' onclick=\"delCode('"+row.chdCode+"')\">删除</a>]";
}

/**
 * 删除当前节点
 * @param {} chdCode
 */
function delCode(chdCode){
	if(chdCode=="000"){
		$.messager.alert("提示","系统编码节点不允许删除","info");
		return;
	}
	var result = ajax("epSysCodeController.do?delChdCode",{chdCode:chdCode});
	if(result.success){
		tip(result.msg);
		sysCodeTreeGrid.reloadTable(); 
	}else{
		tip(result.msg);
	}
}

function editCode(status){
	var row=$('#sysCodeTreeGridId').treegrid("getSelected");
	if(row==null){
		$.messager.alert("提示","请选中需要进行操作的节点信息","info");
		return;
	}
	var fthCode="";
	var chdCode="";
	var valide="";
	if(status=="add"){
		fthCode=row.chdCode;
	}
	if(status=="edit"){
		fthCode=row.fthCode;
		chdCode=row.chdCode;
	}
	valide=row.valide;
	if(chdCode=="000"){
		$.messager.alert("提示","系统编码节点不可编辑","info");
		return;
	}
	sysCodeTreeGrid.addCodeDialog = common.dialog({
		title:"字典信息",
		width:450,
		height:370,
		content:"url:epSysCodeController.do?index&fthCode="+fthCode+"&chdCode="+chdCode+"&status="+status+"&valide="+valide
	})  ;
	$.u.cache("sysCodeTreeGrid",sysCodeTreeGrid);
}

sysCodeTreeGrid.closeTable = function(){
	sysCodeTreeGrid.addCodeDialog.close();
};

sysCodeTreeGrid.reloadTable = function(){
	sysCodeTreeGrid.tg.treegrid('reload');
};