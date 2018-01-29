/**对象*/
var teCoCommonIndex = {
	/**
	 * 初始化方法
	 */
	initAll:  function(){
		$(".btnt").on("click",function(){
			if("弹出窗口"==$(this).text()){
				common.dialog({
					width:800,
					title:"测试",
					content:"url:teCoCommonController.do?go&p=test/win1"
				});
			}else if("弹出子窗口"==$(this).text()){
				teCoCommonIndex.win2 = common.dialog({
					width:300,
					height:100,
					title:"测试",
					content:"url:teCoCommonController.do?go&p=test/win2"
				});
				$.u.cache("teCoCommonIndex",teCoCommonIndex);
			}else if("传送"==$(this).text()){
				var t2 = $("#t2").val();
				log(t2);
				var s = $.u.cache("teCoCommonIndex");
				s.c1(t2);
			}else if("弹出窗口(top)"==$(this).text()){
				var s = $.u.cache("teCoCommonIndex");
				var html = $("#winContext").html();
				s.c2(html);
			}else if("数据库类型"==$(this).text()){
				common.alert(common.dbType,function(){});
			}else if("提示"==$(this).text()){
				common.alert("上报团组的错误信息如下：<br>1、护照专办员手机不能为空；团组成员【陈冬】错误信息如下：<br>1、原持有效护照情况不能为空；2、数字照片编码不能为空；<br>3、身份证扫描件不能为空；<br>4、签名图片不能为空；<br>5、户口薄扫描件不能为空；<br>6、是否采集指纹不能为空；<br>7、护照种类不能为空；",function(){
					common.alert("请使用 common.alert();");
				});
			}
		});
		
		$(".btnc").on("click",function(){
			window.open("teCoCommonController.do?go&p=test/"+$(this).attr("url"));
		});
		
	},
	/**
	 * 赋值测试
	 * 
	 * @param {} t
	 */
	c1: function(t){
		$("#t1").val(t);
		teCoCommonIndex.win2.close();
	},
	c2: function(html){
		common.window({
			html:html
		});
		
	}
};





$(function(){
	teCoCommonIndex.initAll();
});
