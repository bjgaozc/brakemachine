<%@tag description="人员选择，依赖[common.js]" pageEncoding="UTF-8"%>
<%@attribute name="loadType" description="加载类型[all:默认值，加载所有,dependent:加载依赖,rbr:加载逻辑]"%><%@attribute name="id" description="主键 "%><%@attribute name="okBtn" description="确定按钮"%><%@attribute name="okBtnIconCls" description="确定按钮icon"%><%@attribute name="callback" description="回调"%><%@attribute name="targetId" description="目标主键 "%><%@attribute name="targetOnclickId" description="目标点击主键 "%><%@attribute name="optionsCode" description="配置信息"%><%@attribute name="expandAll" description="自动展开"%>
<%
if(null==loadType||"".equals(loadType)) loadType = "all";
if(null==id||"".equals(id)) id = "choosePerson";
if(null==okBtn||"".equals(okBtn)) okBtn = "带回";
if(null==okBtnIconCls||"".equals(okBtnIconCls)) okBtnIconCls = "fa fa-send";
if(null==targetId||"".equals(targetId)) targetId = "#personId";
if(null==targetOnclickId||"".equals(targetOnclickId)) targetOnclickId = targetId;
if(null==optionsCode||"".equals(optionsCode)) optionsCode = "default";
if(null==expandAll||"".equals(expandAll)) expandAll = "true";
%>
<script type="text/javascript">
var <%=id%> = null;
$(function(){
	$("<%=targetOnclickId%>").on("click",function(){
		<%=id%> = common.choosePerson({
			okBtn:"<%=okBtn%>",
			okBtnIconCls:"<%=okBtnIconCls%>",
			optionsCode:"<%=optionsCode%>",
			expandAll:"<%=expandAll%>",
			callback:function(userIds,data){
				<%if(null!=callback&&!"".equals(callback)){%>
				<%=callback%>(userIds,data);			
				<%}else{%>
				//log("已选择用户："+userIds);
				//log(data);
				$("<%=targetId%>").val(userIds);
				//关闭窗口
				<%=id%>.close();
				<%}%>
			}
		});
	});
});
</script>