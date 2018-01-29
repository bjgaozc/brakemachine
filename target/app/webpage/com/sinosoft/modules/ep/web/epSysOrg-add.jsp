<%@ page language="java" import="java.util.*" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@include file="/context/mytags.jsp"%>
<!DOCTYPE html>
<html>
 <head>
  <title>组织机构</title>
  <t:base type="jquery,easyui,tools,DatePicker"></t:base>
  <script type="text/javascript">
  //编写自定义JS代码
  </script>
 </head>
 <body>
  <t:formvalid formid="formobj" dialog="true" usePlugin="password" layout="table" action="epSysOrgController.do?doAdd" tiptype="1">
					<input id="id" name="id" type="hidden" value="${epSysOrgPage.id }">
					<input id="createName" name="createName" type="hidden" value="${epSysOrgPage.createName }">
					<input id="createBy" name="createBy" type="hidden" value="${epSysOrgPage.createBy }">
					<input id="createDate" name="createDate" type="hidden" value="${epSysOrgPage.createDate }">
					<input id="updateName" name="updateName" type="hidden" value="${epSysOrgPage.updateName }">
					<input id="updateBy" name="updateBy" type="hidden" value="${epSysOrgPage.updateBy }">
					<input id="updateDate" name="updateDate" type="hidden" value="${epSysOrgPage.updateDate }">
					<input id="orgStatus" name="orgStatus" type="hidden" value="${epSysOrgPage.orgStatus }">
					<input id="orgVersion" name="orgVersion" type="hidden" value="${epSysOrgPage.orgVersion }">
		<table style="width: 100%;" cellpadding="0" cellspacing="1" class="formtable">
				<tr>
					<td align="right">
						<label class="Validform_label">
							类型:
						</label>
					</td>
					<td class="value">
					     	 <input id="orgType" name="orgType" type="text" style="width: 150px" class="inputxt"
								               
								               >
							<span class="Validform_checktip"></span>
							<label class="Validform_label" style="display: none;">类型</label>
						</td>
					<td align="right">
						<label class="Validform_label">
							备注:
						</label>
					</td>
					<td class="value">
						  	 <textarea style="width:600px;" class="inputxt" rows="6" id="orgNote" name="orgNote"></textarea>
							<span class="Validform_checktip"></span>
							<label class="Validform_label" style="display: none;">备注</label>
						</td>
					</tr>
				<tr>
					<td align="right">
						<label class="Validform_label">
							排序:
						</label>
					</td>
					<td class="value">
					     	 <input id="orgSort" name="orgSort" type="text" style="width: 150px" class="inputxt"
								               
								               >
							<span class="Validform_checktip"></span>
							<label class="Validform_label" style="display: none;">排序</label>
						</td>
					<td align="right">
						<label class="Validform_label">
							单位编号:
						</label>
					</td>
					<td class="value">
					     	 <input id="orgCorpid" name="orgCorpid" type="text" style="width: 150px" class="inputxt"
								               
								               >
							<span class="Validform_checktip"></span>
							<label class="Validform_label" style="display: none;">单位编号</label>
						</td>
					</tr>
				<tr>
					<td align="right">
						<label class="Validform_label">
							上级单位编号:
						</label>
					</td>
					<td class="value">
					     	 <input id="orgPcorpid" name="orgPcorpid" type="text" style="width: 150px" class="inputxt"
								               
								               >
							<span class="Validform_checktip"></span>
							<label class="Validform_label" style="display: none;">上级单位编号</label>
						</td>
					<td align="right">
						<label class="Validform_label">
							上级单位名称:
						</label>
					</td>
					<td class="value">
					     	 <input id="orgPcorpname" name="orgPcorpname" type="text" style="width: 150px" class="inputxt"
								               
								               >
							<span class="Validform_checktip"></span>
							<label class="Validform_label" style="display: none;">上级单位名称</label>
						</td>
					</tr>
				<tr>
					<td align="right">
						<label class="Validform_label">
							单位类型:
						</label>
					</td>
					<td class="value">
					     	 <input id="orgCorptype" name="orgCorptype" type="text" style="width: 150px" class="inputxt"
								               
								               >
							<span class="Validform_checktip"></span>
							<label class="Validform_label" style="display: none;">单位类型</label>
						</td>
					<td align="right">
						<label class="Validform_label">
							单位名称:
						</label>
					</td>
					<td class="value">
					     	 <input id="orgCorpname" name="orgCorpname" type="text" style="width: 150px" class="inputxt"
								               
								               >
							<span class="Validform_checktip"></span>
							<label class="Validform_label" style="display: none;">单位名称</label>
						</td>
					</tr>
				<tr>
					<td align="right">
						<label class="Validform_label">
							单位英文:
						</label>
					</td>
					<td class="value">
					     	 <input id="orgCorpnameen" name="orgCorpnameen" type="text" style="width: 150px" class="inputxt"
								               
								               >
							<span class="Validform_checktip"></span>
							<label class="Validform_label" style="display: none;">单位英文</label>
						</td>
					<td align="right">
						<label class="Validform_label">
							省份:
						</label>
					</td>
					<td class="value">
					     	 <input id="orgProvince" name="orgProvince" type="text" style="width: 150px" class="inputxt"
								               
								               >
							<span class="Validform_checktip"></span>
							<label class="Validform_label" style="display: none;">省份</label>
						</td>
					</tr>
				<tr>
					<td align="right">
						<label class="Validform_label">
							城市:
						</label>
					</td>
					<td class="value">
					     	 <input id="orgCity" name="orgCity" type="text" style="width: 150px" class="inputxt"
								               
								               >
							<span class="Validform_checktip"></span>
							<label class="Validform_label" style="display: none;">城市</label>
						</td>
					<td align="right">
						<label class="Validform_label">
							行业类型:
						</label>
					</td>
					<td class="value">
					     	 <input id="orgIndustrytype" name="orgIndustrytype" type="text" style="width: 150px" class="inputxt"
								               
								               >
							<span class="Validform_checktip"></span>
							<label class="Validform_label" style="display: none;">行业类型</label>
						</td>
					</tr>
				<tr>
					<td align="right">
						<label class="Validform_label">
							单位性质:
						</label>
					</td>
					<td class="value">
					     	 <input id="orgNature" name="orgNature" type="text" style="width: 150px" class="inputxt"
								               
								               >
							<span class="Validform_checktip"></span>
							<label class="Validform_label" style="display: none;">单位性质</label>
						</td>
					<td align="right">
						<label class="Validform_label">
							单位子性质:
						</label>
					</td>
					<td class="value">
					     	 <input id="orgSubnature" name="orgSubnature" type="text" style="width: 150px" class="inputxt"
								               
								               >
							<span class="Validform_checktip"></span>
							<label class="Validform_label" style="display: none;">单位子性质</label>
						</td>
					</tr>
				<tr>
					<td align="right">
						<label class="Validform_label">
							电话:
						</label>
					</td>
					<td class="value">
					     	 <input id="orgPhone" name="orgPhone" type="text" style="width: 150px" class="inputxt"
								               
								               >
							<span class="Validform_checktip"></span>
							<label class="Validform_label" style="display: none;">电话</label>
						</td>
					<td align="right">
						<label class="Validform_label">
							传真:
						</label>
					</td>
					<td class="value">
					     	 <input id="orgFax" name="orgFax" type="text" style="width: 150px" class="inputxt"
								               
								               >
							<span class="Validform_checktip"></span>
							<label class="Validform_label" style="display: none;">传真</label>
						</td>
					</tr>
				<tr>
					<td align="right">
						<label class="Validform_label">
							邮箱:
						</label>
					</td>
					<td class="value">
					     	 <input id="orgEmail" name="orgEmail" type="text" style="width: 150px" class="inputxt"
								               
								               >
							<span class="Validform_checktip"></span>
							<label class="Validform_label" style="display: none;">邮箱</label>
						</td>
					<td align="right">
						<label class="Validform_label">
							邮编:
						</label>
					</td>
					<td class="value">
					     	 <input id="orgZipcode" name="orgZipcode" type="text" style="width: 150px" class="inputxt"
								               
								               >
							<span class="Validform_checktip"></span>
							<label class="Validform_label" style="display: none;">邮编</label>
						</td>
					</tr>
				<tr>
					<td align="right">
						<label class="Validform_label">
							单位地址:
						</label>
					</td>
					<td class="value">
					     	 <input id="orgAddress" name="orgAddress" type="text" style="width: 150px" class="inputxt"
								               
								               >
							<span class="Validform_checktip"></span>
							<label class="Validform_label" style="display: none;">单位地址</label>
						</td>
					<td align="right">
						<label class="Validform_label">
							是否有效:
						</label>
					</td>
					<td class="value">
					     	 <input id="orgIsactive" name="orgIsactive" type="text" style="width: 150px" class="inputxt"
								               
								               >
							<span class="Validform_checktip"></span>
							<label class="Validform_label" style="display: none;">是否有效</label>
						</td>
					</tr>
				<tr>
					<td align="right">
						<label class="Validform_label">
							备注:
						</label>
					</td>
					<td class="value">
						  	 <textarea style="width:600px;" class="inputxt" rows="6" id="orgNotes" name="orgNotes"></textarea>
							<span class="Validform_checktip"></span>
							<label class="Validform_label" style="display: none;">备注</label>
						</td>
					<td align="right">
						<label class="Validform_label">
							排序:
						</label>
					</td>
					<td class="value">
					     	 <input id="orgOrderno" name="orgOrderno" type="text" style="width: 150px" class="inputxt"
								               
								               >
							<span class="Validform_checktip"></span>
							<label class="Validform_label" style="display: none;">排序</label>
						</td>
					</tr>
				<tr>
					<td align="right">
						<label class="Validform_label">
							单位外码:
						</label>
					</td>
					<td class="value">
					     	 <input id="orgExtendcode" name="orgExtendcode" type="text" style="width: 150px" class="inputxt"
								               
								               >
							<span class="Validform_checktip"></span>
							<label class="Validform_label" style="display: none;">单位外码</label>
						</td>
					<td align="right">
						<label class="Validform_label">
							批件号:
						</label>
					</td>
					<td class="value">
					     	 <input id="orgPijian" name="orgPijian" type="text" style="width: 150px" class="inputxt"
								               
								               >
							<span class="Validform_checktip"></span>
							<label class="Validform_label" style="display: none;">批件号</label>
						</td>
					</tr>
				<tr>
					<td align="right">
						<label class="Validform_label">
							确认件号:
						</label>
					</td>
					<td class="value">
					     	 <input id="orgQuerenjian" name="orgQuerenjian" type="text" style="width: 150px" class="inputxt"
								               
								               >
							<span class="Validform_checktip"></span>
							<label class="Validform_label" style="display: none;">确认件号</label>
						</td>
					<td align="right">
						<label class="Validform_label">
							是否为叶子节点:
						</label>
					</td>
					<td class="value">
					     	 <input id="orgIsleaf" name="orgIsleaf" type="text" style="width: 150px" class="inputxt"
								               
								               >
							<span class="Validform_checktip"></span>
							<label class="Validform_label" style="display: none;">是否为叶子节点</label>
						</td>
					</tr>
				<tr>
					<td align="right">
						<label class="Validform_label">
							出国任务审批单位:
						</label>
					</td>
					<td class="value">
					     	 <input id="orgShenpiunit" name="orgShenpiunit" type="text" style="width: 150px" class="inputxt"
								               
								               >
							<span class="Validform_checktip"></span>
							<label class="Validform_label" style="display: none;">出国任务审批单位</label>
						</td>
					<td align="right">
						<label class="Validform_label">
							政治审查审批单位:
						</label>
					</td>
					<td class="value">
					     	 <input id="orgShenchaunit" name="orgShenchaunit" type="text" style="width: 150px" class="inputxt"
								               
								               >
							<span class="Validform_checktip"></span>
							<label class="Validform_label" style="display: none;">政治审查审批单位</label>
						</td>
					</tr>
				<tr>
					<td align="right">
						<label class="Validform_label">
							政治审查批件文号:
						</label>
					</td>
					<td class="value">
					     	 <input id="orgShenchafileno" name="orgShenchafileno" type="text" style="width: 150px" class="inputxt"
								               
								               >
							<span class="Validform_checktip"></span>
							<label class="Validform_label" style="display: none;">政治审查批件文号</label>
						</td>
					<td align="right">
						<label class="Validform_label">
							事项表签署人姓名及职务:
						</label>
					</td>
					<td class="value">
					     	 <input id="orgSignnameduty" name="orgSignnameduty" type="text" style="width: 150px" class="inputxt"
								               
								               >
							<span class="Validform_checktip"></span>
							<label class="Validform_label" style="display: none;">事项表签署人姓名及职务</label>
						</td>
					</tr>
				<tr>
					<td align="right">
						<label class="Validform_label">
							审批件公章:
						</label>
					</td>
					<td class="value">
					     	 <input id="orgAuditfileseal" name="orgAuditfileseal" type="text" style="width: 150px" class="inputxt"
								               
								               >
							<span class="Validform_checktip"></span>
							<label class="Validform_label" style="display: none;">审批件公章</label>
						</td>
					<td align="right">
						<label class="Validform_label">
							审查件公章:
						</label>
					</td>
					<td class="value">
					     	 <input id="orgEfileseal" name="orgEfileseal" type="text" style="width: 150px" class="inputxt"
								               
								               >
							<span class="Validform_checktip"></span>
							<label class="Validform_label" style="display: none;">审查件公章</label>
						</td>
					</tr>
				<tr>
					<td align="right">
						<label class="Validform_label">
							事项表公章:
						</label>
					</td>
					<td class="value">
					     	 <input id="orgListofficialseal" name="orgListofficialseal" type="text" style="width: 150px" class="inputxt"
								               
								               >
							<span class="Validform_checktip"></span>
							<label class="Validform_label" style="display: none;">事项表公章</label>
						</td>
					<td align="right">
						<label class="Validform_label">
							照会公章:
						</label>
					</td>
					<td class="value">
					     	 <input id="orgPdeliverseal" name="orgPdeliverseal" type="text" style="width: 150px" class="inputxt"
								               
								               >
							<span class="Validform_checktip"></span>
							<label class="Validform_label" style="display: none;">照会公章</label>
						</td>
					</tr>
				<tr>
					<td align="right">
						<label class="Validform_label">
							是否有机要文件交换户头:
						</label>
					</td>
					<td class="value">
					     	 <input id="orgCeea" name="orgCeea" type="text" style="width: 150px" class="inputxt"
								               
								               >
							<span class="Validform_checktip"></span>
							<label class="Validform_label" style="display: none;">是否有机要文件交换户头</label>
						</td>
					<td align="right">
						<label class="Validform_label">
							批准文号:
						</label>
					</td>
					<td class="value">
					     	 <input id="orgApprovenum" name="orgApprovenum" type="text" style="width: 150px" class="inputxt"
								               
								               >
							<span class="Validform_checktip"></span>
							<label class="Validform_label" style="display: none;">批准文号</label>
						</td>
					</tr>
				<tr>
					<td align="right">
						<label class="Validform_label">
							批准日期:
						</label>
					</td>
					<td class="value">
							   <input id="orgApprovedate" name="orgApprovedate" type="text" style="width: 150px" 
					      						class="Wdate" onClick="WdatePicker()"
								                
								               >    
							<span class="Validform_checktip"></span>
							<label class="Validform_label" style="display: none;">批准日期</label>
						</td>
					<td align="right">
						<label class="Validform_label">
							备案表生效日期:
						</label>
					</td>
					<td class="value">
							   <input id="orgBabsxdate" name="orgBabsxdate" type="text" style="width: 150px" 
					      						class="Wdate" onClick="WdatePicker()"
								                
								               >    
							<span class="Validform_checktip"></span>
							<label class="Validform_label" style="display: none;">备案表生效日期</label>
						</td>
					</tr>
				<tr>
					<td align="right">
						<label class="Validform_label">
							是否派遣部门:
						</label>
					</td>
					<td class="value">
					     	 <input id="orgIssend" name="orgIssend" type="text" style="width: 150px" class="inputxt"
								               
								               >
							<span class="Validform_checktip"></span>
							<label class="Validform_label" style="display: none;">是否派遣部门</label>
						</td>
					<td align="right">
						<label class="Validform_label">
							外办单位外事机关:
						</label>
					</td>
					<td class="value">
					     	 <input id="orgSeqid" name="orgSeqid" type="text" style="width: 150px" class="inputxt"
								               
								               >
							<span class="Validform_checktip"></span>
							<label class="Validform_label" style="display: none;">外办单位外事机关</label>
						</td>
					</tr>
			</table>
		</t:formvalid>
 </body>
