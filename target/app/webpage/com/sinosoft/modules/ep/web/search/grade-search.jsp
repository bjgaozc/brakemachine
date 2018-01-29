<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@include file="/context/tags.jsp"%>
<app:template title="通用查询">
<script src = "plug-in/jquery-plugs/jquery.maskedinput-1.0.js"></script>
<script type="text/javascript">${js}</script>

<div id="gradeLayoutDivId" class="easyui-layout" fit="true">
	<div data-options="region:'west'" style="width:150px;padding:2px;">
		<select id="conditionTablesSelectId" style="width: 140px; margin: 2px;"></select>
		<c:forEach var="_tables" items="${tablesList }">
			<script type="text/javascript">
				$("#conditionTablesSelectId").append("<option value='${_tables.name }'>${_tables.text }</option>");
			</script>
			<select id="${_tables.name }TableSelectId" ondblclick="moveGt();" style="width: 140px;height: 310px;margin: 2px;display: none;" multiple="multiple">
			<c:forEach var="_table" items="${_tables.tableList }">
				<option value="${_table.column }">${_table.text }</option>
			</c:forEach>
			</select>
		</c:forEach>
	</div> 
	
	<div data-options="region:'east'" style="width:572px;margin:2px;">
		<div id="datagridSelectDivId" style="border:solid 1px #54A5D5;height: 200px;width: 565px;">
			<table id="datagridSelectTableId" class="easyui-datagrid" style="width: 565px;height:200px;overflow-y: auto;" data-options="singleSelect:false">
				<thead>
					<tr>
						<th data-options="field:'column',width:100,hidden:true">列名</th>
						<th data-options="field:'lbracket',width:50">左括号</th>
						<th data-options="field:'text',width:145">列标题</th>
						<th data-options="field:'compare',width:90">比较符</th>
						<th data-options="field:'value',width:155">值</th>
						<th data-options="field:'rbracket',width:50">右括号</th>
						<th data-options="field:'relation',width:50">关系符</th>
					</tr>
				</thead>
			</table>
		</div>
		<div style="display:none;border:solid 1px #54A5D5;border-top: 0px;height: 80px;width: 565px;">
			<div id="conditionVerifyDivId" style="width: 470px;height: 76px;border-right:solid 1px #54A5D5;float: left;line-height: 25px;padding: 2px;overflow-y:auto; "></div>
			<div style="width: 80px;height: 80px;float: right;text-align: center;padding-top: 20px;">
				<a href="javascript:void(0);" class="easyui-linkbutton" data-options="" onclick="alert('校验');">校验</a>
			</div>
		</div>
		<div style="border:solid 1px #54A5D5;;border-top: 0px;height: 60px;width: 565px;">
			<div style="overflow-y: scroll;height:60px;border: 0px; ">
				<table style="width: 100%;">
				<c:forEach var="_sw" items="${searchwheres}">
					<tr>
						<td>${_sw.searchname}</td>
						<td width="40"><a href="javascript:void(0);" onclick="viewSearch('${_sw.searchname }','${_sw.id }')">查看</a></td>
						<td width="40"><a href="javascript:void(0);" onclick="deleteSearch(this,'${_sw.id }')">删除</a></td>
					</tr>
				</c:forEach>
				</table>
			</div>
		</div>
	</div>

	<div data-options="region:'center'" style="padding:10px;background:#eee;">
		<input type="button" value="&gt;&gt;" onclick="moveGt();" style="font-size: 10px;margin-top: 110px;padding: 5px;background-color: #0E90D2;" /><br/><br/><br/><br/>
		<input type="button" value="&lt;&lt;" onclick="moveLt();" style="font-size: 10px;padding: 5px;background-color: #0E90D2;"/>
	</div>   

	<div data-options="region:'south'" style="height:50px;padding:10px;text-align: center;">
		查询名称：<input id="searchnameid" name="searchname" type="text"/>
		&nbsp;<a href="javascript:void(0);" class="easyui-linkbutton" data-options="" onclick="saveSearch();_search();">保存&查询</a>
		&nbsp;<a href="javascript:void(0);" class="easyui-linkbutton" data-options="" onclick="_search();">查询</a>
		&nbsp;<a href="javascript:void(0);" class="easyui-linkbutton" data-options="" onclick="_reset();">清空</a>
		&nbsp;<a href="javascript:void(0);" class="easyui-linkbutton" data-options="" onclick="_close();">取消</a>
	</div>
</div>

<script src = "plug-in/sino/jCountry.js"></script>
<script src = "webpage/com/sinosoft/modules/ep/web/search/grade-search-extend.js"></script>
<script type="text/javascript">
$(function(){
	$("#"+$("#conditionTablesSelectId").val()+"TableSelectId").show();
	
	$("#conditionTablesSelectId").change(function(){
		$("#conditionTablesSelectId option").each(function(){
			$("#"+$(this).val()+"TableSelectId").hide();
		});
		$("#"+$("#conditionTablesSelectId").val()+"TableSelectId").show();
	});
});

function moveGt(param){
	$("#"+$("#conditionTablesSelectId").val()+"TableSelectId").find('option:selected').each(function(){
		addTableRows(this.value,null);
		//$(this).remove();
	});
	setVerifyValues();
}

function moveLt(){
	var getSelections = $("#datagridSelectTableId").datagrid("getSelections");
	for (var i = 0; i < getSelections.length; i++) {
// 		var tablename = getSelections[i].column.substring(0,getSelections[i].column.indexOf("."));
// 		$("#"+tablename+"TableSelectId").append("<option value='"+getSelections[i].column+"'>"+getSelections[i].text+"</option>");
		var selectIndex = $("#datagridSelectTableId").datagrid("getRowIndex",getSelections[i]);
		$("#datagridSelectTableId").datagrid("deleteRow",selectIndex);
	}
	setVerifyValues();
}

function addTableRows(value,param){
	$.ajax({
		url:"generalSearchController.do?setGradeTable",
		data:{
			"column":value,
			"param":JSON.stringify(param)
		},
		type:"post",
		cache:false,
		async:false,
		dataType:"json",
		success:function(obj){
			$("#datagridSelectTableId").datagrid('appendRow',obj[0]);
		}
	});
}

/**
 * 校验展示
 */
function setVerifyValues(){
	
	var _html = "";
	var _datagridValue = $("#datagridSelectDivId").find("table tbody");
	
	if(!_datagridValue){
		return "";
	}
	
	for(var row_index=0;row_index<_datagridValue[3].rows.length;row_index++){
		var _row = _datagridValue[3].rows[row_index];
// 		alert($(_row.childNodes[1]).find("input[name='column']")[0].value);//列名
// 		alert($(_row.childNodes[1]).find("input[name='lbracket']")[0].value);//左括号
// 		alert($(_row.childNodes[1]).find("input[name='text']")[0].value);//中文列名
// 		alert($(_row.childNodes[3]).find("select[name='compare']")[0].value);//条件
// 		alert($(_row.childNodes[4]).find("input[name='value'],select[name='value']")[0].value);//值
// 		alert($(_row.childNodes[5]).find("input[name='rbracket']")[0].value);//右括号
// 		alert($(_row.childNodes[6]).find("select[name='relation']")[0].value);//关系符
		_html+=" ";
		_html+=$(_row.cells[1]).find("input[name='lbracket']")[0].value;
		_html+=$(_row.cells[1]).find("input[name='text']")[0].value;
		_html+=" ";
		_html+=$(_row.cells[3]).find("select[name='compare']")[0].value;
		_html+=" \"";
		_html+=$(_row.cells[4]).find("input[name='value'],select[name='value']")[0].value;
		_html+="\"";
		_html+=$(_row.cells[5]).find("input[name='rbracket']")[0].value;
		_html+=" <font color=\"black\">";
		_html+=$(_row.cells[6]).find("select[name='relation']")[0].value;
		_html+="</font>";
	}
	if(_html){
		_html = _html.substring(0,_html.length-29)
	}
	$("#conditionVerifyDivId").html(_html);
}

function viewSearch(searchname,id){
	_reset();
	$("#searchnameid").val(searchname);
	$.ajax({
		url:"generalSearchController.do?getGradeTableRow",
		data:{
			"id":id
		},
		type:"post",
		cache:false,
		async:false,
		dataType:"json",
		success:function(data){
			$.each(data, function(i, d) {
				addTableRows(d.key,d.value);
			}); 
		}
	});
	setVerifyValues();
}

function saveSearch(){
	$.ajax({
		url:"generalSearchController.do?saveSearch",
		data:{
			"searchname":$("#searchnameid").val(),
			"searchwhere":getSearchWhere()
		},
		type:"post",
		cache:false,
		async:false,
		dataType:"json",
		success:function(obj){
		}
	});
}

function deleteSearch(obj,id){
	$.messager.confirm("提示", "确定要删除吗?", function (r) {
		if (r) {
			$.ajax({
				url:"generalSearchController.do?deleteSearch",
				data:{
					"id":id
				},
				type:"post",
				cache:false,
				async:false,
				dataType:"json",
				success:function(data){
				}
			});
			var _tr = obj.parentNode.parentNode;
			_tr.parentNode.removeChild(_tr);
		}
	});
}

function getSearchWhere(){
	var _where = "";
	var _datagridValue = $("#datagridSelectDivId").find("table tbody");
	for(var row_index=0;row_index<_datagridValue[3].rows.length;row_index++){
		var _row = _datagridValue[3].rows[row_index];
		_where+="{";
		_where+="\"lbracket\":\""+$(_row.childNodes[1]).find("input[name='lbracket']")[0].value+"\",";
		_where+="\"column\":\""+$(_row.childNodes[1]).find("input[name='column']")[0].value+"\",";
		_where+="\"compare\":\""+$(_row.childNodes[3]).find("select[name='compare']")[0].value+"\",";
		_where+="\"text\":\""+$(_row.childNodes[4]).find("input[name='value'],select[name='value']")[0].value+"\",";
		_where+="\"rbracket\":\""+$(_row.childNodes[5]).find("input[name='rbracket']")[0].value+"\",";
		_where+="\"relation\":\""+$(_row.childNodes[6]).find("select[name='relation']")[0].value+"\"";
		_where+="},";
	}
	if(_where){
		_where = _where.substring(0,_where.length-1);
	}
	return "["+_where+"]";
}

function _search(){
	var _where = getSearchWhere();
	$.u.cache("grade_where_dialog",_where);
	_close();
}

function _reset(){
	$("#searchnameid").val('');
	$("#conditionVerifyDivId").html('');
	var _rows = $("#datagridSelectTableId").datagrid('getRows');
	for (var i = _rows.length-1; i >= 0; i--) {
		$("#datagridSelectTableId").datagrid("deleteRow",i);
	}
}

function _close(){
	$.u.cache("setGrade_dialog").close();
}

//处理日期
function _mask(obj){
	if(obj.readOnly == true){
		return;
	}
	if(!obj.title){//第一次获取焦点 绑定格式
		obj.title = "格式：yyyy-mm-dd";
		$(obj).mask("9999-99-99");
	}
	setTimeout(function(){
		if(obj.value == '____-__-__'){
			obj.value = "";
		}
	},100);
}
//处理日期2
function _mask2(obj){//需修改jquery.maskedinput-1.0.js
	if(obj.readOnly == true){
		return;
	}
	if(!obj.title){//第一次获取焦点 绑定格式
		obj.title = "格式：XXXX-XX-XX";
		$(obj).mask("XXXX-XX-XX");
	}
	setTimeout(function(){
		if(obj.value == '____-__-__'){
			obj.value = "";
		}
	},100);
}
/**
 * _c=1左括号，_c=2右括号
 */
function _bracket(obj,_c){
	if(!obj.value){
		return;
	}
	var _char = ")";
	if(_c=='1'){
		_char = "(";
	}
	var tmpChar="";
	for (var i = 0; i < obj.value.length; i++) {
		if(obj.value.charAt(i)==_char){
			tmpChar+=obj.value.charAt(i);
		}
	}
	obj.value=tmpChar;
}
function _addToRacket(obj, symbol){
	var _sl = symbol==1?")":"(";
	obj.value += _sl;
	obj.select();
}
</script>
</app:template>