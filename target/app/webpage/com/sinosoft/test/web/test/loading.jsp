<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@include file="/context/tags.jsp"%>
<app:template title="测试" plugins="jeasyui-extensions">

<div class="easyui-layout" data-options="fit:true">
        <div id="areaSpider" data-options="region:'north',title:'北边',border:false" style="height:100px;border-bottom-width:1px;">
            大家好，我是蜘蛛侠！
        </div>
        <div id="areaBat" data-options="region:'west',title:'西边',border:false" style="width: 200px;border-right-width:1px;border-bottom-width:1px;">
            我是蝙蝠侠！
        </div>
        <div data-options="region:'center',title:'中间',border:false" style="text-align: center; font-size: 14px; font-weight: bold; padding: 20px; border-bottom-width: 1px;">
            我是曼哈顿博士，我的周围全是战斗力仅4.9的渣渣
            <br />
            现都已被我收服，你想罩哪个货，就点下面的按钮
            <br />
            <br />
            <a id="btnSpider" class="easyui-linkbutton" data-options="iconCls:'icon-spider-man',toggle:true">罩 蜘蛛侠</a>
            <a id="btnBat" class="easyui-linkbutton" data-options="iconCls:'icon-bat-man',toggle:true">罩 蝙蝠侠</a>
            <a id="btnThor" class="easyui-linkbutton" data-options="iconCls:'icon-thor_hammer',toggle:true">罩 锤子侠</a>
            <a id="btnIron" class="easyui-linkbutton" data-options="iconCls:'icon-iron-man',toggle:true">罩 钢铁侠</a>
        </div>
        <div id="areaThor" data-options="region:'east',title:'东边',border:false" style="width: 200px; border-left-width: 1px; border-bottom-width: 1px; ">
            我是锤子索尔！
        </div>
        <div id="areaIron" data-options="region:'south',title:'南边',border:false" style="height:100px;">
            大家好，我是钢铁侠！
        </div>
    </div>

<script>
   $(function () {
       var array = ["Spider", "Bat", "Thor", "Iron"];
       array.forEach(function (item) {
           $("#btn" + item).click(function () {
               var lb = $(this), opts = lb.linkbutton("options"), textSpan = lb.find("span.l-btn-text"), area = $("#area" + item);

               if (opts.text.contains("罩")) {
                   opts.text = opts.text.replace("罩", "掀");
                   $.easyui.loading({ msg: item + " 已被引力波覆盖", locale: area });
               }
               else if (opts.text.contains("掀")) {
                   opts.text = opts.text.replace("掀", "罩");
                   $.easyui.loaded(area);
               }
               textSpan.removeClass("l-btn-empty").text(opts.text);
           });
       });
   });
</script>
</app:template>

