<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@include file="/context/tags.jsp"%>
<app:template title="通用查询">
	
<div id="treedivid" style="overflow: auto;height: 350px;">
	<ul id="set_tree">
	</ul>
</div>

<div id="setorderdivid" style="overflow: auto;height: 350px;display: none;">
  <div style="height: 350px;vertical-align: top;">
	<table id="btable" class="btable" style="width: 100%;line-height: 30px" >
		<thead>
			<tr>
				<td style="display: none;">ID</td>
				<td style="text-align: right;"><b>列名</b></td>
				<td style="text-align: center;"><b>宽度</b></td>
				<td style="text-align: center;"><b><a href="javascript:void(0);" onclick="checkAll();" title="全选">排序</a></b></td>
				<td style="text-align: center;"><b>位置</b></td>
				<td>&nbsp;</td>
			</tr>
		</thead>
		<tbody id="setordertablebodyid">
		
		</tbody>
	</table>
  </div>
</div>

<br/>
<center>
	<a href="#" class="easyui-linkbutton" data-options="" onclick="ensure()">确定</a>
	<a href="#" class="easyui-linkbutton" data-options="" onclick="_close();">取消</a>
</center>


<script type="text/javascript">
var _stata = 0;
$(function(){
	var t = $('#set_tree').tree({
		checkbox:true,
		data: jQuery.parseJSON('${treeData}')
	});
	
	// 默认全选
	var rs = t.tree("getRoots");
	for(var r=0;r<rs.length;r++){
		t.tree("check",$("#"+rs[r].domId));
	}
});

function checkAll(){
	$.u.checked("checkboxName");
}

function _close(){
	if(_stata!=0){
		$("#treedivid").show();
		$("#setorderdivid").hide();
		_stata = 0;
	} else {
		$.u.cache("setOutput_dialog").close();
	}
}

function ensure(){
	if(_stata==0){
		tree_ensure();
	} else {
		set_ensure();
	}
}

function tree_ensure(){
	var nodes = $('#set_tree').tree('getChecked');
	if(nodes.length<1){
		common.alert("请选择输出列！");
		return;
	}
	
	$("#setordertablebodyid").html("");
	var _html = '';
	
	for (var i = 0; i < nodes.length; i++) {
		if(!nodes[i].children){//过滤父节点
			_html += "<tr>";
			_html += "<td style=\"display: none;\">"+nodes[i].id+"</td>";
			_html += "<td style=\"text-align: right;\">"+nodes[i].text+"</td>";
			_html += "<td style=\"text-align: center;\"><input type=\"text\" style=\"width:50px;\" value=\"100\" />&nbsp;</td>";
			_html += "<td style=\"text-align: center;\"><input type=\"checkbox\" name=\"checkboxName\" /></td>";
			_html += "<td style=\"text-align: center;\">&nbsp;<a href=\"javascript:void(0);\" onclick=\"_move('up',this);\"><i class=\"fa fa-arrow-circle-up\"></i></a>&nbsp;&nbsp;<a href=\"javascript:void(0);\" onclick=\"_move('down',this);\"><i class=\"fa fa-arrow-circle-down\"></i></a>&nbsp;</td>";
			_html += "</tr>";
		}
	}
	
	//console.log(_html);
	
	$("#setordertablebodyid").html(_html);
	
	$("#treedivid").hide();
	$("#setorderdivid").show();
	_stata = 1;
}

function set_ensure(){
	var _json = "[";
	var orderTable = document.getElementById("setordertablebodyid");
	for (var i = 0; i < orderTable.childNodes.length; i++) {
		var t = orderTable.childNodes[i];
		_json += "{";
		_json += "\"id\":\""+orderTable.childNodes[i].cells[0].innerHTML+"\",";
		_json += "\"text\":\""+orderTable.childNodes[i].cells[1].innerHTML+"\",";
		_json += "\"width\":\""+orderTable.childNodes[i].cells[2].childNodes[0].value+"\",";
		_json += "\"sortable\":\""+orderTable.childNodes[i].cells[3].childNodes[0].checked+"\"";
		_json += "},";
	}
	_json = _json.substring(0,_json.length-1);
	_json += "]";
	
	//log(_json);
	
	$.u.cache("output_nodes_param",_json);
	_stata = 0;
	_close();
}

function _move(_v,obj){
	var isIE8=isIE&&!!document.documentMode;
	if(isIE8){
		_move_forie(_v,obj);
	}else{
		var tr_obj=obj.parentNode.parentNode;
		var tr_obj_index = tr_obj.rowIndex;
		if("up"===_v && tr_obj_index>1){
			var upTr = $(tr_obj).parent().find("tr")[tr_obj_index-2];
			var t = $(tr_obj).clone();
			$(t).insertBefore(upTr);
			$(tr_obj).remove();
		}
		if("down"===_v && tr_obj_index < tr_obj.parentNode.childNodes.length){
			var downTr = $(tr_obj).parent().find("tr")[tr_obj_index];
			var t = $(tr_obj).clone();
			$(t).insertAfter(downTr);
			$(tr_obj).remove();
		}
	}
}

function _move_forie(_v,obj){
	var tr_obj=obj.parentNode.parentNode;
	var tr_obj_index = tr_obj.rowIndex;
	if('up'==_v && tr_obj_index>0){
		tr_obj.parentNode.moveRow(tr_obj_index-1,tr_obj_index-2);
	} else if(tr_obj_index<tr_obj.parentNode.childNodes.length){
		tr_obj.parentNode.moveRow(tr_obj_index-1,tr_obj_index);
	}
}
</script>
	
</app:template>