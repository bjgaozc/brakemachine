<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@include file="/context/tags.jsp"%>
<app:template title="表单2">
	<sino:plugins loadType="rbr" type="kindeditor" />
	<app:chooseCountry targetId="#a43" />
	<app:form action="baseEpBiPersonController.do?doAdd2" beforeSubmit="abc" novalidate="false">
		<app:formItem ccsClass="col-3 pd-r-5" title="姓名" name="a1" value="周振福" required="true" disabled="true"/>
		<app:formItem ccsClass="col-3 pd-r-5" title="身份证号" name="a2" value="330722195511180011" required="true" validType="idcard"/>
		<app:formItem ccsClass="col-3 pd-r-5" title="年龄" name="a3" value="36" readonly="true"/>
		<app:formItem type="select" topLine="true" fthCode="021" ccsClass="col-3 pd-r-5" dataOptions="editable:false,panelHeight:'auto'" title="出生地" name="a4" required="true"/>
		
		<app:formItem type="my97" ccsClass="col-3 pd-r-5" title="出生日期" name="a5" value="2016-12-18" required="true" 
			dataOptions="onpicking:my97Change" />
		<app:formItem type="select" selectUrl="[{id:'公务普通',text:'公务普通'},{id:'其他',text:'其他'}]" ccsClass="col-3 pd-r-5" dataOptions="editable:false,panelHeight:'auto'" title="护照种类" name="passportType" value="公务普通" required="true"/>
		<app:formItem ccsClass="col-3 pd-r-5" title="单位" name="org1"/>
		<app:formItem type="blank" ccsClass="col-3 pd-r-5"/>
		
		<app:formItem ccsClass="col-3 pd-r-5" title="照片编号" name="a31" required="true" validType="eqLength[20]"/>
		<app:formItem ccsClass="col-3 pd-r-5" title="邮箱，最小长度" name="a32" required="true" dataOptions="validType:['email','minLength[10]']"/>
		<app:formItem ccsClass="col-3 pd-r-5" title="只能输入中文" name="a33" required="true" validType="chinese"/>
		<app:formItem ccsClass="col-3 pd-r-5" title="国内邮编" name="a34" required="true" validType="zipcode"/>
		
		<app:formItem type="info" ccsClass="col-3 pd-r-5" title="测试41" name="a41" value="这是内容，这是内容"/>
		<app:formItem type="img" ccsClass="col-3 pd-r-5" title="图片" name="a42" value="plug-in/login/images/login_image/login_bg.jpg"/>
		<app:formItem ccsClass="col-3 pd-r-5" title="选择国家" name="a43"/>
		<app:formItem ccsClass="col-3 pd-r-5" title="只能为数字" name="a44" required="true" validType="integer"/>
		
		<app:formItem type="radio" selectUrl="[{id:'1',text:'男'},{id:'2',text:'女'}]" value="1" ccsClass="col-3 pd-r-5" title="单选" name="a51"/>
		<app:formItem type="checkbox" selectUrl="[{id:'1',text:'选项1'},{id:'2',text:'选项2'}]" value="2" ccsClass="col-3 pd-r-5" title="多选" name="a52"/>
		<app:formItem type="password" ccsClass="col-3 pd-r-5" title="密码" name="a53"/>
		<app:formItem type="custom" ccsClass="col-3 pd-r-5" title="上传文件" name="a54">
			<div class="form-control col-8" >
				<input type="hidden" id="img1Input" name="img1Input">
				<img id="img1Img" src="" class="form-control" style="width: 80px;height: 100%;display: none;">
			</div>
			<div class="form-control col-4 pd-r-0 pd-l-0" >
				<sino:uploadImage id="img1" customFun="img1Abc" />
			</div>
		</app:formItem>
		
		
		
		
		
		
		<app:formItem type="kindeditor" labelHeight="130px" ccsClass="col-6 pd-r-5" name="b1" title="备注aa"/>
		<app:formItem type="textarea" labelHeight="130px" height="141px" ccsClass="col-6 pd-r-5" name="b2" title="备注2" validType="length[5,10]" dataOptions="required:true" />
	</app:form>
	
	
	
	
	
	<app:chooseOrg targetName="#org1" />
	<script>
		$(function(){
			$("#a5").on("change",function(){
				alert($(this).val());
			});
			common.initUploadBtn("选择文件","#img1");
		});
		
		function my97Change(dp){
			if (dp.cal.getDateStr() != dp.cal.getNewDateStr()) {
				alert('选择完成');
			}
		}
		
		function abc(param){
			log("提交前处理");
			//return false;
			return true;
		}
	</script>
</app:template>