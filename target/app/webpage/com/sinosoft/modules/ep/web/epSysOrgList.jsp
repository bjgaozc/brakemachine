<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@include file="/context/mytags.jsp"%>
<t:base type="jquery,easyui,tools,DatePicker"></t:base>
<div class="easyui-layout" fit="true">
  <div region="center" style="padding:1px;">
  <t:datagrid name="epSysOrgList" checkbox="true" fitColumns="false" title="组织机构" actionUrl="epSysOrgController.do?datagrid" idField="id" fit="true" queryMode="group">
   <t:dgCol title="主键"  field="id"  hidden="true"  queryMode="single"  width="120"></t:dgCol>
   <t:dgCol title="单位编号"  field="orgCorpid"   query="true" queryMode="single"  width="120"></t:dgCol>
   <t:dgCol title="上级单位编号"  field="orgPcorpid"    queryMode="single"  width="120"></t:dgCol>
   <t:dgCol title="上级单位名称"  field="orgPcorpname"    queryMode="single"  width="120"></t:dgCol>
   <t:dgCol title="单位类型"  field="orgCorptype"   query="true" queryMode="single"  width="120"></t:dgCol>
   <t:dgCol title="单位名称"  field="orgCorpname"   query="true" queryMode="single"  width="120"></t:dgCol>
   <t:dgCol title="单位英文"  field="orgCorpnameen"    queryMode="single"  width="120"></t:dgCol>
   <t:dgCol title="省份"  field="orgProvince"    queryMode="single"  width="120"></t:dgCol>
   <t:dgCol title="城市"  field="orgCity"    queryMode="single"  width="120"></t:dgCol>
   <t:dgCol title="行业类型"  field="orgIndustrytype"    queryMode="single"  width="120"></t:dgCol>
   <t:dgCol title="单位性质"  field="orgNature"   query="true" queryMode="single"  width="120"></t:dgCol>
   <t:dgCol title="单位子性质"  field="orgSubnature"    queryMode="single"  width="120"></t:dgCol>
   <t:dgCol title="电话"  field="orgPhone"    queryMode="single"  width="120"></t:dgCol>
   <t:dgCol title="传真"  field="orgFax"    queryMode="single"  width="120"></t:dgCol>
   <t:dgCol title="邮箱"  field="orgEmail"    queryMode="single"  width="120"></t:dgCol>
   <t:dgCol title="邮编"  field="orgZipcode"    queryMode="single"  width="120"></t:dgCol>
   <t:dgCol title="单位地址"  field="orgAddress"    queryMode="single"  width="120"></t:dgCol>
   <t:dgCol title="是否有效"  field="orgIsactive"    queryMode="single"  width="120"></t:dgCol>
   <t:dgCol title="备注"  field="orgNotes"    queryMode="single"  width="120"></t:dgCol>
   <t:dgCol title="排序"  field="orgOrderno"    queryMode="single"  width="120"></t:dgCol>
   <t:dgCol title="单位外码"  field="orgExtendcode"    queryMode="single"  width="120"></t:dgCol>
   <t:dgCol title="批件号"  field="orgPijian"    queryMode="single"  width="120"></t:dgCol>
   <t:dgCol title="确认件号"  field="orgQuerenjian"    queryMode="single"  width="120"></t:dgCol>
   <t:dgCol title="是否为叶子节点"  field="orgIsleaf"    queryMode="single"  width="120"></t:dgCol>
   <t:dgCol title="出国任务审批单位"  field="orgShenpiunit"    queryMode="single"  width="120"></t:dgCol>
   <t:dgCol title="政治审查审批单位"  field="orgShenchaunit"    queryMode="single"  width="120"></t:dgCol>
   <t:dgCol title="政治审查批件文号"  field="orgShenchafileno"    queryMode="single"  width="120"></t:dgCol>
   <t:dgCol title="事项表签署人姓名及职务"  field="orgSignnameduty"    queryMode="single"  width="120"></t:dgCol>
   <t:dgCol title="审批件公章"  field="orgAuditfileseal"    queryMode="single"  width="120"></t:dgCol>
   <t:dgCol title="审查件公章"  field="orgEfileseal"    queryMode="single"  width="120"></t:dgCol>
   <t:dgCol title="事项表公章"  field="orgListofficialseal"    queryMode="single"  width="120"></t:dgCol>
   <t:dgCol title="照会公章"  field="orgPdeliverseal"    queryMode="single"  width="120"></t:dgCol>
   <t:dgCol title="是否有机要文件交换户头"  field="orgCeea"    queryMode="single"  width="120"></t:dgCol>
   <t:dgCol title="批准文号"  field="orgApprovenum"    queryMode="single"  width="120"></t:dgCol>
   <t:dgCol title="批准日期"  field="orgApprovedate" formatter="yyyy-MM-dd"   queryMode="single"  width="120"></t:dgCol>
   <t:dgCol title="备案表生效日期"  field="orgBabsxdate" formatter="yyyy-MM-dd"   queryMode="single"  width="120"></t:dgCol>
   <t:dgCol title="是否派遣部门"  field="orgIssend"    queryMode="single"  width="120"></t:dgCol>
   <t:dgCol title="外办单位外事机关"  field="orgSeqid"    queryMode="single"  width="120"></t:dgCol>
   
   <t:dgCol title="类型"  field="orgType"  hidden="true"  queryMode="single"  width="120"></t:dgCol>
   <t:dgCol title="状态"  field="orgStatus"  hidden="true"  queryMode="single"  width="120"></t:dgCol>
   <t:dgCol title="备注"  field="orgNote"  hidden="true"  queryMode="single"  width="120"></t:dgCol>
   <t:dgCol title="排序"  field="orgSort"  hidden="true"  queryMode="single"  width="120"></t:dgCol>
   <t:dgCol title="版本"  field="orgVersion"  hidden="true"  queryMode="single"  width="120"></t:dgCol>
   
   <t:dgCol title="创建人名称"  field="createName"  hidden="true"  queryMode="single"  width="120"></t:dgCol>
   <t:dgCol title="创建人登录名称"  field="createBy"  hidden="true"  queryMode="single"  width="120"></t:dgCol>
   <t:dgCol title="创建日期"  field="createDate" formatter="yyyy-MM-dd" hidden="true"  queryMode="single"  width="120"></t:dgCol>
   <t:dgCol title="更新人名称"  field="updateName"  hidden="true"  queryMode="single"  width="120"></t:dgCol>
   <t:dgCol title="更新人登录名称"  field="updateBy"  hidden="true"  queryMode="single"  width="120"></t:dgCol>
   <t:dgCol title="更新日期"  field="updateDate" formatter="yyyy-MM-dd" hidden="true"  queryMode="single"  width="120"></t:dgCol>
   
   <t:dgCol title="操作" field="opt" width="100"></t:dgCol>
   <t:dgDelOpt title="删除" url="epSysOrgController.do?doDel&id={id}" />
   <t:dgToolBar title="录入" icon="icon-add" url="epSysOrgController.do?goAdd" funname="add"></t:dgToolBar>
   <t:dgToolBar title="编辑" icon="icon-edit" url="epSysOrgController.do?goUpdate" funname="update"></t:dgToolBar>
   <t:dgToolBar title="批量删除"  icon="icon-remove" url="epSysOrgController.do?doBatchDel" funname="deleteALLSelect"></t:dgToolBar>
   <t:dgToolBar title="查看" icon="icon-search" url="epSysOrgController.do?goUpdate" funname="detail"></t:dgToolBar>
   <t:dgToolBar title="导入" icon="icon-put" funname="ImportXls"></t:dgToolBar>
   <t:dgToolBar title="导出" icon="icon-putout" funname="ExportXls"></t:dgToolBar>
   <t:dgToolBar title="模板下载" icon="icon-putout" funname="ExportXlsByT"></t:dgToolBar>
  </t:datagrid>
  </div>
 </div>
 <script type="text/javascript">
 $(document).ready(function(){
 		//给时间控件加上样式
 			$("#epSysOrgListtb").find("input[name='createDate']").attr("class","Wdate").attr("style","height:20px;width:90px;").click(function(){WdatePicker({dateFmt:'yyyy-MM-dd'});});
 			$("#epSysOrgListtb").find("input[name='updateDate']").attr("class","Wdate").attr("style","height:20px;width:90px;").click(function(){WdatePicker({dateFmt:'yyyy-MM-dd'});});
 			$("#epSysOrgListtb").find("input[name='orgApprovedate']").attr("class","Wdate").attr("style","height:20px;width:90px;").click(function(){WdatePicker({dateFmt:'yyyy-MM-dd'});});
 			$("#epSysOrgListtb").find("input[name='orgBabsxdate']").attr("class","Wdate").attr("style","height:20px;width:90px;").click(function(){WdatePicker({dateFmt:'yyyy-MM-dd'});});
 });
 
//导入
function ImportXls() {
	openuploadwin('Excel导入', 'epSysOrgController.do?upload', "epSysOrgList");
}

//导出
function ExportXls() {
	JeecgExcelExport("epSysOrgController.do?exportXls","epSysOrgList");
}

//模板下载
function ExportXlsByT() {
	JeecgExcelExport("epSysOrgController.do?exportXlsByT","epSysOrgList");
}
 </script>