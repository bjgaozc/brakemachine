<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@include file="/context/tags.jsp"%>
<app:template title="我的应用" type="vue" plugins="jquery,jsmodern" autoloadjs="true" version="1.0.1">
<section>
    <div><p style="display:none;">第一页</p></div>
    <div><p style="display:none;">第二页</p></div>
    <div><p style="display:none;">第三页</p></div>
    <div><p style="display:none;">第四页</p></div>
</section>
<style>
p{text-align:center;font-size:50px;margin-top:100px;display:none;color:#fff}
#myNav{width:80px;height:auto;position:fixed;z-index:20;right:20px;top:50%;-webkit-transform:translateY(-50%);-ms-transform:translateY(-50%);transform:translateY(-50%)}
#myNav b{display:block;width:100%;height:34px;line-height:34px;font-size:14px;text-align:center;background:#fff;opacity:.5;color:#555;border-radius:4px;margin:5px 0;font-weight:400;cursor:pointer}
#myNav b.active{opacity:1}
</style>
<script>$(function(){m.initAll();})</script>
</app:template>
