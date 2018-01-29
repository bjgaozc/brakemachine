<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@include file="/context/tags.jsp"%>
<app:template title="测试" plugins="jeasyui-extensions">


<div class="easyui-panel" data-options="fit:true,border:false" style="padding:20px;">
        以 Html 方式初始化：
        <div class="easyui-toolbar" data-options="width:800,align:'left'">
            <div>
                名称：
            </div>
            <div style="padding-right:5px;">
                <input type="text" id="t1" name="t1" value="默认名称" />
            </div>
            <div>
                日期：
            </div>
            <div style="padding-right:5px;">
                <input type="text" id="t2" name="t2" class="easyui-datebox" />
            </div>
            <div>-</div>
            <div>
                关键字：
            </div>
            <div style="padding-right:5px;">
                <input type="text" id="t3" name="t3" class="easyui-textbox" data-options="disabled:true" />
            </div>
            <div>
                <a class="easyui-linkbutton" data-options="iconCls:'icon-search',plain:true">查询</a>
            </div>
        </div>
        <br />
        <div class="easyui-toolbar">
            <div>
                目标工具条：
            </div>
            <div>
                <input type="text" id="targetToolbar" name="targetToolbar" />
            </div>
            <div>
                <a id="btn1" class="easyui-linkbutton" data-options="iconCls:'icon-search',plain:true">获取options</a>
                <a id="btn5" class="easyui-linkbutton" data-options="iconCls:'icon-search',plain:true">获取Items</a>
                <a id="btn8" class="easyui-linkbutton" data-options="iconCls:'icon-search',plain:true">获取Data</a>
            </div>
            <div>-</div>
            <div>
                <a id="btn2" class="easyui-linkbutton" data-options="iconCls:'icon-search',plain:true">水平居中</a>
                <a id="btn3" class="easyui-linkbutton" data-options="iconCls:'icon-search',plain:true">水平居左</a>
                <a id="btn4" class="easyui-linkbutton" data-options="iconCls:'icon-search',plain:true">水平居右</a>
            </div>
            <div>-</div>
            <div>
                <a id="btn6" class="easyui-linkbutton" data-options="iconCls:'icon-search',plain:true">禁用</a>
                <a id="btn7" class="easyui-linkbutton" data-options="iconCls:'icon-search',plain:true">启用</a>
            </div>
        </div>
        <br />
        以 Js 方式初始化：
        <div id="con1"></div>
        <br />
        <div id="con2"></div>
        <br />
        <div id="con4"></div>
        <br />
        <div id="con5"></div>
        <br />
        <div id="con6"></div>
        <br />
        <div id="con7"></div>
        <br />
        <div id="con8"></div>
        <br />
        <div id="con9"></div>
        <br />
        <div id="con3" class="easyui-toolbar"></div>
    </div>
    
<script>
        $(function () {

            var targetToolbarComboboxData = [];
            for (var i = 1; i <= 9; i++) {
                targetToolbarComboboxData.push({ value: String(i), text: i + "号工具条" });
            }
            $("#targetToolbar").combobox({
                data: targetToolbarComboboxData,
                value: "1"
            });

            $("#btn1").click(function () {
                var selected = $("#targetToolbar").combobox("getValue"), target = $("#con" + selected);
                if (target.length) {
                    var opts = target.toolbar("options");
                    $.messager.alert("操作提醒", "options已获取，请通过F12在控制台查看。");
                    console.log(opts);
                }
            });

            $("#btn5").click(function () {
                var selected = $("#targetToolbar").combobox("getValue"), target = $("#con" + selected);
                if (target.length) {
                    var items = target.toolbar("getItems");
                    $.messager.alert("操作提醒", "Items已获取，请通过F12在控制台查看。");
                    console.log(items);
                }
            });

            $("#btn8").click(function () {
                var selected = $("#targetToolbar").combobox("getValue"), target = $("#con" + selected);
                if (target.length) {
                    var data = target.toolbar("getData");
                    $.messager.alert("操作提醒", "Data已获取，请通过F12在控制台查看。");
                    console.log(data);
                }
            });

            $("#btn2").click(function () {
                var selected = $("#targetToolbar").combobox("getValue"), target = $("#con" + selected);
                if (target.length) {
                    target.toolbar("align", "center");
                }
            });

            $("#btn3").click(function () {
                var selected = $("#targetToolbar").combobox("getValue"), target = $("#con" + selected);
                if (target.length) {
                    target.toolbar("align", "left");
                }
            });

            $("#btn4").click(function () {
                var selected = $("#targetToolbar").combobox("getValue"), target = $("#con" + selected);
                if (target.length) {
                    target.toolbar("align", "right");
                }
            });

            $("#btn6").click(function () {
                var selected = $("#targetToolbar").combobox("getValue"), target = $("#con" + selected);
                if (target.length) {
                    target.toolbar("disable");
                }
            });

            $("#btn7").click(function () {
                var selected = $("#targetToolbar").combobox("getValue"), target = $("#con" + selected);
                if (target.length) {
                    target.toolbar("enable");
                }
            });

            var options1 = {
                data: [
                    "[1号工具条]",
                    { id: "label1", text: "名称1：", type: "label" },
                    { id: "text1", name: "text1", type: "text" },
                    "-",
                    { id: "label11", text: "名称11：", type: "label", disabled: true },
                    { id: "text11", name: "text11", type: "text", disabled: false },
                    "-",
                    { id: "label111", text: "名称111：", type: "label", disabled: function (t) { return false; } },
                    { id: "text111", name: "text111", type: "text", disabled: function (t) { return true; } }
                ]
            };
            $("#con1").toolbar(options1);


            var options2 = {
                data: [
                    "[2号工具条]",
                    "性别：",
                    { id: "checkbox2", name: "sex", type: "checkbox", text: "男", checked: true },
                    { id: "checkbox22", name: "sex", type: "checkbox", text: "女", checked: false },
                    "-",
                    { id: "label2", text: "婚姻：", type: "label" },
                    { id: "checkbox222", name: "marry", type: "checkbox", text: "未婚", checked: true },
                    { id: "checkbox2222", name: "marry", type: "checkbox", text: "已婚", checked: false, disabled: true },
                    { id: "btn2", text: "查询", options: { iconCls: "icon-search" }, type: "button", onclick: function (t) { alert('查询'); } },
                    "-",
                    { id: "btn22", text: "新增", options: { iconCls: "icon-add" }, type: "button", handler: function (t) { alert('新增'); } },
                    { id: "btn222", text: "编辑", options: { iconCls: "icon-edit" }, type: "button", disabled: false, onclick: function (t) { alert('编辑'); } },
                    { id: "btn2222", text: "删除", options: { iconCls: "icon-remove" }, type: "button", disabled: function (t) { return true; }, onclick: function (t) { alert('删除'); } }
                ]
            };
            $("#con2").toolbar(options2);

            var options4 = {
                data: [
                    "[4号工具条]",
                    "validatebox1：",
                    { id: "validatebox4", name: "validatebox4", type: "validatebox", value: "默认内容", width: 90 },
                    "validatebox2：",
                    { id: "validatebox44", name: "validatebox44", type: "validatebox", disabled: true, width: 90 },
                    "validatebox3：",
                    { id: "validatebox444", name: "validatebox444", type: "validatebox", disabled: true, width: 90, options: { required: true, disabled: false } },
                    "validatebox4：",
                    { id: "validatebox4444", name: "validatebox4444", type: "validatebox", width: 90, disabled: function (t) { return false; }, keydown: function (e, t) { if (e.which == 13) { alert($(this).val()); } } }
                ]
            };
            $("#con4").toolbar(options4);

            var options5 = {
                data: [
                    "[5号工具条]",
                    "textbox1：",
                    { id: "textbox5", name: "textbox5", type: "textbox", value: "默认内容", width: 90 },
                    "textbox2：",
                    { id: "textbox55", name: "textbox55", type: "textbox", disabled: true, width: 90 },
                    "textbox3：",
                    { id: "textbox555", name: "textbox555", type: "textbox", disabled: true, width: 90, options: { required: true, disabled: false } },
                    "textbox4：",
                    { id: "textbox5555", name: "textbox5555", type: "textbox", width: 90, disabled: function (t) { return false; }, keydown: function (e, t) { if (e.which == 13) { alert($(this).val()); } } },
                    "\\t",
                    "textbox5：",
                    { id: "textbox55555", name: "textbox55555", type: "textbox", value: "1234567890", width: 90, options: { type: "password" } }
                ]
            };
            $("#con5").toolbar(options5);

            var options6 = {
                data: [
                    "[6号工具条]",
                    "数字1：",
                    { id: "numberbox6", name: "numberbox6", type: "numberbox", width: 90, value: 99, keydown: function (e, t) { if (e.which == 13) { alert($(this).val()); } } },
                    "数字2：",
                    { id: "numberbox66", name: "numberbox66", type: "numberbox", disabled: true, width: 110 },
                    "数字3：",
                    { id: "numberspinner6", name: "numberspinner6", type: "numberspinner", width: 110, value: 10 }
                ]
            };
            $("#con6").toolbar(options6);


            var options7 = {
                data: [
                    "[7号工具条]",
                    "日期1：",
                    { id: "datebox7", name: "datebox7", type: "datebox", width: 110, editable: false, disabled: function (t) { return false; } },
                    "日期2：",
                    { id: "datebox77", name: "datebox77", type: "datebox", width: 110, value: "2012-10-12", disabled: true },
                    "日期3：",
                    { id: "datetimebox7", name: "datetimebox7", type: "datetimebox", width: 150, value: "2012-10-12 13:43:11", disabled: function (t) { return false; } },
                    "时间1：",
                    { id: "timespinner7", name: "timespinner7", type: "timespinner", width: 110, value: "10:12", disabled: function (t) { return false; } }
                ]
            };
            $("#con7").toolbar(options7);


            var options8 = {
                data: [
                    "[8号工具条]",
                    "下拉框1：",
                    { id: "combo8", name: "combo8", type: "combo", width: 110, editable: false },
                    "下拉框2：",
                    { id: "combobox8", name: "combobox8", type: "combobox", width: 110, editable: false, data: [{ value: "1", text: "A" }, { value: "2", text: "B" }, { value: "3", text: "C" }], panelHeight: 100, value: "2", disabled: function (t) { return false; } },
                    "下拉框3：",
                    { id: "combobox88", name: "combobox88", type: "combobox", width: 80, data: [{ value: "1", text: "A" }, { value: "2", text: "B" }, { value: "3", text: "C" }], value: "3", disabled: function (t) { return true; } }
                ]
            };
            $("#con8").toolbar(options8);

            var dataForCombotree = [
                { id: "1", text: "A", children: [{ id: "11", text: "A1" }, { id: "12", text: "A2" }] },
                { id: "2", text: "B" },
                { id: "3", text: "C" }
            ];
            var dataForCombogrid = [
                { code: "1", name: "语文", count: 99, remarks: "" },
                { code: "2", name: "数学", count: 12, remarks: "" },
                { code: "3", name: "英语", count: 34, remarks: "老师很漂亮" },
                { code: "4", name: "历史", count: 43, remarks: "老师很风趣" },
                { code: "5", name: "地理", count: 56, remarks: "" }
            ];
            var columnsForCombogrid = [
                [
                    { field: 'code', title: '编号', width: 60 },
                    { field: 'name', title: '名称', width: 90 },
                    { field: 'count', title: '数量', width: 90 },
                    { field: 'remarks', title: '备注', width: 100 }
                ]
            ];
            var options9 = {
                data: [
                    "[9号工具条]",
                    "下拉树1：",
                    { id: "combotree9", name: "combotree9", type: "combotree", width: 110, editable: false, data: dataForCombotree, panelHeight: 100, value: "11", disabled: function (t) { return false; } },
                    "下拉树2：",
                    { id: "combotree99", name: "combotree99", type: "combotree", width: 80, data: dataForCombotree, value: "12", disabled: function (t) { return true; } },
                    "下拉列表1：",
                    {
                        id: "combogrid9", name: "combogrid9", type: "combogrid", editable: false, panelWidth: 360, data: dataForCombogrid,
                        value: "4", idField: "code", textField: 'name',
                        columns: columnsForCombogrid
                    }
                ]
            };
            $("#con9").toolbar(options9);


            var options3 = {
                data: [
                    "[3号工具条]",
                    "搜索框1：",
                    { id: "searchbox3", name: "searchbox3", type: "searchbox", width: 150, prompt: "请输入关键字", disabled: function (t) { return false; }, searcher: function (val, name) { alert(val); } }
                ]
            };
            $("#con3").toolbar("loadData", options3.data);
        });
    </script>
    
</app:template>