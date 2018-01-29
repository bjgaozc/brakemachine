/* 全局变量 begin  */
var moWfCommon = {};
/* 全局变量 end  */



/**
 * 初始化
 * 
 * @author cmh
 * @since 2016-10-26 17:15
 * @version 1.0
 */
moWfCommon.initAll = function(){
	setTimeout(function(){
	},1000);
};


/**
 * 初始化日期控件<br>
 * 
 * @author cmh
 * @since 2016-03-23 16:28:23
 * @version 1.0
 * @param id 主键
 * @param fromat 格式
 */
moWfCommon.initDate = function(id, fromat){
	var idArr = id.split(",");
	if(!fromat) fromat = "yyyy-MM-dd";
	for(var i=0;i<idArr.length;i++){
		$(idArr[i]).attr("class","Wdate").click(function(){WdatePicker({skin:'twoer',dateFmt:fromat});});
	}
};