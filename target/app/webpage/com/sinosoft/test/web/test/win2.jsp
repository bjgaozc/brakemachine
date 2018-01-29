<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@include file="/context/tags.jsp"%>
<app:template title="测试d">

<script type="text/javascript" src="webpage/com/sinosoft/test/web/common/teCoCommon-index.js"></script>
<a href="javascript:void(0);" class="easyui-linkbutton btnt" ><i class="fa fa-link"></i>传送</a>
<input type="text" id="t2">
<a href="javascript:void(0);" class="easyui-linkbutton btnt" ><i class="fa fa-link"></i>弹出窗口(top)</a>

<div id="winContext" style="display: none;">

这里只能写简单的元素：<br>

护照：<input type="text" id="passportId" value="PE1000000">
<br>

性别：
<input type="radio" name="sex" value="0">男
<input type="radio" name="sex" value="1" checked="checked">女
<br><br>

<div style="color: red;">如果需要使用easyui的组件，看下面的例子</div>
<br>

出生地：
<select name="birthplace" class="win-easyui-combobox" data-options="required:true,panelHeight:'auto'">
	<option value="01">北京</option>
	<option value="02">河北</option>
</select>
<br><br>

护照种类：
<input id="passportType" name="passportType" class="win-easyui-combobox" data-options="required:true,editable:false,panelHeight:'auto',data:[{id:'公务普通',text:'公务普通'},{id:'其他',text:'其他'}]">
<br>

<a id="btn_save1" href="javascript:void(0);" onclick="save1();" class="win-easyui-linkbutton" data-options="iconCls:'fa fa-save'">保存</a>

<script type="text/javascript">
function save1(){
	var v = $("#passportType").combobox("getValue");
	alert(v);
}
</script>

</div>

</app:template>


