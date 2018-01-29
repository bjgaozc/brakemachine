<%@tag description="Ntko Office中间件，使用之前，先设置 template 的 type=ntko；依赖[baseCommon.js]" pageEncoding="UTF-8"%>
<%@attribute name="loadType" description="加载类型[all:默认值，加载所有,dependent:加载依赖,rbr:加载逻辑]"%><%@attribute name="id" description="主键"%><%@attribute name="objId" description="obj主键"%><%@attribute name="targetId" description="目标主键"%><%@attribute name="callback" description="回调函数 "%><%@attribute name="caption" description="控件标题"%><%@attribute name="forOnSaveToURL" description="forOnSaveToURL"%><%@attribute name="forOnBeginOpenFromURL" description="forOnBeginOpenFromURL"%><%@attribute name="forOndocumentopened" description="forOndocumentopened"%><%@attribute name="forOnFileCommand" description="forOnFileCommand"%>
<%
if(null==id) id="TANGER_OCX_OBJ";
if(null==objId) objId="TANGER_OCX";
if(null==targetId) targetId="officecontrol";
if(null==caption) caption="在线编辑文档";
if(null==forOnSaveToURL) forOnSaveToURL="";
if(null==forOnBeginOpenFromURL) forOnBeginOpenFromURL="";
if(null==forOndocumentopened) forOndocumentopened="";
if(null==forOnFileCommand) forOnFileCommand="FileCommand";
%>
<script type="text/javascript" src="${pageContext.request.contextPath}/plug-in/officecontrol/ntkoofficecontrol.js"></script>
<script type="text/javascript">
var <%=id%>;
function <%=id%>_Init(){
	initNtkoOfficecontrol({
		id:"<%=id%>",
		targetId:"<%=targetId%>",
		forOnSaveToURL:"<%=forOnSaveToURL%>",
		forOnBeginOpenFromURL:"<%=forOnBeginOpenFromURL%>",
		forOndocumentopened:"<%=forOndocumentopened%>",
		forOnFileCommand:"<%=forOnFileCommand%>"
	});
	<%=id%>=document.getElementById("<%=objId%>");
	<%=id%>.activate(true);
	if(window.navigator.platform=="Win64"){
		<%=id%>.AddDocTypePlugin(".pdf","PDF.NtkoDocument","4.0.0.2","${pageContext.request.contextPath}/plug-in/officecontrol/ntkooledocallx64.cab",51,true);	
	}else{
		<%=id%>.AddDocTypePlugin(".tif","tif.NtkoDocument","4.0.0.2","${pageContext.request.contextPath}/plug-in/officecontrol/ntkooledocall.cab",51,true);
	  	<%=id%>.AddDocTypePlugin(".pdf","PDF.NtkoDocument","4.0.0.2","${pageContext.request.contextPath}/plug-in/officecontrol/ntkooledocall.cab",51,true);
	}
	
	<%=id%>.Caption = "<%=caption%>";
	
	//<%=id%>.CreateNew("Word.Document");
	//<%=id%>.CreateNew("eioffice.document");
	//<%=id%>.BeginOpenFromURL("a.doc");
	//<%=id%>.BeginOpenFromURL("b.docx");
	
	<%if(null==callback||"".equals(callback)){%>
	<%}else{%>
		<%=callback%>(<%=id%>);
	<%}%>
}
window.onload = <%=id%>_Init;
</script>