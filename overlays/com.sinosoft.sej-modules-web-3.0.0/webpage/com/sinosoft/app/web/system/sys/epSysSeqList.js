
/**
 * 前缀格式化
 * 
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