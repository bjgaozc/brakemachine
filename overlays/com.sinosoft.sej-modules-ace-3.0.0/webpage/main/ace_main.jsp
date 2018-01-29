<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@include file="/plug-in/ace/context/tags.jsp"%>
<!DOCTYPE html>
<html lang="en">
	<head>
		<title>控制台</title>
		<%@include file="/plug-in/ace/context/head.jsp"%>
	</head>

	<body>
		
		
		
<div class="navbar navbar-default" id="navbar">
			<script type="text/javascript">
				try{ace.settings.check('navbar' , 'fixed')}catch(e){}
			</script>

			<div class="navbar-container" id="navbar-container">
				<div class="navbar-header pull-left">
					<a href="#" class="navbar-brand">
						<small>
							<i class="icon-leaf"></i>
							后台管理系统
						</small>
					</a><!-- /.brand -->
				</div><!-- /.navbar-header -->

				<div class="navbar-header pull-right" role="navigation">
					<ul class="nav ace-nav">
						<li class="light-blue">
							<a data-toggle="dropdown" href="#" class="dropdown-toggle">
								<img class="nav-user-photo" src="plug-in/ace/avatars/user.jpg" alt="Jason's Photo" />
								<span class="user-info">
									<small>Welcome,${userName }</small>
									<span style="color: #CC33FF">
                    <span style="color: #CC33FF"><t:mutiLang langKey="common.role"/>:</span>
                    <span style="color: #666633">${roleName }</span>
								</span>

								<i class="icon-caret-down"></i>
							</a>

							<ul class="user-menu pull-right dropdown-menu dropdown-yellow dropdown-caret dropdown-close">
								<li>
									<a href="javascript:add('<t:mutiLang langKey="common.change.password"/>','userController.do?changepassword','',550,200)">
										<i class="ace-icon fa fa-cog"></i>
										 <t:mutiLang langKey="common.change.password"/>
									</a>
								</li>

								<li>
									<a href="javascript:openwindow('<t:mutiLang langKey="common.profile"/>','userController.do?userinfo')">
										<i class="ace-icon fa fa-user"></i>
										 <t:mutiLang langKey="common.profile"/>
									</a>
								</li>
								<li>
									<a href="javascript:add('<t:mutiLang langKey="common.change.style"/>','userController.do?changestyle','',550,200)">
										<i class="ace-icon fa fa-user"></i>
										 <t:mutiLang langKey="common.my.style"/>
									</a>
								</li>

								<li>
									<a href="javascript:clearAllCache()">
										<i class="ace-icon fa fa-warning"></i>
										<t:mutiLang langKey="common.clear.localstorage"/>
									</a>
								</li>

								<li class="divider"></li>

								<li>
									<a href="javascript:logout()">
										<i class="ace-icon fa fa-power-off"></i>
										 <t:mutiLang langKey="common.logout"/>
									</a>
								</li>
							</ul>
						</li>
					</ul><!-- /.ace-nav -->
				</div><!-- /.navbar-header -->
			</div><!-- /.container -->
		</div>

		<div class="main-container" id="main-container">
			<script type="text/javascript">
				try{ace.settings.check('main-container' , 'fixed')}catch(e){}
			</script>

			<div class="main-container-inner">
				<a class="menu-toggler" id="menu-toggler" href="#">
					<span class="menu-text"></span>
				</a>

				<div class="sidebar" id="sidebar">
					<script type="text/javascript">
						try{ace.settings.check('sidebar' , 'fixed')}catch(e){}
					</script>

					<div class="sidebar-shortcuts" id="sidebar-shortcuts">
						<div class="sidebar-shortcuts-large" id="sidebar-shortcuts-large">
							<button class="btn btn-success">
								<i class="icon-signal"></i>
							</button>

							<button class="btn btn-info">
								<i class="icon-pencil"></i>
							</button>

							<button class="btn btn-warning">
								<i class="icon-group"></i>
							</button>

							<button class="btn btn-danger">
								<i class="icon-cogs"></i>
							</button>
						</div>

						<div class="sidebar-shortcuts-mini" id="sidebar-shortcuts-mini">
							<span class="btn btn-success"></span>

							<span class="btn btn-info"></span>

							<span class="btn btn-warning"></span>

							<span class="btn btn-danger"></span>
						</div>
					</div><!-- #sidebar-shortcuts -->

					<ul class="nav nav-list">
						
						<li class="dropdown-toggle">
							<a  href="javascript:loadModule('首页','loginController.do?home')">
								<i class="icon-dashboard"></i><!--  menu-icon fa fa-tachometer -->
								<span class="menu-text"> 首页 </span>
							</a>
						</li>
						
						<t:menu style="ace" menuFun="${menuMap}"></t:menu>
						
					</ul><!-- /.nav-list -->

					<div class="sidebar-collapse" id="sidebar-collapse">
						<i class="icon-double-angle-left" data-icon1="icon-double-angle-left" data-icon2="icon-double-angle-right"></i>
					</div>

					<script type="text/javascript">
						try{ace.settings.check('sidebar' , 'collapsed')}catch(e){}
					</script>
				</div>

				<div class="main-content">
					<iframe style="width:100%;margin:0px;padding:0px" scrolling="no" frameborder="0" id="centerIframeId"  src="loginController.do?home" ></iframe>
				</div><!-- /.main-content -->

				<div class="ace-settings-container" id="ace-settings-container">
					<div class="btn btn-app btn-xs btn-warning ace-settings-btn" id="ace-settings-btn">
						<i class="icon-cog bigger-150"></i>
					</div>

					<div class="ace-settings-box" id="ace-settings-box">
						<div>
							<div class="pull-left">
								<select id="skin-colorpicker" class="hide">
									<option data-skin="default" value="#438EB9">#438EB9</option>
									<option data-skin="skin-1" value="#222A2D">#222A2D</option>
									<option data-skin="skin-2" value="#C6487E">#C6487E</option>
									<option data-skin="skin-3" value="#D0D0D0">#D0D0D0</option>
								</select>
							</div>
							<span>&nbsp; 选择皮肤</span>
						</div>

						<div>
							<input type="checkbox" class="ace ace-checkbox-2" id="ace-settings-navbar" />
							<label class="lbl" for="ace-settings-navbar"> 固定导航条</label>
						</div>

						<div>
							<input type="checkbox" class="ace ace-checkbox-2" id="ace-settings-sidebar" />
							<label class="lbl" for="ace-settings-sidebar"> 固定滑动条</label>
						</div>

						<div>
							<input type="checkbox" class="ace ace-checkbox-2" id="ace-settings-breadcrumbs" />
							<label class="lbl" for="ace-settings-breadcrumbs">固定面包屑</label>
						</div>

						<div>
							<input type="checkbox" class="ace ace-checkbox-2" id="ace-settings-rtl" />
							<label class="lbl" for="ace-settings-rtl">切换到左边</label>
						</div>

						<div>
							<input type="checkbox" class="ace ace-checkbox-2" id="ace-settings-add-container" />
							<label class="lbl" for="ace-settings-add-container">
								切换窄屏
								<b></b>
							</label>
						</div>
					</div>
				</div><!-- /#ace-settings-container -->
			</div><!-- /.main-container-inner -->

			<a href="#" id="btn-scroll-up" class="btn-scroll-up btn btn-sm btn-inverse">
				<i class="icon-double-angle-up icon-only bigger-110"></i>
			</a>
		</div>		
		
		
		<%@include file="/plug-in/ace/context/footer.jsp"%>
		<sino:plugins type="tools" />
		<script src="plug-in/jquery-plugs/storage/jquery.storageapi.min.js"></script>
		<script>
			jQuery(function($) {
				setTimeout(function(){
					$("#centerIframeId").css({height:window.screen.availHeight});
				},100);
			});
		</script>		
<!--[if IE]>
<script type="text/javascript">
 window.jQuery || document.write("<script src='plug-in/ace/js/jquery1x.js'>"+"<"+"/script>");
</script>
<![endif]-->
		<script type="text/javascript">
			if('ontouchstart' in document.documentElement) document.write("<script src='plug-in/ace/js/jquery.mobile.custom.js'>"+"<"+"/script>");

		function loadModule(title,url,target){
      		$("#centerIframeId").attr("src",url);
      	}
		

	  	function logout(){
	  		bootbox.confirm("Are you sure to logout?", function(result) {
	  			if(result)
		  			location.href="loginController.do?logout";
	  		});
  		}
		function opendialog(title,url,target){
			//$("#dialog").attr("src",url);
			bootbox.dialog({
				message:$("#changestylePanel").html(),
				title:title,
				buttons:{
				OK:{
				label: "OK", 
				callback:function(){
					    var indexStyle = $('input[name="indexStyle"]:checked').val();
					    if(indexStyle==undefined||indexStyle==""){
					    	indexStyle = "ace";
					    }
					    var cssTheme = $('input[name="cssTheme"]:checked').val();
					    if(cssTheme==undefined){
					    	cssTheme = "";
					    }
						var form = $("#formobj");//取iframe里的form
						$.ajax({
		        			url:form.attr('action'),
		        			type:form.attr('method'),
		        			data:"indexStyle="+indexStyle,//+"&cssTheme="+cssTheme,
		        			success:function(data){
								var d = $.parseJSON(data);
								if (d.success) {
									var msg = d.msg;
									bootbox.alert(msg);
								}else{
									bootbox.alert(d.msg);
								}
		        			},
		        			error:function(e){
		        				bootbox.alert("出错了哦");
		        			}
						});
					}
			},Cancel: {label: "CLOSE", 
				callback:function() {
						//alert('close');//$("#dialog").dialog("close");
					}
				}
			}});
  			
  	}
		function changepass(title,url,target){
			//$("#dialog").attr("src",url);
			bootbox.dialog({
				message:'<form id="formobj2"  action="userController.do?savenewpwd" name="formobj2" method="post">'
					+$("#changepassword").html()+'</form>',
				title:title,
				buttons:{
				OK:{
				label: "OK", 
				callback:function(){
					//alert('not implement');
						$.ajax({
		        			url:"userController.do?savenewpwd",
		        			type:"post",
		        			data:$('#formobj2').serialize(),// 要提交的表单 ,
		        			success:function(data){
								var d = $.parseJSON(data);
								if (d.success) {
									var msg = d.msg;
									bootbox.alert(msg);
								}else{
									bootbox.alert(d.msg);
									}
		        			},
		        			error:function(e){
		        				bootbox.alert("出错了哦");
		        			}
						});
					}
			},Cancel: {label: "CLOSE", 
				callback:function() {
						alert('close');//$("#dialog").dialog("close");
					}
				}
			}});
  			
  	}
		function profile(title,url,target){
			//$("#dialog").attr("src",url);
			bootbox.dialog({
				message:'<iframe width="100%" height="300px" src="'+url+'" style="border:1px #fff solid; background:#CCC;"></iframe>',
				title:title,
				buttons:{
				OK:{
				label: "OK"},Cancel: {label: "CLOSE"
				}
			}});
  			
  	}
			function clearAllCache(){
				var storage=$.localStorage;
				if(!storage)
					storage=$.cookieStorage;
				storage.removeAll();
				//bootbox.alert( "浏览器缓存清除成功!");
				$.ajax({url:"appCommonController.do?clearAllCache", type:"post", dataType:"json",success:function(d){
					if(d.success){
						tip("缓存清除成功!");
					}
				}});
			}
		</script>
	</body>

</html>