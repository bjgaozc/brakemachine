<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@include file="/context/mytags.jsp"%>

<sino:plugins type="jquery,easyui,tools" />
<script type="text/javascript">
$(function(){
});
</script>

<div class="easyui-layout" fit="true">
  <div region="center" style="padding:1px;">
  <t:datagrid name="epSysSeqHistoryList" checkbox="true" fitColumns="true" title="流水号管理" actionUrl="moSySeqController.do?cacheDatagrid=true&id=${id}" idField="id" fit="true" queryMode="group">
   <t:dgCol title="主键"  field="id"  hidden="false" width="120"></t:dgCol>
   <t:dgCol title="编码"  field="seqNameEn" query="false" width="120"></t:dgCol>
   <t:dgCol title="流水"  field="seqContent"   width="120"></t:dgCol>
   <t:dgCol title="创建时间"  field="createTime"  dateformatter="yyyy-MM-dd hh:mm:ss" width="120"></t:dgCol>
  </t:datagrid>
  </div>
 </div>