<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@include file="/context/tags.jsp"%>
<app:template title="测试c">

<script type="text/javascript" src="webpage/com/sinosoft/test/web/common/teCoCommon-index.js"></script>
<a href="javascript:void(0);" class="easyui-linkbutton c6 btnt" ><i class="fa fa-link"></i>弹出子窗口</a>
<input type="text" id="t1">

<a id="orgBtn" href="javascript:void(0);" class="easyui-linkbutton c6" ><i class="fa fa-link"></i>选择单位</a>
<input type="text" id="orgid">
<input type="text" id="org">
<app:chooseOrg targetOnclickId="#orgBtn" />

<br><br>

<a id="t2" href="javascript:void(0);" class="easyui-linkbutton c6" >选择人员</a>
<input type="text" id="t3">
<app:choosePerson targetId="#t3" targetOnclickId="#t2" />

<a id="countryBtn" href="javascript:void(0);" class="easyui-linkbutton c6" >选择国家</a>
<input type="text" id="country" placeholder="国家">
<app:chooseCountry targetOnclickId="#countryBtn" />

</app:template>

