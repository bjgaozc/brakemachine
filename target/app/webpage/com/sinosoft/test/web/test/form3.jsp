<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@include file="/context/tags.jsp"%>
<app:template title="表单3" layoutTitle="表单3">
	<app:form id="groupInfo" btnType="1" action="baseEpBiPersonController.do?doAdd2" beforeSubmit="abc">
		<app:formItem ccsClass="col-3 pd-r-5" name="areaCname" value="中科软" title="申报单位" required="true" readonly="true" />
		<app:formItem ccsClass="col-3 pd-r-5" name="undertakeUnit"  title="组团单位名称" required="false"/>
		<app:formItem type="select" fthCode="076" ccsClass="col-3 pd-r-5" dataOptions="editable:false" title="出访任务" name="visitSubTask" value="经济贸易" required="true"/>
		<app:formItem type="select" fthCode="608" ccsClass="col-3 pd-r-5" dataOptions="editable:false,panelHeight:'auto'" title="团组类型" name="groupType"  value="集团内团组" required="true"/>
			
		<app:formItem ccsClass="col-3 pd-r-5" name="totalAmount"  title="预算金额（万）" required="true"/>
		<app:formItem type="select" fthCode="611" ccsClass="col-3 pd-r-5" 
					  dataOptions="editable:false,panelHeight:'auto'" title="经费来源" name="groupBear" value="派员单位自理" required="true"/>
		<app:formItem type="select" fthCode="992" ccsClass="col-3 pd-r-5" 
					  dataOptions="editable:false,panelHeight:'auto'" title="业务类型" name="businessType" value="出国" required="true"/>
		<app:formItem type="select" fthCode="055" ccsClass="col-3 pd-r-5" 
					  dataOptions="editable:false,panelHeight:'auto'" title="出访类型" name="visitType" value="临时" required="true"/>
			 
			 
		<app:formItem type="my97" ccsClass="col-3 pd-r-5" name="visitDate"  title="出访日期" required="true"/>
		<app:formItem ccsClass="col-3 pd-r-5" name="approvalNo"  title="组团单位批件号" required="false"/>
		<app:formItem type="select" fthCode="505" ccsClass="col-3 pd-r-5" 
					  dataOptions="editable:false,panelHeight:'auto'" title="出境地点" name="outPort"  value="北京" required="false"/>
		<app:formItem type="select" fthCode="505" ccsClass="col-3 pd-r-5" 
					  dataOptions="editable:false,panelHeight:'auto'" title="归国地点" name="inPort"  value="北京" required="false"/>	
		
		
		<div class="col-12 text-center" name="groupButton">
			<div class="form-group">
			<input type="hidden"   id="isSubmit" name="isSubmit" value='${isSubmit}'/>
	         <input type="hidden"   id="isAccept" name="isAccept" value='${isAccept}'/>
	         <input type="hidden"   id="corpId" name="corpId" value='${corpId}'/>
	         <input type="hidden"  id="groupId" name="groupId" value='${groupId}'/>
	         <input type="hidden"  id="finalAudit" name="finalAudit" value='${finalAudit}'/>
	         <input type="hidden"  id="isSp" name="isSp" value='${isSp}'/>
	         <input type="hidden"  id="shangbao" name="shangbao" />
	          <input type="hidden"  id="pjNum" name="pjNum" />
	         <input type="hidden"  id="auditStatus" name=auditStatus />
	         <input type="hidden"  id="groupStatus" name="groupStatus" />
			<span class="saveSpan_" style="">
	        	<a id="groupInfo_btn_sub" href="#" class="easyui-linkbutton" iconcls="fa fa-save">保存团组</a>
	        </span>
	        <span class="shenpiSpan_" style="display:none">
	        	&nbsp;<a id="btn_shenpi0" href="#" class="easyui-linkbutton" iconcls="fa fa-smile-o" onclick="shenpi(1)" >受理</a>
	          	&nbsp;<a id="btn_shenpi1" href="#" class="easyui-linkbutton" iconcls="fa fa-smile-o" onclick="shenpi(2)" >审批通过</a>
	          	&nbsp;<a id="btn_shenpi2" href="#" class="easyui-linkbutton c5" iconcls="fa fa-frown-o" onclick="shenpi(3)" >审批不通过</a>
	          	&nbsp;<a id="btn_bohui" href="#" class="easyui-linkbutton c7" iconcls="fa fa-hand-paper-o" onclick="shenpi(4)">驳回 </a>
	        </span>
	        <span class="print" style="display:none" >
				<a id="print_subId" href="#" class="easyui-linkbutton" iconcls="fa fa-download" onclick="print()">下载函件</a>
	        </span>
			</div>
		</div>
		
	</app:form>

	<script>
		$(function(){
			
		});
		function abc(param){
			log("提交前处理");
			//return false;
			return true;
		}
	</script>
</app:template>