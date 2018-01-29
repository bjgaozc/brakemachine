<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@include file="/context/tags.jsp"%>
<app:template title="人员管理">
<t:formvalid formid="formobj" dialog="true" layout="table" action="epBiPersonController.do?doAdd" tiptype="2">
	<script type="text/javascript" src="webpage/com/sinosoft/modules/ep/web/epBiPerson-add.js"></script>
	<div class="col-6 pd-r-5 pd-l-5">
   		<div class="form-group">
			<div class="col-10 ">
				<label for="xing">姓</label>
				<input type="text" class="form-control easyui-validatebox" 
				name="xing" id="xing" onblur="getPinyinByAjax(this.value,'xPinYin','0','xingTelecode')" 
				placeholder="姓" data-options="required:true "  style="width:100%;">
			</div>
			<div class="col-2 ">
				<label for="btn_d">&nbsp;</label>
				<a id="btn_d" href="#"  style="width:100%;"  class="easyui-linkbutton" onClick="makeUserName('xing','');">·</a>
			</div>
			<div class="clearfix"></div>
		</div>
		<div class="form-group">
			<label for="xPinYin">姓拼音</label>
			<input class="form-control  easyui-combobox" id="xPinYin" name="xPinYin" readonly="readonly" 
				data-options="valueField:'id',textField:'text',panelHeight:'auto'" style="width:100%;"style="width:100%;" placeholder="姓拼音">
		</div>
		<div class="form-group">
			<label for="sex">性别</label>
     			<select type='text'  id='sex' name='sex' class="form-control easyui-combobox"   data-options="valueField:'text',textField:'text',panelHeight:'auto',required:true"   style="width:100%;"  >
     			 <option value='男'>男</option>
     			 <option value='女'>女</option>
     			</select>        			
		</div>
		<div class="form-group">
			<label for="birthPlace">出生地</label>
			<input class="form-control easyui-combobox" style="width:100%;" 
					name="birthPlace" id="birthPlace"
					data-options="valueField:'text',textField:'text',url:'epCommonController.do?getChdsByFthCode&fthCode=003',prompt:'出生地',required:true">
		</div>
   	</div>
   	<div class="col-6 pd-r-5 pd-l-5">
		<div class="form-group">
			<div class="col-10 ">
				<label for="ming">名</label>
    					<input type="text" class="form-control easyui-validatebox" 
				name="ming" id="ming" onblur="getPinyinByAjax(this.value,'mPinYin','1','mingTelecode')"
				placeholder="名" data-options="required:true "  style="width:100%;">
			</div>
			<div class="col-2 ">
				<label for="btn_d">&nbsp;</label>
			 	 <a id="btn_d" href="javascript:void(0);"  style="width:100%;"  class="easyui-linkbutton" onClick="makeUserName('ming','1');">·</a>
			</div>
			<div class="clearfix"></div>
		</div>
		<div class="form-group">
			<label for="mPinYin">名拼音</label>
    				<input id="mPinYin" name="mPinYin"  readonly="readonly"   class="form-control easyui-combobox"
    				 data-options="valueField:'id',textField:'text',panelHeight:'auto'" style="width:100%;" placeholder="名拼音"></input>
		</div>
		<div class="form-group">
			<label for="nation">民族</label>
			<input class="form-control easyui-combobox" style="width:100%;" 
					name="nation" id="nation"
					data-options="valueField:'text',textField:'text',url:'epCommonController.do?getChdsByFthCode&fthCode=501',prompt:'民族',required:true">
		</div>
		<div class="form-group">
			<label for="idcard">证件号</label>
			<input type="text" class="form-control easyui-validatebox" 
				name="idcard" id="idcard"  onblur='checkPersonIdCard(this.value)'
				placeholder="证件号" data-options="required:true "  style="width:100%;">
		</div>
		
	</div>
	
	<div class="form-group">
			<label for="deptName">工作单位</label>
			<app:chooseOrg id="deptName" targetOnclickId="#deptName" targetId="#corpId" targetName="#deptName" />
			<input type="text" class="form-control easyui-validatebox"  readonly="readonly"
			name="deptName" id="deptName"  onblur="backOutDeptName(this.value)"
			placeholder="工作单位" data-options="required:true "  style="width:100%;">
     				<input id='corpId'  name='corpId'  type="hidden" >
	</div>
</t:formvalid>
</app:template>