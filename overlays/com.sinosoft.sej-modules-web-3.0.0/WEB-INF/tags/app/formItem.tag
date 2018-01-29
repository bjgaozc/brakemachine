<%@tag description="表单项，依赖[common.js]" pageEncoding="UTF-8"%>
<%@tag import="org.jeecgframework.core.util.MutiLangUtil"%>
<%@attribute name="loadType" description="加载类型[all:默认值，加载所有,dependent:加载依赖,rbr:加载逻辑]"%><%@attribute name="type" description="类型，默认text[text:文本框,textarea:文本框,img:图片,blank:占位,password:密码,radio:单选,checkbox:多选,custom:自定义]"%><%@attribute name="name" description="名称 "%><%@attribute name="id" description="主键 "%><%@attribute name="value" description="值 "%><%@attribute name="title" description="标题 "%><%@attribute name="ccsClass" description="样式 ,class"%><%@attribute name="style" description="样式 ,style"%><%@attribute name="labelClass" description="标签样式 ,class"%><%@attribute name="feildDivClass" description="域外层div样式 ,class"%><%@attribute name="feildClass" description="域样式 ,class"%><%@attribute name="required" description="是否必填,默认false[true:必填,false:非必填]"%><%@attribute name="validType" description="验证类型"%><%@attribute name="placeholder" description="自定义placeholder"%><%@attribute name="dataOptions" description="配置"%><%@attribute name="fthCode" description="fthCode"%><%@attribute name="valueField" description="valueField"%><%@attribute name="topLine" description="下拉框是否需要添加请选择"%><%@attribute name="selectUrl" description="下拉框数据源URL"%><%@attribute name="labelHeight" description="label高度"%><%@attribute name="height" description="高度"%><%@attribute name="disabled" description="禁用[true:禁用]"%><%@attribute name="readonly" description="只读[true:只读]"%><%@attribute name="imgHeight" description="图片高度"%><%@attribute name="imgWidth" description="图片宽度"%><%@attribute name="bigWidth" description="图片放大宽度"%><%@attribute name="bigHeight" description="图片放大高度"%><%@attribute name="maxlength" description="最大长度 "%>
<%
if(null==loadType||"".equals(loadType)) loadType = "all";
if(null==type||"".equals(type)) type = "text";
if(null==name||"".equals(name)) name = "item";
if(null==id||"".equals(id)) id = name;
if(null==value||"".equals(value)) value = "";
if(null==title||"".equals(title)) title = name;
title = MutiLangUtil.doMutiLang(title, null);
if(null==ccsClass||"".equals(ccsClass)) ccsClass = "col-12";
if(null==style||"".equals(style)) style = "";
if(null==labelClass||"".equals(labelClass)) labelClass = "col-4";
if(null==feildDivClass||"".equals(feildDivClass)) feildDivClass = "col-8";
if(null==feildClass||"".equals(feildClass)) feildClass = "";
if(null==required||"".equals(required)) required = "false";
if(null==validType||"".equals(validType)) validType = "";
if(null==placeholder||"".equals(placeholder)) placeholder = "";
if(null==dataOptions||"".equals(dataOptions)) dataOptions = "formItem:true";
if(null==fthCode||"".equals(fthCode)) fthCode = "611";
if(null==valueField||"".equals(valueField)) valueField = "text";
if(null==topLine||"".equals(topLine)) topLine = "false";
if("true".equals(topLine) && "".equals(value)) value = "---请选择---";
if(null==selectUrl||"".equals(selectUrl)) selectUrl = "epCommonController.do?getChdsByFthCode&fthCode="+fthCode+"&topLine="+topLine;
if(null==labelHeight||"".equals(labelHeight)) labelHeight = "";
if(null==height||"".equals(height)) height = "";
if(null==disabled||"".equals(disabled)) disabled = "";
if(null==readonly||"".equals(readonly)) readonly = "";
if(null==imgWidth||"".equals(imgWidth)) imgWidth = "60px";
if(null==imgHeight||"".equals(imgHeight)) imgHeight = "28px";
if(null==maxlength||"".equals(maxlength)) maxlength = "";
if("textarea".equals(type)||"kindeditor".equals(type)){labelClass="control-label textarea-lebal col-2";feildDivClass="col-10";if("".equals(labelHeight)) labelHeight="49px";if("".equals(height)) height="60px";}
%>
<%if("blank".equals(type)){%>
<div id="<%=id%>_warp" class="<%=ccsClass%>" style="<%=style%>"><div class="form-group invisible"><label class="control-label <%=labelClass%>">&nbsp;</label><div class="<%=feildDivClass%>"><span class="form-control">&nbsp;</span></div></div></div>
<%}else if("info".equals(type)){%>
<div id="<%=id%>_warp" class="<%=ccsClass%>" style="<%=style%>"><div class="form-group"><label class="control-label <%=labelClass%>" style="line-height:<%=labelHeight%>;" for="<%=id%>"><%=title%><%if("true".equals(required)){%><strong class="red">*</strong><%}%></label><div class="<%=feildDivClass%>" ><div class="form-control pd-t-5" style="border: 1px solid #cfcfcf;"><%=value%></div></div></div></div>
<%}else{%>
<div id="<%=id%>_warp" class="<%=ccsClass%>" style="<%=style%>">
	<div class="form-group">
		<label class="control-label <%=labelClass%>" style="line-height:<%=labelHeight%>;" for="<%=id%>"><%=title%><%if("true".equals(required)){%><strong class="red">*</strong><%}%></label>
		<div class="<%=feildDivClass%>" >
			<%if("textarea".equals(type)||"kindeditor".equals(type)){%>
			<textarea class="form-control easyui-validatebox <%=feildClass%>" style="width:100%;height:<%=height%>;" <%if("true".equals(disabled)){%>disabled="disabled"<%}%> <%if("true".equals(readonly)){%>readonly="readonly"<%}%>
				id="<%=id%>" name="<%=name%>" <%if(!"".equals(placeholder)){%>placeholder="<%=placeholder%>"<%}%> <%if(!"".equals(maxlength)){%>maxlength="<%=maxlength%>"<%}%>
				data-options=" <%if("true".equals(required)){%>required:true,<%}%> <%if(!"".equals(validType)){%>validType:'<%=validType%>',<%}%> <%=dataOptions%>
				"><%=value%></textarea>
			<%}else if("img".equals(type)){%>
				<div class="form-control pd-r-0 pd-l-1" >
					<div class="col-4"><img id="<%=id%>" name="<%=name%>" width="<%=imgWidth%>" height="<%=imgHeight%>" src="<%=value%>" class="easyui-tooltip" data-options="content: '<div><img src=\'<%=value%>\' title=\'<%=placeholder%>\' /></div>'"/></div>
					<div class="col-8 text-right"><a id="<%=id%>_downBtn" href="#" class="easyui-linkbutton" iconcls="fa fa-download" style="height: 25px;"></a>&nbsp;<a id="<%=id%>_deleteBtn" href="#" class="easyui-linkbutton" iconcls="fa fa-trash-o" style="height: 25px;"></a></div>
		     	</div>
			<%}else if("radio".equals(type)||"checkbox".equals(type)){%>
				<script>
					$(function(){
						var <%=id%>_data = eval("<%=selectUrl%>");
						var <%=id%>_html = "";
						for(var i=0;i<<%=id%>_data.length;i++){
							var vStr = "";
							var v = <%=id%>_data[i].id;
							if(v==="<%=value%>") vStr ='checked="checked"';
							<%=id%>_html+='<div class="<%=type%> <%=type%>-primary <%=type%>-inline"><input type="<%=type%>" id="<%=id%>_'+i+'" name="<%=name%>" value="'+v+'" '+vStr+'><label for="<%=id%>_'+i+'">'+<%=id%>_data[i].text+'</label></div>';
						}
						$("#<%=id%>").html(<%=id%>_html);
					});
				</script>
				<div id="<%=id%>" class="pd-r-0 pd-l-10"></div>
			<%}else if("custom".equals(type)){%>
			<jsp:doBody/>
			<%}else{%>
			<input type="<%if("password".equals(type)){%>password<%}else{%>text<%}%>" class="form-control <%if("text".equals(type)){%>easyui-validatebox<%}else if("my97".equals(type)){%>easyui-my97<%}else if("select".equals(type)){%>easyui-combobox<%} else if("numberspinner".equals(type)){%>easyui-numberspinner<%}%> <%=feildClass%>" style="width:100%;height:<%=height%>;" <%if("true".equals(disabled)){%>disabled="disabled"<%}%> <%if("true".equals(readonly)){%>readonly="readonly"<%}%>
				id="<%=id%>" name="<%=name%>" value="<%=value%>" <%if(!"".equals(placeholder)){%>placeholder="<%=placeholder%>"<%}%> <%if(!"".equals(maxlength)){%>maxlength="<%=maxlength%>"<%}%>
				data-options="<%if("true".equals(required)){%>required:true,<%}%> <%if(!"".equals(validType)){%>validType:'<%=validType%>',<%}%>
					<%if("select".equals(type)){%>valueField:'<%=valueField%>',textField:'text',<%if(selectUrl.contains("[")){%>data:<%=selectUrl%><%}else{%>url:'<%=selectUrl%>'<%}%>,<%}%>
					<%=dataOptions%>
				">
			<%}%>
		</div>
	</div>
</div>
<%}%>
<%if("kindeditor".equals(type)){%>
<script type="text/javascript">
$(function(){initKindEditor({id:"#<%=id%>",items : ['fullscreen','|','fontname', 'fontsize', '|', 'forecolor', 'hilitecolor', 'bold', 'italic', 'underline','removeformat', '|', 'justifyleft', 'justifycenter', 'justifyright', 'insertorderedlist','insertunorderedlist']});});
</script>
<%}%>