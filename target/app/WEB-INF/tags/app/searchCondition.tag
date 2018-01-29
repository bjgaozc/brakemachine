<%@tag description="查询条件，例如：table" import="net.sf.json.JSONArray,net.sf.json.JSONObject" pageEncoding="UTF-8"%>
<%@attribute name="type" description="类型 "%><%@attribute name="column" description="列 "%><%@attribute name="maxlength" description="最大长度"%><%@attribute name="width" description="宽度，默认300像素"%><%@attribute name="value" description="值"%><%@attribute name="text" description="文本"%>
<%
if(null==type) type = "";
if(null==column) column = "";
if(null==maxlength) maxlength = "";
if(null==width) width = "300";
if(null==value) value = "";
if(null==text) text = "";
String id = column.replaceAll("\\.", "_")+"_Id";
%>
<div style="width:<%=width%>px;float:left;">
<%if(!"hidden".equals(type)){%>&nbsp;<%=text%>:&nbsp;<%}%>
<%if("select".equals(type)){
	JSONArray array = JSONArray.fromObject(value);
%>
<select id="<%=id%>" name="<%=column%>" class="easyui-combobox">
	<%for(Object object : array){JSONObject ary = JSONObject.fromObject(object);%><option value="<%=ary.get("value")%>"><%=ary.get("text")%></option><%}%>
</select>
<%}else if("hidden".equals(type)){%>
<input type="hidden" id="<%=id%>" name="<%=column%>" value="<%=value%>" />
<%}else{%>
<input type="text" id="<%=id%>" name="<%=column%>" value="<%=value%>" class="easyui-textbox" />
<%}%>
</div>