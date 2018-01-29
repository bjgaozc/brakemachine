<%@tag description="自定义模板" pageEncoding="UTF-8"%>
<%@attribute name="type" description="类型 "%><%@attribute name="title" description="标题"%><%@attribute name="layoutTitle" description="layout标题"%><%@attribute name="border" description="border"%><%@attribute name="plugins" description="插件"%><%@attribute name="autoloadjs" description="是否自动加载业务js，默认为:false"%><%@attribute name="version" description="版本"%><%@attribute name="header" fragment="true" description="header"%><%@attribute name="footer" fragment="true" description="footer"%>
<%
if(null==type) type = "default";
if(null==border||"".equals(border)) border = "0";
if(null==autoloadjs||"".equals(autoloadjs)) autoloadjs = "false";
String lang = (String)request.getSession().getAttribute("lang");
if(null==lang){lang = "zh-cn";request.getSession().setAttribute("lang", lang);}
if(null==version) version = "1.0.0";
if("default".equals(type)){
%>
<!DOCTYPE html>
<html lang="en">
	<head>
		<meta charset="utf-8" />
		<meta name="renderer" content="webkit|ie-comp|ie-stand">
		<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
		<meta name="viewport" content="width=device-width,initial-scale=1,minimum-scale=1.0,maximum-scale=1.0,user-scalable=no" />
		<meta http-equiv="Cache-Control" content="no-siteapp" />
		<meta name="keywords" content="${title}" />
		<meta name="description" content="${title}" />
		<title>${title}</title>
		<link rel="shortcut icon" href="${pageContext.request.contextPath}/plug-in/sino/ui/default/images/favicon.ico">
		<%@include file="/plug-in/sino/ui/default/context/head.jsp"%>
		<%if("true".equals(autoloadjs)){%>
		<script type="text/javascript" src="webpage/${viewPath}.js?__s_version=<%=version%>"></script>
		<%}%>
		<script type="text/javascript">var ctx = '${pageContext.request.contextPath}';</script>
		<jsp:invoke fragment="header"/>
	</head>
	<body>
		<div class="easyui-layout" fit="true" border="false">
		    <div data-options="region:'center',title:'${layoutTitle}',border:'<%=border%>px'" style="padding: 0px;" >
				<jsp:doBody/>
		    </div>
		</div>
		<%@include file="/plug-in/sino/ui/default/context/footer.jsp"%>
		<script type="text/javascript">
			$(function(){});
		</script>
		<jsp:invoke fragment="footer"/>
	</body>
</html>
<%}else if("defaultLayout".equals(type)){%>
<!DOCTYPE html>
<html lang="en">
	<head>
		<%@include file="/plug-in/sino/ui/default/context/meta.jsp"%>
		<title>${title}</title>
		<%@include file="/plug-in/sino/ui/default/context/head.jsp"%>
		<jsp:invoke fragment="header"/>
	</head>
	<body>
		<jsp:doBody/>
		<%@include file="/plug-in/sino/ui/default/context/footer.jsp"%>
		<script type="text/javascript">
			$(function(){
				//$("body").css("background","#fff");
			});
		</script>
		<jsp:invoke fragment="footer"/>
	</body>
</html>
<%}else if("zui".equals(type)){%>
<!DOCTYPE html>
<html lang="zh_cn">
<head>
    <title><%=title%> - 外国人来华工作管理服务系统</title>
    <%@include file="/context/meta.jsp"%>
    <meta name="keywords" content="">
    <meta name="description" content="">
    <%@include file="/plug-in/sino/ui/zui/context/head.jsp"%>
    <%if("true".equals(autoloadjs)){%>
	<script type="text/javascript" src="${pageContext.request.contextPath}/webpage/${viewPath}.js"></script>
	<%}%>
	<script type="text/javascript">var ctx = '${pageContext.request.contextPath}';</script>
</head>
<body>
<jsp:doBody/>
</body>
</html>
<%}else if("planeui".equals(type)){%>
<!DOCTYPE html>
<html lang="zh_cn">
<head>
    <title><%=title%> - 外国人来华工作管理服务系统</title>
    <%@include file="/context/meta.jsp"%>
    <meta name="keywords" content="">
    <meta name="description" content="">
    <link rel="shortcut icon" href="${pageContext.request.contextPath}/plug-in/sino/ui/default/images/favicon.ico">
    <%@include file="/plug-in/sino/ui/planeui/context/head.jsp"%>
    <%if("true".equals(autoloadjs)){%>
	<script type="text/javascript" src="${pageContext.request.contextPath}/webpage/${viewPath}.js"></script>
	<%}%>
	<script type="text/javascript">var ctx = '${pageContext.request.contextPath}';</script>
	<jsp:invoke fragment="header"/>
</head>
<body>
<jsp:doBody/>
<jsp:invoke fragment="footer"/>
</body>
</html>
<%}else if("ace".equals(type)){%>
<!DOCTYPE html>
<html lang="zh">
	<head>
		<meta charset="utf-8" />
		<meta name="renderer" content="webkit|ie-comp|ie-stand">
		<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
		<meta name="viewport" content="width=device-width,initial-scale=1,minimum-scale=1.0,maximum-scale=1.0,user-scalable=no" />
		<meta http-equiv="Cache-Control" content="no-siteapp" />
		<meta name="keywords" content="${title}" />
		<meta name="description" content="${title}" />
		<title>${title}</title>
		<link rel="shortcut icon" href="${pageContext.request.contextPath}/plug-in/sino/ui/default/images/favicon.ico">
		<%@include file="/plug-in/sino/ui/sino02/context/head.jsp"%>
		<jsp:invoke fragment="header"/>
		<style>
			.timeline-item .widget-box{margin-left: 75px;}
			::-webkit-scrollbar {
			 width: 5px;
			 height: 5px;
			}
			::-webkit-scrollbar-track {
			 background-color:#808080;
			 -webkit-border-radius: 2em;
			 -moz-border-radius: 2em;
			 border-radius:2em;
			}
			::-webkit-scrollbar-thumb {
			 background-color:#e0e0e0;
			 -webkit-border-radius: 2em;
			 -moz-border-radius: 2em;
			 border-radius:2em;
			}
		</style>
	</head>
	<body>
		<div class="page-content">
			<jsp:doBody/>
		</div>
		<a href="#" id="btn-scroll-up" class="btn-scroll-up btn btn-sm btn-inverse">
			<i class="icon-double-angle-up icon-only bigger-110"></i>
		</a>
		<%@include file="/plug-in/sino/ui/sino02/context/footer.jsp"%>
		<script type="text/javascript">
			$(function(){
				$("body").css("background","#fff");
			});
		</script>
		<jsp:invoke fragment="footer"/>
	</body>
</html>
<%}else if("bea".equals(type)){%>
<!DOCTYPE html>
<html lang="en" data-ng-app="app">
<head>
  <meta charset="utf-8" />
  <title>${title}</title>
  <meta name="keywords" content="${title}" />
  <meta name="description" content="${title}" />
  <meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1" />
  <link rel="shortcut icon" href="${pageContext.request.contextPath}/plug-in/sino/ui/default/images/favicon.ico">
  <link rel="stylesheet" href="${pageContext.request.contextPath}/plug-in-ui/bea/css/bootstrap.css" type="text/css" />
  <link rel="stylesheet" href="${pageContext.request.contextPath}/plug-in-ui/bea/css/animate.css" type="text/css" />
  <link rel="stylesheet" href="${pageContext.request.contextPath}/plug-in-ui/bea/css/font-awesome.min.css" type="text/css" />
  <link rel="stylesheet" href="${pageContext.request.contextPath}/plug-in-ui/bea/css/simple-line-icons.css" type="text/css" />
  <link rel="stylesheet" href="${pageContext.request.contextPath}/plug-in-ui/bea/css/font.css" type="text/css" />
  <link rel="stylesheet" href="${pageContext.request.contextPath}/plug-in-ui/bea/css/app.css" type="text/css" />
  <%if("true".equals(autoloadjs)){%>
  <script type="text/javascript" src="${pageContext.request.contextPath}/webpage/${viewPath}.js"></script>
  <%}%>
  <script type="text/javascript">var ctx = '${pageContext.request.contextPath}';</script>
  <jsp:invoke fragment="header"/>
</head>
<body ng-controller="AppCtrl">
  <div class="app" id="app" ng-class="{'app-header-fixed':app.settings.headerFixed, 'app-aside-fixed':app.settings.asideFixed, 'app-aside-folded':app.settings.asideFolded, 'app-aside-dock':app.settings.asideDock, 'container':app.settings.container}" ui-view></div>

  <!-- jQuery -->
  <script src="${pageContext.request.contextPath}/plug-in-ui/bea/vendor/jquery/jquery.min.js"></script>

  <!-- Angular -->
  <script src="${pageContext.request.contextPath}/plug-in-ui/bea/vendor/angular/angular.js"></script>
  
  <script src="${pageContext.request.contextPath}/plug-in-ui/bea/vendor/angular/angular-animate/angular-animate.js"></script>
  <script src="${pageContext.request.contextPath}/plug-in-ui/bea/vendor/angular/angular-cookies/angular-cookies.js"></script>
  <script src="${pageContext.request.contextPath}/plug-in-ui/bea/vendor/angular/angular-resource/angular-resource.js"></script>
  <script src="${pageContext.request.contextPath}/plug-in-ui/bea/vendor/angular/angular-sanitize/angular-sanitize.js"></script>
  <script src="${pageContext.request.contextPath}/plug-in-ui/bea/vendor/angular/angular-touch/angular-touch.js"></script>
<!-- Vendor -->
  <script src="${pageContext.request.contextPath}/plug-in-ui/bea/vendor/angular/angular-ui-router/angular-ui-router.js"></script>
  <script src="${pageContext.request.contextPath}/plug-in-ui/bea/vendor/angular/ngstorage/ngStorage.js"></script>

  <!-- bootstrap -->
  <script src="${pageContext.request.contextPath}/plug-in-ui/bea/vendor/angular/angular-bootstrap/ui-bootstrap-tpls.js"></script>
  <!-- lazyload -->
  <script src="${pageContext.request.contextPath}/plug-in-ui/bea/vendor/angular/oclazyload/ocLazyLoad.js"></script>
  <!-- translate -->
  <script src="${pageContext.request.contextPath}/plug-in-ui/bea/vendor/angular/angular-translate/angular-translate.js"></script>
  <script src="${pageContext.request.contextPath}/plug-in-ui/bea/vendor/angular/angular-translate/loader-static-files.js"></script>
  <script src="${pageContext.request.contextPath}/plug-in-ui/bea/vendor/angular/angular-translate/storage-cookie.js"></script>
  <script src="${pageContext.request.contextPath}/plug-in-ui/bea/vendor/angular/angular-translate/storage-local.js"></script>

  <!-- App -->
  <script src="${pageContext.request.contextPath}/plug-in-ui/bea/js/app.js"></script>
  <script src="${pageContext.request.contextPath}/plug-in-ui/bea/js/config.js"></script>
  <script src="${pageContext.request.contextPath}/plug-in-ui/bea/js/config.lazyload.js"></script>
  <script src="${pageContext.request.contextPath}/plug-in-ui/bea/js/config.router.js"></script>
  <script src="${pageContext.request.contextPath}/plug-in-ui/bea/js/main.js"></script>
  <script src="${pageContext.request.contextPath}/plug-in-ui/bea/js/services/ui-load.js"></script>
  <script src="${pageContext.request.contextPath}/plug-in-ui/bea/js/filters/fromNow.js"></script>
  <script src="${pageContext.request.contextPath}/plug-in-ui/bea/js/directives/setnganimate.js"></script>
  <script src="${pageContext.request.contextPath}/plug-in-ui/bea/js/directives/ui-butterbar.js"></script>
  <script src="${pageContext.request.contextPath}/plug-in-ui/bea/js/directives/ui-focus.js"></script>
  <script src="${pageContext.request.contextPath}/plug-in-ui/bea/js/directives/ui-fullscreen.js"></script>
  <script src="${pageContext.request.contextPath}/plug-in-ui/bea/js/directives/ui-jq.js"></script>
  <script src="${pageContext.request.contextPath}/plug-in-ui/bea/js/directives/ui-module.js"></script>
  <script src="${pageContext.request.contextPath}/plug-in-ui/bea/js/directives/ui-nav.js"></script>
  <script src="${pageContext.request.contextPath}/plug-in-ui/bea/js/directives/ui-scroll.js"></script>
  <script src="${pageContext.request.contextPath}/plug-in-ui/bea/js/directives/ui-shift.js"></script>
  <script src="${pageContext.request.contextPath}/plug-in-ui/bea/js/directives/ui-toggleclass.js"></script>
  <script src="${pageContext.request.contextPath}/plug-in-ui/bea/js/directives/ui-validate.js"></script>
  <script src="${pageContext.request.contextPath}/plug-in-ui/bea/js/controllers/bootstrap.js"></script>
  <!-- Lazy loading -->
  <jsp:doBody/>
</body>
</html>
<%}else if("hplus".equals(type)){%>
<%}else{%>
<jsp:doBody/>
<%}%>