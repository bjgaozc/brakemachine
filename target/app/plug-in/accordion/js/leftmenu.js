$(function() {
	//easy ui树加载会在文档加载完执行,所以初始化菜单要延迟一秒 by jueyue
	setTimeout(InitLeftMenu,100);
	tabClose();
	tabCloseEven();
	// 释放内存
	$.fn.panel.defaults = $.extend({}, $.fn.panel.defaults, {
		onBeforeDestroy : function() {
			var frame = $('iframe', this);
			if (frame.length > 0) {
				frame[0].contentWindow.document.write('');
				frame[0].contentWindow.close();
				frame.remove();
			}
			if (/msie/.test(navigator.userAgent.toLowerCase())) {
				CollectGarbage();
			}
		}
	});
	
	  $('#maintabs').tabs({ onSelect : function(title) {
	  	rowid="";
	  } });
	
});
var rowid="";
// 初始化左侧
function InitLeftMenu() {
	$("#nav").show();
	$('.easyui-accordion').accordion('resize');
	$('.easyui-accordion li div').click(function() {
		$('.easyui-accordion li div').removeClass("selected");
		$(this).parent().addClass("selected");
	}).hover(function() {
		$(this).parent().addClass("hover");
	}, function() {
		$(this).parent().removeClass("hover");
	});
	var oUl=$('.easyui-tree');
	oUl.tree({
		onClick: function(node){
			openThisNoed(node);
		}
	});
	oUl.on('click','.tree-node',function(e){
		 var oA = $(this).find("a");
		 if(oA.length) {
			 addTab(oA.attr('title'),oA.attr('url'),oA.attr('icon'));
		 }
	});
	$.each(oUl.find("a"),function(){
		$(this).unbind("click");
	});

}

function openThisNoed(node) {
	if(node.state == "open"){
		$('.easyui-tree').tree('collapse', node.target);
		return;
	}
	var children = $('.easyui-tree').tree('getChildren', node.target);
	var pnode = null;
	try{
		pnode = $('.easyui-tree').tree('getParent', node.target);
	}catch(e){}
	if (pnode && children && children.length > 0) {
		$(pnode).each(function() {
			$('.easyui-tree').tree('collapse', this);
		});
		$('.easyui-tree').tree('expand', node.target);
	} else if (children && children.length > 0) {
		$('.easyui-tree').tree('collapseAll');
		$('.easyui-tree').tree('expand', node.target);
	}
	if (children == null || children.length == 0) {
		var fun = $(node.target).find('a').attr("onclick");
		var params = fun.substring(7, fun.length - 1).replaceAll("'", "")
				.split(",");
		addTab(params[0], params[1], params[2]);
	}
}

String.prototype.replaceAll = function(s1,s2) { 
    return this.replace(new RegExp(s1,"gm"),s2); 
};
// 获取左侧导航的图标
function getIcon(menuid) {
	var icon = 'icon ';
	$.each(_menus.menus, function(i, n) {
		$.each(n.menus, function(j, o) {
			if (o.menuid == menuid) {
				icon += o.icon;
			}
		});
	});

	return icon;
}

function addTab(subtitle, url, icon, closeable) {
	if(closeable == undefined) closeable = true;
	var progress = $("div.messager-progress");
	if(progress.length){return;}
	rowid="";
	$.messager.progress({
		text : $.messager.defaults.progressText,
		interval : 200
	});
	if (!$('#maintabs').tabs('exists', subtitle)) {
		//判断是否进行href方式打开tab，默认为iframe方式
		if(url.indexOf('isHref') != -1){
			$('#maintabs').tabs('add', {
				title : subtitle,
				href : url,
				closable : closeable,
				icon : icon
			});	
		}else{
			var h = ($('#maintabs .tabs-panels.tabs-panels-noborder').height()-4) + "px";
			$('#maintabs').tabs('add', {
				title : subtitle,
				content : createFrame(url,h),
				closable : closeable,
				icon : icon
			});		
			
		}

	} else {
		$('#maintabs').tabs('select', subtitle);
		refreshCurrTab();
		$.messager.progress('close');
	}

	// $('#maintabs').tabs('select',subtitle);
	tabClose();
}
var title_now;
function addLeftOneTab(subtitle, url, icon) {
	rowid="";
	if ($('#maintabs').tabs('exists', title_now)) {
		$('#maintabs').tabs('select', title_now);
			if(title_now!=subtitle)
			{
			addmask();
			$('#maintabs').tabs('update', {
				tab : $('#maintabs').tabs('getSelected'),
				options : {
					title : subtitle,
					href : url,
					cache:false,
					closable : false,
					icon : icon
				}
			});
		}
	} else {
		addmask();
		$('#maintabs').tabs('add', {
			title : subtitle,
			href : url,
			closable : false,
			icon : icon
		});
	}
	if (/msie/.test(navigator.userAgent.toLowerCase())) {
		CollectGarbage();
	}
	title_now = subtitle;
	// $('#maintabs').tabs('select',subtitle);
	// tabClose();

}
function addmask() {
	$.messager.progress({
		text : '页面加载中....',
		interval : 100
	});
}
function createFrame(url,h) {
	var s = '<iframe name="tabiframe" id="tabiframe" scrolling="no" frameborder="0"  src="'+url+'" style="width:100%;height:99.5%;min-height:' + h + ';overflow-y:hidden;"></iframe>';
	return s;
}
function tabClose() {
	/* 双击关闭TAB选项卡 */
	$(".tabs-inner").dblclick(function() {
		var subtitle = $(this).children(".tabs-closable").text();
		$('#tabs').tabs('close', subtitle);
	})
	/* 为选项卡绑定右键 */
	$(".tabs-inner").bind('contextmenu', function(e) {
		$('#mm').menu('show', {
			left : e.pageX,
			top : e.pageY
		});

		var subtitle = $(this).children(".tabs-closable").text();

		$('#mm').data("currtab", subtitle);
		// $('#maintabs').tabs('select',subtitle);
		return false;
	});
}

/**
 * 刷新当前选项卡
 */
function refreshCurrTab() {
	var currTab = $('#maintabs').tabs('getSelected');
	var url = $(currTab.panel('options').content).attr('src');
	if(url) {
		var h = ($('#maintabs .tabs-panels.tabs-panels-noborder').height()-4) + "px";
		$('#maintabs').tabs('update', {
			tab : currTab,
			options : {
				content : createFrame(url,h)
			}
		})
	}
}

// 绑定右键菜单事件
function tabCloseEven() {
	// 刷新
	$('#mm-tabupdate').click(refreshCurrTab);
	
	// 关闭当前
	$('#mm-tabclose').click(function() {
		var currtab_title = $('#mm').data("currtab");
		$('#maintabs').tabs('close', currtab_title);
	});
	
	// 全部关闭
	$('#mm-tabcloseall').click(function() {
		$('.tabs-inner span').each(function(i, n) {
			var t = $(n).text();
			if(t != '首页'){
				$('#maintabs').tabs('close', t);
			}
		});
	});
	// 关闭除当前之外的TAB
	$('#mm-tabcloseother').click(function() {
		$('#mm-tabcloseright').click();
		$('#mm-tabcloseleft').click();
	});
	// 关闭当前右侧的TAB
	$('#mm-tabcloseright').click(function() {
		var nextall = $('.tabs-selected').nextAll();
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
	// 关闭当前左侧的TAB
	$('#mm-tabcloseleft').click(function() {
		var prevall = $('.tabs-selected').prevAll();
		if (prevall.length == 0) {
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

	// 退出
	$("#mm-exit").click(function() {
		$('#mm').menu('hide');
	});
}

$.parser.onComplete = function(context) {/* 页面所有easyui组件渲染成功后，隐藏等待信息 */
	window.setTimeout(function() {
		$.messager.progress('close');
		//console.log(context[0].outerText);
//		if(context[0].outerText.indexOf($.messager.defaults.progressText)>-1){
//		}else{
//			$.messager.progress('close');
//		}
	}, 300);
};


