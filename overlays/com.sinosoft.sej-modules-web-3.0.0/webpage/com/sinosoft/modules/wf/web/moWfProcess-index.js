/* 全局变量 begin  */
var moWfProcessIndex = {};
/* 全局变量 end  */



/**
 * 初始化
 * 
 * @author cmh
 * @since 2016-10-23 11:59
 * @version 1.0
 */
moWfProcessIndex.initAll = function(){
	setTimeout(function(){
	},1000);
};





moWfProcessIndex.start = function(pdid) {
	alert(pdid);
};

/**
 * 更新流程定义状态
 * 
 * @author cmh
 * @since 2016-10-23 11:59
 * @version 1.0
 * @param id 主键
 * @param state 状态
 */
moWfProcessIndex.updateProcessState = function(id, state) {
	if(id){
		var r = ajax("moWfProcessController.do?updateProcessState",{processDefinitionId:id,state:state})
		if(r.success){
			$("#pdList").datagrid("reload");
			tip("更新流程定义状态成功");
		}
	}
};

/**
 * 是否挂起 格式化
 * 
 * @author cmh
 * @since 2016-10-23 11:59
 * @version 1.0
 * @param value
 * @param row
 * @param index
 * @returns {String}
 */
moWfProcessIndex.suspendedFormatter = function(value,row,index) {
	if(value){
		value = "<a href=\"javascript:void(0);\" onclick=\"moWfProcessIndex.updateProcessState('"+row.id+"','active');\" title=\"点击更改状态\" style=\"color:red;\">是</a>";
	}else{
		value = "<a href=\"javascript:void(0);\" onclick=\"moWfProcessIndex.updateProcessState('"+row.id+"','suspend');\" title=\"点击更改状态\" style=\"color:green;\">否</a>";
	}
	return value;
};

/**
 * 图片 格式化
 * 
 * @param value
 * @param row
 * @param index
 * @returns {String}
 */
moWfProcessIndex.imageFormatter = function(value,row,index){
	return moWfProcessIndex.resourceRead(row, "image");
};

/**
 * xml 格式化
 * 
 * @param value
 * @param row
 * @param index
 * @returns {String}
 */
moWfProcessIndex.xmlFormatter = function(value,row,index){
	return moWfProcessIndex.resourceRead(row, "xml");
};

/**
 * 读取资源
 * 
 * @param row 数据
 * @param resourceType 资源类型
 */
moWfProcessIndex.resourceRead = function(row, resourceType){
	var name = row.resourceName;
	if("image"==resourceType) name = row.diagramResourceName;
	return "<a href=\"javascript:void(0);\" onclick=\"window.open('moWfProcessController.do?resourceRead&processDefinitionId="+row.id
		+"&resourceType="+resourceType+"');\">"+name+"</a>";
};
