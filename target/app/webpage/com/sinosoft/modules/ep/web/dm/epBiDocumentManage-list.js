var epBiDocumentManageList = {
	/**
	 * 初始化
	 * 
	 * @author cmh
	 */
	initAll: function(){
		this.initDg();
		this.initBtn();
	},
	/**
	 * 文档类型格式
	 * 
	 * @author cmh
	 * @param {} value
	 * @param {} row
	 * @param {} index
	 */
	documentTypeFormatter: function(value,row,index){
		if(!value) return "";
		if("Word.Document"===value){
			value = "<i class='fa fa-file-word-o'></i>&nbsp;Word文档";
		}else if("Excel.Sheet"===value){
			value = "<i class='fa fa-file-excel-o'></i>&nbsp;Excel文档";
		}else if("PowerPoint.Show"===value){
			value = "<i class='fa fa-file-powerpoint-o'></i>&nbsp;PowerPoint文档";
		}
		return value;
	},
	/**
	 * 操作
	 * 
	 * @author cmh
	 * @param {} value
	 * @param {} row
	 * @param {} index
	 * @return {}
	 */
	optsFormatter: function(value,row,index){
		return "[<a href='javascript:void(0);' onclick=\"epBiDocumentManageList.del('"+row.id+"')\">删除</a>]";
	},
	/**
	 * 删除
	 * 
	 * @author cmh
	 * @param {} id 主键
	 */
	del: function(id){
		var that = this;
		$.messager.confirm('消息','确认删除吗？', function(r){
			if(r) {
				var result = ajax("epBiDocumentManageController.do?del",{id:id});
				if(result.success){
					tip(result.msg);
					that.dmSearch();
				}else{
					tip(result.msg);
				}
			};
		});
		
	},
	/**
	 * 初始表格
	 */
	initDg: function(){
		var that = this;
		$("#dm").datagrid({
			url:"epBiDocumentManageController.do?datagrid=true",
			toolbar:"#dmTbId",
//			fit:true,
			fitColumns:true,
			striped:true,
			singleSelect:true,
			pagination:true,
			rownumbers:true,
			columns:[[      
		         {field:'id',title:'主键',width:100,hidden:true},
		         {field:'dm_businesstype', title:'业务类型',width:100,sortable:true},
		         {field:'name', title:'名称',width:100,sortable:true},
		         {field:'documentPath', title:'路径',width:200},
		         {field:'documentName', title:'文档名称',width:100},
		         {field:'documentType', title:'文档类型',width:50,sortable:true,formatter:that.documentTypeFormatter},
		         {field:'realname', title:'所属用户',width:100,sortable:true},
		         {field:'dm_sort', title:'排序',width:50,sortable:true},
		         {field:'opts', title:'操作',width:50,formatter:that.optsFormatter}
			]]
		});
	},
	/**
	 * 查询
	 */
	dmSearch: function(){
		$("#dm").datagrid({
			url:"epBiDocumentManageController.do?datagrid=true",
			queryParams:{
				"dmBusinesstype": $("#dmBusinesstype").val(),
				"name": $("#name").val()
			}
		});
	},
	/**
	 * 初始化按钮
	 */
	initBtn: function(){
		var that = this;
		$("#btn_search").on("click",function(){
			that.dmSearch();
		});
		$("#btn_reset").on("click",function(){
			$(".form-group input").val("");
		});
		$("#btn_add").on("click",function(){
			var d = common.dialog({
				width:"800px",
				height:"280px",
				title:"添加",
				content:"url:epBiDocumentManageController.do?goAdd=true"
			});
			that.dialogAdd = d;
			$.u.cache("epBiDocumentManageList",epBiDocumentManageList);
		});
		$("#btn_edit").on("click",function(){
			var s = $("#dm").datagrid("getSelected");
			if(!s){
				common.tip("请先选择一条记录");
				return;
			}
			var url = "epBiDocumentManageController.do?goUpdate=true";
			url += "&id="+s.id;
			var d = common.dialog({
				autoMax:true,
				title:"文档管理",
				content:"url:"+url
			});
			that.id = s.id;
			that.dialogNew = d;
			$.u.cache("epBiDocumentManageList",epBiDocumentManageList);
		});
		$(".btn_new").on("click",function(){
			var url = "epBiDocumentManageController.do?goNew=true";
			url += "&documentType="+$(this).attr("documentType");
			//window.top.open(url);
			var d = common.dialog({
				autoMax:true,
				title:"文档管理",
				content:"url:"+url
			});
			that.dialogNew = d;
			$.u.cache("epBiDocumentManageList",epBiDocumentManageList);
		});
	}
};