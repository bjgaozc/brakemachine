<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@include file="/context/tags.jsp"%>
<app:template title="测试" plugins="jeasyui-extensions">

<div class="easyui-panel" data-options="fit:true,border:false" style="padding:20px;">
        <span style="color:red;font-weight:bold;">注意，若要支持 在顶级window中使用 messager 扩展，那么需要先往顶级window页面添加 messager 扩展的引用，点此<a id="btnAppendMessagerJsToTop" class="easyui-linkbutton">点我</a>进行添加</span>
        <br />
        <div style="border:1px solid red;width:700px; height:250px;padding:15px;">
            <a id="btnAlert1" class="easyui-linkbutton" data-options="iconCls:'icon-spider-man',toggle:true">在当前window中弹出错误提示框，内容“唱歌”</a>
            <br />
            <a id="btnAlert2" class="easyui-linkbutton" data-options="iconCls:'icon-spider-man',toggle:true">在当前window中弹出错误提示框，内容“唱歌”，标题“青蛙请你”</a>
            <br />
            <a id="btnAlert3" class="easyui-linkbutton" data-options="iconCls:'icon-spider-man',toggle:true">在当前window中弹出错误提示框，内容“唱歌”，标题“青蛙请你”，点击确认后，执行自定义回调函数</a>
            <br />

            <br />
            <br />
            <br />

            <a id="btnAlert11" class="easyui-linkbutton" data-options="iconCls:'icon-spider-man',toggle:true">在顶级window中弹出提示框，内容“唱歌”</a>
            <br />
            <a id="btnAlert22" class="easyui-linkbutton" data-options="iconCls:'icon-spider-man',toggle:true">在顶级window中弹出提示框，内容“唱歌”，标题“青蛙请你”</a>
            <br />
            <a id="btnAlert33" class="easyui-linkbutton" data-options="iconCls:'icon-spider-man',toggle:true">在顶级window中弹出提示框，内容“唱歌”，标题“青蛙请你”，点击确认后，执行自定义回调函数</a>
            <br />
            <br />
            <span style="font-weight:bold;font-size:22px;margin:35px;">alert 方式</span>
        </div>
    </div>
    
<script>
    $(function () {
        var checkTopMessagerJs = function () {
            var topHead = top.$("head"),
                existHeadContent = topHead.html(),
                exist = existHeadContent.contains("jeasyui.extensions.messager.alert.js");

            return exist;
        };

        var checkTopMessagerJsAndAlert = function () {
            if (!checkTopMessagerJs()) { alert("尚未在顶级window中添加对 messager 扩展的引用，请点击红字中的按钮添加引用。"); return false; }
            return true;
        };

        $("#btnAppendMessagerJsToTop").click(function () {
            if (checkTopMessagerJs()) {
                alert("已经添加 messager 扩展的引用，无需重复添加。");
            } else {
                var jsUrl = "/Scripts/jquery-easyui-extensions/messager/jeasyui.extensions.messager.alert.js";
                top.$.util.loadJs(jsUrl);
                alert("messager 扩展的引用添加成功。");
            }
        });

        $("#btnAlert1").click(function () {
            $.messager.alert("唱歌");
        });

        $("#btnAlert2").click(function () {
            $.messager.alert("青蛙请你", "唱歌");
        });

        $("#btnAlert3").click(function () {
            $.messager.alert("青蛙请你", "唱歌", function () { alert("预备唱：猪，你的鼻子为什么那么长……"); });
        });

        $("#btnAlert11").click(function () {
            if (!checkTopMessagerJsAndAlert()) { return; }
            $.easyui.messager.alert("唱歌");
        });

        $("#btnAlert22").click(function () {
            if (!checkTopMessagerJsAndAlert()) { return; }
            $.easyui.messager.alert("青蛙请你", "唱歌");
        });

        $("#btnAlert33").click(function () {
            if (!checkTopMessagerJsAndAlert()) { return; }
            $.easyui.messager.alert("青蛙请你", "唱歌", function () { alert("预备唱：猪，你的鼻子为什么那么长……"); });
        });
    });
</script>
    
</app:template>