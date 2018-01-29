window.onerror = killErrors;

/**
 * 去掉左右空格
 * 
 * @return {}
 */
String.prototype.trim = function(){ 
	return this.replace(/(^\s*)|(\s*$)/g, ""); 
}

/**
 * 替换字符串
 */
String.prototype.replaceAll = function(reallyDo, replaceWith, ignoreCase) {
    if (!RegExp.prototype.isPrototypeOf(reallyDo)) {
        return this.replace(new RegExp(reallyDo, (ignoreCase ? "gi": "g")), replaceWith);
    } else {
        return this.replace(reallyDo, replaceWith);
    }
}

/**
 * 字符串开始
 */
String.prototype.startWith=function(s){
	if(s==null||s==""||this.length==0||s.length>this.length)
		return false;
	if(this.substr(0,s.length)==s)
	    return true;
	else
	    return false;
	return true;
}

String.prototype.endWith = function(s){
	if(s==null||s==""||this.length==0||s.length>this.length)
		return false;
	if(this.substring(this.length-s.length)==s)
	    return true;
	else
		return false;
	return true;
}

/**
 * 去掉左右空格
 * 
 * @return {}
 */
String.prototype.trim = function(){ 
	return this.replace(/(^\s*)|(\s*$)/g, ""); 
}

/**
 * 去掉左空格
 * 
 * @return {}
 */
String.prototype.ltrim = function(){ 
	return this.replace(/(^\s*)/g, ""); 
}

/**
 * 去掉右空格
 * 
 * @return {}
 */
String.prototype.rtrim = function(){ 
	return this.replace(/(\s*$)/g, ""); 
}

/**
 * 按序号删除
 * 
 * @param {} dx
 * @return {Boolean}
 */
Array.prototype.remove = function(dx) {
	if (isNaN(dx) || dx > this.length) {
		return false;
	}
	for (var i = 0, n = 0; i < this.length; i++) {
		if (this[i] != this[dx]) {
			this[n++] = this[i]
		}
	}
	this.length -= 1
}

/**
 * 删除数组中的某个元素，n为数组元素下标
 * @author ZhaoYuJie
 */
Array.prototype.del=function(n) {
	//n表示第几项，从0开始算起。
	//prototype为对象原型，注意这里为对象增加自定义方法的方法。
  	if(n<0)  //如果n<0，则不进行任何操作。
    	return this;
  	else
    	return this.slice(0,n).concat(this.slice(n+1,this.length));
    	
    /*
      concat方法：返回一个新数组，这个新数组是由两个或更多数组组合而成的。
      　　　　　　这里就是返回this.slice(0,n)/this.slice(n+1,this.length)
     　　　　　　组成的新数组，这中间，刚好少了第n项。
      slice方法： 返回一个数组的一段，两个参数，分别指定开始和结束的位置。
    */
}

/**
 * 创建XMLHttpRequest对象
 */
function createXMLHttpRequest() {
	var XMLHttpReq;
	try{
		// Firefox, Opera 8.0+, Safari
		XMLHttpReq=new XMLHttpRequest();
		return XMLHttpReq;
	}catch (e){
		// Internet Explorer
		try{
		   XMLHttpReq=new ActiveXObject("Msxml2.XMLHTTP");
		   return XMLHttpReq;
		}catch (e){
			try{
				XMLHttpReq=new ActiveXObject("Microsoft.XMLHTTP");
				return XMLHttpReq;
			}catch (e){
				alert("您的浏览器不支持AJAX！");
				return false;
			}
	    }
	}
	return XMLHttpReq;
}

/**
 * ajax调用的通用方法
 * 
 * @author zhaoyujie
 * @param requestMethod：post或get
 * @param url：url
 * @param requestMode：true为异步，false为同步
 * @param responseMethod：响应函数
 * @return
 */
function ajaxInvocation(requestMethod,url,requestMode,responseMethod){
	var XMLHttpReq = createXMLHttpRequest(); //调用创建对象方法
	XMLHttpReq.open(requestMethod,url,requestMode);
	XMLHttpReq.onreadystatechange = responseMethod;//指定响应函数调用
	XMLHttpReq.setRequestHeader("If-Modified-Since","0");
	XMLHttpReq.send(null);//发送请求
}

/**
 * 去掉空格
 */
function trim(str){  
    // 用正则表达式将前后空格 ,用空字符串替代。
    return str.replace(/(^\s*)|(\s*$)/g, "");  
}

//function closeRclick(){ 
//if(event.button==2){ 
//} 
//}

//document.onmousedown=closeRclick 
//document.oncontextmenu = function() {
//alert("禁止右键！");
//event.returnValue = false;
//}

/**
 * 处理错误
 */
function killErrors(msg,url,line) {
//	if(window.top.$.dialog){
//		var html = "错误内容：<span style='color:red'>" + msg + "</span><br>"
//			+"错误文件: <b>" + url + "</b><br>"
//			+"错误行: <b>" + line + "</b><br>";
//		window.top.$.dialog({
//		    title:'错误',
//		    content:html,
//		    icon:'error.gif',
//		    zIndex:100000
//		});
//	}else{
//		var html = "错误内容：" + msg + "\n"
//		+"错误文件: " + url + "\n"
//		+"错误行: " + line + "\n";
//		alert(html);
//	}
	return false; 
}

/**
 * 检查文本字符
 */
function checkAlltext(text){   
	if(/^[^\|"<>]*$/.test(text)){  
        return true;   
	}else{
		alert("对不起，您不能输入非法字符！如'<>");
		return false;
	}
}

/**
 * 检查文本字符
 */
function checkAlltext2(text){   
	if(/^[^\|"<>]*$/.test(text)){  
         return false; 
	}else{
		//alert("对不起，您不能输入非法字符！如'<>");
		return true; 
	}
}

/**
 * 编码字符串
 */
function decodeStr(str){
	var s="";
	if(str!=""){
		s=decodeURIComponent(str);
	}             
	return s;
}

/**
 * 替换字符串
 */
function replace(str,a,b){
     var i;
     var s2 = str;
     
     while(s2.indexOf(a)>0){
    	 i = s2.indexOf(a);
    	 s2 = s2.substring(0, i) + b + s2.substring(i + 1, s2.length);
     }
     return s2;
}

/**
 * 关闭窗口
 */
function winclose(){
	window.close();
}

/**
 * 检查日期
 */
function checkDate(sDateStr, eDateStr){
	var BT = new Date(sDateStr.substring(0,4),sDateStr.substring(5,7),sDateStr.substring(8,10),"00","00","00");   
    var ET = new Date(eDateStr.substring(0,4),eDateStr.substring(5,7),eDateStr.substring(8,10),"00","00","00"); 
    if(BT>ET){
    	alert("开始时间大于结束时间，请重新选择！");
	    return false;
    }else{
   	    return true;
    }
}

/**
 * 检查日期
 * 1--按照年，2--按照月
 */
function checkDate02(sDateStr,id){
	 var now = new Date();
     var today = new Date(now.getYear(),now.getMonth()+1,now.getDate());
     var  BT;
	 if(eval(id)==1) {
		 BT=new   Date(sDateStr.substring(0,4),"00","00","00","00","00");
	 }else if(eval(id)==2){
		 BT   =   new   Date(sDateStr.substring(0,4),sDateStr.substring(5,7),"00","00","00","00");
	 }
     if(BT>today){
    	 alert("选择的日期不应大于当前日期，请重新选择！");
    	 return false;
     }else{
    	 return true;
     }
}

/**
 * 根据正则表达式检查日期是否合法<br>
 * yyyy-mm-dd
 * 
 * @param id
 * @returns {Boolean}
 */
function checkDateByReg(id) {
	var s = document.getElementById(id).value;
	if (undefined==s || null==s || ""==s) {
		return false;
	}
	if(s.length==8){
		var y = s.substring(0,4);
		var m = s.substring(4,6);
		var d = s.substring(6,8);
		s = y+"-"+m+"-"+d;
		document.getElementById(id).value=s;
	}
	var reg = /^(?:(?!0000)[0-9]{4}-(?:(?:0[1-9]|1[0-2])-(?:0[1-9]|1[0-9]|2[0-8])|(?:0[13-9]|1[0-2])-(?:29|30)|(?:0[13578]|1[02])-31)|(?:[0-9]{2}(?:0[48]|[2468][048]|[13579][26])|(?:0[48]|[2468][048]|[13579][26])00)-02-29)$/;
	if (!s.match(reg)) {
		return false;
	} else {
		return true;
	}
}

/**
 * 检查文本框内容的长度
 */
function checkcharNum(id){
	var inputObj=document.getElementById(id);
	if(inputObj.value.length>100){
		inputObj.value=inputObj.value.substring(0,100);
	}
}

/**
 * 隐藏元素
 */
function hideElements(num){   
	var n = eval(num);   
	var elms = document.getElementsByTagName("select");   
	for(var j=0;   j<elms.length;   j++){   
		if(n == 0){	    
			elms[j].style.visibility   =   "hidden";   
		}else if(n == 1){
			elms[j].style.visibility   =   "visible"; 
		}
	}   
}

/**
 * 获得选项
 */
function getObjItems(objID,ElementName){
	var obj=document.getElementById(objID);
	var elms = obj.getElementsByTagName(ElementName);   
	return elms.length;  
}

/**
 * 日期验证
 */
function dateValidate(str){
	//return str.match(/^(?:(?:1[6-9]|[2-9]\d)?\d{2}[\/\-\.](?:0?[1,3-9]|1[0-2])[\/\-\.](?:29|30))(?: (?:0?\d|1\d|2[0-3])\:(?:0?\d|[1-5]\d)\:(?:0?\d|[1-5]\d)(?: \d{1,3})?)?$|^(?:(?:1[6-9]|[2-9]\d)?\d{2}[\/\-\.](?:0?[1,3,5,7,8]|1[02])[\/\-\.]31)(?: (?:0?\d|1\d|2[0-3])\:(?:0?\d|[1-5]\d)\:(?:0?\d|[1-5]\d)(?: \d{1,3})?)?$|^(?:(?:1[6-9]|[2-9]\d)?(?:0[48]|[2468][048]|[13579][26])[\/\-\.]0?2[\/\-\.]29)(?: (?:0?\d|1\d|2[0-3])\:(?:0?\d|[1-5]\d)\:(?:0?\d|[1-5]\d)(?: \d{1,3})?)?$|^(?:(?:16|[2468][048]|[3579][26])00[\/\-\.]0?2[\/\-\.]29)(?: (?:0?\d|1\d|2[0-3])\:(?:0?\d|[1-5]\d)\:(?:0?\d|[1-5]\d)(?: \d{1,3})?)?$|^(?:(?:1[6-9]|[2-9]\d)?\d{2}(?:0[1-9]|1[0-2])(?:0[1-9]|[12][0-9]|3[01]))(?: (?:0?\d|1\d|2[0-3])\:(?:0?\d|[1-5]\d)\:(?:0?\d|[1-5]\d)(?: \d{1,3})?)?$/);
	//return str.match(/^((((1[6-9]|[2-9]\d)\d{2})-(0?[13578]|1[02])-(0?[1-9]|[12]\d|3[01]))|(((1[6-9]|[2-9]\d)\d{2})-(0?[13456789]|1[012])-(0?[1-9]|[12]\d|30))|(((1[6-9]|[2-9]\d)\d{2})-0?2-(0?[1-9]|1\d|2[0-8]))|(((1[6-9]|[2-9]\d)(0[48]|[2468][048]|[13579][26])|((16|[2468][048]|[3579][26])00))-0?2-29-))$/);
	return str.match(/^((^((1[8-9]\d{2})|([2-9]\d{3}))([-\/\._])(10|12|0?[13578])([-\/\._])(3[01]|[12][0-9]|0?[1-9])$)|(^((1[8-9]\d{2})|([2-9]\d{3}))([-\/\._])(11|0?[469])([-\/\._])(30|[12][0-9]|0?[1-9])$)|(^((1[8-9]\d{2})|([2-9]\d{3}))([-\/\._])(0?2)([-\/\._])(2[0-8]|1[0-9]|0?[1-9])$)|(^([2468][048]00)([-\/\._])(0?2)([-\/\._])(29)$)|(^([3579][26]00)([-\/\._])(0?2)([-\/\._])(29)$)|(^([1][89][0][48])([-\/\._])(0?2)([-\/\._])(29)$)|(^([2-9][0-9][0][48])([-\/\._])(0?2)([-\/\._])(29)$)|(^([1][89][2468][048])([-\/\._])(0?2)([-\/\._])(29)$)|(^([2-9][0-9][2468][048])([-\/\._])(0?2)([-\/\._])(29)$)|(^([1][89][13579][26])([-\/\._])(0?2)([-\/\._])(29)$)|(^([2-9][0-9][13579][26])([-\/\._])(0?2)([-\/\._])(29)$))$/);
}

/**
 * 替换
 */
function myReplace(str,oldReplaceText,newReplaceText){
	var temp=str.split("");
	 for(var tt=0;tt<temp.length;tt++){
		 if(temp[tt]==oldReplaceText){
			 temp[tt]=newReplaceText;
		 }
	 }
	return temp.join("");
}

/**
 * 移除子元素
 */
function removeChildAll(elm) {
	var child;
	while (child = elm.childNodes[0]) {
		elm.removeChild(child);
	}
}

/**
 * URL编码
 */
function myEncodeURl(str){
	var s=encodeURIComponent(str);
	return encodeURIComponent(s);
}

/**
 * 判断是否是数字
 * @param n
 * @return
 */
function isNum(n){
  var trun=isNaN(n);
  if(trun){
	  return false;
  }else{
	  return true;
  }
}

/**
 * 回车跳到下一个，类似tab键
 */
function next(){
	if(event.keyCode==13){
		event.keyCode=9;
	}
}

/**
 * 返回XML中每个节点的数据信息
 * 
 * @param xmlNodes  XML节点
 * @return 数组
 */
function getReturnDataFromXML(xmlNodes) {
	var textArray = new Array();
	for ( var i = 0; i < xmlNodes.length; i++) {
		var node = xmlNodes.item(i);
		var nodetwo = node.text||node.textContent;
		textArray[i] = nodetwo?nodetwo:'';
	}
	return textArray;
}

/**
 * @param value：要检查的值
 * @param msg：alert的信息
 * @return：true为空，false为非空
 */
function checkIsNull(value,msg){
	var tempValue=stringtrim(value);
	if(tempValue==""||tempValue==null){
		alert(msg);
		return true;
	}
	return false;
}

/**
 * 自定义endsWith
 * @param s
 * @param s0
 * @return
 */
function endsWith(s,s0){
	if(s) return (s.substring(s.length-s0.length)==s0);
}

/**
* 将输入日期赋给另一个日期
* @param   param1 日期1
* @param   param2 日期2
**/
function  issuedvalid(param1,param2){
	if((document.getElementById(param1).value)!=null&&dateValidate(document.getElementById(param1).value)!=null){
		document.getElementById(param2).value=document.getElementById(param1).value;
	}
}

/**
 * @author zhaoyujie
 * @param xmldom是返回的xml
 * @param tagNameForTable是后台输出包含table内容的标签
 * @param theTableId是jsp页面中的table（或tbody）的id
 */
function createTableByXML(xmldom,tagNameForTable,theTableId){
	var theTable=document.getElementById(theTableId);
	var tagNameForTable=xmldom.getElementsByTagName(tagNameForTable);
	clearList(theTable);
	for(var i=0;i<tagNameForTable.length;i++){
		var myArray=new Array();	//存放一行记录
		for(var j=0;j<tagNameForTable[i].childNodes.length;j++){	//一行记录有tagNameForTable.childNodes.length个字段
			if(tagNameForTable[i].childNodes[j].childNodes[0]!=null&&tagNameForTable[i].childNodes[j].childNodes[0].nodeValue!="null"){
				myArray.push(tagNameForTable[i].childNodes[j].childNodes[0].nodeValue);
			}else{
				myArray.push("");	
			}
		}
		addList(theTable,myArray);
	}
}

/**
 * @author zhaoyujie
 * @param theTable
 * @param myArray
 * @return
 */
function addList(theTable,myArray){
	var mytr=theTable.insertRow();
	for(var i=0;i<myArray.length;i++){
		var mytd=document.createElement("<td align='center'>");
		mytd.innerHTML=myArray[i];
		mytr.appendChild(mytd);
	}
}

/**
 * 清除列表
 */
function clearList(theTable){
	for(var i=theTable.rows.length-1;i>=0;i--){
		theTable.deleteRow(i);
	}
}

/**
 * 该函数是使按钮由不可使用变为可使用
 * @author 王宪良
 */
function buttonDisabled(param){
	document.getElementById(param).disabled=false;
}

/**
* @author 王宪良
* 改函数返回select选中的Value值
* @param   selectid    select选择框的id值
* @return  value       select选中的Value值
**/
function getSelect(selectid){
  var issuedbyID=document.getElementById(selectid).options;
  var selectValue;	
  for(var j=0,n=issuedbyID.length ;j<n;j++){
	  if(issuedbyID[j].selected==true){
		  selectValue=issuedbyID[j].text;
	  }
  }
  return selectValue;
}

/**
 *  @author  王宪良 
 *  该函数判断所传字符串是否为空，如果为空则传回一个null值
 **/
function  stringReturn(paramString){
	if(paramString!=""){
		return paramString;
	}else{
		return "null";
	}
}

/**
* @author 王宪良 
* 该函数是从页面中将隐藏的select选框得到，然后输出到弹出的DIV中
* param   selectId  页面中select选框的Id名字  createSelectId 新创建的select选框Id名字 
*         styleWidth创建select选框的选择框大小，createCorp 选择框初始默认选择的名称
*		  createDivId  将选择框放入的DIV名称，divObj 将生成的DIV放入到页面中DIV的名称
*  
**/
function getSelectObj(selectId,createSelectId,styleWidth,createCorp,createDivId,divObj){
	var passportTypeSelect =document.getElementById(selectId).options;
	var issuedbySelectObj=document.createElement("select");
	issuedbySelectObj.setAttribute("id",createSelectId);
	issuedbySelectObj.style.width=styleWidth;
	for(var i=0;i<passportTypeSelect.length;i++){
	   var value=passportTypeSelect[i].value;
	   var text=passportTypeSelect[i].text;
	   var isop=new Option(text,value);
	   if(createCorp!=""){
			if(passportTypeSelect[i].value==createCorp){
				 isop.selected=true;
			}
	   }
	   issuedbySelectObj.options.add(isop);
	} 
	var issuedbyfilldiv = document.createElement("div");
	issuedbyfilldiv.setAttribute("id",createDivId);
	issuedbyfilldiv.style.zIndex = "10009";
	issuedbyfilldiv.appendChild(issuedbySelectObj);
	var issuedbydivObj=document.getElementById(divObj);
	issuedbydivObj.appendChild(issuedbyfilldiv);
}

/**
 * 是否是时间字符串
 */
function isDateTimeString(str){
  if(str.length == 0 ) return true ;
  var a = str.match(/^((\d{2}(([02468][048])|([13579][26]))[\-\/\s]?((((0?[13578])|(1[02]))[\-\/\s]?((0?[1-9])|([1-2][0-9])|(3[01])))|(((0?[469])|(11))[\-\/\s]?((0?[1-9])|([1-2][0-9])|(30)))|(0?2[\-\/\s]?((0?[1-9])|([1-2][0-9])))))|(\d{2}(([02468][1235679])|([13579][01345789]))[\-\/\s]?((((0?[13578])|(1[02]))[\-\/\s]?((0?[1-9])|([1-2][0-9])|(3[01])))|(((0?[469])|(11))[\-\/\s]?((0?[1-9])|([1-2][0-9])|(30)))|(0?2[\-\/\s]?((0?[1-9])|(1[0-9])|(2[0-8]))))))(\s((([0-9]|[0-1][0-9]|[2][0-3]))\:([0-9]|[0-5][0-9])(()|(\:([0-9]|[0-5][0-9])))))?$/);
  if (a == null) { return false;}
  if (a[1]>24 || a[3]>60 || a[4]>60){
    //alert("时间格式不对");
    return false
  }
  return true;
}

/**
 * 下拉框快捷键
 */
function selectLoop(select){
	var optionIndex = select.selectedIndex;
	if (optionIndex == 0){
		if (event.keyCode==38){
			select[select.length-1].selected = true;
			event.keyCode=40
		}
	}else if (optionIndex == select.length-1){
		if (event.keyCode==40){//下
			select[0].selected = true;
			event.keyCode=38
		}
	}
	if(event.keyCode==13){
		event.keyCode=9;
	}
}

/**
 * 获取下拉框的值
 */
function getSelectValue(selectid){
	var issuedbyID=document.getElementById(selectid).options;
  	var selectValue;	
  	for(var j=0,n=issuedbyID.length ;j<n;j++){
  		if(issuedbyID[j].selected==true){
  			selectValue=issuedbyID[j].value;
		}
  	}
  	return  selectValue;
}

/**
 * 打开窗口
 * 
 * @param {String} url 地址
 * @param {String} w 宽度
 * @param {String} h 高度
 */
function openViewWindow(url,w,h){
	var l=(screen.width-w)/2; 
	var t=(screen.height-h)/2;
   	var s = 'width=' + w + ', height=' + h + ', top=' + t + ', left=' + l; 
   	s += ',status=no,scrollbars=yes,toolbar=no,menubar=no,location=no,resizable=yes'; 
	window.open(url,null,s);
}

/**
 * 弹出窗口 需要jquery,用到了 styles/css.css 里面的 #myAlert
 * 
 * @param {String} msg 提示信息(不能太长)
 */
function myAlert2(msg){
	$('<div id="myAlert"></div>').appendTo("body"); ;
	if(!$("#myAlert").is(':visible')){
		$("#myAlert").replaceWith('<div id="myAlert"><div style="text-align: center;color:red;font-size: 12px;padding-top:20px;">'+msg+'</div></div>');
		$("#myAlert").css({display:"block",top:"-100px"}).animate({top:'+=100'},500,function(){setTimeout('out()',500);});
	}
}
/**
 * 弹出窗口辅助函数
 */
function out(){
	$("#myAlert").animate({top:'-=100'},2000,function(){jQuery(this).css({display:"none",top:"-100px"});});
}

/**
 * 全选和取消全选
 * 
 * @param {} chc
 * @param {} fxk
 */
function selectAll(chc,fxk){
	var fuXuanKuang=document.getElementsByName(fxk);
	if(chc.checked){
		for(var i=0;i<fuXuanKuang.length;i++){
			fuXuanKuang[i].checked=true;
		}

	}else{
		for(var i=0;i<fuXuanKuang.length;i++){
			fuXuanKuang[i].checked=false;
		}
	}
}

/**
 * 选中所有选项
 * 
 * @param {} selectObjName
 */
function selectAllItems(selectObjName){
	jQuery("select[name='"+selectObjName+"'] option").each(function(){
		jQuery((this)).attr("selected","selected");
	});
}

/**
 * 监听回车事件
 * 
 * @param {} event
 * @param {} funName 要调用的方法的名称
 */
function onEnterKeyDown(event, funName) {
	if (event.keyCode == 13) {
		//event.keyCode=0;   //取消回车
		var funNameStr = funName+"()";
		setTimeout(funNameStr,100);
	}
}

/**
 * Input框里的灰色提示，使用前先引入jquery
 * <br>使用方法：&lt;input type=&quot;text&quot; tipMsg=&quot;例如：用户名&quot;&nbsp;&nbsp; /&gt;
 * 
 * @return
 */
function inputTipText(){ 
	$("input[tipMsg]").each(function(){
		if($(this).val() == ""){
			var oldVal=$(this).attr("tipMsg");
		if($(this).val()==""){$(this).attr("value",oldVal).css({"color":"#888"});}
		$(this)
		   .css({"color":"#888"})     //灰色
		   .focus(function(){
		    if($(this).val()!=oldVal){$(this).css({"color":"#000"})}else{$(this).val("").css({"color":"#888"})}
		   })
		   .blur(function(){
		    if($(this).val()==""){$(this).val(oldVal).css({"color":"#888"})}
		   })
		   .keydown(function(){$(this).css({"color":"#000"})});
		}
	});
}

/**
 * 通过国际化日期获得格式化日期
 * @param fullDate  格式为国际化日期 "Sat Jan 12 2008 01:00:00" 
 * @example 
 * @param type 没有输入该参数默认为yyyy-MM-dd；1：yyyy年MM月dd日；2:yyyy/MM/dd
 * @return
 */
function getFormateDate(fullDate,type){
	
	var rtnDate = "";
   try{
	   if(fullDate == undefined || null == fullDate || fullDate == "" || fullDate == "null"){
		   return rtnDate;
	   }
	   var tempDate = new Date(fullDate);
	   
	   if(type == undefined || type == null || type == ""){
		   rtnDate =  tempDate.getFullYear() +"-";
		   if(tempDate.getMonth() < 9){
			   rtnDate +=  "0" + eval(tempDate.getMonth()+1)+"-"
		   }else{
			   rtnDate +=  eval(tempDate.getMonth()+1)+"-"
		   }
	
		   if(tempDate.getDate() <10){
			   rtnDate +=  "0" + tempDate.getDate()
		   }else{
			   rtnDate +=  tempDate.getDate()
		   }
	   }else{
		   if(type == "1"){

			   rtnDate =  tempDate.getFullYear() +"-";
			   if(tempDate.getMonth() < 10){
				   rtnDate +=  "0" + eval(tempDate.getMonth()+1)+"年"
			   }else{
				   rtnDate +=  eval(tempDate.getMonth()+1)+"月"
			   }
		
			   if(tempDate.getDate() <10){
				   rtnDate +=  "0" + tempDate.getDate()
			   }else{
				   rtnDate +=  tempDate.getDate()+"日";
			   }
		   }else if(type == "2"){
			   rtnDate =  tempDate.getFullYear() +"/";
			   if(tempDate.getMonth() < 10){
				   rtnDate +=  "0" + eval(tempDate.getMonth()+1)+"/"
			   }else{
				   rtnDate +=  eval(tempDate.getMonth()+1)+"/"
			   }
		
			   if(tempDate.getDate() <10){
				   rtnDate +=  "0" + tempDate.getDate()
			   }else{
				   rtnDate +=  tempDate.getDate()
			   }
		   }
	   }
	   
	   return rtnDate;
   }catch(e){
	   return rtnDate;
   }
}

/**
 * 日期年加减
 * @param nowDate 格式为yyyy-MM-dd
 * @param addMont 
 * @return
 */
function dateAdd(nowDate,addMont){
	var rtnDate = "";
	try{
		if(nowDate==undefined || null == nowDate || "" == nowDate){//输入日期参数为空
			return;
		}
		var dateArray = nowDate.split("-");
		var nowDateStr = dateArray[1]+"/"+dateArray[2]+"/"+dateArray[0];
		 var tempDate = new Date(nowDateStr);
		 tempDate.addYears(addMont);
		 rtnDate = tempDate.asString();
	}catch(e){
		alert("error!");
	}
	return rtnDate;
}

/**
 * 日期相加
 */
function dayAdd(nowDate,addMont){
	var rtnDate = "";
	try{
		if(nowDate==undefined || null == nowDate || "" == nowDate){//输入日期参数为空
			return;
		}
		var dateArray = nowDate.split("-");
		var nowDateStr = dateArray[1]+"/"+dateArray[2]+"/"+dateArray[0];
		var tempDate = new Date(nowDateStr);
		tempDate.addDays(eval(addMont));
		rtnDate = tempDate.asString();
	}catch(e){
		alert("error!");
	}
	return rtnDate;
}

/**
 * 日期相减
 * @param firstDate
 * @param secandDate
 * @return
 */
function DateSubtract(firstDate,secandDate){
	var firstStr=firstDate.split("-");   
    var firstDateStr = firstStr[1] + "/" + firstStr[2]+"/"+firstStr[0];
    var dtm1 =new Date(firstDateStr);
    
	var secandStr=secandDate.split("-");   
    var secandDateStr = secandStr[1] + "/" + secandStr[2]+"/"+secandStr[0];
    var dtm2 =new Date(secandDateStr);
    
    var time=dtm2.getTime()-dtm1.getTime();
	var days=time/(24 * 60 * 60 * 1000);
	return days;
}

/**
 * 给表格的行加上颜色
 * <br>
 * 其他行颜色，如果不填写，默认白色
 * <br>
 * 
 * @param {} tableId 表格ID
 * @param {} index 当前选择行的索引
 * @param {} indexColor 当前选择行的颜色
 * @param {} otherColor 其他行颜色
 */
function trAddColor(tableId,index,indexColor,otherColor){
	if(undefined == otherColor){
		otherColor = "white";
	}
	$("#"+tableId).find('tr').each(function(i){
		if(index==i){
			$(this).css('background',indexColor);
		}else{
			$(this).css('background',otherColor);
		}
    });
}

/**
 * 校验输入字数长度
 * @return
 */
function checkLength(elementId,length){
	var eValue = document.getElementById(elementId).value;
	if(eValue.length>length){
		alert("输入字数过多！");
		document.getElementById(elementId).focus();
	}
}

/**
 * 显示提示
 * 
 * @param {} tips 显示属性tip里面的内容
 * @param {} flag 是否显示
 * @param {} width 提示宽度
 */
function showtip(tips, flag, width, x, y) {
	if(undefined == x){
		x = 3;
	}
	if(undefined == y){
		y = -3;
	}
	
	var display = "display: none;";
	if(flag){
		display = "";
	}
	var mytipsHtml = '<div class="patentindex" id="mytips" style="border-right: gray 1px solid; border-top: gray 1px solid; '
		+display+' filter: progid : DXImageTransform.Microsoft.Shadow ( color = #999999, direction = 135, strength = 3 ); left: 0px; border-left: gray 1px solid; border-bottom: gray 1px solid; position: absolute; background-color: #ffffff; text-align: left;">' 
		+tips+'</div>';
	$("#mytips").remove();
	$("body").append(mytipsHtml);
	var my_tips = document.all.mytips;
	if(flag){
		my_tips.style.width = width;
		my_tips.style.left = event.clientX + (x) + document.body.scrollLeft;
		my_tips.style.top = event.clientY + (y) + document.body.scrollTop;
	}
}

/**
 * 弹出窗口
 * 
 * @param {} url 连接地址
 * @param {} title 标题
 * @param {} width 宽度
 * @param {} height 高度
 */
function openWindowByArtDialog(url,title,width,height){
	if(undefined == url){
		url = "";
	}
	if(undefined == title){
		title = "窗口";
	}
	if(undefined == width){
		width = 800;
	}
	if(undefined == height){
		height = 500;
	}
	
	var html = "<iframe src='"+url+"' width='100%' height='"+height+"' frameborder='0' scrolling='auto'></iframe>";
	$.dialog({
		padding:0,
		title:title,
		width:width,
		height:height,
		content: html
	});
}

/**
 * 打开右下角消息窗口
 * 
 * @param {} content 内容
 * @param {} title 标题
 * @param {} width 窗口宽度
 * @param {} height 窗口高度
 * @param {} time 消失时间
 */
function openMsgDialog(content,title,width,height,time){
	if(undefined == content){
		content = "默认内容";
	}
	if(undefined == title){
		title = "公告";
	}
	if(undefined == width){
		width = 300;
	}
	if(undefined == height){
		height = 50;
	}
	if(undefined == time){
		time = 10;
	}
	
	$.dialog({
	    id: 'msg',
	    title: title,
	    content: content,
	    width: width,
	    height: height,
	    left: '100%',
	    top: '100%',
	    fixed: true,
	    drag: false,
	    resize: false,
	    time:time  //多少秒后消失
	});
}

/**
 * 全屏窗口
 * 
 * @param u
 */
function fullScreen(u){
	window.open(u, '', 'fullscreen=yes');
}

/**
* @author 王宪良
* 该函数选中要选的值
* @param   selectid    select选择框的id值
* @return  value       select选中的Value值
**/
function getSelectByText(selectid,selectText){
	var issuedbyID=document.getElementById(selectid).options;
	for(var i=0;i<issuedbyID.length ;i++){
		if (issuedbyID[i].text == selectText){
			issuedbyID[i].selected = true;
		}
	}
}

/**
 * 全选和取消全选
 * @param {} chc 单击的复选框对象
 * @param {} fxk 需要全选或取消全选的复选框的名称
 */
function selectAllByName(chc,fxk){
	var fuXuanKuang=document.getElementsByName(fxk);
	if(chc.checked){
		for(var i=0;i<fuXuanKuang.length;i++){
			fuXuanKuang[i].checked=true;
		}

	}else{
		for(var i=0;i<fuXuanKuang.length;i++){
			fuXuanKuang[i].checked=false;
		}
	}
}

/**
 * 获得多选框的值(按flag拼接)
 * 
 * @param chkName 复选框的名称
 * @param flag 拼接标识
 * @returns 返回对象 {"num":0,"str":""}
 */
function getChkStr(chkName, flag){
	var result = {};
	if(chkName){
		if(!flag){
			flag = ",";
		}
		var chkArr = document.getElementsByName(chkName);
		var num = 0;
		var str = "";
		for(var i=0;i<chkArr.length;i++){
			if(chkArr[i].checked==true){
				str+=chkArr[i].value; 	
				str+=flag;	
				num++;	
			}
		}
		if(num != 0){
			str = str.substring(0, str.length-1);
		}
		result.num = num;
		result.str = str;
	}
	return result;
}

/**
 * 身份证校验
 * 
 * @param num 身份证号码
 * @returns {Boolean} 校验是否成功，成功：true  失败：false
 */
function validateIdCard(num){
	num = num.toUpperCase();  
	if (!(/(^\d{15}$)|(^\d{17}([0-9]|X)$)/.test(num))){ 
		alert('输入的身份证号长度不对，或者号码不符合规定！\n15位号码应全为数字，18位号码末位可以为数字或X。'); 
        return false; 
	} 
	//校验位按照ISO 7064:1983.MOD 11-2的规定生成，X可以认为是数字10。 
	//下面分别分析出生日期和校验位 
	var len, re; 
	len = num.length; 
	if (len == 15){ 
		re = new RegExp(/^(\d{6})(\d{2})(\d{2})(\d{2})(\d{3})$/); 
		var arrSplit = num.match(re); 
		//检查生日日期是否正确 
		var dtmBirth = new Date('19' + arrSplit[2] + '/' + arrSplit[3] + '/' + arrSplit[4]); 
		var bGoodDay; 
		bGoodDay = (dtmBirth.getYear() == Number(arrSplit[2])) && ((dtmBirth.getMonth() + 1) == Number(arrSplit[3])) && (dtmBirth.getDate() == Number(arrSplit[4])); 
		if (!bGoodDay){ 
			alert('输入的身份证号里出生日期不对！');   
		    return false; 
		}else{ 
			//将15位身份证转成18位 
			//校验位按照ISO 7064:1983.MOD 11-2的规定生成，X可以认为是数字10。 
			var arrInt = new Array(7, 9, 10, 5, 8, 4, 2, 1, 6, 3, 7, 9, 10, 5, 8, 4, 2); 
			var arrCh = new Array('1', '0', 'X', '9', '8', '7', '6', '5', '4', '3', '2'); 
			var nTemp = 0, i;   
			num = num.substr(0, 6) + '19' + num.substr(6, num.length - 6); 
			for(i = 0; i < 17; i ++){ 
				nTemp += num.substr(i, 1) * arrInt[i]; 
			} 
			num += arrCh[nTemp % 11];   
			return true;   
		}
	}else if(len == 18){ 
		re = new RegExp(/^(\d{6})(\d{4})(\d{2})(\d{2})(\d{3})([0-9]|X)$/); 
		var arrSplit = num.match(re); 
		//检查生日日期是否正确 
		var dtmBirth = new Date(arrSplit[2] + "/" + arrSplit[3] + "/" + arrSplit[4]); 
		var bGoodDay; 
		bGoodDay = (dtmBirth.getFullYear() == Number(arrSplit[2])) && ((dtmBirth.getMonth() + 1) == Number(arrSplit[3])) && (dtmBirth.getDate() == Number(arrSplit[4])); 
		if (!bGoodDay){ 
			alert('输入的身份证号里出生日期不对！'); 
			$("#idcard").focus();
			return false; 
		}else{ 
			//检验18位身份证的校验码是否正确。 
			//校验位按照ISO 7064:1983.MOD 11-2的规定生成，X可以认为是数字10。 
			var valnum; 
			var arrInt = new Array(7, 9, 10, 5, 8, 4, 2, 1, 6, 3, 7, 9, 10, 5, 8, 4, 2); 
			var arrCh = new Array('1', '0', 'X', '9', '8', '7', '6', '5', '4', '3', '2'); 
			var nTemp = 0, i; 
			for(i = 0; i < 17; i ++){ 
				nTemp += num.substr(i, 1) * arrInt[i]; 
			} 
			valnum = arrCh[nTemp % 11]; 
			if (valnum != num.substr(17, 1)){ 
				alert('18位身份证的校验码不正确！最后一位应该为：' + valnum); 
				return false; 
			} 
			return true; 
		}
	}
	return false; 	
}

/**
 * 根据身份证显获得出生日期和性别
 * 
 * @param idCardValue 身份证号码
 * @returns {"birthday":"1988-09-09","sex":"男"}
 */
function getBirthdayAndSexByIdCard(idCardValue) {
	var result = {};	
	if (idCardValue != "" && (idCardValue.length == 15 || idCardValue.length == 18)) {
		var tempDay = "";
		var tempSex = "男";
		if (idCardValue.length == 15) {
			tempDay = "19" + idCardValue.substring(6, 8) + "-"
					+ idCardValue.substring(8, 10) + "-"
					+ idCardValue.substring(10, 12);
			var sexNum = idCardValue.substring(14);
			alert(sexNum);
			if (isNum(sexNum)) {
				var tempN = parseInt(sexNum) % 2;
				if (tempN == 0) {
					tempSex = "女";
				}
			}
		} else if (idCardValue.length == 18) {
			tempDay = idCardValue.substring(6, 10) + "-"
					+ idCardValue.substring(10, 12) + "-"
					+ idCardValue.substring(12, 14);
			var sexNum = idCardValue.substring(16, 17);
			if (isNum(sexNum)) {
				var tempN = parseInt(sexNum) % 2;
				if (tempN == 0) {
					tempSex = "女";
				}
			}
		}
		
		result.birthday=tempDay;
		result.sex=tempSex;
	}
	return result;
}

/**
 * 判断密码是否正确
 * 
 * @param username 用户名
 * @param password 密码
 * @returns 例如：{"flag":true,"msg":"密码正确"}
 */
function isPasswordRight(username, password){
	var result = {};
	
	result.flag = true;
	result.msg = "密码正确";
	
	if(""==username){
		result.flag = false;
		result.msg = "请先输入用户名";
		return result;
	}
	if(""==password){
		result.flag = false;
		result.msg = "请先输入密码";
		return result;
	}
	
	$.ajax({
		async : false,
		type : "POST",
		url : "isCorrectPassword.html",
		dataType: "json",
		data : {
			"username":username,
			"password":password
		},
		success : function(data) {
			if(!data){
				result.flag = false;
				result.msg = "密码不正确，请重新输入";
			}
		}
	});
	
	return result;
}

/**
 * 根据用户名获得用户信息
 * 
 * @param username 用户名
 * @returns 例如：{"flag":true,"msg":"","user":user}
 */
function getUserByUsername(username){
	if(!username){
		alert("请先传入用户名");
		return;
	}
	var result = {};
	
	result.flag = true;
	result.msg = "密码正确";
	
	if(""==username){
		result.flag = false;
		result.msg = "请先输入用户名";
		return result;
	}
	
	$.ajax({
		async : false,
		type : "POST",
		url : "getUserByUsername.html",
		dataType: "json",
		data : {
			"username":username
		},
		success : function(data) {
			result = data;
		}
	});
	
	return result;
}

/**
 * 提示框
 * 
 * @param msg 消息
 */
function artMsg(msg){
	window.top.$.dialog({
	    content:msg,
	    time:3
	});
}

/**
 * 成功提示框
 * 
 * @param msg 消息
 */
function artSucceed(msg){
	window.top.$.dialog({
		title:'提示',
		content:msg,
	    icon:'success.gif',
	    time:3
	});
}

/**
 * 警告框
 * 
 * @param msg 消息
 */
function artAlert(msg){
	window.top.$.dialog({
	    title:'警告',
	    content:msg,
	    icon:'face-sad.png',
	    time:3
	});
}

/**
 * 错误框
 * 
 * @param msg
 *            消息
 */
function artError(msg){
	window.top.$.dialog({
	    title:'错误',
	    content:msg,
	    icon:'error.gif'
	});
}

/**
 * 确认框
 * 
 * @param msg 消息
 * @param callback 回调函数
 * @param title 标题
 */
function artConfirm(msg, callback, title){
	if(!title) title = "温馨提示";
	window.top.$.dialog({
		lock:true,
		icon:"confirm.gif",
		title:title,
		content:msg,
		ok:function(){
			if(isFunction(callback)){
				return callback();
			}
		},
		cancel:function(){
		}
	});
}

/**
*@author LiWeichao
*    验证上传文件类型
*@param fileId  ID
*@param type  验证类型 如：.zip,.xml,.xls
*@return boolean
*/
function checkFileType(fileId,type){
	  var tmpFile = document.getElementById(fileId);
	  if(!tmpFile || !tmpFile.value){
	  	 return false;
	  }
	  
	  var postfix = tmpFile.value.match(/^(.*)(\.)(.{1,8})$/)[3].toLowerCase(); //获得选择的上传文件的后缀名的正则表达式
	  if(type.toLowerCase().indexOf(postfix) < 0) {
	     artAlert('文件类型不正确，请选择'+type+'文件 ！');
	     var nf = tmpFile.cloneNode(true);
	     nf.value='';
	     tmpFile.parentNode.replaceChild(nf, tmpFile);
	     return false;
	   }
	   return true;
}

/**
 * 简单封装jquery的ajax方法<br>
 * 默认异步为false
 * 
 * @param url 地址
 * @param data 参数json对象，例如 {name:"test"}
 * @param async 是否异步，默认 false
 * @returns 返回的数据，根据自己的方法进行处理
 */
function ajax(url, data, async){
	var result = {};
	if(undefined == url){
		url = "";
	}
	if(undefined == data){
		data = {};
	}
	if(undefined == async){
		async = false;
	}
	
	$.ajax({
		async : async,
        url: url,
        type: "post",
        data: data,
        dataType: "json",
        success: function(data) {
        	result = data;
        },
        error: function(jqXHR, textStatus, errorThrown) {
//        	alert("ajax error");
//          alert(jqXHR.status);
//          alert(jqXHR.readyState);
//          alert(textStatus);
//      	jqXHR.responseText
      	
        	var msg = "";
			switch (jqXHR.status){
				case(500):
					msg = "服务器系统内部错误";
					break;
				case(401):
					msg = "未登录";
					break;
				case(403):
					msg = "无权限执行此操作";
				break;
				case(408):
					msg = "请求超时";
					break;
				default:
					msg = "未知错误";
			}
			
	      	$.dialog({
	          	title:"错误",
//	          	icon:"error",
	      	    content:"执行AJAX发现问题：参数非法或"+msg
	      	});
	      	
	      	throw errorThrown;
        },
        complete: function(XMLHttpRequest, textStatus) {
            this; // 调用本次AJAX请求时传递的options参数
        }
    });
	return result;
}

/**
 * 验证手机号
 * 
 * @param {}
 *            telephone 要验证的手机号码
 * @return {Boolean}
 */
function isTelephone(telephone){
	if(telephone == ""){
		return false;
	}
	telephone = new String(telephone).trim();
	var regex = /^0?(13[0-9]|15[012356789]|18[01236789]|14[57])[0-9]{8}$/;
	if(!regex.test(telephone)){
   		return false;
  	}
	return true;
}

/**
 * 获得项目根路径
 * 
 * @returns
 */
function getCtx(){
	var curWwwPath = window.document.location.href;
	var pathName = window.document.location.pathname;
	var pos = curWwwPath.indexOf(pathName);
	var localhostPath = curWwwPath.substring(0, pos);
	var projectName = pathName.substring(0, pathName.substr(1).indexOf("/") + 1);
	return (localhostPath+projectName);
}

/**
 * 打开tab
 * 
 * @param title 标题
 * @param url 访问URL
 */
function openTab(title, url){
	var maintabs = window.top.$('#maintabs');
	if(!maintabs.tabs('exists', title)){
		addOneTab(title, url);
	}else{
		maintabs.tabs('select', title);
		var currTab = maintabs.tabs('getSelected');
		maintabs.tabs('update', {
			tab : currTab,
			options : {
				content : createFrame(url)
			}
		})
	}
}

/**
 * 输出
 * 
 * @param obj
 */
function log(obj){
	try{if(console) console.log(obj);}catch(e){}
}

/**
 * 编辑窗口
 * 
 * @param title 标题
 * @param content 内容
 * @param okFun 点击确定回调函数
 * @param cancelFun 点击关闭回调函数
 */
function edit(title, content, okFun, cancelFun){
	return editDialog({title:title,content:content,okFun:okFun,cancelFun:cancelFun});
}

/**
 * 编辑窗口
 * 
 * @param options 参数，例如 {title="编辑",content="内容",okFun=true,cancelFun=true}
 */
function editDialog(options){
	if(!options.title) options.title = "编辑";
	if(!options.content) options.content = "";
	if(!options.okFun) options.okFun = true;
	if(!options.cancelFun) options.cancelFun = true;
	var d = window.top.$.dialog({
		lock:true,
		cache:false,
		resize:false,
		padding:0,
		min:false,
		max:false,
		title:options.title,
		content: options.content,
		ok:options.okFun,
		cancelVal:"关闭",
		cancel: options.cancelFun
	});
	return d;
}

/**
 * 判断是否为函数
 * 
 * @param obj
 * @returns {Boolean}
 */
function isFunction(obj){
//	return $.type(obj)==="function";
    return (typeof obj=='function')&&obj.constructor==Function; 
}

/**
 * 监听按键事件
 * 
 * @param {} keyCode 需要监听的按键
 * @param {} funName 要调用的方法的名称，或者直接写匿名函数
 */
function keyCallback(keyCode, funName) {
	var e = window.event||arguments.callee.caller.arguments[0];
	if (e.keyCode == keyCode) {
		if(isFunction(funName)){
			eval("funName()");
		}else{
			//var funNameStr = funName+"()";
			//setTimeout(funNameStr,100);
			window[funName]();
		}
	}
}

/**
 * 合法字符
 * @author LiWeichao
 * @param str
 * @returns
 */
function reNew(str){
    var re;
	re=/%26amp;/g;
	str=str.replace(re,"&");
	re=/%26apos;/g;  
	str=str.replace(re,"'");
	re=/%26lt;/g;  
	str=str.replace(re,"<");
	re=/%26gt;/g;  
	str=str.replace(re,">");
	re=/%26quot;/g;  
	str=str.replace(re,"\"");
	re=/%25/g;
	str=str.replace(re,"%");
	re=/````/g;
	str=str.replace(re,",");
	return(str);		
}

/****************************
 *取得合法的字符串
 *@author LiWeichao
 ****************************/
function getValidStr(str) 
{
	str += "";
	if (str=="undefined" || str=="null" || str=="NaN")
		return "";
	else
		return reNew(str);
		
}

/********************************
 *编码规则:1) ~43~48~45~4e~48~41~4f
 *         2) ^7a0b^7389
 *字符编码,解决传输出现乱码问题
 *@author LiWeichao
 ********************************/
function encode(strIn){
	var intLen=strIn.length;
	var strOut="";
	var strTemp;

	for(var i=0; i<intLen; i++)
	{
		strTemp=strIn.charCodeAt(i);
		if (strTemp>255)
		{
			tmp = strTemp.toString(16);
			for(var j=tmp.length; j<4; j++) tmp = "0"+tmp;
			strOut = strOut+"^"+tmp;
		}
		else
		{
			if (strTemp < 48 || (strTemp > 57 && strTemp < 65) || (strTemp > 90 && strTemp < 97) || strTemp > 122)
			{
				tmp = strTemp.toString(16);
				for(var j=tmp.length; j<2; j++) tmp = "0"+tmp;
				strOut = strOut+"~"+tmp;
			}
			else
			{
				strOut=strOut+strIn.charAt(i);
			}
		}
	}
	return (strOut);
}

/******************************************
 *字符串解码,汉字传输过程中出现乱码问题
 *解码规则:1) ~43~48~45~4e~48~41~4f
 *         2) ^7a0b^7389
 *@author LiWeichao
 ******************************************/
function decode(strIn){
	var intLen = strIn.length;
	var strOut = "";
	var strTemp;

	for(var i=0; i<intLen; i++)
	{
		strTemp = strIn.charAt(i);
		switch (strTemp)
		{
			case "~":{
				strTemp = strIn.substring(i+1, i+3);
				strTemp = parseInt(strTemp, 16);
				strTemp = String.fromCharCode(strTemp);
				strOut = strOut+strTemp;
				i += 2;
				break;
			}
			case "^":{
				strTemp = strIn.substring(i+1, i+5);
				strTemp = parseInt(strTemp,16);
				strTemp = String.fromCharCode(strTemp);
				strOut = strOut+strTemp;
				i += 4;
				break;
			}
			default:{
				strOut = strOut+strTemp;
				break;
			}
		}

	}
	return (strOut);
}

/*******************************
 *字符串进行编码
 *@author LiWeichao
 *******************************/
function getEncodeStr(str) {
	if(!str){
		return "";
	}
	return encode(getValidStr(str));
	//return escape(getValidStr(str));
}

/*******************************
 *字符串进行解码
 *@author LiWeichao
 *******************************/
function getDecodeStr(str) {
	return ((str)?decode(getValidStr(str)):"");
}

/*******************************
 *打印Word调用打印机  需要设置默认打印机 否则无法打印
 *@author LiWeichao
 *******************************/
function printWord(fileName, visible) {
	var wordApp = null;
	try{        
		wordApp = new ActiveXObject('Word.Application');
	} catch(e){ 
		artError(e+', 原因分析: 浏览器安全级别较高导致不能创建Word对象或者客户端没有安装Word软件'); 
		return; 
	}
	try{
		var path = 'http://'+window.location.host + window.location.pathname.substring(0, window.location.pathname.indexOf("/", 1));
		var doc=wordApp.Documents.Open(path+fileName);
		if(visible && null!=visible){
			wordApp.Application.Visible = true;
		}else{
			wordApp.Application.Visible = false;
			wordApp.Application.Printout();
			//doc.saveAs("I:\\epassport\\temp\\word_worksheet.doc");
			wordApp.Application.ActiveDocument.Close(0);
			wordApp.Application.Quit();
			wordApp=null;
		}
	}catch(e){
		//artError(e);
	}
}

/*******************************
 *打印Excel调用打印机
 *@author LiWeichao
 *******************************/
function  printExcel(fileName, visible) {
	//fileName = "/reports/template/1383122924603.xls";
	var xlsApp = null;    
	try{        
		xlsApp = new ActiveXObject('Excel.Application');    
	} catch(e) { 
		artError(e+', 原因分析: 浏览器安全级别较高导致不能创建Excel对象或者客户端没有安装Excel软件'); 
		return; 
	}
	try{
		var path = 'http://'+window.location.host + window.location.pathname.substring(0, window.location.pathname.indexOf("/", 1));
		var xlBook = xlsApp.Workbooks.Open(path+fileName);
		if(visible && null!=visible){
			xlsApp.Application.Visible = true;
		}else{
			var xlsheet = xlBook.Worksheets(1);
			xlsApp.Application.Visible = false; 
			xlsApp.visible = false; 
			xlsheet.Printout; 
			xlsApp.Quit(); 
			xlsApp=null;
		}
	}catch(e){
		//artError(e);
	}
}

/*******************************
 *客户端调用打印机
 *该方法需传入相对(项目发布名成)地址 如："/reports/template/TEST.doc"
 *--将服务器上的待打印文件下载到本地 后打印
 *@author LiWeichao
 *******************************/
function  clientPrint(fileName, visible) {
	if(isIE()){
		var postfix = fileName.match(/^(.*)(\.)(.{1,8})$/)[3].toLowerCase(); //获得选择的上传文件的后缀名的正则表达式
	    if(".doc,.docx".indexOf(postfix) != -1) {
	    	//artAlert("正在准备打印，请稍等...");
	    	setTimeout(function(){printWord(fileName, visible);},100);
	    } else if (".xls,.xlsx".indexOf(postfix) != -1) {
	    	//artAlert("正在准备打印，请稍等...");
			setTimeout(function(){printExcel(fileName, visible);},100);
		} else {
			artError("该对象无法打印，只能打印world和Excel文件。");
		}
	}else{
		initJatoolsPrinter({
			version:"P8",
			printDocumentUrl:fileName
		});
	}
}

/**
 * 初始化组合框<br>
 * 公用的获取数据源的URL
 * appCommonController.do?getComboDs=true&tableName=t_s_base_user&id=id&text=realname
 * appCommonController.do?getComboDs=true&tableName=t_s_base_user&id=id&text=realname&mode=remote
 * 
 * @author cmh
 * @version 2014-06-12 下午16:32:50
 * @param id 普通input的id
 * @param ud 数据url或者静态数据
 * @param valueField 默认id
 * @param textField 默认text
 * @param editable 默认true
 * @returns 组合框对象
 */
function initCombobox(id, ud, valueField, textField, editable,width,height){
	if(!id) return null;
	if(!ud) return null;
	if(!valueField) valueField = "id";
	if(!textField) textField = "text";
	//	if(!editable && undefined==editable) editable = true;
	var opts = {
		width:width,
		height:height,
		valueField:valueField, 
		textField:textField,
		editable:editable,
		onSelect: function(rec){
            $(this).val(rec[valueField]);
            c.next().children(":text").focus();
        },
        onChange:function(n, o){
        	var d = $(this).combobox("getData");
        	var flag = false;
        	for(var i=0;i<d.length;i++){
        		if(d[i][valueField]==n){
        			flag = true;
        			break;
        		}
        	}
        	if(!flag) $(this).val("");
        }
	};
	if("array"===$.type(ud)){
		opts.data = ud;
	}else{
		opts.url = ud;
	}
	
	var c = $("#"+id).combobox(opts);

	function setVal(that){
		var v = that.val();
		if(""!=v){
			var d = c.combobox("getData");
			var flag = false;
	    	for(var i=0;i<d.length;i++){
	    		if(d[i][textField]==v){
	    			c.combobox("setValue",d[i][valueField]);
	    			$("#"+id).val(d[i][valueField]);
	    			flag = true;
	    			break;
	    		}
	    	}
	    	if(!flag){// 没有查中的情况，尝试补全
	    		for(var i=0;i<d.length;i++){
//		    		if(d[i][textField].indexOf(v)>-1){  // 模糊查找
	    			if(d[i][textField].substring(0,v.length)==v){// 第一个查中才算
		    			c.combobox("setValue",d[i][valueField]);
		    			$("#"+id).val(d[i][valueField]);
		    			break;
		    		}
		    	}
	    	}
		}
	}
	c.next().children(":text").blur(function(){setVal($(this));}).keydown(function(e){if(e.keyCode==13){setVal($(this));}});
	c.next().click(function(){c.combobox("showPanel");});
	return c;
}

/**
 * 序列化表单为对象
 * 
 * @param form 需要序列化的表单
 * @returns 表单值对象
 */
function serializeObject(form){
	if(!($.type(form)==="object")){
		form = $("#"+form);
	}
	var o = {};
	$.each(form.serializeArray(), function(index) {
		if (this['value'] != undefined && this['value'].length > 0) {// 如果表单项的值非空，才进行序列化操作
			if (o[this['name']]) {
				o[this['name']] = o[this['name']] + "," + this['value'];
			} else {
				o[this['name']] = this['value'];
			}
		}
	});
	return o;
}

/**
 * 金额数字 格式化
 * 
 * @param value
 * @param row
 * @param index
 * @returns {String}
 */
function moneyNumberFormatter(value,row,index){
	if(null==value) return "0.00";
	var v = new String(value);
	if(v.indexOf(".") < 0){
		v = v+".00";
	}else{
		var t = v.substring(v.indexOf(".")+1, v.length);
		if(t.length>3){
			v = v.substring(0, v.indexOf(".")+3);
		}else if(t.length==1){
			v = v+"0";
		}
	}
	return v;
}

/**
 * 判断是否为正负整数，或者两位小数<br>
 * 例如：100,-100,100.1,100.12,-100.2,-100.50
 * 
 * @param v 需要判断的数字
 * @returns 通过：true；不通过：false
 */
function isNumAndTowDecimal(v){
	var re = /^[+-]?\d*\.?\d{1,2}$/;
	return re.test(v);
}

/**
 *格式化日期 2013-07-23
 *
 *@author LiWeichao
 *dt Date  如：new Date()
 */
function getDateTime(dt){
	return dt.getFullYear() + "-" + ("0"+ (dt.getMonth() +1)).slice(-2) + "-" + ("0"+ dt.getDate()).slice(-2) + " " + dt.toLocaleTimeString();
}

/**
 * 替换所有
 * 
 * @param obj
 * @param str1
 * @param str2
 * @returns
 */
function replaceAll(obj,str1, str2){
	if(obj){
		obj = obj.replace(str1,str2);
		if(obj.indexOf(str1)!=-1){
			obj = replaceAll(obj,str1, str2);
		}
	}
	return obj;
}

/**
*修补填充时间 onblur=repairDate(this)
*@author LiWeichao
*/
function repairDate(obj){
	if(obj.value){
		var _value = obj.value.trim();
		_value = replaceAll(_value,".","-");//_value.replace(".","-").replace(".","-").replace(".","-");
		
		var _nowDate = new Date();
		var _time = _nowDate.getFullYear() + "-" + ("0"+ (_nowDate.getMonth() +1)).slice(-2) + "-" + ("0"+ _nowDate.getDate()).slice(-2);//当前年-月-日
		
		if(_value.indexOf("-") != -1){//89-11-2
			try{
				//日
				var _r = "";
				if(_value.indexOf(" ") == -1){
					_r = _value.substring(_value.lastIndexOf("-")+1);
				} else {
					_r = _value.substring(_value.lastIndexOf("-")+1,_value.indexOf(" "));
				}
				if(_r.length == 1){
					_r = "0" + _r;
				}
				//月份
				var _m = _value.substring(_value.indexOf("-")+1, _value.lastIndexOf("-"));
				if(_m.length == 1){
					_m = "0" + _m;
				}
				//年份
				var _t = _value.substring(0,_value.indexOf("-"));
				
				//年-月-日
				var _date = _t + "-" + _m + "-" + _r;
				if(_t.length==2){
					if(_date > _time.substring(2)){
						_date = "19" + _date;
					} else {
						_date = "20" + _date;
					}
				}
				
				if(_value.indexOf(" ") != -1){
					_date += _value.substring(_value.indexOf(" "));
				}
				
				if(dateValidate(_date) || isDateTimeString(_date)){//修补成功回显
					obj.value = _date;
					return;
				} else {
					artAlert("日期类型输入有误！");
					return;
				}
			}catch(e){
				artAlert("日期类型输入有误！");
				return;
			}
		}
		
		//890101
		try{
			var _date = "";
			if(_value.length==6){//6位简写
				_date =  _value.substring(0, 2) + "-" + _value.substring(2, 4) + "-" + _value.substring(4);
				if(_date > _time.substring(2)){
					_value = "19" + _value;
				} else {
					_value = "20" + _value;
				}
			}
			if(_value.length==8){
				_date =  _value.substring(0, 4) + "-" + _value.substring(4, 6) + "-" + _value.substring(6);
			}
			if(_date && dateValidate(_date)){//修补成功回显
				obj.value = _date;
			} else {
				artAlert("日期类型输入有误！");
				return;
			}
		}catch(e){
			artAlert("日期类型输入有误！");
			return;
		}
	}
}

/**
 * 初始化jatoolsPrinter打印控件
 * 
 * @author cmh
 * @version 2014-06-12 下午16:32:50
 * @param options 配置项
 */
function initJatoolsPrinter(options){
	// 默认参数
	var defaults = {
			version:2,
			paperName:'a4', // 纸张类型
//			pageWidth:1635, // 纸张宽度   付费版支持
//			pageHeight:2110, // 纸张宽度   付费版支持
			topMargin:0, // 上边距
			leftMargin:0, // 左边距
			bottomMargin:0, // 下边距
			rightMargin:0, // 右边距
			marginIgnored:false,// 忽略边距
			orientation:1, // 选择横向打印,1为纵向，2为横向
			copies:1, // 打印份数
			print:true, // 是否初始化完成后立刻打印
			printPreview:false,// 打印预览
			printer:null,// 默认打印机
			printModel:false, // 打印模式 true：选择打印机打印，false：直接打印
			importedStyle:[], //样式   付费版支持
			printDocument:false,// 打印文档，付费版支持
			printDocumentUrl:null,// 打印文档的URL，printDocument为true时有效，付费版支持
			printDocumentType:null,// 打印文档的类型，printDocument为true时有效，付费版支持
			done:function(err){}, // 回调函数   付费版支持
			copyrights:"杰创软件拥有版权  www.jatools.com"
	};
	
	var opts = $.extend(defaults, options);
	try{
		if(jatoolsPrinter);
	}catch(e){
		if(opts.version==2){
			// 免费版本 2,1,0,4
			$("body").append('<OBJECT ID="jatoolsPrinter" width="0" height="0" CLASSID="CLSID:B43D3361-D975-4BE2-87FE-FFFF88254255" codebase="'+ctx+'/plug-in/jatoolsPrinter/jatoolsPrinter_f.cab#version=2,1,0,4"></OBJECT>');
		}else if(opts.version==8){
			// 免费版本 8,6,0,0
			$("body").append('<OBJECT ID="jatoolsPrinter" width="0" height="0" CLASSID="CLSID:B43D3361-D075-4BE2-87FE-057188254255" codebase="'+ctx+'/plug-in/jatoolsPrinter/jatoolsPrinter_free.cab#version=8,6,0,0"></OBJECT>');
		}else if(opts.version=="P8"){
			// 付费版本 8,7,5549
			$("body").append('<object id="ojatoolsPrinter" width="0" height="0" classid="clsid:B43D3361-D075-4BE2-87FE-057188254255" codebase="'+ctx+'/plug-in/jatoolsPrinter/jatoolsPrinter.cab#version=8,7,5549"><embed id="ejatoolsPrinter" type="application/x-vnd.jatoolsPrinter" pluginspage="'+ctx+'/plug-in/jatoolsPrinter/jatoolsPrinter.exe" width="0" height="0"/></object>');
			jatoolsPrinter = isIE() ? document.getElementById('ojatoolsPrinter') : document.getElementById('ejatoolsPrinter');
			opts.lazy = true;
//			opts.copyrights = "";// 自定义版权
		}
	}
	
	// 打印控件参数设置
	var myreport = {}; 
	
	if(opts.version==2){
		myreport = {
	    		documents:document,
	    		marginIgnored:opts.marginIgnored,
	    		importedStyle:opts.importedStyle,
	    		print_settings:{
	    			paperName:opts.paperName,
					topMargin:opts.topMargin,
					leftMargin:opts.leftMargin,
					bottomMargin:opts.bottomMargin,
					rightMargin:opts.rightMargin,
					orientation:opts.orientation,
					copies:opts.copies
				},
				done:opts.done,
				copyrights:'\u6770\u521B\u8F6F\u4EF6\u62E5\u6709\u7248\u6743 www.jatools.com'
	   	};
	    if(null!=opts.printer) myreport.print_settings.printer = opts.printer;
	    if(opts.pageWidth) myreport.print_settings.pageWidth = opts.pageWidth;
	    if(opts.pageHeight) myreport.print_settings.pageHeight = opts.pageHeight;
	}else if(opts.version==8 || opts.version=="P8"){
		myreport = {
	    		documents:document,
	    		marginIgnored:opts.marginIgnored,
	    		importedStyle:opts.importedStyle,
	    		settings:{
					topMargin:opts.topMargin,
					leftMargin:opts.leftMargin,
					bottomMargin:opts.bottomMargin,
					rightMargin:opts.rightMargin,
					orientation:opts.orientation,
					copies:opts.copies
				},
				done:opts.done,
				copyrights:opts.copyrights
	   	};
	    if(null!=opts.printer) myreport.settings.printer = opts.printer;
	    if(!opts.pageWidth){
	    	myreport.settings.paperName = opts.paperName;
	    }else{
	    	myreport.settings.pageWidth = opts.pageWidth;
		    if(opts.pageHeight) myreport.settings.pageHeight = opts.pageHeight;
	    }
	}
	if(opts.print){
		if(opts.printPreview){
			jatoolsPrinter.printPreview(myreport);
		}else if(opts.printDocument || opts.printDocumentUrl){
			if(null==opts.printDocumentUrl){
				artAlert("请先配置打印文档的URL");
				return;
			}
			var path = 'http://'+window.location.host + window.location.pathname.substring(0, window.location.pathname.indexOf("/", 1));
			// 判断是否可以打印文档
			var d = opts.printDocumentUrl;
			var fileName=path+"/"+d;
			if(d.indexOf("/")==0) fileName = path+d;
			var fileType = opts.printDocumentType;
			if(null==fileType){
				fileType = d.substring(d.lastIndexOf(".")+1, d.length);
			}
			if(jatoolsPrinter.isPrintableFileType(fileType)){
				if(opts.lazy){
					setTimeout(function(){
						if(opts.printDocumentType){
							jatoolsPrinter.printDocument(fileName,fileType);
						}else{
							jatoolsPrinter.printDocument(fileName);
						}
					},200);
				}else{
					if(opts.printDocumentType){
						jatoolsPrinter.printDocument(fileName,fileType);
					}else{
						jatoolsPrinter.printDocument(fileName);
					}
				}
			}else{
				artAlert("不支持的打印文档类型："+fileType);
			}
		}else{
			if(opts.lazy){
				setTimeout(function(){jatoolsPrinter.print(myreport, opts.printModel);},200);
			}else{
				jatoolsPrinter.print(myreport, opts.printModel);
			}
		}
    }
	return myreport;
}

/**
 * 初始化lodop打印控件
 * 
 * @author cmh
 * @version 2014-06-12 下午16:32:50
 * @returns
 */
function initLodop(){
	if(null==document.getElementById('LODOP_OB')){
		$("body").append('<object id="LODOP_OB" width="0" height="0" classid="clsid:2105C259-1E0C-4534-8141-A753534CB4CA" width=0 height=0><embed id="LODOP_EM" type="application/x-print-lodop" width=0 height=0></embed></object><script type="text/javascript" src="plug-in/lodop/LodopFuncs.js"></script>');
		$("body").append('<script type="text/javascript" src="plug-in/lodop/LodopFuncs.js"></script>');
	}
	var LODOP;
	try{ 
		LODOP=getLodop(document.getElementById('LODOP_OB'),document.getElementById('LODOP_EM')); 
	}catch(err){ 
		 alert("Error:本机未安装或需要升级!"); 
	}
	return LODOP;
}

/**
 * 初始化快捷键监听<br>
 * 例如：initHotKeyMonitor({src:"#companyNameId",target:"#countryId",srcType:"combobox",targetType:"combobox",altKey:true});
 * 
 * @author cmh
 * @version 2014-06-12 下午16:32:50
 * @param options 配置项
 */
function initHotKeyMonitor(options){
	var defaults = {
		type:"next",// 监听类型  fun,next
		src:null,// 源
		funName:null,// 方法名
		target:null,// 目标
		srcType:"text",// 源类型
		targetType:"text",// 目标类型
		keyCode:13,// 事件码
		altKey:false,
		ctrlKey:false,
		shiftKey:false,
		select:false
	};
	var opts = $.extend(defaults, options);
	if("text"==opts.srcType||"select"==opts.srcType){
		$(opts.src).keydown(function(e){f(e, opts);});
	}else if("combobox"==opts.srcType){
		$(opts.src).next().children(":text").keydown(function(e){f(e, opts);});
	}
	function f(e, opts){
		if(!opts.altKey) e.altKey = true;
		if(!opts.ctrlKey) e.ctrlKey = true;
		if(!opts.shiftKey) e.shiftKey = true;
		if(e.altKey && e.ctrlKey && e.shiftKey && e.keyCode==opts.keyCode){
			if("fun"==opts.type){
				keyCallback(opts.keyCode, opts.funName);
				if(opts.select){
					if("text"==opts.srcType){
						$(opts.src).select();
					}else if("combobox"==opts.srcType){
						$(opts.src).next().children(":text").select();
					}
				}
			}else if("next"==opts.type){
				if("text"==opts.targetType){
					$(opts.target).focus();
					if(opts.select) $(opts.target).select();
				}else if("combobox"==opts.targetType){
					$(opts.target).next().children(":text").focus();
					if(opts.select) $(opts.target).next().children(":text").select();
					$(opts.target).combobox("showPanel");
				}
			}
		}
	}
}

/**
 * 获取所有列的字符串，以,分隔
 * 
 * @param e 点击事件或者是datagrid
 * @returns 所有列的宽度的字符串，以,分隔
 */
function getDgColsFieldStr(e){
	return getDgColsObj(e).fAll;
}

/**
 * 获取所有列的名称的字符串，以,分隔
 * 
 * @param e 点击事件或者是datagrid
 * @returns 所有列的宽度的字符串，以,分隔
 */
function getDgColsTitleStr(e){
	return getDgColsObj(e).tAll;
}

/**
 * 获取所有可见列的名称的字符串，以,分隔
 * 
 * @param e 点击事件或者是datagrid
 * @returns 所有列的宽度的字符串，以,分隔
 */
function getDgColsTitleStr2(e){
	return getDgColsObj(e).t2All;
}

/**
 * 获取所有列的字符串，以,分隔
 * 
 * @param e 点击事件或者是datagrid
 * @returns 所有列的宽度的字符串，以,分隔
 */
function getDgColsWidthStr(e){
	return getDgColsObj(e).wAll;
}

/**
 * 获取所有列的field、title、width的字符串，以,分隔
 * 
 * @param e
 * @returns 
 */
function getDgColsObj(e){
	var r = {};
	var dg = e.data.dg||e;
	var cs = dg.datagrid("options").columns[0];
	var fAll = "";
	var tAll = "";
	var t2All = "";
	var wAll = "";
	var hAll = "";
	for(var i=0;i<cs.length;i++){
		fAll += cs[i].field;
		tAll += cs[i].title;
		wAll += cs[i].width;
		if(!cs[i].hidden){
			t2All += cs[i].title+",";
			hAll += "false";
		}else{
			t2All += "hidden,";
			hAll += cs[i].hidden;
		}
		if(i<cs.length-1){
			fAll += ",";
			tAll += ",";
			wAll += ",";
			hAll += ",";
		}
		r.fAll = fAll;
		r.tAll = tAll;
		r.t2All = t2All;
		r.wAll = wAll;
		r.hAll = hAll;
	}
	if(r.t2All.endWith(",")) r.t2All = r.t2All.substring(0, r.t2All.length-1);
	return r;
}

/**
 * 自动更改datagrid高度
 */
function autoChangeDatagridWidth(){
	setTimeout(function(){
		if($.browser.chrome){
			$(".datagrid-body").each(function(){
				var w = $(this).width();
				if(w != 0){
					$(this).width(w+4);
				}
			});
		}
	},500);
}

/**
 * 打印pdf
 * 
 * @author cmh
 * @version 2014-7-10 下午13:12:12
 * @param fileName 文件相对路径和名称
 * @param visible 是否显示打印设置
 */
function printPdf(fileName, visible) {
	var path = 'http://'+window.location.host + window.location.pathname.substring(0, window.location.pathname.indexOf("/", 1));
	var pdfName = path+"/"+fileName;
	debugger;
	try{
		if(pdfObjectId){
			$("#pdfObjectId").remove();
			if(pdfObjectId);
		}
	}catch(e){
		$("body").append('<object id="pdfObjectId" width="0" height="0" classid="clsid:CA8A9780-280D-11CF-A24D-444553540000"><param id="pdfObjectParamSrcId" name="src" value="'+pdfName+'"/></object>');
	}
	
	try{
		if(visible){
			pdfObjectId.printWithDialog();
		}else{
			pdfObjectId.setPageMode("none");
			pdfObjectId.setLayoutMode("DontCare");
			pdfObjectId.printAllFit(false);
		}
	}catch(e){
		artError(e+'<br><br>原因分析: 浏览器安全级别较高或者客户端没有安装Adobe Reader软件');
	}
}

/**
 * 判断是否是IE浏览器
 * 
 * @returns 是:true，否:false
 */
function isIE(){
	return navigator.userAgent.match(/(msie\s|trident.*rv:)([\w.]+)/i)?true:false;
}

/**
 * 初始化Echarts图表
 * 
 * @author cmh
 * @version 2014-7-30 下午10:14:10
 * @param options
 */
function initEcharts(options){
	try{if(require);}catch(e){
		$("body").append('<script id="eslScriptId" src="plug-in/echarts/esl.js"></script>');
	}
	// 默认参数
	var defaults = {
		id:"#echartsDivId",
		width:"100%",
		height:"300px",
		option:null,
		render:null
	};
	var opts = $.extend(defaults, options);
	if(null==opts.render){
		if(null==opts.option){
			opts.option = {
				tooltip: {show: false},
	            legend: {
	                data:['销量']
	            },
	            xAxis : [
	                {
	                    type : 'category',
	                    data : ["衬衫","羊毛衫","雪纺衫","裤子","高跟鞋","袜子"]
	                }
	            ],
	            yAxis : [
	                {
	                    type : 'value'
	                }
	            ],
	            series : [
	                {
	                    name:"销量",
	                    type:"bar",
	                    data:[5, 20, 40, 10, 10, 20]
	                }
	            ]
			};
		}
		
		opts.render = function(ec){
			if(null!=opts.id){
				var m = $(opts.id);
				m.css({width:opts.width,height:opts.height});
				var c = ec.init(m[0]);
                c.setOption(opts.option);
			}
		};
	}
	
	require.config({
	    paths:{ 
	        echarts:'plug-in/echarts/echarts',
	        'echarts/chart/bar':'plug-in/echarts/echarts',
	        'echarts/chart/line':'plug-in/echarts/echarts',
	        'echarts/chart/map':'plug-in/echarts/echarts-map'
	    }
	});
	
	require(
		[
	        'echarts',
	        'echarts/chart/bar',
	        'echarts/chart/line',
	        'echarts/chart/map'
	    ],
	    opts.render
	);
}

/**
 * 关闭或打开搜索
 * 
 * @returns {Boolean}
 */
function closeSearch(id){
	var d = $("#"+id).css("display");
	if("none"==d){
		$("#"+id).css({display:""});
	}else{
		$("#"+id).css({display:"none"});
	}
}

/**
 * 
 * 用以验证form表单 其中 form表单中的标签包含require属性和desc属性 require=true标示此表单不能为空 desc描述标签名称
 * 
 * @param {Object}
 *            formId
 * @return {TypeName}
 */
function validateForm(formId) {
	var flag = true;
	if (formId == null || formId == '') {
		flag = false;
		return flag;
	}
	var inputTags = $("form[id='" + formId + "'] input[require='true']");
	$.each(inputTags, function(i, tag) {
		var f = true;
		if(type){
			if(type==1){
				var r = $(tag).attr("readonly");
				var d = $(tag).attr("disabled");
				if(r||d){
					f = false;
				}
			}
		}
		if(f){
			var t = $(tag).attr("type");
			if(!t) t = "text";
			if ("text"==t) {
				if (null == tag.value || tag.value == '' || tag.value == '0' || tag.value.trim().length == 0) {
					flag = false;
					myAlert( {
						content : "请输入" + $(tag).attr("desc") + "!",
						callback : function() {$(tag).select().focus();}
					});
					return flag;
				}
			}else{
				var v = $("input[name="+$(tag).attr("name")+"]:checked").val();
				if(!v){
					flag = false;
					myAlert( {content : "请选择" + $(tag).attr("desc") + "!"});
					return flag;
				}
			}
		}
	});
	if (!flag) return flag;
	var selectTags = $("form[id='" + formId + "'] select[require='true']");
	$.each(selectTags, function(i, tag) {
		var f = true;
		if(type){
			if(type==1){
				var r = $(tag).attr("readonly");
				var d = $(tag).attr("disabled");
				if(r||d){
					f = false;
				}
			}
		}
		if(f){
			var value = "";
			try {
				value = $(tag).combobox('getValue');
			} catch (e) {
				value = tag.value;
			}
			if (value == null || value == '') {
				myAlert( {
					content : "请选择" + $(tag).attr("desc") + "!",
					callback : function() {$(tag).focus();}
				});
				flag = false;
				return flag;
			}
		}
	});
	if (!flag) return flag;
	var textareaTags = $("form[id='" + formId + "'] textarea[require='true']");
	$.each(textareaTags, function(i, tag) {
		var f = true;
		if(type){
			if(type==1){
				var r = $(tag).attr("readonly");
				var d = $(tag).attr("disabled");
				if(r||d){
					f = false;
				}
			}
		}
		if(f){
			if (tag.value == null || tag.value == '' || tag.value.trim().length == 0) {
				myAlert( {
					content : "请输入" + $(tag).attr("desc") + "!",
					callback : function() {$(tag).focus();}
				});
				flag = false;
				return flag;
			}
		}
	});
	return flag;
}

/**
 * 初始化选择框
 * 
 * @param id
 * @param data
 * @author cmh
 */
function initSelect(id, data, onchange, valueField, textField) {
	if (!valueField)
		valueField = "chdCName";
	if (!textField)
		textField = "chdCName";
	for ( var i = 0; i < data.length; i++) {
		$(id).append("<option value='" + data[i][valueField] + "'>" + data[i][textField] + "</option>");
	}
	$(id).change(onchange).show();
}

/**
 * 发送AJAX请求
 * 
 * @param u
 *            URL
 * @param d
 *            参数
 * @param c
 *            回调函数
 */
function ajax2(u, d, c) {
	$.ajax( {
		type : "POST",
		timeout : 60000,
		url : u,
		dataType : 'json',
		data : d,
		success : function(data) {
			c(data);
		},
		error: function(jqXHR, textStatus, errorThrown) {
//        	alert("ajax error");
//          alert(jqXHR.status);
//          alert(jqXHR.readyState);
//          alert(textStatus);
//      	jqXHR.responseText
      	
        	var msg = "";
			switch (jqXHR.status){
				case(500):
					msg = "服务器系统内部错误";
					break;
				case(401):
					msg = "未登录";
					break;
				case(403):
					msg = "无权限执行此操作";
				break;
				case(408):
					msg = "请求超时";
					break;
				default:
					msg = "未知错误";
			}
			
	      	$.dialog({
	          	title:"错误",
//	          	icon:"error",
	      	    content:"执行AJAX发现问题：参数非法或"+msg
	      	});
	      	
	      	throw errorThrown;
        },
        complete: function(XMLHttpRequest, textStatus) {
            this; // 调用本次AJAX请求时传递的options参数
        }
	});
}

/**
 * 提示窗口
 * 
 * @author cmh
 * @version 2014-10-24 上午11:56:50
 * @param options
 *            配置项
 */
function myAlert(options) {
	// 默认参数
	var defaults = {
		type : 2,
		title : "温馨提示",
		content : "请选择一条记录",
		icon : "info",
		callback : function() {
		}
	};
	var opts = $.extend(defaults, options);
	if (/msie/.test(navigator.userAgent.toLowerCase())) {
		var ie6 = !- [ 1, ] && !window.XMLHttpRequest;
		if(ie6){
			if(opts.type==1){
				alert(opts.content);
				var fn = opts.callback;
				fn();
				return;
			}else{
				if(opts.type==2){
					$("select").hide();
					var fn = opts.callback;
					opts.callback = function(){
						var ss = $("select");
						$(ss).each(function(i){
							try{
								var v = $(this).combobox("getValue");
								if(v);
							}catch(e){
								$(this).show();
							}
						});
						fn();
					};
				}
			}
		}
	}
	$.messager.alert(opts.title, opts.content, opts.icon, opts.callback);
}

/**
 * 字符串转换成对象
 * 
 * @param str
 * @returns
 */
function strToObj(str) {
	str = str.replace(/&/g, "','");
	str = str.replace(/=/g, "':'");
	str = "({'" + str + "'})";
	var newobj = eval(str);
	return newobj;
}

/**
 * 设置radio的值
 * 
 * @param name
 * @param value
 * @param cleanFlag 是否在设置值之前先清除原来的值
 */
function setRadioValue(name, value, cleanFlag){
	if(cleanFlag) $("input[name="+name+"]").removeAttr("checked");
	$("input[name="+name+"][value="+value+"]").attr("checked",true);
}

/**
 * 获得图片大小(KB)
 * 
 * @param id
 * @returns {Number}
 */
function getImageFileSize(id){
	var imgObj = new Image();
	var fFile = document.getElementById(id);
	imgObj.src = fFile.value;
	var fileSize = imgObj.fileSize||0;
	if(fileSize==0) fileSize = fFile.files[0].size;
	var size = Math.round(fileSize/1000*100)/100;// 图片大小
	//alert("图片大小："+size+"KB");
	return size;
}

/**
 * 初始化Highcharts图表
 * 
 * @author cmh
 * @version 2015-06-01 下午13:05:50
 * @param options 配置项
 */
function initHighcharts(options){
	// 默认参数
	var defaults = {
		id:'#highchartsContainerId',
		js:null,
		jsAll:false,
		credits:{//版权信息配置
    		enabled:false,
    		href:'http://www.sinosoft.com.cn',
    		text:'中科软科技股份有限公司'
    	},
    	title:{text:'主标题'}
	};
	var opts = $.extend(defaults, options);
	
	try{
		if(Highcharts);
	}catch(e){
		$('body').append('<script src="plug-in/highcharts/js/highcharts.js"></script>');
		if(opts.jsAll){
			$('body').append('<script src="plug-in/highcharts/js/highcharts-3d.js"></script>');
			$('body').append('<script src="plug-in/highcharts/js/modules/exporting.js"></script>');
			$('body').append('<script src="plug-in/highcharts/js/modules/no-data-to-display.js"></script>');
		}else{
			if(opts.js){
				var jArr = opts.js.split(",");
				for(var i=0;i<jArr.length;i++){
					$('body').append('<script src="plug-in/highcharts/js/'+jArr[i]+'.js"></script>');
				}
			}
		}
	}
	$(opts.id).highcharts(opts);
}

/**
 * 初始化分页<br>
 * 使用 myPagination 插件
 * 
 * @param id 控件ID
 * @param url 数据URL
 * @param callback 回调函数，处理结果
 * @param rows 每页行数
 */
function initPage(id, url, callback, rows){
	if(!rows) rows = 10;
	var config = {
		ajax : {
			on : true,
			url : url+"&rows="+rows,
			dataType : 'json',
			ajaxStart : function() {
				$.messager.progress();
			},
			callback : function(data) {
				callback(data);
				$.messager.progress('close');
			}
		},
		panel: {
	        tipInfo_on: true,
	        tipInfo: '  跳{input}/{sumPage}页',
	        tipInfo_css: {
	          width: '25px',
	          height: "20px",
	          border: "2px solid #f0f0f0",
	          padding: "0 0 0 5px",
	          margin: "0 5px 0 5px",
	          color: "#48b9ef"
	        }
		}
	};
	$(id).myPagination(config);
}

/**
 * 初始化KindEditor
 * 
 * <pre><pre>
 * @author cmh
 * @since 2016-8-18 上午11:07:21
 * @version 1.0
 * @param options 参数
 * @returns
 */
function initKindEditor(options){
	// 默认参数
	var defaults = {
		id:'#kindEditorId',
		uploadJson : ctx + '/plug-in/kindeditor/m/upload_json.jsp',
        fileManagerJson : ctx +  '/plug-in/kindeditor/m/file_manager_json.jsp',
        allowFileManager : true,
        items : [
            'fontname', 'fontsize', '|', 'forecolor', 'hilitecolor', 'bold', 'italic', 'underline',
            'removeformat', '|', 'justifyleft', 'justifycenter', 'justifyright', 'insertorderedlist',
            'insertunorderedlist', '|', 'emoticons', 'image', 'link', '|', 'insertfile']
	};
	var opts = $.extend(defaults, options);
	return KindEditor.create(opts.id, opts);
}

/**
 * 工具类的jquery扩展
 * @author cmh
 * @version 2014-07-31 上午10:00:50
 */
(function($){
	$.extend({
		u : {
			version:function(){return "工具类 v1.0";},
			toString:function(){return $.u.version();},
			alert:function(options){
				// 默认参数
				var defaults = {
					title:"提示",
					content:"提示",
					icon:"alert.gif"
				};
				var opts = $.extend(defaults, options);
				if($.type(options)=="string"){
					opts.content = options;
				}
				window.top.$.dialog({
					icon:opts.icon,
				    time:3,
					top:100,
					follow:document.getElementById(opts.follow),
					title:opts.title,
					content:opts.content,
					cancel:false
				});
			},
			cache:function(key,value){
				var bind = "body";
				if(window.top.$(bind).length==0) bind = "frameset";
				if(value && null!=value){
					window.top.$(bind).data(key,value);
				}else{
					return window.top.$(bind).data(key);
				}
			},
			removeCache:function(key){
				var bind = "body";
				if(window.top.$(bind).length==0) bind = "frameset";
				return window.top.$(bind).removeData(key);
			},
			checked : function(name,value,flag){
				// 全选/取消/反选   例如： $.u.checked("name");
				if(!flag) flag = ",";
				$("input[name="+name+"]").each(function() {
					if(!value){
						if (!this.checked) this.checked = true; else this.checked = false;
					}else{
						var vArr = value.split(flag);
						for(var i=0;i<vArr.length;i++){
							if(vArr[i].trim()==this.value.trim()){
								if (!this.checked) this.checked = true; else this.checked = false;
							}
						}
					}
				});
			},
			getCheckedValue : function(name,flag){
				var r = "";
				if(!flag) flag = ",";
				$("input[name="+name+"]").each(function() {if (this.checked) r += this.value + flag;});
				if(r.length>0 && r.lastIndexOf(flag)) r = r.substring(0, r.length-1);
				return r;
			},
			setCheckedValue : function(name,value,flag){
				if(name && value){
					if(!flag) flag = ",";
					$("input[name="+name+"]").each(function() {
						var vArr = value.split(flag);
						for(var i=0;i<vArr.length;i++){
							if(vArr[i].trim()==this.value.trim()){
								this.checked = true;
							}else{
								this.checked = false;
							}
						}
					});
				}
			},
			deepCopy : function(source){
				//对象和数组的深拷贝 
				var result={};
				for (var key in source) {
					result[key] = typeof source[key]==='object' ? $.u.deepCopy(source[key]) : source[key];
				} 
				return result;
			}
		}
	});
})(jQuery);
