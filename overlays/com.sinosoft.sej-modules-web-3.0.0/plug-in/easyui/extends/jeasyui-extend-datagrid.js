/**
 * 扩展datagrid方法
 */
$.extend($.fn.datagrid.methods, {
	/**
     * 动态添加编辑器
     * 
     * @param {} jq
     * @param {} param
     */
    addEditor : function(jq, param) {
        if (param instanceof Array) {
            $.each(param, function(index, item) {
                var e = $(jq).datagrid('getColumnOption', item.field);
                e.editor = item.editor;
            });
        } else {
            var e = $(jq).datagrid('getColumnOption', param.field);
            e.editor = param.editor;
        }
    },
    /**
     * 动态移除编辑器
     * @param {} jq
     * @param {} param
     */
    removeEditor : function(jq, param) {
        if (param instanceof Array) {
            $.each(param, function(index, item) {
                var e = $(jq).datagrid('getColumnOption', item);
                e.editor = {};
            });
        } else {
            var e = $(jq).datagrid('getColumnOption', param);
            e.editor = {};
        }
    },
    /**
	 * 工具栏按钮<br>
	 * 添加按钮<br>
	 * 
	 * $('#tt').datagrid("addToolbarItem",[{"text":"xxx"},"-",{"text":"xxxsss","iconCls":"icon-ok"}]);
	 * 
	 * @author cmh
	 */
	addToolbarItem : function(jq, items) {
		return jq.each(function() {
			var toolbar = $(this).parent().prev(".datagrid-toolbar");
			for (var i = 0; i < items.length; i++) {
				var item = items[i];
				if (item === "-") {
					toolbar.find("tr").append('<td><div class="datagrid-btn-separator"></div></td>');
				} else {
					var td = $("<td></td>");
					var btn = $("<a href=\"javascript:void(0)\"></a>");
					btn[0].onclick = eval(item.handler || function() {});
					btn.css("float", "left").appendTo(td).linkbutton($.extend({}, item, {plain : true}));
					td.appendTo(toolbar.find("tr"));
				}
			}
			toolbar = null;
		});
	},
	/**
	 * 工具栏按钮<br>
	 * 移除按钮<br>
	 * 
	 * $('#tt').datagrid("removeToolbarItem","GetChanges")//根据btn的text删除
	 * $('#tt').datagrid("removeToolbarItem",0)//根据下标删除
	 * 
	 * @author cmh
	 */
	removeToolbarItem : function(jq, param) {
		return jq.each(function() {
			var btns = $(this).parent().prev(".datagrid-toolbar").find("a");
			var cbtn = null;
			if (typeof param == "number") {
				cbtn = btns.eq(param);
			} else if (typeof param == "string") {
				var text = null;
				btns.each(function() {
					text = $(this).data().linkbutton.options.text;
					if (text == param) {
						cbtn = $(this);
						text = null;
						return;
					}
				});
			}
			if (cbtn) {
				var prev = cbtn.prev()[0];
				var next = cbtn.next()[0];
				if (prev && next && prev.nodeName == "DIV"
						&& prev.nodeName == next.nodeName) {
					$(prev).remove();
				} else if (next && next.nodeName == "DIV") {
					$(next).remove();
				} else if (prev && prev.nodeName == "DIV") {
					$(prev).remove();
				}
				cbtn.parent().next().hide();
				cbtn.remove();
				cbtn = null;
			}
		});
	},
	/**
	 * author ____′↘夏悸 create date 2012-11-5
	 * 
	 * 
	 * onLoadSuccess:function(){ //所有列进行合并操作 //$(this).datagrid("autoMergeCells");
	 * //指定列进行合并操作 $(this).datagrid("autoMergeCells",['itemid','productid']); }
	 * 
	 * 
	 */
	autoMergeCells : function (jq, fields) {
		return jq.each(function () {
			var target = $(this);
			if (!fields) {
				fields = target.datagrid("getColumnFields");
			}
			var rows = target.datagrid("getRows");
			var i = 0,
			j = 0,
			temp = {};
			for (i; i < rows.length; i++) {
				var row = rows[i];
				j = 0;
				for (j; j < fields.length; j++) {
					var field = fields[j];
					var tf = temp[field];
					if (!tf) {
						tf = temp[field] = {};
						tf[row[field]] = [i];
					} else {
						var tfv = tf[row[field]];
						if (tfv) {
							tfv.push(i);
						} else {
							tfv = tf[row[field]] = [i];
						}
					}
				}
			}
			$.each(temp, function (field, colunm) {
				$.each(colunm, function () {
					var group = this;
					
					if (group.length > 1) {
						var before,
						after,
						megerIndex = group[0];
						for (var i = 0; i < group.length; i++) {
							before = group[i];
							after = group[i + 1];
							if (after && (after - before) == 1) {
								continue;
							}
							var rowspan = before - megerIndex + 1;
							if (rowspan > 1) {
								target.datagrid('mergeCells', {
									index : megerIndex,
									field : field,
									rowspan : rowspan
								});
							}
							if (after && (after - before) != 1) {
								megerIndex = after;
							}
						}
					}
				});
			});
		});
	},
	 /**
	 * from 西天之旅
	 * datagrid footer合并单元格
	 * 
	 * 		//向下合并
	       $(this).datagrid('footerMergeCells',{
	           index: 1,
	           field: 'city',
	           rowspan: 2
	       });
	       //向右合并
	      $(this).datagrid('footerMergeCells',{
	             index: 0,
	             field: 'city',
	             colspan: 2
	       });
	 * @return
	 */
    footerMergeCells : function (jq, options) {
        return jq.each(function () {
            if (options.index != undefined && options.index >= 0){
                if (options.field != undefined && options.field != ''){
                    var target = $(this);
                    var panel = target.datagrid('getPanel');
                    //向下合并
                    if (options.rowspan != undefined && options.rowspan > 1){
                        //合并
                        panel.find('.datagrid-ftable tbody tr[datagrid-row-index=' + options.index 
                                    + '] td[field="' + options.field 
                                    + '"]').attr({rowspan : options.rowspan});
                        //隐藏向下被合并的单元格
                        for(i = 1; i < options.rowspan; i++){
                            panel.find('.datagrid-ftable tbody tr[datagrid-row-index=' + (options.index + i)
                                    + '] td[field="' + options.field 
                                    + '"]').hide();
                        }
                    }
                    //向右合并
                    if (options.colspan != undefined && options.colspan > 1){
                        //合并
                        var org_td = panel.find('.datagrid-ftable tbody tr[datagrid-row-index=' + options.index 
                                + '] td[field="' + options.field 
                                + '"]');
                        org_td.attr({colspan : options.colspan});
                        //合并后内容居中
                        org_td.attr({align : 'center'});
                        //隐藏向右被合并的单元格
                        for(i = 1; i < options.colspan; i++){
                            org_td = org_td.next('td');
                            org_td.hide();
                        }
                    }
                }
            }
        });
    }
});



