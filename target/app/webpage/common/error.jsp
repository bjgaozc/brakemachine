<%@ page contentType="text/html; charset=UTF-8" isErrorPage="true"%>
<% Exception e = (Exception)request.getAttribute("ex"); %>
<!DOCTYPE HTML>
<html>
<head>
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1" />
<title>系统提示</title>

<style type="text/css" media="screen,print" >
body{ background:#F9F9F9;margin: 0px;font-family:"微软雅黑","宋体"; font-size:12px;}
.box{width: 100%;margin: 0 auto;height: auto}
.box .titleContent { width: 100%;border-bottom-color: #e3e3e3;line-height:50px; background-color: #FFF;border-bottom-style: solid;border-bottom-width: 1px;}
.box .titleContent .title{width:300px;height:50px;margin-left:15%;padding-top:20px; padding:2px;  font-family:"微软雅黑"; font-size:20px;color: #4266b2;}
.box .content{width:700px;height:auto;margin:0 auto; border-top-color: #fff;background-color: #f9f9f9;border-top-style: solid;border-top-width: 1px; }
.box .content .errorImg{width:230px;height:150px; margin:30px auto 0px; background: url("${pageContext.request.contextPath}/plug-in/sino/ui/default/images/err_img_bg.png") no-repeat 0px -30px;}
.content .msg{ width: 670px;height: 120px; padding:10px; background-color:  #F0F5FE ;border: 1px solid #CDDCF4;}
.msg .img{width: 50px;height: 50px; margin-left:20px;margin-top:30px;  background: url("${pageContext.request.contextPath}/plug-in/sino/ui/default/images/err_img_bg.png") no-repeat 0px -190px;height:35px;display:inline;float: left;}
.msg .info {width: 500px;padding-left:5px;padding-top:30px; vertical-align:middle; text-align:left;display: inline;float: left;font-family:"Arial","宋体"; font-size:14px;color: #333333}
.msg .info a{color:#0000FF;}
.content .errorButton{width:300px;height:30px; margin-top: 20px;}
.errorButton .refresh{width: 140px; border:1px solid #BBB;height:28px;background:url("${pageContext.request.contextPath}/plug-in/sino/ui/default/images/err_img_bg.png") repeat 0px 0px; display: inline;float: left;cursor:pointer; }
.refresh .refreshImg{background: url("${pageContext.request.contextPath}/plug-in/sino/ui/default/images/err_img_bg.png") no-repeat 0px -230px; margin-top:8px; height:15px;padding-left:17px;;margin-left:10px; display: inline;float: left;}
.refresh .refreshTxt{margin-left:6px; display: inline;float: left;margin-top: 6px;}
.errorButton .back{width: 100px; border:1px solid #BBB;height:28px;background:url("${pageContext.request.contextPath}/plug-in/sino/ui/default/images/err_img_bg.png") repeat 0px 0px; display: inline;float: left;cursor:pointer; }
.back .backImg{ background: url("${pageContext.request.contextPath}/plug-in/sino/ui/default/images/err_img_bg.png") no-repeat 0px -250px;height:15px;padding-left:17px;margin-left:10px; margin-top:8px; display: inline;float: left;}
.back .backTxt{color: #333;display: inline;float: left;margin-top: 6px;margin-left:6px;}
.errorButton a{text-decoration:none; color:#000; }
.errorButton .backIndex{display:inline;float: left;margin-left: 20px;}
</style>
<script type="text/javascript">
function showErrorInfo(){
	if("none"==errorDiv.style.display) errorDiv.style.display = "";
	else errorDiv.style.display = "none";
}
</script>
</head>
<body>
<div class="box">
   <div class="titleContent">
        <div class="title">系统出现异常了</div>
   </div>
    <div class="content">
        <div class="errorImg"></div>
        <div class="msg">
            <div class="img"> </div>
            <div class="info">
               <h1 style="color: red;"><%= e.getClass().getSimpleName()%></h1>
            </div>
        </div>
        <div class="errorButton" id="errorBtn">
            <a href='javascript:history.go(-1);'>
                <div class="back" style="margin-left: 0px;">
                    <div class="backImg"></div>
                    <span class="backTxt">点击返回</span>
                </div>
            </a>
            <a href='javascript:showErrorInfo();'>
                <div class="back" style="margin-left: 30px;">
                    <div class="backImg"></div>
                    <span class="backTxt">查看详细</span>
                </div>
            </a>
        </div>
        
        <hr>
        <div id="errorDiv" style="display: none;">
            <div>系统执行发生错误，信息描述如下：</div>
			<div>错误状态代码是：${pageContext.errorData.statusCode}</div>
			<div>错误发生页面是：${pageContext.errorData.requestURI}</div>
			<div>错误信息：<span style="color:red;">${pageContext.exception}</span></div>
			<div>错误堆栈信息：</div>
            <div style="color:red;">
				<% e.printStackTrace(new java.io.PrintWriter(out)); %>
			</div>
			
        </div>
        
        
<%--        <em><a href="http://www.sinosoft.com.cn" target="_blank">中科软科技股份有限公司</a></em></div>--%>
        
   </div><!-- content -->
</div>

</body>
</html>