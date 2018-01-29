<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@include file="/context/mytags.jsp"%>
<html>
<head>
	<title>管理系统</title>
	<sino:plugins type="jquery-1.11.3,easyui-default-1.4.4,tools,util,My97DatePicker" />
	<link rel="stylesheet" href="plug-in/sino/ui/default/css/style.css" />
	<link rel="shortcut icon" href="plug-in/sino/ui/default/images/favicon.ico" />
	
	<script type="text/javascript">
	  var refreshIndexTabFlag = false;// 标记，第一次初始化不执行刷新
	  function refreshIndexTab(){
	    if(refreshIndexTabFlag){
	      var currTab = $("#maintabs").tabs("getTab","首页");
	      var url = $(currTab.panel('options').content).attr('src');
	      if(url){
	    	  $('#maintabs').tabs('update', {
	  	        tab : currTab,
	  	        options : {
	  	          content : createFrame(url)
	  	        }
	  	      });
	      }
	    }else{
	      refreshIndexTabFlag = true;
	    }
	  }
	  /**
	   * 收起
	   */
	  function collapseNorth(){
		  var n = document.documentElement;
		  $("body").hasClass("full-screen") ? ($("body").removeClass("full-screen"), $("#fullscreen-toggler").removeClass("active"), document.exitFullscreen ? document.exitFullscreen() : document.mozCancelFullScreen ? document.mozCancelFullScreen() : document.webkitExitFullscreen && document.webkitExitFullscreen()) : ($("body").addClass("full-screen"), $("#fullscreen-toggler").addClass("active"), n.requestFullscreen ? n.requestFullscreen() : n.mozRequestFullScreen ? n.mozRequestFullScreen() : n.webkitRequestFullscreen ? n.webkitRequestFullscreen() : n.msRequestFullscreen && n.msRequestFullscreen());
	  }
	  function clearAllCache(){
	    var storage=$.localStorage;
	    if(!storage)
	      storage=$.cookieStorage;
	    storage.removeAll();
	    $.ajax({url:"appCommonController.do?clearAllCache", type:"post", dataType:"json",success:function(d){
	      if(d.success){
	        tip("缓存清除成功!");
	      }
	    }});
	  }
	  $(function(){
	  });
	</script>
</head>
<body id="mainLayoutId" class="easyui-layout" scroll="no">
	<%--顶部--%>
	<div region="north" border="false" class="north">
		<div class="header">
			<div class="header-wrap">
				<div class="pull-left logo"></div>
				<div class="pull-right info">
					<ul class="pull-right">
						<li onclick="openwindow('个人信息','userController.do?userinfo')">
							<i class="fa fa-user fa-lg"></i> <span>${realName}</span>
						</li>
						<li class="easyui-menubutton" menu="#layout_north_kzmbMenu">
							<i class="fa fa-cog fa-lg"></i> <span>控制面板</span>
						</li>
						<li id="fullScreen" onclick="collapseNorth();">
							<i class="fa fa-arrows-alt fa-lg"></i> <span>全屏</span>
						</li>
						<li id="exitBtn" onclick="exit('loginController.do?logout','确定退出该系统吗 ?',1);">
							<i class="fa fa-sign-out fa-lg"></i> <span>退出</span>
						</li>
					</ul>
					<div id="layout_north_kzmbMenu" style="display: none;">
						<!-- <div onclick="openwindow('个人信息','userController.do?userinfo')" data-options="iconCls:'fa fa-info-circle'">个人信息</div> -->
						<div onclick="add('修改密码','userController.do?changepassword',null,550,150)"
							data-options="iconCls:'fa fa-pencil-square-o'">修改密码</div>
						<%--
						<div onclick="clearAllCache();" data-options="iconCls:'fa fa-refresh'">
							<t:mutiLang langKey="common.clear.localstorage" />
						</div>
						<div onclick="add('修改首页风格','userController.do?changestyle')" data-options="iconCls:'fa fa-cube'">更换皮肤</div>
						--%>
					</div>
				</div>
				<div class="clearfix"></div>
			</div>
			<div class="menu_top">
				<div id="menu_level_one" class="easyui-tabs" data-options="plain:true,narrow:true,pill:true,tabHeight:48" style="width:100%;height:48px">
				</div>
			</div>
		</div>
	</div>
	<%--左侧--%>
	<div class="west" data-options="region:'west',split:true,border:false"
		href="loginController.do?left" title="<i class='fa fa-th'></i>&nbsp;&nbsp;导航菜单"></div>
	<%--中间--%>
	<div class="center" id="mainPanle" region="center" data-options="onResize:function(w,h){}">
		<div id="maintabs" class="easyui-tabs" fit="true" border="false">
			<%--<div class="easyui-tab" title="首页" iconCls="fa fa-home" href="loginController.do?home"></div> --%>
		</div>
	</div>
	<div style="display: none;">
		<div id="mm" class="easyui-menu">
			<div id="mm-tabupdate" data-options="iconCls:'fa fa-refresh'">刷新</div>
			<div id="mm-tabclose" data-options="iconCls:'fa fa-window-close-o'">关闭</div>
			<div id="mm-tabcloseall">全部关闭</div>
			<div id="mm-tabcloseother">除此之外全部关闭</div>
			<div class="menu-sep"></div>
			<div id="mm-tabcloseright">当前页右侧全部关闭</div>
			<div id="mm-tabcloseleft">当前页左侧全部关闭</div>
		</div>
	</div>
	<div id="cacheDivId"></div>
	<%-- 缓存数据div --%>
</body>
</html>