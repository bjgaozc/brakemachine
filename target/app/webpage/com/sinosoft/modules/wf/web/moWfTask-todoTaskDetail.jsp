<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@include file="/context/mytags.jsp"%>
<sino:plugins type="jquery,easyui,tools,util"/>
<%@include file="/webpage/com/sinosoft/modules/wf/ui/moWf.jsp"%>
<script src = "webpage/com/sinosoft/modules/wf/web/moWfTask-todoTaskDetail.js"></script>    
<script type="text/javascript">
$(function(){
    moWfTaskTodoTaskDetail.initAll();
});
</script>

<div class="easyui-layout" fit="true">
    <div data-options="region:'center'" style="padding: 10px;background:#f0f0f0;">
        
        <div class="easyui-panel" title="基本信息" style="height:300px;">   
            
        	<div style="height: 55px; overflow: hidden; padding: 20px;">
               <div class="v-gridlayout v-gridlayout-title-block title-block">
               <div class="v-gridlayout-margin v-gridlayout-margin-bottom">
               <div style="position: relative; overflow: hidden; height: 50px;">
               <div style="overflow: hidden; padding-left: 0px; padding-top: 0px; position: absolute; left: 0px; top: 0px; width: 49px; height: 50px;">
               <div style="float: left; margin-left: 0px;"><div class="v-embedded v-embedded-image" style="width: 49px; height: 50px;">
               <img src="webpage/com/sinosoft/modules/wf/ui/images/task-50.png"></div></div></div>
               <div style="height: 18px; overflow: hidden; padding-left: 0px; padding-top: 0px; position: absolute; left: 61px; top: 32px;">
               <div style="float: left; margin-left: 0px;"><div class="v-horizontallayout" style="overflow: hidden; width: auto; height: 18px;">
               <div style="overflow: hidden; margin: 0px; width: auto; height: 18px;">
               <div style="height: 18px; width: 150px; overflow: hidden; float: left; padding-left: 0px; padding-top: 0px;">
               <div style="float: left; margin-left: 0px;"><div class="v-csslayout"><div class="v-csslayout-margin">
               <div class="v-csslayout-container"><div class="v-label">
               	到期日：<fmt:formatDate value="${task.dueDate}" pattern="yyyy-MM-dd"/></div></div></div></div></div></div>
               <div style="height: 18px; width: 100px; overflow: hidden; float: left; padding-left: 6px; padding-top: 0px;">
               <div style="float: left; margin-left: 0px;"><div class="v-csslayout"><div class="v-csslayout-margin">
               <div class="v-csslayout-container"><div class="v-label">级别:${task.priority}</div></div></div></div></div>
               </div><div style="height: 18px; width: auto; overflow: hidden; float: left; padding-left: 6px; padding-top: 0px;"><div style="float: left; margin-left: 0px;">
               <div class="v-label v-label-task-create-time task-create-time v-label-undef-w">
               	创建于 <fmt:formatDate value="${task.createTime}" pattern="yyyy-MM-dd HH:mm:ss"/></div></div>
               </div><div style="width: 0px; height: 0px; clear: both; overflow: hidden;"></div></div>
               </div></div></div><div style="height: 27px; overflow: hidden; padding-left: 0px; padding-top: 0px; position: absolute; left: 61px; top: 0px; width: 862px;"><div style="float: left; margin-left: 0px;">
               <div class="v-label v-label-h2 h2">${task.name}</div></div></div></div></div></div>
           	</div>
           	<hr>
           	<div style="padding: 20px;">
               ${task.description}
           	</div>
            
        </div>
        <div style="height: 10px;"></div>
        <div class="easyui-panel" title="参与人" style="height:100px;" data-options="collapsible:true">   
        
        </div>
        <div style="height: 10px;"></div>
        <div class="easyui-panel" title="子任务" style="height:100px;" data-options="collapsible:true,collapsed:true">   
        
        </div>
        <div style="height: 10px;"></div>
        <div class="easyui-panel" title="相关内容" style="height:200px;" data-options="collapsible:true,collapsed:true">   
        
        </div>
        <div style="height: 20px;padding-top: 20px;padding-left: 0px;">
            <a href="#" class="easyui-linkbutton" iconcls="icon-ok" onclick="moWfTaskTodoTaskDetail.completeTask();">完成任务</a>
        </div>
        
        <br><br>
        
<!--         <iframe src="http://localhost:9081/activiti-explorer/diagram-viewer/index.html?processDefinitionId=sino-mo-wf-qjsq:5:576&processInstanceId=701" frameborder="0" style="border:0;width:100%;height:300px;"></iframe> -->
        
        
    </div>
</div>
