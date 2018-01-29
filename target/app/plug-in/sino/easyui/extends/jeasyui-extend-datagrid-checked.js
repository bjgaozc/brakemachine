/**
 * 扩展 datagrid 支持分页多选<br>
 * 默认 checkField 为 tempRowNumber<br>
 * 使用的使用注意要覆盖此属性
 * 
 * 例如：

function setCheckFieldStr() {
	$("testDgId").datagrid("setCheckFieldStr","1#1,2#15");// #前面是当前页，后面是checkField的值
	$("testDgId").datagrid("reload");
}

function getCheckFieldStr() {
	var cd = $("testDgId").datagrid("getCheckFieldStr");
	alert(cd);
}

function getCheckFieldVal() {
	var cd = $("testDgId").datagrid("getCheckFieldVal");
	alert(cd);
}

function clearCheckedAll() {
	$("testDgId").datagrid("clearCheckedAll");
}

 * 
 * <br>
 * @author cmh
 * @version 2014-08-14 下午22:34:24
 * @return
 */
$.extend($.fn.datagrid.defaults, {
	checkCacheFlag : "checked",
	checkAllFlag : "all",
	checkFlag : ",",
	splitFlag : "#",
	checkField : "tempRowNumber",
	onCheck : function(i, r) {
		var target = $(this);
		var p = target.datagrid("getPager").pagination("options").pageNumber;
		var o = target.datagrid("options");
		var ccf = o.checkCacheFlag;
		var f = o.checkFlag;
		var s = o.splitFlag;
		var cf = o.checkField;
		var cd = target.data(ccf);
		if (!cd) cd = "";
		var c = p + s + r[cf] + f;
		if(cd.length>0 && f!=cd.substring(cd.length-1)) cd += f;
		if (cd.indexOf(c) == -1) {
			cd += c;
			target.data(ccf, cd);
		}
	},
	onUncheck : function(i, r) {
		var target = $(this);
		var p = target.datagrid("getPager").pagination("options").pageNumber;
		var o = target.datagrid("options");
		var ccf = o.checkCacheFlag;
		var f = o.checkFlag;
		var s = o.splitFlag;
		var cf = o.checkField;
		var cd = target.data("checked");
		if(cd.length>0 && f!=cd.substring(cd.length-1)) cd += f;
		var c = p + s + r[cf] + f;
		cd = cd.replace(c, "");
		target.data(ccf, cd);
	},
	onLoadSuccess : function(d) {
		var target = $(this);
		var o = target.datagrid("options");
		var ci = target.data("ci");
		if (!ci) {
			ci = $(".datagrid-header-row").find("input:checkbox");
			$(ci).click(function() {
				var ccf = o.checkCacheFlag;
				if ($(this).attr("checked")) {
					target.data(ccf, o.checkAllFlag);
				} else {
					target.data(ccf, "");
				}
			});
			target.data("ci", ci);
		}
		var cd = target.data("checked");
		if (cd) {
			var cf = o.checkField;
			var f = o.checkFlag;
			var s = o.splitFlag;
			if(cd.length>0 && f!=cd.substring(cd.length-1)) cd += f;
			for ( var i = 0; i < d.rows.length; i++) {
				var p = target.datagrid("getPager").pagination("options").pageNumber;
				var c = p + s + d.rows[i][cf] + f;
				if (cd.indexOf(c) > -1) {
					var index = target.datagrid("getRowIndex", d.rows[i]);
					target.datagrid("checkRow", index);
				}
			}
		}
	}
});
$.extend($.fn.datagrid.methods, {
	// 设置需要选择的行
	setCheckFieldStr : function(jq, options) {
		return jq.each(function () {
			var target = $(this);
			var o = target.datagrid("options");
			var ccf = o.checkCacheFlag;
			target.data(ccf, options);
		});
	},
	// 获得选择的行的字符串，以 checkFlag 分隔
	getCheckFieldStr : function(jq) {
		var target = $(jq[0]);
		var o = target.datagrid("options");
		var ccf = o.checkCacheFlag;
		var f = o.checkFlag;
		var cdStr = "";
		var cd = target.data(ccf);
		if(cd){
			var caf = o.checkAllFlag;
			if(caf===cd) return cd;
			if(f==cd.substring(cd.length-1)) cd = cd.substring(0,cd.length-1);
			cdStr = cd;
		}
		return cdStr;
	},
	// 获得checkField的值的字符串，以 checkFlag 分隔
	getCheckFieldVal : function(jq){
		var target = $(jq[0]);
		var o = target.datagrid("options");
		var f = o.checkFlag;
		var s = o.splitFlag;
		var cd = target.datagrid("getCheckFieldStr");
		var vStr = "";
		if(cd){
			var caf = o.checkAllFlag;
			if(caf===cd) return cd;
			if(f==cd.substring(cd.length-1)) cd = cd.substring(0,cd.length-1);
			var cdArr = cd.split(f);
			for(var i=0;i<cdArr.length;i++){
				var vArr = cdArr[i].split(s);
				vStr += vArr[1] + f;
			}
			if(f==vStr.substring(vStr.length-1)) vStr = vStr.substring(0,vStr.length-1);
		}
		return vStr;
	},
	// 清除所有选择的行
	clearCheckedAll : function(jq) {
		return jq.each(function () {
			var target = $(this);
			var o = target.datagrid("options");
			var ccf = o.checkCacheFlag;
			target.data(ccf,"");
			target.datagrid("uncheckAll");
		});
	}
});