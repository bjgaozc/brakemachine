<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@include file="/context/tags.jsp"%>
<app:template title="测试" plugins="jeasyui-extensions">

<div>
        <h2>动态批量创建 Menu</h2>
        <hr />
        <div id="cc" style="border-width: 1px; border-style: solid; border-color: Black; width: 400px; height: 200px; padding: 10px;margin-left:20px;">
            请用鼠标右键点击此区域
        </div>
    </div>
    
<script>
        $(function () {
            $("#cc").bind("contextmenu", function (e) {
                e.preventDefault();
                $.easyui.showMenu({
                    left: e.pageX, top: e.pageY,
                    items: [
                        { text: "测试菜单1", iconCls: "icon-hamburg-address" },
                        { text: "测试菜单2", handler: function (e, item) { alert(item.text); } },
                        {
                            text: function () { return "自定义菜单项" },
                            disabled: function () { return window.event.clientX < 300; },
                            style: { color: "red" },
                            bold: true,
                            handler: function (e, item) { alert(item.text); }
                        },
                        "-",
                        {
                            text: "测试菜单3", children: [
                                { text: "测试子菜单1", handler: function (e, item) { alert(item.text); } },
                                { text: "测试子菜单2", handler: function (e, item) { alert(item.text); } }
                            ]
                        },
                    ]
                });
            });
        });
    </script>
    
</app:template>