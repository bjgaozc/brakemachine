/* 全局变量 begin  */
var personChoose = {
	config:$.u.cache("personChoose_config")
};
/* 全局变量 end  */

/**
 * 初始化左右表格
 * 
 * @author cmh
 * @since 2015-11-28 13:23:23
 * @version 1.0
 */
personChoose.initLayout = function(){
	$(".okBtn").text(personChoose.config.okBtn);
	$(".okBtn").on("click", personChoose.saveChoosePersonId);
	$(".okBtn").linkbutton({iconCls:personChoose.config.okBtnIconCls});
	
	$('#cpDsId').dblselector({
		border:false, 
		leftPanelWidth:0.6,
		leftPanel:"#cpDsLeftTableId",
		rightPanel:"#cpDsRightTableId",
		onMoveToRight:function(){
			if(personChoose.checkPersonExist()){
				$('#cpDsId').dblselector("moveToRight");
			}
		},
		onMoveToRightAll:function(){
			if(personChoose.checkPersonExist()){
				$('#cpDsId').dblselector("moveToRightAll");
			}
		}
	});
	
	personChoose.leftTable = $("#cpDsLeftTableId").datagrid({
		url:"epCommonController.do?getUsersByDepartId",
		fit:true,
		fitColumns:true,
		rownumbers:true,
		pagination:true,
		columns:[[
		    {field:"",checkbox:true},
		    {field:"id",title:"主键",width:30,hidden:true},
		    {field:"realName",title:"姓名", width:30}
		]]
	});
	
	var p = personChoose.leftTable.datagrid("getPager");
	p.pagination({showRefresh:false,displayMsg:""});
	
	personChoose.rightTable = $("#cpDsRightTableId").datagrid({
		fit:true,
		fitColumns:true,
		remoteSort:false,
		rownumbers:true,
		columns:[[
		    {field:"",checkbox:true},
		    {field:"id",title:"主键",width:30,hidden:true},
		    {field:"realName",title:"姓名",width:30}
		]]
	});
	
};

personChoose.orgClick = function(valArrayId){
	$("#cpDsLeftTableId").datagrid("reload",{departId:valArrayId});
};

/**
 * 判断是否已选择
 * @returns
 */
personChoose.checkPersonExist = function(){
	var rowLeft = $('#cpDsLeftTableId').datagrid('getSelections');
	var rowRight = $('#cpDsRightTableId').datagrid('getRows');
	var rowRightStr = "";
	for (var j = 0; j < rowRight.length; j++) {
		if(rowRightStr == ""){
			rowRightStr += rowRight[j].id;
		}else{
			rowRightStr += "," + rowRight[j].id;
		}
	}
	if(rowLeft.length > 0 && rowRightStr.length > 0){
		for (var i = 0; i < rowLeft.length; i++) {
			var row = rowLeft[i];
			var id = row.id;
			if(rowRightStr.indexOf(id) != -1){
				alert("已选择人员不能再次选择！");
				return false;
			}
		}
	}
	return true;
};

/**
 * 返回已保存的人员ID
 * @returns
 */
personChoose.saveChoosePersonId = function(){
	var rowRight = $('#cpDsRightTableId').datagrid('getRows');
	var rowRightStr = "";
	for (var j = 0; j < rowRight.length; j++) {
		if(rowRightStr == ""){
			rowRightStr += rowRight[j].id;
		}else{
			rowRightStr += "," + rowRight[j].id;
		}
	}
	//alert("已选择人员ID：" +rowRightStr);
	
	personChoose.config.callback(rowRightStr,rowRight);
};

$(function(){
	personChoose.initLayout();
});