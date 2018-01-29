/* 全局变量 begin  */
var epSysParameterList = {
	url:"epSysParameterController.do?parameterTreeGrid",
	parameterListColumn:[
     	{field:'keys',title:'关键字',width:200,halign:'center'},
        {field:'paramKey',title:'主键',width:180,hidden:true},
        {field:'value',title:'值',width:150,halign:'center',editor:"text"},
        {field:'descript',title:'说明',width:150,halign:'center'},
        {field:'valide',title:'是否可用',width:50,halign:'center',align:'center',formatter:sysParValideFormatter},
        {field:'groupName',title:'分组名称',width:100,halign:'center',hidden:true},
        {field:'sort',title:'排序',width:50,halign:'center'},
        {field:'opt',title:'操作',width:50,halign:'center',formatter:sysParOptFormatter}
    ],
    valueEdit:true
};
var parameterList;// 表格
/* 全局变量 end  */


epSysParameterList.initAll = function(){
	initParameterList(epSysParameterList.url);
};



/**
 * 添加参数
 * 
 * @param title
 * @param addurl
 * @param gname
 * @param rootKey
 */
function addParameter(title,addurl,gname,rootKey) {
	if(rootKey){
		addurl += "&rootKey="+rootKey;
	}
	gridname=gname;
	var s = parameterList.datagrid("getSelected");
	if(null!=s){
		addurl += "&parentKey="+s.paramKey;
	}else{
		if(rootKey){
			addurl += "&parentKey="+rootKey;
		}
	}
	
	$.u.cache("epSysParameterList",epSysParameterList);
	
	createwindow(title, addurl,null,null);
}

/**
 * 更新参数
 * 
 * @param title
 * @param url
 * @param id
 * @param rootKey
 */
function updateParameter(title,url,id,rootKey) {
	if(rootKey){
		url += "&rootKey="+rootKey;
	}
	gridname=id;
	var rowsData = $('#'+id).datagrid('getSelections');
	if (!rowsData || rowsData.length==0) {
		tip('请选择编辑项目');
		return;
	}
	if (rowsData.length>1) {
		tip('请选择一条记录再编辑');
		return;
	}
	url += '&paramKey='+rowsData[0].paramKey;
	
	$.u.cache("epSysParameterList",epSysParameterList);
	
	createwindow(title,url,null,null);
}

/**
 * 初始化基础参数树形列表
 */
function initParameterList(url){
	if(!url) url = "epSysParameterController.do?parameterTreeGrid=true";
	
	var lastIndex;
	var editorOpen = false;
	parameterList = $('#parameterList').treegrid({    
	    url:url,   
	    idField:'paramKey',  
	    treeField:'keys',
		parentField : 'parentKey',
		toolbar:"#parameterListTb",
	    fit:true,
	    border: false,
	    fitColumns:true,
	    columns:[epSysParameterList.parameterListColumn],
	    onClickCell:function(field, row){
	    	if(epSysParameterList.valueEdit && field=="value" && !editorOpen){
	    		var rowIndex = row.paramKey;
		        
	    		$(this).treegrid('endEdit', lastIndex);
    			$(this).treegrid('beginEdit', rowIndex);
	        	lastIndex = rowIndex;
	        	editorOpen = true;
	        	
	        	var v = $("input[class=datagrid-editable-input]");
	        	if(v.length==1){
	        		v.on("blur",function(){
		        	}).on("keydown",function(e){
		        		if(e.keyCode==13){
		        			$("#parameterList").treegrid('endEdit', lastIndex);
		        			editorOpen = false;
		        		}
		        	});
		        	v.focus();
	        	}else{
	        		v.each(function(i){
	        			$(this).on("keydown",function(e){
			        		if(e.keyCode==13){
			        			$("#parameterList").treegrid('endEdit', lastIndex);
			        			editorOpen = false;
			        		}
			        	});
	        			if(i==0){
	        				$(this).focus();
	        			}
	        		});
	        	}
	        	
	    	}else{
	    		$(this).treegrid('endEdit', lastIndex);
	    		editorOpen = false;
	    	}
	    },
	    onAfterEdit:function(row,changes){
	    	if(changes.value && ""!=changes.value){
	    		var r = ajax("epSysParameterController.do?doUpdateCvalue=true",{"paramKey":row.paramKey,"value":row.value});
		    	artSucceed(r);
	    	}
	    }
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
function sysParValideFormatter(value,row,index){
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
function sysParOptFormatter(value,row,index){
	return "[<a href=\"#\" onclick=\"delObj('epSysParameterController.do?doDel=true&paramKey="+row.paramKey+"','parameterList')\">删除</a>]";
}

/**
 * 刷新
 */
function reloadTable(){
	$('#parameterList').treegrid('reload');
}
