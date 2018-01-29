/* 全局变量 begin  */
var moWfTaskTodoTask = {};
/* 全局变量 end  */



/**
 * 初始化
 * 
 * @author cmh
 * @since 2016-10-26 15:59
 * @version 1.0
 */
moWfTaskTodoTask.initAll = function(){
	moWfTaskTodoTask.initTodoTaskList();
	setTimeout(function(){
		moWfTaskTodoTask.todoTaskList.datagrid("selectRow",0);
		var s = moWfTaskTodoTask.todoTaskList.datagrid("getSelected");
		if(s) moWfTaskTodoTask.todoTaskListOnClickRow(0,s);
	},200);
	
};






/**
 * 初始化待办任务列表
 * 
 * @author cmh
 * @since 2016-10-28 14:33
 * @version 1.0
 */
moWfTaskTodoTask.initTodoTaskList = function() {
	moWfTaskTodoTask.todoTaskList = $('#todoTaskList').datagrid({    
	    url:'moWfTaskController.do?todoTaskList',
	    fit:true,
	    fitColumns:true,
	    showHeader:false,
	    pagination:true,
	    singleSelect:true,
	    columns:[[
	        {field:'id',title:'主键',width:100,hidden:true},
	        {field:'name',title:'任务名称',width:100},
	    ]],
	    onClickRow:moWfTaskTodoTask.todoTaskListOnClickRow
	});
	
	//设置分页控件  
	moWfTaskTodoTask.todoTaskList.datagrid('getPager').pagination({  
//        pageSize: 10,  
//        pageList: [10,20,30],  
        beforePageText: '',  
        afterPageText: '/{pages}',
        displayMsg: '{from}-{to}共{total}条',
        showPageList:false,
        showRefresh:true,
        onBeforeRefresh:function(pageNumber, pageSize){
            $(this).pagination('loading');
            $(this).pagination('loaded');
        }
    });
};

moWfTaskTodoTask.todoTaskListOnClickRow = function(i, d) {
	$("#contentView").html('<iframe src="moWfTaskController.do?todoTaskDetail&taskId='+d.id+'" frameborder="0" style="border:0;width:100%;height:100%;"></iframe>');
};

/**
 * 新任务
 * 
 * @author cmh
 * @since 2016-10-26 16:33
 * @version 1.0
 */
moWfTaskTodoTask.newTask = function(){
	moWfTaskTodoTask.d = edit("新任务","url:moWfTaskController.do?newTask");
	$.u.cache("moWfTaskTodoTask", moWfTaskTodoTask);
	//$("#contentView").html('<iframe src="apps/helloworld" frameborder="0" style="border:0;width:100%;height:100%;"></iframe>');
};

moWfTaskTodoTask.test = function(){
	$("#aaa").append("bbb");
}