<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@include file="/context/tags.jsp"%>
<app:template title="测试" plugins="jeasyui-extensions">
 <div class="easyui-panel" data-options="fit:true,border:false" style="padding:20px;">
        <a id="t1" href="javascript:void(0)">鼠标放上来，显示“信息1”</a>
        <br />
        <br />
        <br />
        <a id="t2" href="javascript:void(0)">鼠标放上来，显示“信息2”</a>
        <br />
        <br />
        <br />
        <div id="t3" style="width:100px; height:80px; border:1px solid red;">
            鼠标进红框，给你看吸血鬼
        </div>
    </div>
<script>
    $(function () {
        $.easyui.tooltip.init($("#t1"), {
            position: "right",
            content: "信息1"
        });
        $.easyui.tooltip.init($("#t2"), {
            content: "<span style=\"color:red;\">信息2</span>"
        });
        $.easyui.tooltip.init($("#t3"), {
            position: "bottom",
            content: "<div style=\"width:600px;height:480px;\"><img src=\"http://img04.tooopen.com/images/20130701/tooopen_20083555.jpg\" title=\"123\" /></div>"
        });
    });
</script>
</app:template>