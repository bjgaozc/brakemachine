/* 全局变量 begin  */
var orgChoose = {
	config:$.u.cache("orgChoose_config")
};
/* 全局变量 end  */

$(function(){
	if(orgChoose.config.check == "false"){
		$("#confirmBtn").css({"display":"none"});
	}
	if(orgChoose.config.clearBtn){
		$("#clearBtn .l-btn-text").text(orgChoose.config.clearBtn);
	}
	$("#clearBtn").on("click",function(){
		orgChoose.config.clearCallback();
	});
	$("#closeBtn").on("click",function(){
		orgChoose.config.closeCallback();
	});
	$("#confirmBtn").on("click",function(){
		var valArrayStr = "";
		var valArrayId = "";
		var treeObj=$.fn.zTree.getZTreeObj("orgTreeDiv");
		var nodes = treeObj.getCheckedNodes(true);
		if(nodes.length>0){
			for(var i = 0;i< nodes.length;i++){
				if(!orgChoose.config.pvalue){
					if(nodes[i].isParent){
						continue;
					}
				}else{
					if(nodes[i].isParent && nodes[i].check_Child_State != 2){
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
		orgChoose.config.confirmCallback(valArrayStr,valArrayId);
	});
	
});

/**
 * 点击事件
 * 
 * @param {} event
 * @param {} treeId
 * @param {} treeNode
 */
orgChoose.orgClick = function(valArrayId, valArrayStr, treeNode, event, treeId){
	orgChoose.config.callback(valArrayId,valArrayStr,treeNode);
};
