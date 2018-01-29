<%@tag description="组织机构选择，依赖[common.js]" pageEncoding="UTF-8"%>
<%@attribute name="loadType" description="加载类型[all:默认值，加载所有,dependent:加载依赖,rbr:加载逻辑]"%><%@attribute name="title" description="标题 "%><%@attribute name="url" description="数据URL"%><%@attribute name="id" description="主键 "%><%@attribute name="name" description="名称 "%><%@attribute name="targetType" description="目标类型[1:显示在页面div,2:显示到窗口] "%><%@attribute name="targetId" description="目标主键 "%><%@attribute name="targetName" description="目标名称 "%><%@attribute name="targetOnclickId" description="目标点击主键 "%><%@attribute name="check" description="是否多选，true或false，默认false"%><%@attribute name="pvalue" description="是否父节点也作为选择值，true或false，默认false，只有将check为true时，此项才起作用"%><%@attribute name="onclick" description="点击事件 "%><%@attribute name="optionsCode" description="配置信息"%><%@attribute name="width" description="窗口宽度"%><%@attribute name="height" description="窗口高度"%><%@attribute name="expandAll" description="自动展开"%>
<%
if(null==loadType||"".equals(loadType)) loadType = "all";
if(null==title||"".equals(title)) title = "选择单位";
if(null==url||"".equals(url)) url = "epCommonController.do?getOrgTree=true";
if(null==id||"".equals(id)) id = "org";
if(null==name||"".equals(name)) name = id;
if(null==targetType||"".equals(targetType)) targetType = "3";
if(null==targetId||"".equals(targetId)) targetId = "#orgid";
if(null==targetName||"".equals(targetName)) targetName = "#org";
if(null==targetOnclickId||"".equals(targetOnclickId)) targetOnclickId = targetName;
if(null==optionsCode||"".equals(optionsCode)) optionsCode = "default";
if(null==check || "".equals(check)) check = "false";
if(null==pvalue || "".equals(pvalue)) pvalue = "false";

if(null==width||"".equals(width)) width = "400";
if(null==height||"".equals(height)) height = "400";
if(null==expandAll||"".equals(expandAll)) expandAll = "true";
%>
<%if("all".equals(loadType) || "dependent".equals(loadType)){%>
<link rel="stylesheet" href="plug-in/ztree/css/zTreeStyle/zTreeStyle.css"/>
<script type="text/javascript" src="plug-in/ztree/js/jquery.ztree.core-3.5.js"></script>
<script type="text/javascript" src="plug-in/ztree/js/jquery.ztree.excheck-3.5.js"></script>
<script type="text/javascript" src="plug-in/ztree/js/jquery.ztree.exedit-3.5.js"></script>
<script type="text/javascript">
</script>
<%}%>
<%if("all".equals(loadType) || "rbr".equals(loadType)){%>
<script type="text/javascript">
var <%=id%>;

	<%if("1".equals(targetType)){%>
$(function(){
	<%=id%> = common.initZtree({
		id:"<%=targetId%>",
		url:"<%=url%>&optionsCode=<%=optionsCode%>",
		name:"departname",
		idKey:"id",
		pIdKey:"parentdepartid",
		check:<%=check%>,
		autoExpand:<%=expandAll%>,
		beforeCheck:function(){
			var nodes = <%=id%>.getCheckedNodes(true);
			if(<%=check%> == "false"){
				<%=id%>.checkAllNodes(false);
			}
			
		},
		onClick:function(event, treeId, treeNode){
			var valArrayStr="";
			var valArrayId = "";
			var nodes = <%=id%>.getSelectedNodes();
			if(nodes.length>0){
				for(var i = 0;i< nodes.length;i++){
					if(i == 0){
						valArrayStr= nodes[i].departname;
						valArrayId=nodes[i].id;
					}else{
						valArrayStr += "," + nodes[i].departname;
					}
				}
			}
			<%if(null!=onclick&&!"".equals(onclick)){%>
			<%=onclick%>(valArrayId, valArrayStr, treeNode, event, treeId);			
			<%}%>
		}
	});
	$("<%=targetId%>").addClass("ztree");
	
	setTimeout(function(){
		<%if("true".equals(expandAll)){%>
		<%=id%>.expandAll(true);//单位列表初始化展开全部节点
		<%}%>
		var v = $.u.cache("chooseOrg_value");
		if(v && ""!=v){
			if(<%=check%>){//多选赋值
				var vs = v.split(",");
				for (var i = 0; i < vs.length; i++) {
					var vi = vs[i];
					var node = <%=id%>.getNodeByParam("id", vi, null);
					if(!node.isParent){
						<%=id%>.checkNode(node, true, true);
					}
				}
			}else{
				var node = <%=id%>.getNodeByParam("id", v, null);//单选赋值
				<%=id%>.selectNode(node);	
			}
		}
	},1000);
});
	<%}else if("2".equals(targetType)){%>
$(function(){
	$("<%=targetOnclickId%>").on("click",function(){
		$("#<%=id%>Window").show().window({
			title:"<%=title%>",
			width:"<%=width%>",
		    height:"<%=height%>",
		    shadow:true,
			collapsible:false,
			minimizable:false,
			maximizable:false,
		    modal:true,
		    onOpen: function(){
		    	<%=id%> = common.initZtree({
					id:"#<%=id%>Tree",
					url:"<%=url%>&optionsCode=<%=optionsCode%>",
					name:"departname",
					idKey:"id",
					pIdKey:"parentdepartid",
					check:<%=check%>,
					autoExpand:<%=expandAll%>,
					beforeCheck:function(){
						var nodes = <%=id%>.getCheckedNodes(true);
						if(<%=check%> == "false"){
							<%=id%>.checkAllNodes(false);
						}
					},
					onClick:function(event, treeId, treeNode){
						var valArrayStr="";
						var valArrayId = "";
						var nodes = <%=id%>.getSelectedNodes();
						if(nodes.length>0){
							for(var i = 0;i< nodes.length;i++){
								if(i == 0){
									valArrayStr= nodes[i].departname;
									valArrayId=nodes[i].id;
								}else{
									valArrayStr += "," + nodes[i].departname;
								}
							}
						}
						$("<%=targetId%>").val(valArrayId);
						$("<%=targetName%>").val(valArrayStr);
						$("#<%=id%>Window").window("close");
						$("<%=targetName%>").focus();
						<%if(null!=onclick&&!"".equals(onclick)){%>
						<%=onclick%>(valArrayId, treeNode, event, treeId);			
						<%}%>
					}
				});
				
				setTimeout(function(){
					<%if("true".equals(expandAll)){%>
					<%=id%>.expandAll(true);//单位列表初始化展开全部节点
					<%}%>
					var v = $("<%=targetId%>").val();
					if(v && ""!=v){
						if(<%=check%>){//多选赋值
							var vs = v.split(",");
							for (var i = 0; i < vs.length; i++) {
								var vi = vs[i];
								var node = <%=id%>.getNodeByParam("id", vi, null);
								if(!node.isParent){
									<%=id%>.checkNode(node, true, true);
								}
							}
						}else{
							var node = <%=id%>.getNodeByParam("departname", v, null);
							<%=id%>.selectNode(node);	
						}
					}
				},1000);
		    },
		    tools:[{
		    	iconCls:'fa fa-save',
				handler:function(){
					$("<%=targetId%>").val("");
					$("<%=targetName%>").val("");
					
					var valArrayStr = "";
					var valArrayId = "";
					var nodes = <%=id%>.getCheckedNodes(true);
					if(nodes.length>0){
						for(var i = 0;i< nodes.length;i++){
							if(!<%=pvalue%>){
								if(nodes[i].isParent){
									continue;
								}
							}
							if(valArrayStr == ''){
								valArrayStr= nodes[i].departname;
								valArrayId=nodes[i].id;
							}else{
								valArrayStr += "," + nodes[i].departname;
								valArrayId+= "," + nodes[i].id;
							}
							
						}
					}
					$("<%=targetId%>").val(valArrayId);
					$("<%=targetName%>").val(valArrayStr);
					$("#<%=id%>Window").window("close");
				}
			},{
				iconCls:'icon-redo',
				handler:function(){
					$("<%=targetId%>").val("");
					$("<%=targetName%>").val("");
					$("#<%=id%>Window").window("close");
				}
			}]
        });
	});
});
	<%}else if("3".equals(targetType)){%>
$(function(){
	$("<%=targetOnclickId%>").on("click",function(){
		var v = $("<%=targetId%>").val();
		if(v && ""!=v) $.u.cache("chooseOrg_value",v);
		<%=id%> = common.chooseOrg({
			treeUrl:"<%=url%>",
			optionsCode:"<%=optionsCode%>",
			expandAll:"<%=expandAll%>",
			width:"<%=width%>px",
		    height:"<%=height%>px",
			title:"<%=title%>",
			check:<%=check%>,
			pvalue:<%=pvalue%>,
			clearCallback:function(){
				$("<%=targetId%>").val("");
				$("<%=targetName%>").val("");
				<%=id%>.close();
			},
			closeCallback:function(){
				<%=id%>.close();
			},
			confirmCallback:function(valArrayStr,valArrayId){
				$("<%=targetId%>").val(valArrayId);
				$("<%=targetName%>").val(valArrayStr);
				<%=id%>.close();
			},
			callback:function(orgId,orgName,treeNode){
				//log(treeNode);
				$("<%=targetId%>").val(orgId);
				$("<%=targetName%>").val(orgName);
				$("<%=targetName%>").focus();
				//关闭窗口
				<%=id%>.close();
				<%if(null!=onclick&&!"".equals(onclick)){%>
				<%=onclick%>(orgId, orgName, treeNode);			
				<%}%>
			}
		});
	});
});
	<%}%>
</script>
<div id="<%=id%>Window" style="display: none;">
	<div><div id="<%=id%>TreeSubDivId"><div id="<%=id%>Tree" class="ztree"></div></div></div>
</div>
<%}%>