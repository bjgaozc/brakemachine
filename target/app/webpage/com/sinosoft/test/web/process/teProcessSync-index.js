var teProcessSyncIndex = {
	/**
	 * 初始化
	 * 
	 * @author cmh
	 */
	initAll: function(){
		this.initBtn();
	},
	/**
	 * 初始化按钮
	 * 
	 * @author cmh
	 */
	initBtn: function(){
		var that = this;
		common.initCombobox({id:"#syType",url:"",prompt:'操作类型'});
		$("#btn_search").on("click",function(){
			that.dgSearch();
		});
		$("#btn_reset").on("click",function(){
			$(".form-group input").val("");
		});
		$("body").keydown(function(e){
			if(e.keyCode==13){
	      		$("#btn_search").click();
			}
		});
	},
	/**
	 * 查询
	 */
	dgSearch: function(){
		$("#teProcessSyncList").datagrid({
			queryParams:{
				"syType" : $("#syType").val(),
				"syApplyid" : $("#syApplyid").val(),
				"syApplytype" : $("#syApplytype").val(),
				"version": 1
			}
		});
	},
	
	version: function(){
		return "1.0.0";
	}
};
