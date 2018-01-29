<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@include file="/context/tags.jsp"%>
<app:template title="人员管理">
<t:formvalid formid="formobj" dialog="true" layout="table" action="epBiPersonController.do?doUpdate" tiptype="3">
	<input type="hidden" name="id" value="${p.id}">
	<div class="col-6 pd-r-3">
   		<div class="form-group">
			<label for="countryName">姓名</label>
			<input type="text" class="form-control" 
				id="name" name="name" value="${p.name}"
				datatype="*" nullmsg="姓名必填"
				placeholder="姓名">
			<span class="Validform_checktip"></span>
			<label class="Validform_label" style="display: none;">姓名</label>
		</div>
		<div class="form-group">
			<label for="totalDays">拼音</label>
			<input type="text" class="form-control"
				id="pinyin" name="pinyin" value="${p.pinyin}"
				datatype="*" nullmsg="拼音必填"
				placeholder="拼音">
			<span class="Validform_checktip"></span>
			<label class="Validform_label" style="display: none;">拼音</label>
		</div>
		<div class="form-group">
			<label for="sex">性别</label>
     			<select type='text' class="form-control" id='sex' name='sex' value="${p.sex }" datatype="*" nullmsg="性别必填"
				placeholder="性别"  >
     			 <option value='男'>男</option>
     			 <option value='女'>女</option>
     			</select> 
     			<span class="Validform_checktip"></span>
			<label class="Validform_label" style="display: none;">性别</label>       			
		</div>
		<div class="form-group">
			<label for="nation">民族</label>
			<input class="form-control" style="width:100%;" 
					name="nation" id="nation" value="${p.nation }"
					data-options="valueField:'text',textField:'text',url:'epCommonController.do?getChdsByFthCode&fthCode=501',prompt:'民族',required:true" datatype="*" nullmsg="民族必填">
					<span class="Validform_checktip"></span>
			<label class="Validform_label" style="display: none;">民族</label>
		</div>
		</div>
		<div class="col-6 pd-r-3">
		<div class="form-group">
			<label for="idcard">身份证号</label>
			<input type="text" class="form-control easyui-validatebox" 
				name="idcard" id="idcard" value="${p.idcard }" onblur='checkPersonIdCard(this.value)'
				placeholder="证件号" data-options="required:true "  style="width:100%;">
				<span class="Validform_checktip"></span>
			<label class="Validform_label" style="display: none;">身份证号</label>
		</div>
		<div class="form-group">
			<label for="birthPlace">出生地</label>
			<input class="form-control" style="width:100%;" 
					name="birthPlace" id="birthPlace" value="${p.birthPlace }"
					data-options="valueField:'text',textField:'text',url:'epCommonController.do?getChdsByFthCode&fthCode=003',prompt:'出生地',required:true">
					<span class="Validform_checktip"></span>
			<label class="Validform_label" style="display: none;">出生地</label>
		</div>
		<div class="form-group">
			<label for="deptName">工作单位</label>
			<app:chooseOrg id="deptName" targetOnclickId="#deptName"  targetId="#corpId" targetName="#deptName" />
			<input type="text" class="form-control easyui-validatebox" value="${p.deptName }" readonly="readonly"
			name="deptName" id="deptName"  onblur="backOutDeptName(this.value)"
			placeholder="工作单位" data-options="required:true "  style="width:100%;">
     				<input id='corpId'  name='corpId'  type="hidden" >
     				<span class="Validform_checktip"></span>
			<label class="Validform_label" style="display: none;">工作单位</label>
	</div>
   	</div>
</t:formvalid>
</app:template>