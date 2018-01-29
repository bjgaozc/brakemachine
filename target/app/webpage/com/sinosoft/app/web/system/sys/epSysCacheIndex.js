$(function(){
});

/**
 * 设置datagrid属性
 */
$('#epSysCacheList').datagrid({
    idField: 'id',
    fit:true,
    pagination:false,
    rownumbers:true,
    singleSelect:true,
    fitColumns:true,
    url:'epSysCacheController.do?cacheList',  
    toolbar: '#tb2',
    loadFilter: function(data){
    	return getData(data);
	}
});

/**
 * 编辑初始化数据
 * 
 * @param data
 * @returns data
 */
function getData(data){
	var rows = [];			
	var total = data.total;
	for(var i=0; i<data.rows.length; i++){
		rows.push({
			id: data.rows[i].id,
			name: data.rows[i].name,
			type: data.rows[i].type,
			note: data.rows[i].note
		});
	}
	var newData={"total":total,"rows":rows};
	return newData;
}

/**
 * 刷新表格
 */
function reloadTable(){
	$('#epSysCacheList').datagrid('reload');
}

/**
 * 刷新缓存
 */
function refreshCache(){
	$.ajax({
        type: "POST",
        //async:false,
        url: "epSysCacheController.do?refresh",
        dataType:"json",
        success: function(obj){
        	if(obj){
        		reloadTable();
        		artSucceed("刷新缓存成功");
        	}
        }
   });
}
