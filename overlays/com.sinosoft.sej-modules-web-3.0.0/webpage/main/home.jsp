<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@include file="/context/tags.jsp"%>
<app:template title="首页">

<style>
.panel-body{
	overflow:hidden;
}
</style>

<div id="homeportalId" style="position:relative;">
</div>

<script type="text/javascript" src="plug-in/easyui/extends/portal/jquery.portal.js"></script>
<script type="text/javascript" src="webpage/com/sinosoft/modules/ep/web/epApi.js"></script>
<script>
/* 全局变量 begin  */
var homeportal;
var columns = '<div style="width:50%;"></div><div style="width:50%;"></div>';
var local = 'p1:p2';//在一起的用,分割，不在一起的用:分割
var portaldata;
/* 全局变量 end  */

/**
 * 初始化
 */
$(function(){
	var home = {
		initAll : function(){
			var uiData = null;
			//var uiData = baseApi.ui.getData();
			if(uiData){
				try{
					var p = eval('(' + uiData.obj.portal + ')');
					columns = p.columns;
					local = p.local;
					portaldata = p.data;
				}catch(e){}
			}
			initHomeportal();
		}	
	};
	home.initAll();
});

/**
 * 初始化portal
 * 
 * @param reset 是否重置
 */
function initHomeportal(reset){
	//console.log(portaldata);
	if(!portaldata){
		portaldata = [{
	        id: 'p1',
	        title: '待办',
	        iconCls:'fa fa-search',
	        height:420,
	        collapsible: true,
//	        closable:true,
	        content: ''
	    }, {
	        id: 'p2',
	        title: '通知',
	        iconCls:'icon-tip',
	        height:420,
	        collapsible: true,
//	        closable: true,
	        content: ''
	    }];
	}
	
	$('#homeportalId').html(columns);
	
    //监听portal状态改变事件、每次改变位置、获取当前改变后的位置状态、保存在cookie
	homeportal = $('#homeportalId').portal({
        border: false,
        fit: true,
        onStateChange: function () {
            //$.cookie('portal_paenl_states', getPanelsLoaction(), {expires: 7});
        }
    });
    
	if(reset){
		//$.cookie('portal_paenl_states', local, {expires: 7});
	}
	
    if ($.cookie("portal_paenl_states")) {
        local = $.cookie("portal_paenl_states");
    }
    
    renderPanel();
}

function renderContent(url){
	return '<iframe src="" width="100%" frameborder="no" border="0" marginwidth="0" marginheight="0" scrolling="yes"></iframe>';
}

/**
 * 获取当前位置状态
 * 
 * @returns
 */
function getPanelsLoaction() {
    var locals = [];
    var cols = local.split(":").length;
    for (var i = 0; i < cols; i++) {
        var temp = [];
        var pl = homeportal.portal("getPanels", i);
        for (var j = 0; j < pl.length; j++) {
            temp.push(pl[j].attr("id"));
        }
        locals.push(temp.join(","));
    }
    return locals.join(':');
}

/**
 * 根据ID获得面板
 * 
 * @param id
 * @returns
 */
function getPanelById(id) {
    for (var i = 0; i < portaldata.length; i++) {
        if (portaldata[i].id == id) {
            return portaldata[i];
        }
    }
    return undefined;
}

/**
 * 渲染panel
 */
function renderPanel() {
    var cols = local.split(":");
    for (var i = 0; i < cols.length; i++) {
        var rows = cols[i].split(",");
        for (var j = 0; j < rows.length; j++) {
            var op = getPanelById(rows[j]);
            var p = $('<div/>').attr('id', op.id).appendTo('body');
            p.panel(op).panel('refresh', op.content);
            homeportal.portal('add', {
                panel: p,
                columnIndex: i
            });
        }
    }
}
</script>

</app:template>