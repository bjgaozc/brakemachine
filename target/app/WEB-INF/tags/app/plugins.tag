<%@tag description="插件" pageEncoding="UTF-8"%>
<%@attribute name="type" description="类型 "%><%@attribute name="theme" description="主题 "%><%@attribute name="id" description="主键 "%>
<%
if(null==type) type = "";
if(null==id||"".equals(id)) id = "plugin";
String[] pArr = type.split(",");
for(int i=0;i<pArr.length;i++){%>
	<%
	if("".equals(pArr[i])){
	%>
	<%}else if("highcharts".equals(pArr[i])){%>
<script type="text/javascript" src="plug-in/highcharts/js/highcharts.js"></script>
<script type="text/javascript" src="plug-in/highcharts/js/highcharts-3d.js"></script>
	<%}else if("jeasyui-extend".equals(pArr[i])){%>
<script type="text/javascript" src="plug-in/jeasyui-extend/jquery.easyui.extensions.min.js"></script>
	<%}else if("jeasyui-extensions".equals(pArr[i])){%>
<script type="text/javascript" src="plug-in/jeasyui-extensions/jquery.jdirk.js"></script>
<link rel="stylesheet" type="text/css" href="plug-in/jeasyui-extensions/base/jeasyui.extensions.base.css">
<script type="text/javascript" src="plug-in/jeasyui-extensions/base/jeasyui.extensions.base.loading.js"></script>
<script type="text/javascript" src="plug-in/jeasyui-extensions/base/jeasyui.extensions.base.tooltip.js"></script>
<script type="text/javascript" src="plug-in/jeasyui-extensions/menu/jeasyui.extensions.menu.js"></script>
<link rel="stylesheet" type="text/css" href="plug-in/jeasyui-extensions/toolbar/jeasyui.extensions.toolbar.css">
<script type="text/javascript" src="plug-in/jeasyui-extensions/toolbar/jeasyui.extensions.toolbar.js"></script>
<script src="plug-in/jeasyui-extensions/selector/common/jeasyui.extensions.dialog.sealed.sample.js"></script>
<script src="plug-in/jeasyui-extensions/selector/common/jeasyui.extensions.selector.base.js"></script>
<script src="plug-in/jeasyui-extensions/selector/jeasyui.extensions.selector.singleDatagrid.js"></script>
<script src="plug-in/jeasyui-extensions/datagrid/jeasyui.extensions.datagrid.getDom.js"></script>
<script src="plug-in/jeasyui-extensions/datagrid/jeasyui.extensions.datagrid.getRowData.js"></script>
<script src="plug-in/jeasyui-extensions/datagrid/jeasyui.extensions.datagrid.getColumnInfo.js"></script>
<script src="plug-in/jeasyui-extensions/datagrid/jeasyui.extensions.datagrid.tooltip.js"></script>
	<%}else if("HTPrint".equals(pArr[i])){%>
<object id="<%=id%>" classid="clsid:179E0EA0-F342-4F20-A30B-EE768D80C2E7" viewastext codebase="plug-in/sino/qzbl/HTPrint.CAB#version=1,0,0,9" width="0" height="0"></object>
	<%}else if("laypage".equals(pArr[i])){%>
	<%}else if("SyntaxHighlighter".equals(pArr[i])){if(null==theme) theme = "Default";%>
<link type="text/css" rel="stylesheet" href="plug-in/SyntaxHighlighter/styles/shCore.css"/>
<link type="text/css" rel="Stylesheet" href="plug-in/SyntaxHighlighter/styles/shTheme<%=theme%>.css"/>
<script type="text/javascript" src="plug-in/SyntaxHighlighter/scripts/shCore.js"></script>
<script type="text/javascript" src="plug-in/SyntaxHighlighter/scripts/shAutoloader.js"></script>
<script type="text/javascript">
   $(function(){
     setTimeout(function(){
        SyntaxHighlighter.autoloader(
           'applescript      plug-in/SyntaxHighlighter/scripts/shBrushAppleScript.js',
           'actionscript3 as3    plug-in/SyntaxHighlighter/scripts/shBrushAS3.js',
           'bash shell       plug-in/SyntaxHighlighter/scripts/shBrushBash.js',
           'coldfusion cf      plug-in/SyntaxHighlighter/scripts/shBrushColdFusion.js',
           'cpp c          plug-in/SyntaxHighlighter/scripts/shBrushCpp.js',
           'obj-c objc       plug-in/SyntaxHighlighter/scripts/shBrushObjC.js',
           'c# c-sharp csharp    plug-in/SyntaxHighlighter/scripts/shBrushCSharp.js',
           'css          plug-in/SyntaxHighlighter/scripts/shBrushCss.js',
           'delphi pascal      plug-in/SyntaxHighlighter/scripts/shBrushDelphi.js',
           'diff patch pas     plug-in/SyntaxHighlighter/scripts/shBrushDiff.js',
           'erl erlang       plug-in/SyntaxHighlighter/scripts/shBrushErlang.js',
           'groovy         plug-in/SyntaxHighlighter/scripts/shBrushGroovy.js',
           'haxe hx        plug-in/SyntaxHighlighter/scripts/shBrushHaxe.js',
           'java         plug-in/SyntaxHighlighter/scripts/shBrushJava.js',
           'jfx javafx       plug-in/SyntaxHighlighter/scripts/shBrushJavaFX.js',
           'js jscript javascript  plug-in/SyntaxHighlighter/scripts/shBrushJScript.js',
           'perl pl        plug-in/SyntaxHighlighter/scripts/shBrushPerl.js',
           'php          plug-in/SyntaxHighlighter/scripts/shBrushPhp.js',
           'text plain       plug-in/SyntaxHighlighter/scripts/shBrushPlain.js',
           'py python        plug-in/SyntaxHighlighter/scripts/shBrushPython.js',
           'ruby rails ror rb    plug-in/SyntaxHighlighter/scripts/shBrushRuby.js',
           'scala          plug-in/SyntaxHighlighter/scripts/shBrushScala.js',
           'sql          plug-in/SyntaxHighlighter/scripts/shBrushSql.js',
           'vb vbnet       plug-in/SyntaxHighlighter/scripts/shBrushVb.js',
           'xml xhtml xslt html  plug-in/SyntaxHighlighter/scripts/shBrushXml.js'
        );
        
        SyntaxHighlighter.all();
     },200);
     
   });
</script>
	<%}else{%>
	<%}%>
<%}%>