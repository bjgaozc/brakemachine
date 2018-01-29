<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@include file="/context/tags.jsp"%>
<app:template title="数据表格" plugins="jeasyui-extend">
<script>
$(function(){
	$(".btnt").on("click",function(){
		if("隐藏编辑按钮"==$(this).text()){
			$("#dg").datagrid("removeToolbarItem",0);
		}else if("添加按钮"==$(this).text()){
			$("#dg").datagrid("addToolbarItem",["-",{"text":"测试按钮"},"-",{"text":"第二个","iconCls":"icon-ok",handler: function(){alert('第二个按钮')}}]);
		}else if("移除测试按钮"==$(this).text()){
			$("#dg").datagrid("removeToolbarItem","测试按钮");
		}else if("更改标题"==$(this).text()){
			$("#dg").datagrid({title:"表格标题已经修改"});
		}
	});
	
});

var editIndex = undefined;
function endEditing(){
	if (editIndex == undefined){return true}
	if ($('#dg').datagrid('validateRow', editIndex)){
		var ed = $('#dg').datagrid('getEditor', {index:editIndex,field:'productid'});
		var productname = $(ed.target).combobox('getText');
		$('#dg').datagrid('getRows')[editIndex]['productname'] = productname;
		$('#dg').datagrid('endEdit', editIndex);
		editIndex = undefined;
		return true;
	} else {
		return false;
	}
}
function onClickRow(index){
	if (editIndex != index){
		if (endEditing()){
			$('#dg').datagrid('selectRow', index)
					.datagrid('beginEdit', index);
			editIndex = index;
		} else {
			$('#dg').datagrid('selectRow', editIndex);
		}
	}
}
function accept(){
	if (endEditing()){
		$('#dg').datagrid('acceptChanges');
	}
}
function reject(){
	$('#dg').datagrid('rejectChanges');
	editIndex = undefined;
}
function getChanges(){
	var rows = $('#dg').datagrid('getChanges');
	alert(rows.length+' rows are changed!');
}
</script>

<a href="javascript:void(0);" class="easyui-linkbutton btnt" >隐藏编辑按钮</a>
<a href="javascript:void(0);" class="easyui-linkbutton btnt" >添加按钮</a>
<a href="javascript:void(0);" class="easyui-linkbutton btnt" >移除测试按钮</a>
<a href="javascript:void(0);" class="easyui-linkbutton btnt" >更改标题</a>

<hr>

<input type="text" placeholder="提示下" >

<hr>

<table id="dg" class="easyui-datagrid" title="数据表格" style="width:100%;height:500px"
	data-options="
		singleSelect:true,
		collapsible:true,
		customAttr:{
            tooltip:{
                enable: true,
                target: 'cell',
                fields: ['listprice'],
                formatter: tooltipFormatter
            }
        },
		url:'plug-in/easyui/demo/datagrid/datagrid_data1.json',
		toolbar: [{
			id:'edit',
			text:'编辑',
			iconCls: 'icon-edit',
			handler: function(){}
		},'-',{
			id:'help',
			text:'保存',
			iconCls: 'icon-save',
			handler: function(){accept()}
		},'-',{
			id:'help',
			text:'获取更改',
			iconCls: 'fa fa-search',
			handler: function(){getChanges}
		},{ text: '添加', iconCls: 'icon-add', handler: function () {
            if (editIndex) {
                $('#dg').datagrid('endEdit', editRow);
            }
            if (editIndex == undefined) {
                $('#dg').datagrid('insertRow', {
                    index: 0,
                    row: {

                    }
                });
                $('#dg').datagrid('beginEdit', 0);
                editRow = 0;
            }
          }
         }
        ],
		method:'get',
		onClickRow: onClickRow
		"
	>
	<thead>
		<tr>
			<th data-options="field:'itemid',resizable:false" width="15%">Item ID(15%)</th>
			<th data-options="field:'productid',resizable:false,
				editor:{
					type:'combobox',
					options:{
						valueField:'productid',
						textField:'productname',
						url:'plug-in/easyui/demo/datagrid/products.json',
						required:true
					}
				}
			" width="15%">Product(15%)</th>
			<th data-options="field:'listprice',align:'right',resizable:false" width="15%">List Price(15%)</th>
			<th data-options="field:'unitcost',align:'right',resizable:false" width="15%">Unit Cost(15%)</th>
			<th data-options="field:'attr1',resizable:false" width="25%">Attribute(25%)</th>
			<th data-options="field:'status',align:'center',resizable:false" width="15%">Status(15%)</th>
		</tr>
	</thead>
</table>
<script>
function tooltipFormatter(value, field){
    var content = '快速了解各组件扩展信息，请直接访问在线<a href=\'http://loafer.sturgeon.mopaas.com\' target=\'_blank\'>Demo</a><br>具体了解每个组件的扩展内容及使用方法，请查看extend下相应文件的开头说明。<br>~~要使扩展属性生效，必须执行方法followCustomHandle。~~<br>';
    return {content: content, css:{backgroundColor: '#FFFF88', borderColor: '#df8505'}};
}
</script>
</app:template>