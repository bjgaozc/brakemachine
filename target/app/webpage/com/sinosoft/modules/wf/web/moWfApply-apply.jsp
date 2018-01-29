<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@include file="/context/mytags.jsp"%>
<sino:plugins type="jquery,easyui,tools,zui-1.5.0,util"/>
<%@include file="/webpage/com/sinosoft/modules/wf/ui/moWf.jsp"%>
<script src = "webpage/com/sinosoft/modules/wf/web/moWfApply-apply.js"></script>		
<script type="text/javascript">
$(function(){
	moWfApplyApply.initAll();
});
</script>
<div class="easyui-layout" fit="true">
    <div data-options="region:'center',border:false" style="padding: 0px;" class="mo_de_wf_bg1">
    	
    	
    	<div class="container">
			<div class="row">
				<br>
			</div>
			
			<div class="row">
			  <div class="col-md-3">
			  	<div class="card" style="cursor:pointer;">
				    <img onclick="alert(1);" src="webpage/com/sinosoft/modules/wf/ui/images/1.png" alt="">
				    <div class="card-heading"><strong>请假</strong></div>
				    <div class="card-content text-muted">良辰美景奈何天，赏心乐事谁家院。</div>
				    <div class="card-actions">
				      <button type="button" class="btn btn-danger"><i class="icon-heart"></i> 喜欢</button>
				      <div class="pull-right text-danger"><i class="icon-heart-empty"></i> 520 人喜欢</div>
				    </div>
				  </div>
			  </div>
			  <div class="col-md-3">
			  	<a class="card" href="###">
				    <img src="http://zui.sexy/docs/img/img2.jpg" alt="">
				    <div class="card-heading"><strong>报销</strong></div>
				    <div class="card-content text-muted">良辰美景奈何天，赏心乐事谁家院。</div>
				    <div class="card-actions">
				      <button type="button" class="btn btn-danger"><i class="icon-heart"></i> 喜欢</button>
				      <div class="pull-right text-danger"><i class="icon-heart-empty"></i> 520 人喜欢</div>
				    </div>
				  </a>
			  </div>
			  <div class="col-md-3">
			  	<a class="card" href="###">
				    <img src="http://zui.sexy/docs/img/img2.jpg" alt="">
				    <div class="card-heading"><strong>出差</strong></div>
				    <div class="card-content text-muted">良辰美景奈何天，赏心乐事谁家院。</div>
				    <div class="card-actions">
				      <button type="button" class="btn btn-danger"><i class="icon-heart"></i> 喜欢</button>
				      <div class="pull-right text-danger"><i class="icon-heart-empty"></i> 520 人喜欢</div>
				    </div>
				  </a>
			  </div>
			  <div class="col-md-3">
			  	<a class="card" href="###">
				    <img src="http://zui.sexy/docs/img/img2.jpg" alt="">
				    <div class="card-heading"><strong>外出</strong></div>
				    <div class="card-content text-muted">良辰美景奈何天，赏心乐事谁家院。</div>
				    <div class="card-actions">
				      <button type="button" class="btn btn-danger"><i class="icon-heart"></i> 喜欢</button>
				      <div class="pull-right text-danger"><i class="icon-heart-empty"></i> 520 人喜欢</div>
				    </div>
				  </a>
			  </div>
			</div>
			
			
			<div class="row">
				
				<div class="col-md-3"></div>
				<div class="col-md-3"></div>
				<div class="col-md-3"></div>
				<div class="col-md-3">
				
					<div onclick="moWfApplyApply.addClick();" style="border: 1px solid #95B8E7;margin: 5px;float: left;cursor:pointer;float: right;" onmouseover="$(this).css({'background-color':'F2F2F2'})" onmouseout="$(this).css({'background-color':'#ffffff'})">
						<table>
							<tr><td align="center" valign="middle"><img src="webpage/com/sinosoft/modules/wf/ui/images/task-50.png" width="65px" height="65px"></td></tr>
							<tr><td align="center" valign="middle"><span>添加</span></td></tr>
						</table>
					</div>
				
				</div>
				
			</div>
			
			
			
		</div>
  
  
  
  
  
  
  
  
    	
    	
    	
    	
    	
    	
    	
    	<br><br><br><br><br><br><br><br>
    	
    	
    	
    	
    	
    	
    	
    	
    	
    	
    	
    	
    	
		
		
		
		
		
		
		
		
		
		
    </div>
</div>