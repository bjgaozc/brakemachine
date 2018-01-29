<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@include file="/context/tags.jsp"%>
<app:template title="单列表选择框" plugins="jeasyui-extensions">

<div class="easyui-panel" data-options="fit:true,border:false,title:'本演示是简易版，不支持扩展的toolbar插件'">
        选中项的Value：<input type="text" id="ID" name="ID" class="easyui-textbox" data-options="width:350,multiline:true,height:40" />
        <br /><br />
        选中项的Text：<input type="text" id="Name" name="Name" class="easyui-textbox" data-options="width:350,multiline:true,height:40" />
        <br />
        <br />
        <a id="btn1" class="easyui-linkbutton" data-options="iconCls:'icon-add'">打开singleDatagrid选择框</a>
        当前选择框为<span id="spanSingle" style="color:red;font-weight:bold;">单选</span>
    </div>

<script>
$(function () {
    var single = true;

    $("#btn2").click(function () {
        $("#ID").textbox("setValue", "");
        $("#Name").textbox("setValue", "");
        single = $("[name='ss']:checked").val().toBoolean();
        $("#spanSingle").text(single ? "单选" : "多选");
    });

    function fill(data) {
        if (!data) { return; }
        if ($.isArray(data)) {
            $("#ID").textbox("setValue", $.array.map(data, function (item) { return item.ID }).join(","));
            $("#Name").textbox("setValue", $.array.map(data, function (item) { return item.RealName }).join(","));
        } else {
            $("#ID").textbox("setValue", data.ID);
            $("#Name").textbox("setValue", data.RealName);
        }
    }

    $("#btn1").click(function () {

        var selected = $("#ID").textbox("getValue");

        var dia = $.easyui.showSelector.singleDatagrid({
        	title: "测试选择",
            width: 400,
            height: 250,
            onEnter: function (row) {
                fill(row);
            },
            extToolbar: false,
            selected: selected,
            datagridOptions: {
                singleSelect: single,
                method: "get",
                url: "datagrid-selector-data.json",
                idField: 'ID',
                columns: [[
                    { field: 'ID', title: '工号', width: 90 },
                    { field: 'RealName', title: '姓名', width: 90 },
                    { field: 'Remarks', title: '备注', width: 150 }
                ]],
                onClickRow:function(rowIndex, rowData){
                	log(rowData);
                	fill(rowData);
                	dia.close();
                }
            }
        });
    });

});
</script>

</app:template>