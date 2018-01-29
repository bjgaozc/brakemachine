<%@ page language="java" import="java.util.*" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@include file="/context/mytags.jsp"%>
 <head>
  <title>流水号管理</title>
  <sino:plugins type="jquery,easyui,tools,date,util" />
  <script src="webpage/com/sinosoft/modules/sys/web/moSySeq-index.js"></script>
  <script type="text/javascript">
  //编写自定义JS代码
    $(function(){
        initPrefixCombobox("prefix","add");
        initPrefixCombobox("suffix","add");
    });
  </script>
 </head>

  <t:formvalid formid="formobj" dialog="true" layout="table" action="moSySeqController.do?doAdd" tiptype="1">
                    <input id="id" name="id" type="hidden" value="${epSysSeqPage.id }">
        <table style="width: 600px;" cellpadding="0" cellspacing="1" class="formtable">
                <tr>
                    <td align="right">
                        <label class="Validform_label">
                            编码:
                        </label>
                    </td>
                    <td class="value">
                             <input id="nameEn" name="nameEn" type="text" style="width: 150px" class="inputxt"  
                                               datatype="*" onblur="validateNameEn();"
                                               >
                            <span class="Validform_checktip"></span>
                            <label class="Validform_label" style="display: none;">编码</label>
                        </td>
                <tr>
                    <td align="right">
                        <label class="Validform_label">
                            名称:
                        </label>
                    </td>
                    <td class="value">
                             <input id="name" name="name" type="text" style="width: 150px" class="inputxt"  
                                               datatype="*"
                                               >
                            <span class="Validform_checktip"></span>
                            <label class="Validform_label" style="display: none;">名称</label>
                        </td>
                    </tr>
                <tr>
                    <td align="right">
                        <label class="Validform_label">
                            类型:
                        </label>
                    </td>
                    <td class="value">
                              <t:dictSelect field="type" type="list"
                                    typeGroupCode="seqType" defaultVal="2" hasLabel="false"  title="类型"></t:dictSelect>     
                            <span class="Validform_checktip"></span>
                            <label class="Validform_label" style="display: none;">类型</label>
                        </td>
                <tr>
                    <td align="right">
                        <label class="Validform_label">
                            流水:
                        </label>
                    </td>
                    <td class="value">
                             <input id="content" name="content" type="text" style="width: 150px" class="inputxt"  
                                               value="0"
                                               >
                            <span class="Validform_checktip"></span>
                            <label class="Validform_label" style="display: none;">流水</label>
                        </td>
                    </tr>
                <tr>
                    <td align="right">
                        <label class="Validform_label">
                            补全标记:
                        </label>
                    </td>
                    <td class="value">
                             <input id="acflag" name="acflag" type="text" style="width: 150px" class="inputxt"  
                                             value="0"  
                                               >
                            <span class="Validform_checktip"></span>
                            <label class="Validform_label" style="display: none;">补全标记</label>
                        </td>
                <tr>
                    <td align="right">
                        <label class="Validform_label">
                            补全位数:
                        </label>
                    </td>
                    <td class="value">
                             <input id="acnum" name="acnum" type="text" style="width: 150px" class="inputxt"  
                                               value="5"
                                               >
                            <span class="Validform_checktip"></span>
                            <label class="Validform_label" style="display: none;">补全位数</label>
                        </td>
                    </tr>
                <tr>
                    <td align="right">
                        <label class="Validform_label">
                            前缀:
                        </label>
                    </td>
                    <td class="value">
                        <input id="prefix" name="prefix" value="_seq_p3" type="text" style="width: 300px" class="inputxt" />
                            <span class="Validform_checktip"></span>
                            <label class="Validform_label" style="display: none;">前缀</label>
                        </td>
                <tr>
                    <td align="right">
                        <label class="Validform_label">
                            后缀:
                        </label>
                    </td>
                    <td class="value">
                        <input id="suffix" name="suffix" type="text" style="width: 300px" class="inputxt" />
                            <span class="Validform_checktip"></span>
                            <label class="Validform_label" style="display: none;">后缀</label>
                        </td>
                    </tr>
                <tr style="display: none;">
                    <td align="right">
                        <label class="Validform_label">
                            业务类型:
                        </label>
                    </td>
                    <td class="value">
                             <input id="businessType" name="businessType" type="text" style="width: 150px" class="inputxt"  
                                               
                                               >
                            <span class="Validform_checktip"></span>
                            <label class="Validform_label" style="display: none;">业务类型</label>
                        </td>
            </table>
        </t:formvalid>
      