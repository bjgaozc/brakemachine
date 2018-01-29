<%
if(null==plugins) plugins = "";
String[] pArr = plugins.split(",");
for(int i=0;i<pArr.length;i++){%>
	<%
	if("".equals(pArr[i])){
	%>
	<%}else if("jweixin".equals(pArr[i])){%>
<script src="http://res.wx.qq.com/open/js/jweixin-1.2.0.js"></script>
	<%}else if("wxCommonApi".equals(pArr[i])){%>
<script src="${pageContext.request.contextPath}/webpage/com/sinosoft/lh/web/wx/api/common/wxCommonApi.js"></script>
	<%}else if("highcharts".equals(pArr[i])){%>
<script type="text/javascript" src="${pageContext.request.contextPath}/plug-in/highcharts/js/highcharts.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/plug-in/highcharts/js/highcharts-3d.js"></script>
	<%}else if("echarts".equals(pArr[i])){%>
<script src="${pageContext.request.contextPath}/plug-in/echarts/echarts.min.js"></script>
	<%}else if("jeasyui-extend".equals(pArr[i])){%>
<script type="text/javascript" src="${pageContext.request.contextPath}/plug-in/jeasyui-extend/jquery.easyui.extensions.min.js"></script>
	<%}else if("jeasyui-extend-datagrid".equals(pArr[i])){%>
<script type="text/javascript" src="${pageContext.request.contextPath}/plug-in/jeasyui-extend/extend/jquery.easyui.datagrid.extend.js"></script>
	<%}else if("jeasyui-extensions".equals(pArr[i])){%>
<script type="text/javascript" src="${pageContext.request.contextPath}/plug-in/jeasyui-extensions/jquery.jdirk.js"></script>
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/plug-in/jeasyui-extensions/base/jeasyui.extensions.base.css">
<script type="text/javascript" src="${pageContext.request.contextPath}/plug-in/jeasyui-extensions/base/jeasyui.extensions.base.loading.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/plug-in/jeasyui-extensions/base/jeasyui.extensions.base.tooltip.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/plug-in/jeasyui-extensions/menu/jeasyui.extensions.menu.js"></script>
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/plug-in/jeasyui-extensions/toolbar/jeasyui.extensions.toolbar.css">
<script type="text/javascript" src="${pageContext.request.contextPath}/plug-in/jeasyui-extensions/toolbar/jeasyui.extensions.toolbar.js"></script>
<script src="${pageContext.request.contextPath}/plug-in/jeasyui-extensions/selector/common/jeasyui.extensions.dialog.sealed.sample.js"></script>
<script src="${pageContext.request.contextPath}/plug-in/jeasyui-extensions/selector/common/jeasyui.extensions.selector.base.js"></script>
<script src="${pageContext.request.contextPath}/plug-in/jeasyui-extensions/selector/jeasyui.extensions.selector.singleDatagrid.js"></script>
<script src="${pageContext.request.contextPath}/plug-in/jeasyui-extensions/datagrid/jeasyui.extensions.datagrid.getDom.js"></script>
<script src="${pageContext.request.contextPath}/plug-in/jeasyui-extensions/datagrid/jeasyui.extensions.datagrid.getRowData.js"></script>
<script src="${pageContext.request.contextPath}/plug-in/jeasyui-extensions/datagrid/jeasyui.extensions.datagrid.getColumnInfo.js"></script>
<script src="${pageContext.request.contextPath}/plug-in/jeasyui-extensions/datagrid/jeasyui.extensions.datagrid.tooltip.js"></script>
	<%}else if("jquery".equals(pArr[i])){%>
<script type="text/javascript" src="${pageContext.request.contextPath}/plug-in/jquery/jquery-1.11.3.min.js"></script>
	<%}else if("jsmodern".equals(pArr[i])){%>
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/plug-in-ui/jquery-plugs/jsmodern/jsmodern-4.1.5.min.css">
<script src="${pageContext.request.contextPath}/plug-in-ui/jquery-plugs/jsmodern/jsmodern-4.1.5.min.js"></script>	
	<%}else{%>
	<%}%>
<%}%>
