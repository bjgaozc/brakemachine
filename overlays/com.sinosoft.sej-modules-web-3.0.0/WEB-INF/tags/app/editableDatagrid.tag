<%@tag description="可编辑表格，依赖[common.js]" pageEncoding="UTF-8"%>
<%@attribute name="loadType" description="加载类型[all:默认值，加载所有,dependent:加载依赖,rbr:加载逻辑]"%><%@attribute name="id" description="主键 "%><%@attribute name="targetId" description="目标主键 "%><%@attribute name="addBtn" description="添加按钮 "%><%@attribute name="editBtn" description="编辑按钮 "%><%@attribute name="saveBtn" description="保存按钮 "%><%@attribute name="deleteBtn" description="删除按钮 "%><%@attribute name="callback" description="回调"%>
<%
if(null==loadType||"".equals(loadType)) loadType = "all";
if(null==id||"".equals(id)) id = "dg";
if(null==targetId||"".equals(targetId)) targetId = "#"+id;
if(null==addBtn||"".equals(addBtn)) addBtn = "#"+id+"_btn_add";
if(null==editBtn||"".equals(editBtn)) editBtn = "#"+id+"_btn_edit";
if(null==saveBtn||"".equals(saveBtn)) saveBtn = "#"+id+"_btn_save";
if(null==deleteBtn||"".equals(deleteBtn)) deleteBtn = "#"+id+"_btn_delete";
%>
<script type="text/javascript">
$(function(){
	common.initEditableDatagrid({
		id:"<%=targetId%>",
		onClickRowToEdit:false,
		addBtn:"<%=addBtn%>",
		addBtnOnClick:null,
		editBtn:"<%=editBtn%>",
		editBtnOnClick:null,
		saveBtn:"<%=saveBtn%>",
		saveBtnOnClick:null,
		deleteBtn:"<%=deleteBtn%>",
		deleteBtnOnClick:null,
		callback:function(data){
			<%if(null!=callback&&!"".equals(callback)){%>
			<%=callback%>(data);			
			<%}else{%>
			//log(data);
			<%}%>
		}
	});
});
</script>