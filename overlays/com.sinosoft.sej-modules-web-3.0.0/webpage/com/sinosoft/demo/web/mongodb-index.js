/* 全局变量 begin  */
var mongodbIndex = {};
/* 全局变量 end  */


/**
 * 初始化
 */
mongodbIndex.initAll = function(){
	
};

mongodbIndex.initDatagrid = function(){
	
	demoIndex.dg = $('#demoIndexDg').datagrid({    
	    url:"deCoToPage.do?datagrid",
	    fit:true,
	    pagination:true,
	    toolbar: [{
			iconCls: 'icon-edit',
			handler: function(){
				demoIndex.dg.datagrid("reload");
				
			}
		},'-',{
			iconCls: 'icon-help',
			handler: function(){alert('帮助按钮')}
		}],
	    columns:[[    
	        {field:'name',title:'姓名',width:100,sortable:true},
	        {field:'age',title:'年龄',width:100,align:'right',sortable:true},
	        {field:'birthday',title:'出生日期',width:200,formatter: function(value,row,index){
	        		if(value){
	        			value = new Date(value).formatDate("yyyy-MM-dd hh:mm:ss");
	        		}
	        		return value;
	        	}
	        }
	    ]]    
	});
	
};
