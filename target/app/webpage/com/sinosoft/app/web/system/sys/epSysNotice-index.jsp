<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="/context/mytags.jsp"%>

<sino:plugins type="jquery,easyui,tools,date,util"/>
<script type="text/javascript">

function showDetail(id){
	window.top.$.dialog({
		lock:true,
		padding:0,
		min:false,
		title:"查看详细",
		content: "url:epSysNoticeController.do?showDetail&id="+id
	}).max();
}

function titleFormatter(value,row,index){
	value = '<a href="javascript:void(0);" onclick="showDetail(\''+row.id+'\');" >'+value+'</a>';
	return value;
}

function createtimeFormatter(value,row,index){
	if(null!=value) value = new Date(value).formatDate('yyyy年MM月dd日');
	return value;
}

</script>
<div class="easyui-layout" fit="true">
	<div region="center" border="false">

<table class="easyui-datagrid" fit="true" data-options="
	url:'epSysNoticeController.do?dg&type=${type}',
	border:false,fitColumns:true,singleSelect:true," >
	<thead>   
        <tr> 
            <th data-options="field:'title',width:300,formatter:titleFormatter">标题</th>
            <th data-options="field:'keyword',width:100">关键字</th>
            <th data-options="field:'realname',width:100">创建人</th>
            <th data-options="field:'createtime',width:100,formatter:createtimeFormatter">创建时间</th>
        </tr>
    </thead>
</table>

	</div>
</div>
