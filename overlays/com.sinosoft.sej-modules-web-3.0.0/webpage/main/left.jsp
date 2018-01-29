<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@include file="/context/mytags.jsp"%>
<ul id="menu_level_child"></ul>
<script type="text/javascript">
	$(function() {
		var menu = {
			menuUrl: "menuApiController.do?genMenu",
			getMenuData: function() {
				return ajax(this.menuUrl);
			},
			menuData: null,
			formatMenuData: function(obj) {
				var _this = this;
				var temp = {
					id: obj.id,
					text: obj.name,
					url: obj.url,
					iconCls: obj.icon
				};
				if("children" in obj) {
					temp.children = [];
					$.each(obj.children, function(c){
						temp.children.push(_this.formatMenuData(obj.children[c]));
					});
				};
				return temp;
			},
			createFrame: function(url,h) {
				var s = '<iframe name="tabiframe" id="tabiframe" scrolling="no" frameborder="0"  src="'+url+'" style="width:100%;height:99%;min-height:' + h + ';overflow-y:hidden;"></iframe>';
				return s;
			},
			refreshCurrTab: function() {
				var progress = $("div.messager-progress");
				if(progress.length){return;}
				$.messager.progress({
					text : '页面加载中....',
					interval : 200
				});
				var currTab = $('#maintabs').tabs('getSelected');
				var url = $(currTab.panel('options').content).attr('src');
				if(url) {
					var h = ($('#maintabs .tabs-panels.tabs-panels-noborder').height()-4) + "px";
					$('#maintabs').tabs('update', {
						tab : currTab,
						options : {
							content : this.createFrame(url,h)
						}
					})
				}
			},
			tabEvent: function() {
				/* 双击关闭TAB选项卡 */
				$(".tabs-inner").on("dblclick",function() {
					var title = $(this).children(".tabs-closable").text();
					$('#maintabs').tabs('close', title);
				})
				/* 为选项卡绑定右键 */
				$(".tabs-inner").on('contextmenu', function(e) {
					$('#mm').menu('show', {
						left : e.pageX,
						top : e.pageY
					});
					var title = $(this).children(".tabs-closable").text();
					$('#mm').data("currtab", title);
					return false;
				});
			},
			tabContextmenuEvent: function() {
				$('#mm-tabupdate').on("click", {_this : this}, function(e){// 刷新
					e.data._this.refreshCurrTab();
				});
				$('#mm-tabclose').on("click",function() {// 关闭当前
					var currtab_title = $('#mm').data("currtab");
					$('#maintabs').tabs('close', currtab_title);
				});
				$('#mm-tabcloseall').on("click",function() {// 全部关闭
					$('.tabs-inner span').each(function(i, n) {
						var t = $(n).text();
						if(t != '首页'){
							$('#maintabs').tabs('close', t);
						}
					});
				});
				$('#mm-tabcloseother').on("click",function() {// 关闭除当前之外的TAB
					$('#mm-tabcloseright').trigger("click");
					$('#mm-tabcloseleft').trigger("click");
				});
				$('#mm-tabcloseright').on("click",function() {// 关闭当前右侧的TAB
					var nextall = $('#maintabs .tabs').first().find('.tabs-selected').nextAll();
					if (nextall.length == 0) {
						$.messager.alert('消息','后边没有啦~~','info');
						return false;
					}
					nextall.each(function(i, n) {
						var t = $('a:eq(0) span', $(n)).text();
						$('#maintabs').tabs('close', t);
					});
					return false;
				});
				$('#mm-tabcloseleft').on("click",function() {// 关闭当前左侧的TAB
					var prevall = $('#maintabs .tabs').first().find('.tabs-selected').prevAll();
					if (prevall.length == 1) {
						$.messager.alert('消息','到头了，前边没有啦~~','info');
						return false;
					}
					prevall.each(function(i, n) {
						var t = $('a:eq(0) span', $(n)).text();
						if(t != '首页'){
							$('#maintabs').tabs('close', t);
						}	
					});
					return false;
				});
			},
			openTab: function(title, url, icon) {
				if (!$('#maintabs').tabs('exists', title)) {
					var progress = $("div.messager-progress");
					if(progress.length){return;}
					$.messager.progress({
						text : '页面加载中....',
						interval : 200
					});
					var closable = true;
					if("首页"==title) closable = false;
					//判断是否进行href方式打开tab，默认为iframe方式
					if(url.indexOf('isHref') != -1){
						$('#maintabs').tabs('add', {
							title : title,
							href : url,
							closable : closable,
							icon : icon
						});	
					} else {
						var h = ($('#maintabs .tabs-panels.tabs-panels-noborder').height()-4) + "px";
						$('#maintabs').tabs('add', {
							title : title,
							content : this.createFrame(url,h),
							closable : closable,
							icon : icon
						});		
					}
	
				} else {
					$('#maintabs').tabs('select', title);
					this.refreshCurrTab();
				}
				this.tabEvent();
			},
			initMainMenu: function() {
				this.openTab("首页","loginController.do?home","fa fa-home");
				if (this.menuData) {
					$.each(this.menuData, function(i,item) {
						if("0"===item.type){
							$("#menu_level_one").tabs('add', {
								id : item.id,
								title : item.name,
								content : '',
								children: item.children,
								closable : false
							});
						}
					});
				}
			},
			initChildMenu: function() {
				var _this = this;
				var tabs = $('#menu_level_one').tabs().tabs('tabs');
				$.each(tabs, function(i){
					var opt = tabs[i].panel('options');
					opt.tab.unbind().on('click', {children : opt.children}, function(e) {
						var children = [];
						try{
							if(e.data.children){
								$.each(e.data.children, function(j){
									children.push(_this.formatMenuData(e.data.children[j]));
								});
							}
						}catch(e){alert(e.message)}
						$("#menu_level_child").tree({
							data: children,
							animate: true,
							onClick: function(node){
								if(node.url && node.url !== "null") {
									_this.openTab(node.text,node.url,node.iconCls);
								} else if("children" in node) {
									if(node.state === "open"){
										$('#menu_level_child').tree('collapse', node.target);
									} else {
										$('#menu_level_child').tree('expand', node.target);
									}
								}
							}
						})
					});
				});
				tabs[0].panel('options').tab.trigger('click');
			},
			init: function(){
				//获取菜单数据
				this.menuData = this.getMenuData();
				//初始化一级菜单
				this.initMainMenu();
				//初始化左侧子菜单
				this.initChildMenu();
				//给打开窗口添加右键事件
				this.tabContextmenuEvent();
				//页面所有easyui组件渲染成功后，隐藏等待信息
				$.parser.onComplete = function() {
					$.messager.progress('close');
				};
			}
		}
		menu.init();
	});
</script>