/**
 * 参数：this
 * 	    v:传入对象
 * 		show：默认是false 展示国家
 * @author	Li Jinjun
 * @date	2013-12-03
 * @see		选择国家控件
 * @param   ms:是否多选，默认是false，
 * @returns
 * */
function jCountry(v,flag ,ms,count,show) {
    var c = $(v) ;//继承jQuery
    var offset = c.offset() ;//元素坐标
    //定义弹出窗口坐标，根据元素位置判断
    var y = offset.top + 10 ;
    var x = offset.left + 30 ;
    var pc = c.val() == null?"亚洲":c.val() ;//用来标记已经选择或录入国家

    //弹出窗口
    openWin(x,y,pc) ;

    function openWin(x ,y ,pc) {
        //关闭窗口
        doFadeOutEl(window.top.$("#isCountryFrame")) ;
        doFadeOutEl(window.top.$("#visCountryFrame")) ;
        var top = ($(window.top).height() - 386)/2;
        var left = ($(window.top).width() - 582)/2;
        var scrollTop = window.top.$(document).scrollTop();
        var scrollLeft = window.top.$(document).scrollLeft();
        x= left + scrollLeft;
        y= top + scrollTop;

        // y= window.screen.height/2+b.scrollTop +document.documentElement.scrollTop-300;
        // x= b.clientWidth/2+b.scrollLeft+document.documentElement.scrollLeft-300;
        //创建窗口
        var html = "" ;
        html += "<div id='isCountryFrame' style='position:absolute;width:582px;height:386px;left:" + x + "px; top:" + y + "px; background:#fdfdfd; border:1px solid #1365aa; display:none; z-index:9999;'></div>" ;
        window.top.$("body").append(html) ;
        window.top.$("#isCountryFrame").fadeIn(200, function() {
            //加入选项卡
            var thtml = "<div style='display:none; width:100%; height:30px; float:left; background:#1365aa; border-bottom:1px solid #003058;'></div>" ;

            $(thtml).appendTo(this).fadeIn(200,function() {
                //注入选项卡背景及：请选择国家    文本
                //$(this).append("<div style='width:90%; height:50px; float:left; font-size:20px; color:#fff; line-height:50px; font-family:\"微软雅黑\"; text-align:center;'>请选择国家</div>").fadeIn(200) ;
                $("<div style='width:9%; height:30px; float:right; line-height:30px; text-align:center;'><a href='javascript:void(0);' style='float:right; margin-right:5px; color:#fff; width:30px; height:30px; line-height:30px; display:block; font-family:\"Arial\";'>X</a></div>").appendTo(this).fadeIn(200).find("a").click(function() {
                    //关闭窗口
                    doFadeOutEl(window.top.$("#isCountryFrame")) ;
                    doFadeOutEl(window.top.$("#visCountryFrame")) ;
                    $(c).focus();//焦点回归
                }) ;

                //注入选项卡
                $(this).append(getConTab()).fadeIn(200, function() {
                    //选项卡鼠标经过效果
                    $(this).find("li a").click(function() {
                    	window.top.$("#countrysUl").html(getCountrysByCon($(this).html())).find("li a").click(function() {
                            //输入框的值以,（英文逗号分隔）
                            var _put = c.val() == ""?"":c.val().split(",") ;
                            var _parr = [];
                            if(_put != "") {
                                //_parr = c.val().split(",") ;
                                var _ib = false ;
                                var _ip = true ;
                                if(flag == "false" || flag == false) {
                                    _ip = false ;
                                }
                                if(_ip == true) {
                                    //alert(c.val()) ;
                                    for(var _i = 0 ; _i < c.val().split(",").length ; _i ++) {
                                        //如果当前点的数据已在输入框中，即当作删除操作
                                        if($(this).text() == c.val().split(",")[_i]) {
                                            _ib = true ;
                                            _i ++ ;
                                        } else {
                                            _parr.push(c.val().split(",")[_i]) ;
                                        }
                                    }
                                }
                                if(_ib == false) {
                                    _parr.push($(this).text()) ;
                                }
                            } else {
                                _parr.push($(this).text()) ;
                            }
                            var _txIn = "" ;
                            for(var _j = 0 ; _j < _parr.length ; _j ++) {
                                _txIn += (_txIn == ""?"":",") + _parr[_j] ;
                            }
                            c.val(_txIn) ;//给选择框赋值
                            if(show==true){//后加方法  仅用于团组立项
                                countryChange(_txIn,count);
                            }
                            var _isSelect = false ;
                            if(ms) {
                                _isSelect = ms ;
                            }
                            if(_isSelect == false) {
                                //关闭窗口
                                doFadeOutEl(window.top.$("#isCountryFrame")) ;
                                doFadeOutEl(window.top.$("#visCountryFrame")) ;
                                if(typeof flag=='boolean'){
                                    $(c).focus();//焦点回归
                                }
                            }

                            $(this).css({
                                "color":"#ff6600" , "background":"#eee"
                            }) ;
                        }).mousemove(function() {
                            if($(this).parent().html().split("#ff6601;").length == 1) {
                                $(this).css({
                                    "color":"#ff6600" , "background":"#eee"
                                }) ;
                            }
                        }).mouseout(function() {
                            if($(this).parent().html().split("#ff6601;").length == 1) {
                                $(this).css({
                                    "color":"#4b4b4b" , "background":"#fff"
                                }) ;
                            }
                        }) ;

                        $(this).parent().parent().find("li a").each(function() {
                            $(this).css({
                                "background":"#1365aa" , "color":"#fff"
                            }) ;
                        }) ;
                        $(this).css({
                            "background":"#48a9fb" , "color":"#ffd65a"
                        }) ;
                    }) ;
                    //选项卡选中状态
                    $(this).find("li a").each(function() {
                        if($(this).html() == getConLibByCountry(pc)) {
                            $(this).css({
                                "background":"#48a9fb" , "color":"#ffd65a"
                            }) ;
                        }
                    }) ;
                }) ;

                //根据洲得到国家列表
                var cuhtml = "<ul id='countrysUl' style='width:100%; display:none; float:left; margin-top:4px; padding-left:15px;'>" + getCountrysByCon(getConLibByCountry(pc)) + "</ul>" ;

                //将国家填充入展示框
                $(cuhtml).appendTo($(this).parent()).fadeIn(200, function() {
                    //标记鼠标点击事件
                    $(this).find("li a").click(function() {
                        //给输入框赋值
                        //输入框的值以,（英文逗号分隔）
                        var _put = c.val() == ""?"":c.val().split(",") ;
                        var _parr = [] ;
                        if(_put != "") {
                            //_parr = c.val().split(",") ;
                            var _ib = false ;
                            var _ip = true ;
                            if(flag == "false" || flag == false) {
                                _ip = false ;
                            }
                            if(_ip == true) {
                                //alert(c.val()) ;
                                for(var _i = 0 ; _i < c.val().split(",").length ; _i ++) {
                                    //如果当前点的数据已在输入框中，即当作删除操作
                                    if($(this).text() == c.val().split(",")[_i]) {
                                        _ib = true ;
                                        _i ++ ;
                                    } else {
                                        _parr.push(c.val().split(",")[_i]) ;
                                    }
                                }
                            }
                            if(_ib == false) {
                                _parr.push($(this).text()) ;
                            }
                        } else {
                            _parr.push($(this).text()) ;
                        }
                        var _txIn = "" ;
                        for(var _j = 0 ; _j < _parr.length ; _j ++) {
                            _txIn += (_txIn == ""?"":",") + _parr[_j] ;
                        }
                        c.val(_txIn) ;//------------------------给选择框赋值,正常赋值的地方-----------------------------------
                        if(show==true){//后加方法  仅用于团组立项
                            countryChange(_txIn,count);
                        }

                        var _isSelect = false ;
                        if(ms) {
                            _isSelect = ms ;
                        }
                        if(_isSelect == false) {
                            //关闭窗口
                            doFadeOutEl(window.top.$("#isCountryFrame")) ;
                            doFadeOutEl(window.top.$("#visCountryFrame")) ;
                            if(typeof flag=='boolean'){
                                $(c).focus();//焦点回归
                            }
                        }
                    }).mousemove(function() {
                        if($(this).parent().html().split("#ff6601;").length == 1) {
                            $(this).css({
                                "color":"#ff6600" , "background":"#eee"
                            }) ;
                        }
                    }).mouseout(function() {
                        if($(this).parent().html().split("#ff6601;").length == 1) {
                            $(this).css({
                                "color":"#4b4b4b" , "background":"#fff"
                            }) ;
                        }
                    }) ;
                }) ;
            }) ;
        }) ;
        //创建遮罩
        var vhtml = "<div id='visCountryFrame' style='position:absolute;width:100%;height:" + $(window.top).outerHeight() + "px;left:0; top:0; background:#000; border:1px solid #dedede; display:none; z-index:9005; filter:alpha(opacity=50); -moz-opacity:0.5; opacity:0.5;'></div>";
        window.top.$("body").append(vhtml);
        window.top.$("#visCountryFrame").fadeIn(300);
    }

    /*
     * 淡出元素
     * */
    function doFadeOutEl(elm) {
        elm.fadeOut(200, function() {
            elm.remove() ;
        }) ;
    }

    /*
     * 根据洲得到国家列表--处理后列表
     * */
    function getCountrysByCon(con) {
        var c = getCountryList(con) ;
        var rtc = "" ;//返回拼接后的国家串
        if(c != null && c!= "") {
            var cu = c.split(",") ;
            for(var i = 0 ; i < cu.length ; i ++) {
                var _cty = false ;

                for(var _pi = 0 ; _pi < pc.split(",").length ; _pi ++) {
                    if(pc.split(",")[_pi] == cu[i]) {
                        _cty = true ;
                    }
                }
                rtc += "<li style='width:140px; list-style:none; float:left; height:24px; margin:0; padding:0; border-bottom:1px solid #fdfdfd;'>" ;
                if(_cty == true) {
                    rtc += "<a href='javascript:void(0);' style='padding-left:8px; width:138px; display:block; font-size:10pt; color:#ff6601; height:24px; line-height:24px;'>" + cu[i] + "</a>" ;
                } else {
                    rtc += "<a href='javascript:void(0);' style='padding-left:8px; width:138px; display:block; font-size:10pt; color:#4b4b4b; height:24px; line-height:24px;'>" + cu[i] + "</a>" ;
                }
                rtc += "</li>" ;
            }
        }
        return rtc ;
    }

    /*
     * 得到洲选项卡
     * */
    function getConTab() {
        var ctlicss = "style='float:left; width:73px;list-style:none;background:#1365aa; border-right:1px solid #074f8c;'" ;
        var ctacss = "style='color:#fff; font-size:12pt; width:85px; display:block; height:30px; line-height:30px; text-align:center;'" ;
        var cthtml = "<ul style='float:left; width:90%; margin:0; padding:0;'>" ;
        var cl = getConTabList().split(",") ;
        //拼接洲选项卡
        for(var j = 0 ; j < cl.length ; j ++) {
            cthtml += "<li " + ctlicss + "><a href='javascript:void(0);' " + ctacss + ">" + cl[j] + "</a></li>" ;
        }
        cthtml += "</ul>";
        return cthtml ;
    }

    /*
     * 根据国家得到洲信息
     * */
    function getConLibByCountry(pci) {
        var cl = getConTabList().split(",") ;
        //拼接洲选项卡
        for(var k = 0 ; k < cl.length ; k ++) {
            var cn = getCountryList(cl[k]).split(",") ;
            for(var m = 0 ; m < cn.length ; m ++) {
                if(pci == cn[m]) {
                    return cl[k] ;
                }
            }
        }
    }

    /*
     * 活的选项卡列表
     * */
    function getConTabList() {
        return "亚洲,非洲,欧洲,北美洲,南美洲,大洋洲,地区" ;
    }

    /*
     * 根据洲得到国家列表--处理前列表
     * */
    function getCountryList(con) {
        switch(con) {
            case "亚洲": {
                return "阿富汗,阿联酋,阿曼,阿塞拜疆,巴基斯坦,巴勒斯坦,巴林,不丹,朝鲜,东帝汶,菲律宾,格鲁吉亚,哈萨克斯坦,韩国,吉尔吉斯斯坦,柬埔寨,卡塔尔,科威特,老挝,黎巴嫩,马尔代夫,马来西亚,蒙古,孟加拉国,缅甸,尼泊尔,日本,沙特阿拉伯,斯里兰卡,塔吉克斯坦,泰国,土耳其,土库曼斯坦,文莱,亚美尼亚,乌兹别克斯坦,新加坡,叙利亚,也门,伊拉克,伊朗,以色列,印度,印度尼西亚,约旦,越南" ;
            }
            case "非洲": {
                return "阿尔及利亚,埃及,埃塞俄比亚,安哥拉,贝宁,博茨瓦纳,布基纳法索,布隆迪,赤道几内亚,多哥,厄立特里亚,佛得角,冈比亚,刚果共和国,刚果民主共和国,吉布提,几内亚,几内亚比绍,加纳,加蓬,津巴布韦,喀麦隆,科摩罗,科特迪瓦,肯尼亚,莱索托,利比里亚,利比亚,卢旺达,马达加斯加,马拉维,马里,毛里求斯,毛里塔尼亚,摩洛哥,莫桑比克,纳米比亚,南非,南苏丹,尼日尔,尼日利亚,塞拉利昂,塞内加尔,塞舌尔,圣多美和普林西比,斯威士兰,苏丹,索马里,坦桑尼亚,突尼斯,乌干达,赞比亚,乍得,中非" ;
            }
            case "欧洲": {
                return "阿尔巴尼亚,爱尔兰,爱沙尼亚,安道尔,奥地利,白俄罗斯,保加利亚,比利时,冰岛,波黑,波兰,丹麦,德国,俄罗斯,法国,芬兰,荷兰,黑山,捷克,克罗地亚,拉脱维亚,立陶宛,列支敦士登,卢森堡,罗马尼亚,马耳他,马其顿,摩尔多瓦,摩纳哥,挪威,葡萄牙,瑞典,瑞士,塞尔维亚,塞浦路斯,圣马力诺,斯洛伐克,斯洛文尼亚,乌克兰,西班牙,希腊,匈牙利,意大利,英国,欧盟" ;
            }
            case "北美洲": {
                return "安提瓜和巴布达,巴巴多斯,巴哈马,巴拿马,伯利兹,多米尼加,多米尼克,哥斯达黎加,格林纳达,古巴,海地,洪都拉斯,加拿大,美国,墨西哥,尼加拉瓜,萨尔瓦多,圣基茨和尼维斯,圣卢西亚,圣文森特和格林纳丁斯,特立尼达和多巴哥,危地马拉,牙买加" ;
            }
            case "南美洲": {
                return "阿根廷,巴拉圭,巴西,秘鲁,玻利维亚,哥伦比亚,厄瓜多尔,圭亚那,苏里南,委内瑞拉,乌拉圭,智利" ;
            }
            case "大洋洲": {
                return "澳大利亚,巴布亚新几内亚,斐济,库克群岛,密克罗尼西亚,纽埃,萨摩亚,汤加,瓦努阿图,新西兰" ;
            }
            case "地区": {
                return "香港,澳门,台湾" ;
            }
            default :{
                return "阿富汗,阿联酋,阿曼,阿塞拜疆,巴基斯坦,巴勒斯坦,巴林,不丹,朝鲜,东帝汶,菲律宾,格鲁吉亚,哈萨克斯坦,韩国,吉尔吉斯斯坦,柬埔寨,卡塔尔,科威特,老挝,黎巴嫩,马尔代夫,马来西亚,蒙古,孟加拉国,缅甸,尼泊尔,日本,沙特阿拉伯,斯里兰卡,塔吉克斯坦,泰国,土耳其,土库曼斯坦,文莱,亚美尼亚,乌兹别克斯坦,新加坡,叙利亚,也门,伊拉克,伊朗,以色列,印度,印度尼西亚,约旦,越南" ;
            }
        }
    }
}