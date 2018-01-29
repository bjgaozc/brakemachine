/* 公共方法 */
var common = {
	/**
	 * 初始化所有
	 * 
	 * @author cmh
	 * @param {} options 配置
	 */
	initAll: function(options){
		ctx = this.root();
		try{$('input, textarea').placeholder();}catch(e){}
		this.getDbType();
		this.dbType=$.u.cache("dbType");
	},
	/**
	 * 版本
	 * 
	 * @author cmh
	 */
	version: function(){
		return "1.0.0";
	},
	/**
	 * 获取项目
	 * 
	 * @author cmh
	 */
	getRootPath: function(){
		//获取当前网址，如： http://localhost:8083/uimcardprj/share/meun.jsp
	    var curWwwPath = window.document.location.href;
	    // 获取主机地址之后的目录，如： uimcardprj/share/meun.jsp
	    var pathName = window.document.location.pathname;
	    var pos = curWwwPath.indexOf(pathName);
	    // 获取主机地址，如： http://localhost:8083
	    var localhostPaht = curWwwPath.substring(0, pos);
	    //获取带"/"的项目名，
	    // 如：/uimcardprj
	    var projectName = pathName.substring(0, pathName.substr(1).indexOf('/') + 1);
	    var root = localhostPaht +projectName;
	    return root;
	},
	/**
	 * 项目地址
	 * 
	 * @author cmh
	 */
	root: function(){
		return this.getRootPath();
	},
	/**
	 * 向服务器发送请求的地址
	 * 
	 * @author cmh
	 */
	ajaxRoot: function(){
		return this.root();
	},
	/**
	 * 输出调试信息
	 * 
	 * @author cmh
	 */
	log: function(obj){
		try{if(console) console.log(obj);}catch(e){}
	},
	/**
	 * 获取数据库类型
	 * 
	 * @author cmh
	 */
	getDbType: function(){
		var dbType = $.u.cache("dbType");
		if(!dbType){
			$.ajaxSettings.async = false;
			$.getJSON("api/ep/common/prop/dbType.do",{},function(data){
				if(data.success){
					$.u.cache("dbType",data.obj);
				}
			});
			$.ajaxSettings.async = true;
			dbType = $.u.cache("dbType");
		}
		return dbType;
	},
	/**
	 * 获取字段名称
	 * 
	 * @author cmh
	 * @param value 值
	 */
	getField: function(value){
		var d = this.initDbType();
		if("oracle"==d){
			value = value.toUpperCase();
		}
		return value;
	},
	/**
	 * 初始化datagrid提示<br>
	 * 依赖jeasyui-extend
	 * 
	 * @author cmh
	 * @param fields 字段
	 */
	datagridCellTooltip: function(fields){
		return {
            tooltip:{
                enable: true,
                target: "cell",
                fields: [fields],
                formatter: function(value, field){
                	return {content: value, css:{backgroundColor: '#FFFF88', borderColor: '#df8505'}};
                }
            }
        };
	},
	/**
	 * 初始化图片提示
	 * 
	 * @author cmh
	 * @param id 主键
	 * @param src 图片
	 * @param width 图片宽度
	 * @param placeholder 提示文字
	 */
	initImageTooltip: function(id, src, width, placeholder){
		if(!width) width = "450";
		$(id).tooltip({
			content:'<div><img width="'+width+'" src="'+src+'" title="'+placeholder+'" /></div>'
		}).on("click",function(){
			window.open(ctx+"/"+src);
		});
	},
	/**
	 * 初始化日期
	 * 
	 * @author cmh
	 * @param {} options 配置
	 */
	initDate: function(options){
		// 默认参数
		var defaults = {
			id:".date",
			fromat:"yyyy-MM-dd"
		};
		var opts = $.extend(defaults, options);
		var idArr = opts.id.split(",");
		for(var i=0;i<idArr.length;i++){
			$(idArr[i]).parent().addClass("input-icon");
			$(idArr[i]).after("<i class=\"icon-calendar blue\"></i>");
			$(idArr[i]).bind("click", function(){WdatePicker({skin:'twoer',dateFmt:opts.fromat})});
		}
	},
	/**
	 * 日期格式化
	 * 
	 * @param {} value
	 * @param {} row
	 * @param {} index
	 * @return {String}
	 */
	dateFormatter: function(value,row,index){
		if(!value) return "";
		return new Date(value).formatDate("yyyy-MM-dd");
	},
	/**
	 * 日期格式化
	 * 
	 * @param {} value
	 * @param {} row
	 * @param {} index
	 * @return {String}
	 */
	dateTimeFormatter: function(value,row,index){
		if(!value) return "";
		return new Date(value).formatDate("yyyy-MM-dd hh:mm:ss");
	},
	/**
	 * 初始化可编辑表格
	 * 
	 * @author cmh
	 * @param {} options 配置
	 */
	initEditableDatagrid: function(options){
		// 默认参数
		var defaults = {
			id:"#dg",
			onClickRow:null,
			onClickRowToEdit:false,
			addBtn:"#btn_add",
			addBtnOnClick:null,
			editBtn:"#btn_edit",
			editBtnOnClick:null,
			saveBtn:"#btn_save",
			saveBtnOnClick:null,
			deleteBtn:"#btn_delete",
			deleteBtnOnClick:null,
			callback:null
		};
		var opts = $.extend(defaults, options);
		var o = null;
		try{
			o = $(opts.id).datagrid("options");
		}catch(e){
			$(opts.id).datagrid();
			o = $(opts.id).datagrid("options");
		}
		o.onClickRow = function(rowIndex, rowData){
			if(opts.onClickRowToEdit){
				onClickRow(rowIndex, rowData);
			}
			if(opts.onClickRow) opts.onClickRow(rowIndex, rowData);
		};
		$(opts.addBtn).on("click",function(){
			if(null==opts.addBtnOnClick){
				endEditing();
				$(opts.id).datagrid("appendRow",{});
				var editIndex = $(opts.id).datagrid("getRows").length-1;
				$(opts.id).datagrid("selectRow", editIndex).datagrid("beginEdit", editIndex);
			}else{
				opts.addBtnOnClick();
			}
		});
		$(opts.editBtn).on("click",function(){
			if(null==opts.editBtnOnClick){
				onClickRow();
			}else{
				opts.editBtnOnClick();
			}
		});
		$(opts.saveBtn).on("click",function(){
			if(null==opts.saveBtnOnClick){
				endEditing();
				if($(opts.id).datagrid("getChanges").length){
					var r = {};
					r.inserted = $(opts.id).datagrid("getChanges","inserted");
					r.deleted = $(opts.id).datagrid("getChanges","deleted");
					r.updated = $(opts.id).datagrid("getChanges","updated");
					$(opts.id).datagrid("acceptChanges");
//					log(r);
					if(null!=opts.callback) opts.callback(r);
				}
			}else{
				opts.saveBtnOnClick();
			}
		});
		var that = this;
		$(opts.deleteBtn).on("click",function(){
			if(null==opts.deleteBtnOnClick){
				var row = $(opts.id).datagrid("getSelected");
				if (row) {
					var rowIndex = $(opts.id).datagrid("getRowIndex", row);
					$(opts.id).datagrid("deleteRow", rowIndex);
				}else{
					that.tip("<span><i class='fa fa-bell' aria-hidden='true'></i></span>请先选择需要删除的数据");
				}
			}else{
				opts.deleteBtnOnClick();
			}
		});
		function onClickRow(rowIndex, rowData){
			endEditing();
			var row = $(opts.id).datagrid("getSelected");
			if (row) {
				if(!rowIndex) rowIndex = $(opts.id).datagrid("getRowIndex", row);
				$(opts.id).datagrid("beginEdit",rowIndex);
			}else{
				that.tip("<span><i class='fa fa-bell' aria-hidden='true'></i></span>请先选择需要编辑的数据");
			}
		}
		function endEditing(){
			var rows = $(opts.id).datagrid("getRows");
			for ( var i = 0; i < rows.length; i++) {
				$(opts.id).datagrid("endEdit", i);
			}
		}
	},
	/**
	 * 显示护照信息
	 * 
	 * @author cmh
	 * @param {} options 配置
	 */
	showPassportInfo: function(options){
		// 默认参数
		var defaults = {
			title:"护照信息",
			width:960,
			height:580,
			content:"url:baseZjglhzcjController.do?hzInfo",
			type:"1",
			cd:"gl",
			passportId:"",
			personId:null,
			useStatus:null,
			readonly:false,
			callback:function(data){}
		};
		var opts = $.extend(defaults, options);
		
		var d = this.dialog(opts);
		opts.dialog = d;
		$.u.cache("showPassportInfo_config",opts);
		return d;
	},
	/**
	 * 选择单位
	 * 
	 * @author cmh
	 * @param {} options 配置
	 */
	chooseOrg: function(options){
		// 默认参数
		var defaults = {
			treeUrl:"",
			optionsCode:"",
			expandAll:"true",
			clearBtn:"清空",
			check:false,
			pvalue:false,
			clearCallback:function(){},
			closeCallback:function(){},
			confirmCallback:function(){},
			callback:function(orgId,orgName,treeNode){},
			width:400,
		    height:400,
			title:"选择单位",
			content:"url:epCommonController.do?orgChoose"
		};
		
		var opts = $.extend(defaults, options);
		if(opts.treeUrl) opts.content += "&treeUrl="+opts.treeUrl + "&optionsCode="+opts.optionsCode + "&expandAll="+opts.expandAll + "&check="+opts.check;
		var d = this.dialog(opts);
		var baseOrgChooseConfig = {
			clearBtn:opts.clearBtn,
			check:opts.check,
			pvalue:opts.pvalue,
			clearCallback:opts.clearCallback,
			closeCallback:opts.closeCallback,
			confirmCallback:opts.confirmCallback,
			callback:opts.callback
		};
		$.u.cache("orgChoose_config",baseOrgChooseConfig);
		return d;
	},
	/**
	 * 选择人员
	 * 
	 * @author cmh
	 * @param {} options 配置
	 */
	choosePerson: function(options){
		// 默认参数
		var defaults = {
			okBtn:"确定",
			okBtnIconCls:"fa fa-send",
			optionsCode:"default",
			expandAll:"true",
			callback:function(userIds,data){},
			width:800,
			height:450,
			title:"选择人员",
			content:"url:epCommonController.do?departAndUserPage"
		};
		var opts = $.extend(defaults, options);
		opts.content += "&optionsCode="+opts.optionsCode;
		opts.content += "&expandAll="+opts.expandAll;
		var d = this.dialog(opts);
		var basePersonChooseConfig = {
			okBtn:opts.okBtn,
			okBtnIconCls:opts.okBtnIconCls,
			callback:opts.callback
		};
		$.u.cache("personChoose_config",basePersonChooseConfig);
		return d;
	},
	/**
	 * 设置提示信息
	 * 
	 * @author cmh
	 * @param {} options 配置
	 */
	inputTipText: function(options){
		var isIE8=isIE&&!!document.documentMode;
		if(isIE8){
			$("input[placeholder]").each(function(){
				if($(this).val() == ""){
					var oldVal=$(this).attr("placeholder");
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
	},
	/**
	 * 验证是否为空
	 * 
	 * @author cmh
	 * @param val
	 */
	validateIsNull: function(val){
		if(!val || undefined == val || null==val || ""===val){
			return true;
		}
		return false;
	},
	/**
	 * 判断字符串是否为空
	 * 
	 * @author cmh
	 * @param {Object} obj
	 */
	strIsNull: function(obj){
		return this.validateIsNull(obj);
	},
	/**
	 * 判断字符串是否为空
	 * 
	 * @author cmh
	 * @param {Object} obj
	 */
	stringtrim: function(str){
		// 用正则表达式将前后空格  用空字符串替代
		try{return str.replace(/(^\s*)|(\s*$)/g, "");}catch(e){alert(e.message);return str;};
	},
	/**
	 * 身份证校验
	 * 
	 * @author cmh
	 * @param value  身份证号码
	 * @returns {success:true,message:""}
	 */
	validateIdCard: function(value){
		if(this.strIsNull(this.stringtrim(value))){
			return {success:false,message:"身份证号不正确"};
		}
		var num=this.stringtrim(value.toUpperCase());
		value=num;
		num = num.toUpperCase();  
		if (!(/(^\d{15}$)|(^\d{17}([0-9]|X)$)/.test(num))){ 
	        return {success:false,message:"输入的身份证号长度不对，或者号码不符合规定！<br>15位号码应全为数字<br>18位号码末位可以为数字或X"};
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
				return {success:false,message:"输入的身份证号里出生日期不对"};
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
				return {success:true,message:""};
			}
		}else if(len == 18){ 
			re = new RegExp(/^(\d{6})(\d{4})(\d{2})(\d{2})(\d{3})([0-9]|X)$/); 
			var arrSplit = num.match(re); 
			//检查生日日期是否正确 
			var dtmBirth = new Date(arrSplit[2] + "/" + arrSplit[3] + "/" + arrSplit[4]); 
			var bGoodDay; 
			bGoodDay = (dtmBirth.getFullYear() == Number(arrSplit[2])) && ((dtmBirth.getMonth() + 1) == Number(arrSplit[3])) && (dtmBirth.getDate() == Number(arrSplit[4])); 
			if (!bGoodDay){ 
				return {success:false,message:"输入的身份证号里出生日期不对"};
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
					return {success:false,message:"您输入的身份证号不正确！<br>最后一位应该为：" + valnum};
				} 
				return {success:true,message:""};
			}
		}
		return {success:false,message:"身份证号不正确"};
	},
	/**
	 * 显示出生日期
	 * 
	 * @author cmh
	 * @param value 身份证号码
	 * @param birthdayId 出生日期主键
	 * @param sexId 性别主键
	 * @returns {Boolean} 校验是否成功，成功：true  失败：false
	 */
	showbirthday: function(value, birthdayId, sexId){
		value=this.stringtrim(value.toUpperCase());
		var idCardValue =value;
		if(this.strIsNull(idCardValue)){
			return;
		}
		if(!this.validateIdCard(idCardValue)){
			return ;
		}
		var birthdayObj = document.getElementById(birthdayId);
		if (idCardValue != ""
				&& (idCardValue.length == 15 || idCardValue.length == 18)) {
			var tempDay = "";
			if (idCardValue.length == 15) {
				tempDay = "19" + idCardValue.substring(6, 8) + "-"
						+ idCardValue.substring(8, 10) + "-"
						+ idCardValue.substring(10, 12);
				var sexNum = idCardValue.substring(14);
				if (isNum(sexNum)) {
					var tempN = parseInt(sexNum) % 2;
					if (tempN == 0) {
						var sex = document.getElementById(sexId).value = "女";
					} else {
						var sex = document.getElementById(sexId).value = "男";
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
						var sex = document.getElementById(sexId).value = "女";
					} else {
						var sex = document.getElementById(sexId).value = "男";
					}
				}
			}
			birthdayObj.value = tempDay;
		}
	},
	/**
	 * 验证日期
	 * 
	 * @author cmh
	 * @param date yyyy-mm-dd或yyyy-m-d
	 */
	validateDate: function(date){
		if(this.validateIsNull(date)){
			alert("日期不能为空");
			return false;
		}
		var flag=/^[1-3][0-9]{3}-([0][1-9]|[1-9]|[1][0-2])-([0][1-9]|[1-9]|[1-2][0-9]|[3][0-1])$/.test(date);
		if (flag==false){
			alert("日期格式错误");
			return flag;
		}
		var arr=date.split("-");
		var lastDate=getLastDateOfMonth(date)
		if(parseInt(lastDate,10)<parseInt(arr[2],10)){
			alert("日期格式错误");
			return flag;
		}
		return true;
	},
	/**
	 * 验证年
	 * 
	 * @author cmh
	 * @param year 年
	 */
	validateDate: function(year){
		if(this.validateIsNull(year)){
			alert("年份不能为空");
			return false;
		}
		var flag=/^[1-3][0-9]{3}$/.test(year);
		if (flag==false){
			alert("年份格式错误");
		}
		return flag;
	},
	/**
	 * 验证月
	 * 
	 * @author cmh
	 * @param month 月
	 */
	validateMonth: function(month){
		if(this.validateIsNull(month)){
			alert("月份不能为空");
			return false;
		}
		var flag=/^([1-9]|[1][0-2])$/.test(month);
		if (flag==false){
			alert("月份格式错误");
		}
		return flag;
	},
	/**
	 * 验证日
	 * 
	 * @author cmh
	 * @param day 日期 格式，例如：yyyy-mm-dd
	 */
	validateMonth: function(day){
		if(this.validateIsNull(day)){
			alert("日期不能为空");
			return false;
		}
		var flag=/^([1-9]|[1-2][0-9]|[3][0-1])$/.test(day);
		if (flag==false){
			alert("日期格式错误");
		}
		return flag;
	},
	/**
	 * 读取给定日期的最后一天
	 * 
	 * @author cmh
	 * @param date 日期 格式，例如：yyyy-mm-dd
	 */
	getLastDateOfMonth: function(date){
		var arr=date.split("-");
		if(parseInt(arr[1],10)==2){
			if(isLeapYear(parseInt(arr[0],10))){
				return "29";
			}else{
				return "28";
			}
		}
		var months=[1,3,5,7,8,10,12];
		for(var m in months){
			if(m==parseInt(arr[1],10)){
				return "31";
			}
		}
		return "30";
	},
	/**
	 * 判断是否为闰年
	 * 
	 * @author cmh
	 * @param year 年 格式，例如：yyyy
	 */
	isLeapYear: function(year){
		var y=parseInt(year,10);
		if(y%100==0){
			if(y%400==0){
				return true;
			}
		}else{
			if(y%4==0){
				return true;
			}
		}
		return false;
	},
	/**
	 * 验证中文
	 * 
	 * @author cmh
	 * @param value 值
	 * @returns {Boolean} 校验是否成功，成功：true  失败：false
	 */
	validateChinese: function(value){
		return /^[\Α-\￥]+$/i.test(value);
	},
	/**
	 * ajax获取数据填充到页面（遍历服务器返回的数据，与common.parseData2功能相同，推荐使用common.parseData2）
	 * 
	 * @author xy
	 * @param qz 页面标签id前缀
	 * @param url ajax url
	 * @param types 数据字典
	 * @param param 自定义参数
	 * @param callback 成功回调
	 */
	parseData: function(qz,url, types, param,callback){
		$.get(url,param,function(data){
	        for (var key in data) {
	            var obj = $("#" + qz + key);
	            if (obj.length != 1)
	                continue;
	            var typeCode = obj.attr("data-typeCode");
	            if (typeCode)
	            	data[key] = this.dataGridFormatByType(types, typeCode, data[key]);
	            if (data[key] == null)
	            	data[key] = "";
	            if (obj[0].localName === "input" || obj[0].localName === "select")
	                obj.val(data[key]);
	            else
	                obj.text(data[key]);
	            if(callback instanceof Function){
	                callback();
	            }
	        }
	    },"json");
	},
	/**
	 * 获取数据，解析到页面,需要标签带有data-ajaxKey属性 （遍历页面上的标签，与common.parseData功能相同，推荐使用common.parseData2）
	 * @param fuid 父标签#id或其它jq选择器
	 * @param url ajax url
	 * @param types 数据字典
	 * @param param 自定义参数
	 * @param callback 成功回调
	 */
	parseData2: function(fuid, url, types, param, callback){
		var baseObj = $(fuid).find("[data-ajaxKey]");
		if (baseObj.length == 0)
			return;
		$.get(url,param,function(data){
			baseObj.each(function() {
				var zithis = $(this);
				var key = zithis.attr("data-ajaxKey");
				var typeCode = zithis.attr("data-typeCode");
	            if (typeCode)
	            	data[key] = this.dataGridFormatByType(types, typeCode, data[key]);
	            if (data[key] == null)
	            	data[key] = "";
	            if (this.localName === "input" || this.localName === "select")
	            	zithis.val(data[key]);
	            else
	            	zithis.text(data[key]);
	            if(callback instanceof Function){
	                callback();
	            }
			});
	    },"json");
	},
	/**
	 * 返回数据字典对应值
	 * 可放在datagrid的format里面
	 * @author xy
	 * @param types 数据字典，getTypes(codes)的返回值
	 * @param typeCode 数据字典类型名
	 * @param code 需要查的key
	 * @returns
	 */
	dataGridFormatByType: function(types, typeCode, code){
		if (!types || !typeCode || !code || !types[typeCode] || !types[typeCode][code])
			return code;
		return types[typeCode][code];
	},
	/**
	 * form表单加载数据
	 * 
	 * @param {Object} form 表单
	 * @param {Object} obj 填充对象
	 * @param {Object} otherObj
	 */
	dataGridFormatByType: function(types, typeCode, code){
		var f=null;
		if((typeof form)==="object"){
			f=form;
		}
		if((typeof form)==="string"){
			f=document.getElementById(form);
		}
		obj=obj||{};
		for(var n in obj){
			if(f[n]){
				f[n].value=obj[n];
			}
		}
		otherObj=otherObj||{};
		for(var other in otherObj){
			if(obj[otherObj[other]]&&f[other]&&(typeof otherObj[other])=="string"){
				f[other].value=obj[otherObj[other]];
			}
		}
	},
	/**
	 * 序列化表格数据并提交
	 * 不能提交file类型
	 * 
	 * @author xy
	 * @param formId 表格id 需要加#
	 * @param url 提交的url
	 * @param callback 成功回调
	 * @returns
	 */
	submitData: function(formId, url, callback){
		$.ajax({
	        type: "POST",
	        url: this.root + "/" + url,
	        dataType: "json",
	        traditional:true,
	        data: $(formId).serializeObject(),
	        success: function(data) {
	            if (callback instanceof Function)
	                callback(data);
	        }
	    });
	},
	/**
	 * 初始化上传按钮
	 * 
	 * @author cmh
	 * @param name 按钮名称
	 * @param id 主键
	 * @param type 类型
	 * @param progress 是否遮罩
	 * @param cssClass 样式
	 */
	initUploadBtn: function(text, id, type, progress, cssClass){
		if(!type) type = "2";
		if(!progress) progress = false;
		if(!cssClass) cssClass = "fileinput-button fileinput-button-block";
		setTimeout(function(){
			var o = null;
			if(!id){
				if(!text) text="点击选择文件";
				o = $(".ieDiv");
			}else{
				o = $(id).parent();
			}
			if("1"==type){
				o.removeClass("ieDiv").addClass(cssClass).append("<i class='fa fa-upload'></i><span>"+text+"</span>").css({"fontSize":"12px","color":"#007fd0","box-sizing":"border-box"});
			}else if("2"==type){
				o.removeClass("ieDiv").addClass(cssClass).append("<i class='fa fa-upload'></i><span>"+text+"</span>").css({"color":"#007fd0","box-sizing":"border-box"});
				o.linkbutton();
				var newElement = $(id).clone();
				o.append(newElement);
				$(id).remove();
			}else if("3"==type){
				changebtn(false);
			}else if("4"==type){
				changebtn(true);
			}
		}, 200);
		
		function changebtn(plain){
			var idArr = id.split(",");
			if(idArr.length>1){
				$(idArr[1]).parent().hide();
			}else{
				$(".ieDiv").hide();
			}
			
			$(idArr[0]).parent().append("<div id='"+$(idArr[0]).attr("id")+"' class='fileinput-button fileinput-button-block'>"+$(idArr[0]).html()+"</div>");
			$(idArr[0]).remove();
			var tfile = null;
			if(idArr.length>1){
				tfile = $(idArr[1]).clone();
				$(idArr[1]).parent().remove();
			}else{
				tfile = $(".ieDiv").find("input[type=file]");
				$(".ieDiv").remove();
			}
			var t = $(idArr[0]).find(".l-btn-text").text();
			if(t) text = t;
			$(idArr[0]).find("span").remove();
			$(idArr[0]).append("<i class='fa fa-upload'></i><span class='l-btn-text' style='color:#777'>"+text+"</span>").css({"color":"#007fd0","width":"auto"});
			$(idArr[0]).linkbutton({plain:plain});
			// TODO 这样还是会有问题，上传校验格式不正确会打断
			if(progress) tfile.on("change",function(){window.top.$.messager.progress({"text":$.messager.defaults.progressText});});
			$(idArr[0]).append(tfile);
			
			return idArr[0];
		}
	},
	/**
	 * 初始化ztree
	 * 
	 * @author cmh
	 * @param options 配置
	 */
	initZtree: function(options){
		// 默认参数
		var defaults = {
			id:"#treeObj",
			autoExpand:true,
			url:"",
			name:"",
			idKey:"",
			pIdKey:"",
			beforeCheck:function(){},
			onClick:function(event, treeId, treeNod){}
		};
		var opts = $.extend(defaults, options);
		var setting = {
			async:{
				dataType:"text",
				enable:true,
				type:"post",
				contentType: "application/json",
				url:opts.url,
				otherParam: []
			},
			data: {
				key:{
					checked:"checked",
					children:"children",
					title:"",
					name:opts.name
				},
				simpleData: {
					enable: true,
					idKey:opts.idKey,
					pIdKey:opts.pIdKey,
					rootPId:null
				}
			},
			zTreeObj:{},
			callback: {
				beforeCheck:opts.beforeCheck,
				onClick:opts.onClick
			},
			view:{selectedMulti: false}
		};
		
		var t = $.fn.zTree.init($(opts.id), setting, []);
		if(opts.autoExpand){
			setTimeout(function(){
				t.expandAll(true);//单位列表初始化展开全部节点
			},500);
		}
		return t;
	},
	/**
	 * 初始化window
	 * 
	 * @author cmh
	 * @param options 配置
	 */
	initWindow: function(options){
		// 默认参数
		var defaults = {
			id:"#windowObj",
			title:"窗口",
			width:400,
		    height:400,
		    shadow:true,
		    collapsible:false,
			minimizable:false,
			maximizable:false,
		    modal:true,
		    onOpen: function(){},
		    tools:[]
		};
		var opts = $.extend(defaults, options);
		$(opts.id).css({'display':''});
		var w = $(opts.id).window(opts);
		return w;
	},
	/**
	 * 初始化表单
	 * 
	 * @author cmh
	 * @param options 参数，例如 {formId:"vfdForm"}
	 */
	initForm: function(options){
		// 默认参数
		var defaults = {
			tabId:null,
			formId:"#vfdForm",
			btnSubmit:"#saveBtn", 
			btnReset:"#resetBtn", 
			tiptype:2,
			beforeCheck:function(curform){},
			beforeSubmit:function(curform){
				layer.load(2,{shade: 0.1});
				$(opts.btnSubmit).parent().parent().hide();
			},
			succeedMsg:"保存成功",
			errorMsg:"保存失败",
			callback:null,
			saveInfo:function(data){}
		};
		var opts = $.extend(defaults, options);
		if(null==opts.callback){
			opts.callback = function(data){
				setTimeout(function(){
					$.Hidemsg();
					layer.closeAll('loading');
					if(data.success || data.status==0){
						this.succeed(opts.succeedMsg);
						data.tabId = opts.tabId;
						if(data.result && data.result.vfdmId) $("#vfdmId").val(data.result.vfdmId);
						if(data.tabId) this.nextStep({data:{tabId:data.tabId}});
						$(".Validform_loading").text("").removeClass("Validform_loading");
						opts.saveInfo(data);
					}else if(data.status==403){
						location.href = this.getFrontUrl("seCmIndex")+"/login-index.do";
					}else{
						var msg = data.msg;
						if(!msg) msg = data.message;
						this.error(opts.errorMsg+"："+msg);
					}
					$(opts.btnSubmit).parent().parent().show();
				},600);
			}
		}
		
		// 初始化表单验证
		var f = $(opts.formId).Validform({
			tiptype:opts.tiptype, 
			ajaxPost:true,
			btnSubmit:opts.btnSubmit, 
			btnReset:opts.btnReset, 
			beforeCheck:opts.beforeCheck,
			beforeSubmit:opts.beforeSubmit,
			callback:opts.callback
		});
		return f;
	},
	/**
	 * 验证表单
	 * 
	 * @author cmh
	 * @param formId 表单ID
	 * @returns true:验证通过;false:验证未通过
	 */
	validateForm: function(formId){
		if(formId.substring(0,1) != "#") formId = "#"+formId;
		var d = $(formId).Validform({tiptype:2});
		var r = false;
		try{
			r = d.check(false);
		}catch(e){
			alert(e.message);
		}
		return r;
	},
	
	/**
	 * 确认框
	 * 
	 * @author cmh
	 * @param msg 消息
	 * @param c 回调
	 */
	confirm: function(msg, c){
		window.top.layer.confirm(msg, {icon: 3}, function(index){
			c();
			window.top.layer.close(index);
		});
	},
	/**
	 * 警告框
	 * 
	 * @author cmh
	 * @param {} msg 消息
	 * @param {} fn 回调
	 * @param {} title 标题
	 * @param {} icon 图标
	 */
	alert: function(msg, fn, title, icon){
		try{
			if(!fn) fn = function(){};
			if(!title) title = "温馨提示";
			if(!icon) icon = "";//error,question,info,warning  | fa fa-plus
			window.top.$.messager.alert(title,msg,icon,fn);
		}catch(e){}
	},
	/**
	 * 提示
	 * 
	 * @author cmh
	 * @since 2015-08-18 下午17:23:50
	 * @version 1.0
	 * @param msg 消息
	 * @param type 类型
	 * @param id 控件ID
	 */
	tip: function(msg, type, id){
		if(!type) type = 0;
		if(type==0){
			try{window.top.tip(msg);}catch(e){tip(msg);}
		}else if(type==1){
			setTimeout(function(){
				try{$.Hidemsg();}catch(e){}
				window.top.layer.msg(msg,{icon:1});
			},200);
		}else if(type==2){
			$.Showmsg(msg);
			setTimeout(function(){$.Hidemsg();},3000);
		}else if(type==3){
			if(id){
				window.top.layer.tips(msg,id,{time:0});
				$(".layui-layer-tips").css({"width":"auto"});
			}
		}
	},
	/**
	 * 弹出window窗口(到顶层)
	 * 
	 * @author cmh
	 * @param options 配置
	 */
	window: function(options){
		var query = parent.$, fnClose = options.onClose;
		var opts = query.extend({
			title: '窗口',
			width: 600,
			height: 400,
			closed: false,
			cache: false,
			modal: true,
			minimizable:false,
			html: '',
			url: '',
			viewModel: query.noop
		}, options);

		opts.onClose = function () {
			if (query.isFunction(fnClose)) fnClose();
			query(this).dialog('destroy');
		};

		if (query.isFunction(opts.html))
			opts.html = utils.functionComment(opts.html);
		else if (/^\#.*\-template$/.test(opts.html))
			opts.html = $(opts.html).html();

		opts.html = opts.html.replace(new RegExp(/win-/g),'');
		var win = query('<div></div>').appendTo('body').html(opts.html);
		if (opts.url)
			query.ajax({ async: false, url: opts.url, success: function (d) { win.empty().html(d); } });

		win.window(opts);
		query.parser.onComplete = function () {
			if ("undefined" === typeof ko)
				opts.viewModel(win);
			else
				ko.applyBindings(new opts.viewModel(win), win[0]);

			query.parser.onComplete = query.noop;
		};
		query.parser.parse(win);
		return win;
	},
	/**
	 * 弹出窗口
	 * 
	 * @author cmh
	 * @param options 配置
	 */
	dialog: function(options){
		try{windowapi}catch(e){windowapi = frameElement?frameElement.api:undefined;}
		// 默认参数
		var defaults = {
			lock:true,
			cache:false,
			resize:false,
			padding:0,
			min:false,
			max:false,
			width:600,
			height:400,
			parent:windowapi,
			title:"窗口",
			content: "内容",
			init:function(){},
			close:function(){
				try{parent.$(".ui_loading").remove();}catch(e){}
			},
			autoMax:false
		};
		var opts = $.extend(defaults, options);
		if(opts.width=="100%"){
			opts.width = window.top.document.body.offsetWidth;
		}
		if(opts.height=="100%"){
			opts.height = window.top.document.body.offsetHeight-80;
		}
		var d = window.top.$.dialog(opts);
		if(opts.autoMax) d.max();
		return d;
	},
	/**
	 * 判断传入的时间是否是半年后  半年后为true  半年前为 false
	 * 
	 * @param {} endDate  格式2016-01-01
	 * @return {Boolean}
	 */
	isSixMonths: function(endDate){
		var myDate = new Date();  
		var startDate	=myDate.toLocaleDateString().replace("\/","-").replace("\/","-");//当前时间
		if(endDate!=""){
			var num=DateSubtract(startDate,endDate);
			if(num<180){
				return false;
			}else{
				return true;
			}
		}
		return false;
	},
	/**
	 * 根据传入的参数 判断现在页面当前的状态
	 * @param {} isSubmit   是否提交
	 * @param {} isSp       是否审批页面
	 * @return {String}
	 */
	isSp:function(isSubmit,isSp){
		if(isSp=="1"){//审批页面  不需要控制
		return "0";
		}else if(isSp!="1"&&isSubmit=="1"){
		return "1";  //填报页面   已提交
		}else if(isSp!="1"&&isSubmit!="1"){
		return "2";  //填报页面  未提交
		}
	},
	/**
	 * 根据传入时间获取从当前时间到传入时间之间的工作日
	 */
	 checkTime:function (endTime){
		//起始日期
		var nowDate= this.getNowFormatDate();
		var beginDate= new Date(nowDate.replace(/-/g, "/"));
		//结束日期  
		var endDate = new Date(endTime.replace(/-/g, "/"));  
		//日期差值,即包含周六日、以天为单位的工时，86400000=1000*60*60*24.  
		var workDayVal = (endDate - beginDate)/86400000 + 1;  
		//工时的余数  
		var remainder = workDayVal % 7;  
		//工时向下取整的除数  
		var divisor = Math.floor(workDayVal / 7);  
		var weekendDay = 2 * divisor;  
		//起始日期的星期，星期取值有（1,2,3,4,5,6,0）  
		var nextDay = beginDate.getDay();  
		//从起始日期的星期开始 遍历remainder天  
		for(var tempDay = remainder; tempDay>=1; tempDay--) {  
		    //第一天不用加1  
		    if(tempDay == remainder) {  
		        nextDay = nextDay + 0;  
		    } else if(tempDay != remainder) {  
		        nextDay = nextDay + 1;  
		    }  
		    //周日，变更为0  
		    if(nextDay == 7) {  
		        nextDay = 0;  
		    }  
		  
		    //周六日  
		    if(nextDay == 0 || nextDay == 6) {  
		        weekendDay = weekendDay + 1;  
		    }  
		}  
		//实际工时（天） = 起止日期差 - 周六日数目。  
		workDayVal = workDayVal - weekendDay;  
		return workDayVal;
	},
	/**
	 * 获取当前时间，格式YYYY-MM-DD
	 * @return {}
	 */
 	getNowFormatDate:function () {
        var date = new Date();
        var seperator1 = "-";
        var year = date.getFullYear();
        var month = date.getMonth() + 1;
        var strDate = date.getDate();
        if (month >= 1 && month <= 9) {
            month = "0" + month;
        }
        if (strDate >= 0 && strDate <= 9) {
            strDate = "0" + strDate;
        }
        var currentdate = year + seperator1 + month + seperator1 + strDate;
        return currentdate;
    },
	/**
     * 下载 无弹框
     * url 下载连接
	 *
     * @author LiWeichao
     * @param {} url
     */
    downLoadIframe:function(url){
    	try{
			var _downTmp = document.createElement("iframe");
			_downTmp.src = url;
			_downTmp.style.display = "none";
			document.body.appendChild(_downTmp);
		}catch(e){
			alert("操作异常！");
		}
    },
    
    
	/**
	 * 初始化combobox
	 * 
	 * @author cmh
	 * @param {} options 配置
	 */
	initCombobox: function(options){
		// 默认参数
		var defaults = {
			id:"#cb",
//			url:"appCommonController.do?getComboDs=true&tableName=t_s_territory&id=territorycode&text=territoryname",
			valueField:"id", 
			textField:"text",
			editable:false,
			multiple:false,
			panelHeight:"auto",
			width:"90%",
			onSelect: function(rec){
				if(!opts.multiple){
					$(this).val(rec[opts.valueField]);
				}
				c.next().children(":text").focus();
	        },
	        onChange:function(n, o){
	        	if(!opts.multiple){
					var d = $(this).combobox("getData");
		        	var flag = false;
		        	for(var i=0;i<d.length;i++){
		        		if(d[i][opts.valueField]==n){
		        			flag = true;
		        			break;
		        		}
		        	}
		        	if(!flag) $(this).val("");
				}else{
					var v = $(this).combobox("getValues");
	        		if(v.length>0) $(this).val(v.join(","));
				}
	        }
		};
		var opts = $.extend(defaults, options);
		var c = $(opts.id).combobox(opts);
		if(!opts.multiple){
			function setVal(that){
				var v = that.val();
				if(""!=v){
					var d = c.combobox("getData");
					var flag = false;
			    	for(var i=0;i<d.length;i++){
			    		if(d[i][opts.textField]==v){
			    			c.combobox("setValue",d[i][opts.valueField]);
			    			$(opts.id).val(d[i][opts.valueField]);
			    			flag = true;
			    			break;
			    		}
			    	}
			    	if(!flag){// 没有查中的情况，尝试补全
			    		for(var i=0;i<d.length;i++){
		//		    		if(d[i][textField].indexOf(v)>-1){  // 模糊查找
			    			if(d[i][opts.textField].substring(0,v.length)==v){// 第一个查中才算
				    			c.combobox("setValue",d[i][opts.valueField]);
				    			$(opts.id).val(d[i][opts.valueField]);
				    			break;
				    		}
				    	}
			    	}
				}
			}
			c.next().children(":text").blur(function(){setVal($(this));}).keydown(function(e){if(e.keyCode==13){setVal($(this));}});
		}
		c.next().click(function(){c.combobox("showPanel");});
	},
	/**
	 * 禁用combobox
	 * 
	 * 
	 * @author cmh
	 * @since 2017年5月29日 下午7:12:56
	 * @version 1.0
	 * @param id 主键
	 * @param value 值
	 */
	disableCombobox: function(id, value){
		$(id).combobox({onShowPanel:function(){$(id).combobox("hidePanel");}}).combobox("disable");
		if(value) $(id).combobox("setValue",value).combobox("disable");
	},
	
	/**
	 * 选择框 触发事件
	 * 
	 * @author cmh
	 * @since 2016-03-23 15:29:23
	 * @version 1.0
	 * @param e 事件
	 */
	selectEvent: function(e){
		var targetId = e.data.targetId;
		if(targetId) $(targetId).val($(this).val());
		
		// 处理事件
		if(e.data.event && e.data.event.length>0){
			var sId = $(this).val();// 选择的值
			for(var i=0;i<e.data.event.length;i++){
				var eObj = e.data.event[i];
				var id = eObj.id;
				var tId = eObj.targetId;
				var tIdArr = tId.split(",");
				if("!readonly"==eObj.type){
					if(id==sId){
						for(var j=0;j<tIdArr.length;j++){
							$(tIdArr[j]).removeAttr("readonly").css("background-color","#fff");
						}
					}else{
						for(var j=0;j<tIdArr.length;j++){
							$(tIdArr[j]).val("").attr("readonly",true).css("background-color","#e0e0e0");
						}
					}
				}else if("show"==eObj.type){
					if(id==sId){
						for(var j=0;j<tIdArr.length;j++){
							$(tIdArr[j]).show();
						}
					}else{
						for(var j=0;j<tIdArr.length;j++){
							$(tIdArr[j]).hide();
						}
					}
				}else if("hide"==eObj.type){
					if(id==sId){
						for(var j=0;j<tIdArr.length;j++){
							$(tIdArr[j]).hide();
						}
					}else{
						for(var j=0;j<tIdArr.length;j++){
							$(tIdArr[j]).show();
						}
					}
				}else if("clean"==eObj.type){
					if(id==sId){
						for(var j=0;j<tIdArr.length;j++){
							$(tIdArr[j]).val("");
						}
					}
				}else if("changeSelect"==eObj.type){
					for(var j=0;j<tIdArr.length;j++){
						var inputs=$(tIdArr[j]+" :input[name*='vti-']");
						var index=$(this).prop('selectedIndex');
						if(index>-1){
							inputs.val("");
							var input=inputs.eq(index);
							if(input){
								input.val(1);
							}
						}
					}
				}else if("reset"==eObj.type){
					for(var j=0;j<tIdArr.length;j++){
						try{
							$(tIdArr[j]).val("");
							$(tIdArr[j]).trigger("select2:updated");
							$(tIdArr[j]+" :input[name*='vti-']").val("");
							$(tIdArr[j]).change();
						}catch(e){}
					}
				}else if("!disabled"==eObj.type){
					if(id==sId){
						for(var j=0;j<tIdArr.length;j++){
							$(tIdArr[j]).removeAttr("disabled").css("background-color","#fff");
						}
					}else{
						for(var j=0;j<tIdArr.length;j++){
							$(tIdArr[j]).val("").attr("disabled",true).css("background-color","#e0e0e0");
						}
					}
				}else if("cascade"==eObj.type){
					for(var j=0;j<tIdArr.length;j++){
						var u = eObj.url;
						if(!u){
							u = "epCommonController.do?getChdsByFthCode&fthCode="+sId;
						}else{
							var reg = /[\u4e00-\u9fa5]/g;
							if(reg.test(sId)){//含有中文则需要编码
							    sId = encodeURIComponent(sId);
							}
							u += sId;
						}
						try{$(tIdArr[j]).select2().select2("destroy");}catch(e){}
						$(tIdArr[j]).empty();
						common.initSelect({id:tIdArr[j],url:u,value:eObj.value,customRequired:eObj.customRequired});
					}
				}else if("custom"==eObj.type){
				}
			}
		}
	},
	/**
	 * 初始化select控件<br>
	 * 如果是多选，只需要在select元素上添加 multiple=""
	 * 
	 * @author cmh
	 * @since 2016-03-23 16:28:23
	 * @version 1.0
	 * @param options 参数，例如 {id:"#selectId"}
	 */
	initSelect: function(options){
		var that = this;
		// 默认参数
		var defaults = {
			id:"#selectId", // 控件主键
			value:"", // 控件默认值
			width:"auto", // 控件宽度 
			targetId:null,
			change:that.selectEvent, // 事件
			url:null, // 数据
			data:null, // 参数
			event:null, // 自定义事件 数组 []
			cache:false, // 是否缓存，缓存数据需要ajax同步
			valueField:"id",
			tree:false,
			icon:null,
			customRequired:false, //自定义必选项,默认为false,如果为true,则如果有数据则设置为必选,无数据,则非必选
			callback:null
		};
		var opts = $.extend(defaults, options);
		var placeholder = $(opts.id).attr("placeholder");
		if(!placeholder) placeholder = "请选择";
		if(opts.url){
			if(that.initSelectCache) opts.cache = true;
			var cache = $("body").data(opts.url);
			if(opts.cache){
				if(cache){
					datacall(cache);
				}else{
					$.ajaxSettings.async = false;
					$.getJSON(opts.url, opts.data, datacall);
					$.ajaxSettings.async = false;
				}
			}else{
				if("array"===$.type(opts.url)){
					datacall(opts.url);
				}else{
					$.getJSON(opts.url, opts.data, function(data){try{datacall(data);}catch(e){}});
				}
			}
			function datacall(d){
				if(d){
					if(!cache) $("body").data(opts.url,d);
					$(opts.id).empty();
					var multiple = $(opts.id).attr("multiple");
					if(multiple != "multiple"){
						$(opts.id).append("<option></option>");
					}
					
					for(var i=0;i<d.length;i++){
						var vStr = "";
						if(opts.value===d[i][opts.valueField]) vStr = "selected=\"selected\"";
						if(opts.tree){
							if(d[i].pid) vStr += " parent=\""+d[i].pid+"\"";
							if(d[i].style) vStr += "style=\""+d[i].style+"\"";
							if(d[i].disabled) vStr += " disabled=\""+d[i].disabled+"\"";
							if(d[i].css) vStr += " css=\""+d[i].css+"\"";
						}
						var option = "<option value=\""+d[i][opts.valueField]+"\" "+vStr+" >"+d[i].text+"</option>";
						$(opts.id).append(option);
					}
					
					if(opts.customRequired){
						if(d.length == 0 || (d.length == 1 && d[0][opts.valueField] == "")){
							$(opts.id).removeAttr("datatype");
						}else{
							$(opts.id).attr("datatype","*");
						}
					}
					after();
				}
			}
		}else {
			after();
		}
		function after(){
			var defaultValue = $(opts.id).attr("value");
			if(!opts.value && defaultValue != ""){
				opts.value = defaultValue;
			}
			// 赋值
			if(opts.value){
				if(opts.targetId) $(opts.targetId).val(opts.value);
				$(opts.id).val(opts.value);
			}else if(opts.targetId){
				$(opts.id).val($(opts.targetId).val());
			}
			// 绑定事件
			$(opts.id).bind("change", {id:opts.id,value:opts.value,targetId:opts.targetId,event:opts.event}, opts.change);
			$(opts.id).trigger("change");// 触发一次
			
			$(opts.id).on("select2:close",function(){$(opts.id).trigger("blur")});//关闭时触发校验
			// 获取自定义宽度
			var w = $(opts.id).attr("width");
			if(w) opts.width = w;
			if("auto"==opts.width){
				var w = $("input.col-xs-10.col-sm-5:first").width();
				if(w){
					opts.width = w+"%";
				}else{
					opts.width = "100%";
				}
			}
			try{
				var config = {
					data:opts.data,
					language: 'zh-CN',
					width: opts.width,
					placeholder: placeholder,
					allowClear:true,
					icon:opts.icon
				};
				if(opts.tree){
					$(opts.id).select2tree(config);
				}else{
					$(opts.id).select2(config);
//					try{$(opts.id).next(".select2-container").css("width", w);}catch(e){alert(e.message);}
				}
			}catch(e){
				alert(e.message);
			}
			
			if(opts.callback){
				opts.callback();
			}
		}
		return opts.cache;
	},
	
	/**
	 * 初始化combogrid
	 * 
	 * @author cmh
	 * @param {} options 配置
	 */
	initCombogrid: function(options){
		// 默认参数
		var defaults = {
			id:"#combogridId", // 控件主键
			url:null,
			mode: 'remote',
    		idField: "id",
    		textField: "text",
    		fitColumns:true,
    		pagination:true,
    		paginationStyle:null,//simple
    		columns: null,
    		onSelect:function(index,row){
				log($(opts.id).combogrid("getValue"));
				$(opts.id).combogrid("setValue","");
			}
		};
		var opts = $.extend(defaults, options);
		var cg = $(opts.id).combogrid(opts);
		if("simple"===opts.paginationStyle){
			var p = cg.combogrid("grid").datagrid("getPager");
			p.pagination({
				layout:['first','last']
			});
		}
		return cg;
	},
	doChange: function(url, id, msg, callback){
		if(!id){
			common.tip("请先选择一条记录");
			return;
		}
		$.messager.confirm('温馨提示',msg, function(r){
			if(r) {
				var data = ajax(url,{id:id});
				if(data.success){
					tip(data.msg);
					if(callback) callback();
				}else{
					artError(data.msg);
				}
			};
		});
	},
	/**
	 * radio 触发事件
	 * 
	 * @author cmh
	 * @since 2017年5月29日 下午11:34:31
	 * @version 1.0
	 * @param e 事件
	 */
	radioEvent: function(e){
//		// 赋值
//		$("#vti-"+e.data.name+$(this).val()).attr("checked",true);
		
		var targetId = e.data.targetId;
		if(targetId){
			var idArr = targetId.split(",");
			for(var i=0;i<idArr.length;i++){
				if(i==$(this).val()){
					$(idArr[i]).val("1");
				}else{
					$(idArr[i]).val("");
				}
			}
		}
		
		// 处理事件
		if(e.data.event && e.data.event.length>0){
			var sId = "#"+$(this).attr("id");// 点击的id
			for(var i=0;i<e.data.event.length;i++){
				var eObj = e.data.event[i];
				var id = eObj.id;
				var tId = eObj.targetId;
				var tIdArr = tId.split(",");
				if("!readonly"==eObj.type){
					if(id==sId){
						for(var j=0;j<tIdArr.length;j++){
							$(tIdArr[j]).removeAttr("readonly").css("background-color","#fff");
						}
					}else{
						for(var j=0;j<tIdArr.length;j++){
							$(tIdArr[j]).val("").attr("readonly",true).css("background-color","#e0e0e0");
						}
					}
				}else if("!disabled"==eObj.type){
					if(id==sId){
						for(var j=0;j<tIdArr.length;j++){
							$(tIdArr[j]).attr("disabled",false).css("background-color","#fff");
						}
					}else{
						for(var j=0;j<tIdArr.length;j++){
							$(tIdArr[j]).val("").attr("disabled",true).css("background-color","#e0e0e0");
						}
					}
				}else if("show"==eObj.type){
					if(id==sId){
						for(var j=0;j<tIdArr.length;j++){
							$(tIdArr[j]).show();
						}
					}else{
						for(var j=0;j<tIdArr.length;j++){
							$(tIdArr[j]).hide();
						}
					}
				}else if("hide"==eObj.type){
					if(id==sId){
						for(var j=0;j<tIdArr.length;j++){
							$(tIdArr[j]).hide();
						}
					}else{
						for(var j=0;j<tIdArr.length;j++){
							$(tIdArr[j]).show();
						}
					}
				}
			}
		}
	},
	/**
	 * 初始化radio控件
	 * 
	 * @author cmh
	 * @since 2017年5月29日 下午11:33:05
	 * @version 1.0
	 * @param options 参数，例如 {name:"radioName"}
	 */
	initRadio: function(options){
		// 默认参数
		var defaults = {
			name:"radioName", // 控件主键
			targetId:null,
			value:null,
			event:null // 自定义事件 数组 []
		};
		var opts = $.extend(defaults, options);
		
		// 赋值
		if(opts.targetId){
			var idArr = opts.targetId.split(",");
			for(var i=0;i<idArr.length;i++){
				if("1"==$(idArr[i]).val()){
					$("#"+opts.name+"_"+i).attr("checked",true);
					break;
				}
			}
		}
		
		// 绑定事件
		$("input[name="+opts.name+"]").bind("click",{name:opts.name,targetId:opts.targetId,event:opts.event}, common.radioEvent);
		
		if(!opts.value){
			var v=$("input[name="+opts.name+"]:checked").val();
			if(v) opts.value = v;
		}
		
		// 赋值
		if(opts.value){
			try{
				$("#"+opts.name+"_"+opts.value).trigger("click");
				$(opts.name+"_"+opts.value).trigger("click");
			}catch(e){};
		}
	},
	/**
	 * 初始化提示
	 * 
	 * @author cmh
	 * @since 2017年6月4日 下午2:48:48
	 * @version 1.0
	 * @param options 参数
	 */
	initTooltip: function(options){
		// 默认参数
		var defaults = {
			id:"form label", // 控件主键
			position:"top",
			content: function(){
				var str = $(this).html();
				if(!str) str = $(this).attr('placeholder');
				return '<span class="black">' + str + '</span>';
			},
			onShow: function(){
				$(this).tooltip('tip').css({backgroundColor: "#FAFFBD"});
			}
		};
		//$(this).attr('placeholder')
		var opts = $.extend(defaults, options);
		$(opts.id).each(function(){
			$(this).tooltip({
				position: opts.position,
				content: opts.content,
				onShow: opts.onShow
			});
		});
	},
	
    version: function(){
    	return "1.0.0";
    }
};


/**
 * 重写alert
 * 
 * TODO 暂时先不重写，看看多少地方使用
 * 
 * @author cmh
 * @param {} msg
 * @param {} fn
 */
function alert_bak(msg, fn){
	common.alert(msg, fn);
}

/**
 * 初始化方法
 */
$(function(){
	common.initAll();
});








