/**
 * dblselector 双选
 * 
 * 例如：

$('#dsId').dblselector({
	leftPanel:"#leftTableId",
	rightPanel:"#rightTableId",
	onMoveToRightAll:function(){
		alert("回调函数");
	}
});

属性：
	type 显示类型，默认 layout，可选：layout,dialog
	leftPanel 左侧面板
	rightPanel 右侧面板
	leftPanelWidth 左侧面板所占百分比，0.5 是 50%
	onMoveToRightAll 选择全部 回调函数
	onMoveToRight 选择部分 回调函数
	onMoveToLeft 取消部分 回调函数
	onMoveToLeftAll 取消全部 回调函数

 * 
 * <br>
 * @author cmh
 * @version 2014-04-16 下午2:59:24
 * @return
 */
(function($){
	
	/**
	 * 显示布局
	 */
	function showDblLayout(target, opts){
		var pl = $(target);// 父容器
		var parentPanel = $("<div data-options=\"region:'center',border:false\"></div>");
		var dl = $("<div></div>").appendTo(parentPanel),//双选容器
			leftPanel = $("<div data-options=\"region:'west',border:"+opts.border+"\"></div>"),
			centerPanel = $("<div data-options=\"region:'center',border:"+opts.border+"\" style=\"background:#eee;\"></div>"),
			rightPanel = $("<div data-options=\"region:'east',border:"+opts.border+"\" ></div>"),
			centerPanelTable = $("<table></table>"),
			tr_moveToRightAll = $("<tr><td align=\"center\" valign=\"middle\"></td></tr>"),
			tr_moveToRight = $("<tr><td align=\"center\" valign=\"middle\"></td></tr>"),
			tr_moveToLeft = $("<tr><td align=\"center\" valign=\"middle\"></td></tr>"),
			tr_moveToLeftAll = $("<tr><td align=\"center\" valign=\"middle\"></td></tr>"),
			btn_moveToRightAll = $("<a></a>").linkbutton({plain:true,iconCls:opts.btnIconCls[0]}).click(target,opts.onMoveToRightAll).attr("title",opts.btnTitle[0]),
			btn_moveToRight = $("<a></a>").linkbutton({plain:true,iconCls:opts.btnIconCls[1]}).click(target,opts.onMoveToRight).attr("title",opts.btnTitle[1]),
			btn_moveToLeft = $("<a></a>").linkbutton({plain:true,iconCls:opts.btnIconCls[2]}).click(target,opts.onMoveToLeft).attr("title",opts.btnTitle[2]),
			btn_moveToLeftAll = $("<a></a>").linkbutton({plain:true,iconCls:opts.btnIconCls[3]}).click(target,opts.onMoveToLeftAll).attr("title",opts.btnTitle[3]);
		
		tr_moveToRightAll.find("td").append(btn_moveToRightAll);
		tr_moveToRight.find("td").append(btn_moveToRight);
		tr_moveToLeft.find("td").append(btn_moveToLeft);
		tr_moveToLeftAll.find("td").append(btn_moveToLeftAll);
		
		if(opts.btnOrder==1){
			centerPanelTable.append(tr_moveToRightAll).append(tr_moveToRight).append(tr_moveToLeft).append(tr_moveToLeftAll);
		}else if(opts.btnOrder==2){
			centerPanelTable.append(tr_moveToRight).append(tr_moveToRightAll).append(tr_moveToLeft).append(tr_moveToLeftAll);
		}else if(opts.btnOrder==3){
			centerPanelTable.append(tr_moveToRight).append(tr_moveToLeft).append(tr_moveToRightAll).append(tr_moveToLeftAll);
		}
		
		centerPanel.append(centerPanelTable);
		dl.append(leftPanel);
		dl.append(centerPanel);
		dl.append(rightPanel);
		pl.append(parentPanel);
		
		dl.layout({fit: true});
		pl.layout({fit: true});
		
		var p = pl.layout("panel","center");
		p.panel({
			onResize:function(w,h){
				if(h>0){
					var cw = 50;
					var lrw = w - cw;
					var ww = lrw/2;
					var lw = lrw*opts.leftPanelWidth;
					var rw = lrw*(1-opts.leftPanelWidth);
					var cptw = cw - 5;
					var cpth = h - 30;
					dl.layout("panel","west").panel("resize",{
						width:lw
					});
					dl.layout("panel","east").panel("resize",{
						width:rw
					});
					dl.layout("resize");
					centerPanelTable.css({width:cptw,height:cpth});
				}
			}
		});
		
		p.panel("resize");
		
		opts.leftPanel = opts.leftPanel == null ? "左侧内容，如需替换，请添加 <span style='color:red;'>leftPanel</span> 属性":$(opts.leftPanel);
		leftPanel.append(opts.leftPanel);
		opts.rightPanel = opts.rightPanel == null ? "右侧内容，如需替换，请添加 <span style='color:red;'>rightPanel</span> 属性":$(opts.rightPanel);
		rightPanel.append(opts.rightPanel);
		
	}
	
	/**
	 * 显示窗口
	 */
	function showDblGridselector(opts){
		var container = $("<div class=\"grid-selector-container\" style=\"width:600px;height:400px;\" ></div>");
		var dia = $.dialog({
			title:opts.title,
			lock:opts.lock,
			padding:0,
			content:container
		});
		
		container.append("<div data-options=\"region: 'north', split: false, border: true\" style=\"height:100px;\"><div class=\"grid-selector-toolbar\"></div></div>" +
        "<div data-options=\"region: 'center', border: true\"><div class=\"grid-selector\"></div></div>");
		
        container.layout({ 
        	fit: true
        });
	}
	
	// 构造
	$.fn.dblselector = function(options, param){
		if (typeof options == 'string'){
			return $.fn.dblselector.methods[options](this, param);
		}
		options = options || {};
		return this.each(function(){
			var state = $.data(this, 'dblselector');
			if (state){
				$.extend(state.options, options);
			} else {
				$.data(this, 'dblselector', {
					options: $.extend({}, $.fn.dblselector.defaults, $.fn.dblselector.parseOptions(this), options)
				});
				$(this).removeAttr('disabled');
			}
			
			var opts = $.data(this, 'dblselector').options;//配置
			
			if("layout"==opts.type){
				showDblLayout(this, opts);
			}else if("dialog"==opts.type){
				showDblGridselector(opts);
			}
			
		});
	};
	
	// 方法
	$.fn.dblselector.methods = {
		options: function(jq){
			return $.data(jq[0], 'dblselector').options;
		},
		enable: function(jq){
			return jq.each(function(){
			});
		},
		disable: function(jq){
			return jq.each(function(){
			});
		},
		moveToRightAll: function(jq){
			return jq.each(function(){
				var opts = $.data(this, 'dblselector').options;
				var d = $(opts.leftPanel).datagrid("getData");
				if(d.total>0){
					var rd = $(opts.rightPanel).datagrid("getData");
					if(rd.total==0){
						$(opts.rightPanel).datagrid("loadData",d);
						$(opts.leftPanel).datagrid("loadData",{total:0,rows:[]});
					}else{
						$(opts.rightPanel).datagrid("loadData",d);
						$(opts.leftPanel).datagrid("loadData",{total:0,rows:[]});
						for (var i=0; i<rd.rows.length; i++) {
							$(opts.rightPanel).datagrid("insertRow",{index:0,row:rd.rows[i]});
						}
					}
				}
			});
		},
		moveToRight: function(jq){
			return jq.each(function(){
				var opts = $.data(this, 'dblselector').options;
				var sArr = $(opts.leftPanel).datagrid("getSelections");
				if(sArr.length>0){
					for (var i=0; i<sArr.length; i++) {
						$(opts.rightPanel).datagrid("insertRow",{index:0,row:sArr[i]});
						$(opts.leftPanel).datagrid("deleteRow",$(opts.leftPanel).datagrid("getRowIndex",sArr[i]));
					}
				}else{
					$(opts.leftPanel).datagrid("selectRow",0);
					var r = $(opts.leftPanel).datagrid("getSelected");
					if(null!=r){
						$(opts.rightPanel).datagrid("insertRow",{index:0,row:r});
						$(opts.leftPanel).datagrid("deleteRow",0);
					}
				}
			});
		},
		moveToLeft: function(jq){
			return jq.each(function(){
				var opts = $.data(this, 'dblselector').options;
				var sArr = $(opts.rightPanel).datagrid("getSelections");
				if(sArr.length>0){
					for (var i=0; i<sArr.length; i++) {
						$(opts.leftPanel).datagrid("insertRow",{index:0,row:sArr[i]});
						$(opts.rightPanel).datagrid("deleteRow",$(opts.rightPanel).datagrid("getRowIndex",sArr[i]));
					}
				}else{
					$(opts.rightPanel).datagrid("selectRow",0);
					var r = $(opts.rightPanel).datagrid("getSelected");
					if(null!=r){
						$(opts.leftPanel).datagrid("insertRow",{index:0,row:r});
						$(opts.rightPanel).datagrid("deleteRow",0);
					}
				}
			});
		},
		moveToLeftAll: function(jq){
			return jq.each(function(){
				var opts = $.data(this, 'dblselector').options;
				var d = $(opts.rightPanel).datagrid("getData");
				if(d.total>0){
					var ld = $(opts.leftPanel).datagrid("getData");
					if(ld.total==0){
						$(opts.leftPanel).datagrid("loadData",d);
						$(opts.rightPanel).datagrid("loadData",{total:0,rows:[]});
					}else{
						$(opts.leftPanel).datagrid("loadData",d);
						$(opts.rightPanel).datagrid("loadData",{total:0,rows:[]});
						for (var i=0; i<ld.rows.length; i++) {
							$(opts.leftPanel).datagrid("insertRow",{index:0,row:ld.rows[i]});
						}
					}
				}
			});
		},
		test: function(jq){
			return jq.each(function(){
			});
		}
	};
	
	// 解析参数
	$.fn.dblselector.parseOptions = function(target){};
	
	// 默认参数
	$.fn.dblselector.defaults = {
		// 属性
		id: null,
		type:"layout",//dialog
		leftPanel:null,
		rightPanel:null,
		leftPanelWidth:0.5,// 按百分比，0.5 是 50%
		title: "选择",
		lock:true,
		disabled: false,
		iconCls: null,
		iconAlign: "left",
		border:true,
		btnOrder:1,// 按钮顺序 1,2,3
		btnIconCls:["pagination-last","pagination-next","pagination-prev","pagination-first"],
		btnTitle:["选择全部","选择部分","取消部分","取消全部"],
		//事件
		onMoveToRightAll:function(e){$(e.data).dblselector("moveToRightAll");},
		onMoveToRight:function(e){$(e.data).dblselector("moveToRight");},
		onMoveToLeft:function(e){$(e.data).dblselector("moveToLeft");},
		onMoveToLeftAll:function(e){$(e.data).dblselector("moveToLeftAll");}
	};
	
})(jQuery);