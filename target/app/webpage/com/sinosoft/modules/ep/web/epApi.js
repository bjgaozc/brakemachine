/* 公共Api */
var epApi = {
	/**
	 * 初始化登录页面
	 * 
	 * @author cmh
	 * @param {} options 配置
	 */
	initLoginPage: function(options){
		$("body").hide();
		this.ui.loginbg();
		$("body").show();
	},
	/**
	 * 初始化首页
	 * 
	 * @author cmh
	 * @param {} options 配置
	 */
	initMainPage: function(options){
		$("body").hide();
		this.ui.logo();
		$("body").show();
	},
	/**
	 * UI配置
	 * 
	 * @author cmh
	 */
	ui: {
		url: "api/ep/common/prop/ui.do",
		getData: function(){
			var d = this.data;
			if(!d){
				$.ajaxSettings.async = false;
				$.getJSON(this.url,function(data){
					d = data;
				});
				$.ajaxSettings.async = true;
				this.data = d;
			}
			return d;
		},
		logo:function(){
			var d = this.getData();
			if(undefined!=d.obj.exitBtn){
				if("false"==d.obj.exitBtn){
					$("#exitBtn").hide();
					$("#fullScreen").hide();
				}
			}
			//$(".logo").html("<br><br><br>");// 解决IE8下logo不能显示（位置）问题  ; 已经通过css解决
			$(".logo").css({"background":"url("+d.obj.logo+") no-repeat left"});
		},
		loginbg:function(){
			var d = this.getData();
			$(".bg").css({"background":"url("+d.obj.loginbg+") no-repeat left"});
		}
	}
};