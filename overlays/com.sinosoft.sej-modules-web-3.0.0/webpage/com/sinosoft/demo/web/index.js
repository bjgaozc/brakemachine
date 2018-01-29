/* 全局变量 begin  */
var demoIndex = {};
/* 全局变量 end  */


/**
 * 初始化
 */
demoIndex.initAll = function(){
	
};

demoIndex.getOne = function(){
	var r = ajax("deCoToPage.do?getOne");
	log(r);
	$("#demoIndexContent").html(r.name);
};


/**
 * 版本
 */
demoIndex.version = function(){
	alert("1.0.0");
};