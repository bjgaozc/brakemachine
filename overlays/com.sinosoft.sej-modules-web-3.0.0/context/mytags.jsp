<!DOCTYPE html>
<%@ taglib prefix="t" uri="/easyui-tags"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jstl/fmt_rt"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%> 
<%@ taglib prefix="sino" uri="/sino-tags"%>
<%@ taglib prefix="app" tagdir="/WEB-INF/tags/app" %>
<%@ include file="/context/meta.jsp"%>
<% 
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path;
%>
<c:set var="webRoot" value="<%=basePath%>" />
<c:set var="ctx" value="${pageContext.request.contextPath}"/>
<script type="text/javascript">var ctx = '${ctx}';</script>