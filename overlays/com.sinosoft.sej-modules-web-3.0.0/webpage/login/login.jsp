<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="com.sinosoft.app.cache.AppCache" %>
<%@include file="/context/mytags.jsp"%>
<html>
<head>
<title>登录 </title>
<link rel="shortcut icon" href="plug-in/sino/ui/default/images/favicon.ico" />
<link rel="stylesheet" href="plug-in/sino/ui/default/css/style.css" />
<link href="plug-in/login/css/zice.style.css" rel="stylesheet" type="text/css" />
<link href="plug-in/login/css/login.css" rel="stylesheet" type="text/css" />
</head>
<body>
<div id="alertMessage"></div>
<div id="successLogin"></div>
<div class="bg">
	<div class="login_info_top"></div>
    <div class="login_info">
    	<form name="formLogin" id="formLogin" action="loginController.do?login" check="loginController.do?checkuser" method="post">
    	<input type="hidden" id="langCode" name="langCode" value="zh-cn">
    	<table class="login" cellpadding="0" cellspacing="0">
        	<tr>
            	<td class="title">用户名</td>
            </tr>
            <tr>
            	<td>
                	<input style="width:251px;height:34px;line-height:34px;border:none;background-position:0;box-shadow:none;" class="txt_username" name="userName" type="text" id="userName" title="用户名" iscookie="true" value="" nullmsg="请输入用户名!" />
                </td>
            </tr>
            <tr>
            	<td class="title">密码</td>
            </tr>
            <tr>
            	<td>
                	<input style="width:251px;height:34px;line-height:34px;border:none;background-position:0;box-shadow:none;" class="txt_password" name="password" type="password" id="password" title="密码" value="123456" nullmsg="请输入密码!" />
                </td>
            </tr>
            <tr>
            	<td class="title">工作日期</td>
            </tr>
            <tr>
            	<td>
                	<input style="width:250px;height:32px;line-height:34px;padding-right:0;border:1px solid #cdcdcd;background-position:225px 5px;box-shadow:none;"  id="workDay" name="workDay" onclick="WdatePicker({skin:'twoer'})" class="txt_date Wdate" name="" type="text"readonly="readonly" title="工作日期" nullmsg="请先选择工作日期!" />
                </td>
            </tr>
            <tr><td>&nbsp;</td></tr>
            <tr>
            	<td>
                	<input class="login_btn" type="button" id="but_login" name="" />
                </td>
            </tr>
        </table>
        </form>
    </div>
</div>
<input type="hidden" id="on_off" />

<script type="text/javascript" src="plug-in/jquery/jquery-1.11.1.min.js"></script>
<script type="text/javascript" src="plug-in/jquery-plugs/jquery.cookie.js"></script>
<script type="text/javascript" src="plug-in/login/js/jquery.tipsy.js"></script>
<script type="text/javascript" src="plug-in/My97DatePicker/WdatePicker.js"></script>
<script type="text/javascript" src="plug-in/tools/date.js"></script>
<script type="text/javascript" src="plug-in/sino/encode.js"></script>
<script type="text/javascript">
  var loginSecurityOpen = '<%=AppCache.loginSecurityOpen%>';
  var loginSecurityType = '<%=AppCache.loginSecurityType%>';
</script> 
<script type="text/javascript" src="plug-in/login/js/login.js"></script>
</body>
</html>
