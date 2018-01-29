/**
 * 根据汉字度拼音
 * 
 * @param word
 * @param sId
 * @param n
 */
function getPinyinByAjax(word,sId,n,wordCode) {
	if(word != "") {
		try {
			$.ajax({
				type : "POST" ,
				url : "epBiPersonController.do?getPinyin",
				data : {"word" : word},
				dataType : "json",
				success : function(j) {
					initCombobox(sId, j.obj);//给下拉动态填值
					$('#'+sId).combobox("setValue",j.obj[0].id);
					if(j.obj.length > 1) {
//							$.messager.alert("提示","请选择多音字！","info");
					}
				}
			});
		} catch(e) {
			$.messager.alert("提示",e,"info");
		}
	}
}
	
/**
 * 根据人员姓名查询人员拼音
 * @param vName
 * @param n
 * @returns
 */
function makeUserName(vName ,n) {
	if(n == "") {
		$("#" + vName).val($("#" + vName).val() + "·") ;
		getPinyinByAjax($("#xing").val() ,"xPinYin" ,"teleCodeXing" ,0) ;
	} else {
		$("#" + vName).val("·" + $("#" + vName).val()) ;
		getPinyinByAjax($("#ming").val() ,"mPinYin" ,"teleCodeName" ,1) ;
	}
}

/**
 * 检验身份证，回填数据
 */	
function checkPersonIdCard(IdCard){
		validateIdCard(IdCard);
		var list=getBirthdayAndSexByIdCard(IdCard);
		$('#birthday').val(list.birthday);
		log(list.sex);
		$("#sex").combobox('setValue',list.sex);
		//common.validateIdCard(IdCard);   此方法暂时有问题 
	//var list=common.showbirthday(IdCard);
}