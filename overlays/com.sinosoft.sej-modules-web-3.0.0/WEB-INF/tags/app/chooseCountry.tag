<%@tag description="选择国家，依赖[baseCommon.js]" pageEncoding="UTF-8"%>
<%@attribute name="loadType" description="加载类型[all:默认值，加载所有,dependent:加载依赖,rbr:加载逻辑]"%><%@attribute name="type" description="类型[1:jCountry,2:使用easyui组件]"%><%@attribute name="name" description="名称 "%><%@attribute name="id" description="主键 "%><%@attribute name="value" description="值 "%><%@attribute name="title" description="标题 "%><%@attribute name="targetId" description="目标主键 "%><%@attribute name="targetOnclickId" description="目标点击主键 "%><%@attribute name="multiple" description="多选，默认false[true:多选,false:单选] "%>
<%
if(null==loadType||"".equals(loadType)) loadType = "all";
if(null==type||"".equals(type)) type = "1";
if(null==name||"".equals(name)) name = "chooseCountry";
if(null==id||"".equals(id)) id = name;
if(null==value||"".equals(value)) value = "";
if(null==title||"".equals(title)) title = name;
if(null==targetId||"".equals(targetId)) targetId = "#country";
if(null==targetOnclickId||"".equals(targetOnclickId)) targetOnclickId = targetId;
if(null==multiple||"".equals(multiple)) multiple = "false";
%>
<%if("all".equals(loadType) || "dependent".equals(loadType)){%>
	<%if("1".equals(type)){%>
<script type="text/javascript" src="plug-in/sino/jCountry.js"></script>
	<%}else if("2".equals(type)){%>
	<%}%>
<%} if("all".equals(loadType) || "rbr".equals(loadType)){%>
	<%if("1".equals(type)){%>
<script type="text/javascript">
$(function(){
	$("<%=targetOnclickId%>").on("click",function(){
		<%if("true".equals(multiple)){%>
		jCountry($("<%=targetId%>")[0],true,true);
		<%}else{%>
		jCountry($("<%=targetId%>")[0],false,false);
		<%}%>
	});
});
</script>
	<%}else if("2".equals(type)){%>
<script type="text/javascript">
$(function(){
});
</script>
	<%}%>
<%}%>