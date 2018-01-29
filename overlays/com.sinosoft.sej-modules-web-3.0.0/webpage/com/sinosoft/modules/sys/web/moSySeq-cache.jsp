<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@include file="/context/mytags.jsp"%>

<sino:plugins type="jquery,easyui,tools" />
<script type="text/javascript">
$(function(){
});
</script>

<t:formvalid formid="formobj" dialog="true" layout="table" action="moSySeqController.do?doCache" tiptype="1">
    <input id="id" name="id" type="hidden" value="${epSysSeqPage.id }">
    <table style="width: 600px;" cellpadding="0" cellspacing="1" class="formtable">
        <tr>
            <td align="right">
                <label class="Validform_label">
                    编码名称:
                </label>
            </td>
            <td class="value">
                <input type="text" id="nameEnId" name="nameEn" value="${epSysSeqPage.nameEn}" readonly="readonly" class="inputxt" style="width: 150px;background-color: #e0e0e0;" >
            </td>
        <tr>
            <td align="right">
                <label class="Validform_label">
                    缓存数量:
                </label>
            </td>
            <td class="value">
                <input type="text" id="cacheNumId" name="cacheNum" class="inputxt" style="width: 150px" datatype="n" >
                <span class="Validform_checktip"></span>
                <label class="Validform_label" style="display: none;">缓存数量</label>
            </td>
        </tr>
        
    </table>
</t:formvalid>
