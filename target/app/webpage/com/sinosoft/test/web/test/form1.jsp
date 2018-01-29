<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@include file="/context/tags.jsp"%>
<app:template title="表单1">
	
	<script>
		function abc(param){
			log(param);
			return true;
		}
		function def(data){
			log(data);
			baseCommon.tip(data.msg);
			return true;
		}
	</script>
	
	<app:form action="epBiPersonController.do?doAdd2" beforeSubmit="abc" >
		<div class="col-12">
			<div class="form-group">
				<label for="countryName">姓名</label>
				<input type="text" class="form-control easyui-validatebox" 
					id="name" name="name" value="张三"
					placeholder="姓名">
			</div>
			<div class="form-group">
				<label for="totalDays">拼音</label>
				<input type="text" class="form-control easyui-validatebox"
					id="pinyin" name="pinyin" value="zhangsan"
					placeholder="拼音">
			</div>
			<div class="form-group">
				<label for="countryName">邮箱</label>
				<input class="form-control easyui-validatebox" style="width:100%;" value="aaa@126.com" 
					name="countryName" id="countryName"  maxlength="50" placeholder="邮箱"
					data-options="prompt:'邮箱',required:true,validType:['email','minLength[10]']">
			</div>
			<div class="form-group">
				<label for="countryName">手机</label>
				<input class="form-control easyui-validatebox" style="width:100%;" value="" 
					name="mobile" id="mobile"  maxlength="50"
					data-options="required:true,validType:'mobile'">
			</div>
		</div>
	</app:form>

</app:template>

