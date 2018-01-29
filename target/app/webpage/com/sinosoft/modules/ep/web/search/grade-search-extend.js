/**
*扩展js   扩展方法 my_*(id)
*/

//国家
function my_jcountry(id){
	$("#"+id).attr("readonly","readonly");
	$("#"+id).bind("click",function(){jCountry($("#"+id));});
	$("#"+id).bind("keydown",function(){jCountry($("#"+id));});
}

//事由
function my_reason(id){
	$('#'+id).combobox({    
	    url:'yqhInvitationLetterController.do?getTypeListByGroup&typegroupcode=reason',    
	    valueField:'typename',    
	    textField:'typename',
	    panelHeight:'200',
	    editable:false
	}); 
}
   		