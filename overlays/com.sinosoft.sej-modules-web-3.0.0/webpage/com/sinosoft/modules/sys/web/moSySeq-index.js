/**
 * 前缀格式化
 * 
 * <pre><pre>
 * @author cmh
 * @since 2016-8-27 下午4:50:33
 * @version 1.0
 * @param value
 * @param rec
 * @param index
 * @returns
 */
function prefixFormatter(value,rec,index){
	value = value.replace("_seq_p1","当前年缩写");
	value = value.replace("_seq_p2","当前年");
	value = value.replace("_seq_p3","当前年月");
	value = value.replace("_seq_p4","当前年月日");
	value = value.replace("_seq_p5","当前月");
	value = value.replace("_seq_corpCode","外事机关编码");
	value = value.replace("_seq_loginUserUnit","当前登录用户所属单位编码");
	return value;
}

/**
 * 初始化格式
 * 
 * <pre><pre>
 * @author cmh
 * @since 2016-8-27 下午4:56:21
 * @version 1.0
 * @param id
 * @param type
 */
function initPrefixCombobox(id, type){
	initCombobox(id,[
		{id:"_seq_p1",text:"当前年缩写"},
		{id:"_seq_p2",text:"当前年"},
		{id:"_seq_p3",text:"当前年月"},
		{id:"_seq_p4",text:"当前年月日"},
		{id:"_seq_p5",text:"当前年月日"},
		{id:"yyyy-MM-dd",text:"yyyy-MM-dd"},
		{id:"{uuid}",text:"UUID"},
	]);
}

/**
 * 同步流水
 * 
 * <pre><pre>
 * @author cmh
 * @since 2016-8-27 下午10:02:28
 * @version 1.0
 * @param title
 * @param url
 * @param id
 */
function syncSeq(title, url, id){
	var s = $("#"+id).datagrid("getSelected");
	if(!s){
		tip("请先选择流水号");
		return;
	}
	var r = ajax("moSySeqController.do?syncSeq",{nameEn:s.nameEn});
	if(r.success){
		tip(r.msg);
	}else{
		artError(r.msg);
	}
}


