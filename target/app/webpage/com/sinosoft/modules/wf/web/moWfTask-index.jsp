<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@include file="/context/mytags.jsp"%>
<sino:plugins type="jquery,easyui,tools,zui-1.5.0,util"/>
<script src = "webpage/com/sinosoft/modules/wf/web/moWfTask-index.js"></script>		
<script type="text/javascript">
$(function(){
	moWfTaskIndex.initAll();
});
</script>

<div class="easyui-layout" fit="true">
    <div data-options="region:'center',border:false" style="padding: 0px;" class="mo_de_wf_bg1">
    	
    	
    	
  
  
  
  <div class="scrollbar-hover" style="max-height: 300px; overflow: scroll;">
    		<button class="btn btn-primary" type="button">主要按钮</button>
				<a class="btn btn-primary" href="your/url/">主要按钮</a>
		    	
		    	<span class="label">标签</span>
		    	
		    	<button class="btn">列表 <span class="label label-badge">12</span></button>
		    	
		    	
		    	<input type="text" class="form-control" placeholder="用户名">
		    	
		    	
		    	<select class="form-control">
				  <option value="">请选择一种水果</option>
				  <option value="apple">苹果</option>
				  <option value="banana">香蕉</option>
				  <option value="orange">桔子</option>
				</select>
    			
    			<img src="http://zui.sexy/docs/img/img1.jpg" width="200px" height="200px" class="img-rounded" alt="圆角图片">
    	
		    	<hr>
		    	<img src="http://zui.sexy/docs/img/img2.jpg" width="200px" height="200px" class="img-circle" alt="圆形图片">
		</div>
    	
    	<div class="scrollbar-hover" style="max-height: 300px; overflow: scroll;">
    	
			    	<div class="alert with-icon">
			    <i class="icon-inbox"></i>
			    <div class="content">
			      <h4>你好</h4>
			      <hr>
			      <p>有一些内容你可能需要知道。</p>
			    </div>
			  </div>
			  <div class="alert alert-success with-icon">
			    <i class="icon-ok-sign"></i>
			    <div class="content">
			      <h4>太好了!</h4>
			      <hr>
			      <strong>一切已准备就绪。</strong>
			    </div>
			  </div>
			  <div class="alert alert-primary with-icon">
			    <i class="icon-star"></i>
			    <div class="content">
			      <h4>Hello</h4>
			      <hr>
			      <p>World.</p>
			    </div>
			  </div>
			  <div class="alert alert-info with-icon">
			    <i class="icon-info-sign"></i>
			    <div class="content"><strong>Hi!</strong> 这条消息可能需要你注意。</div>
			  </div>
			  <div class="alert alert-warning with-icon">
			    <i class="icon-frown"></i>
			    <div class="content"><strong>注意!</strong> 看起来遇到一些问题。</div>
			  </div>
			  <div class="alert alert-danger with-icon">
			    <i class="icon-remove-sign"></i>
			    <div class="content">
			      <h4>不好了!</h4>
			      <p>确实遇到了问题，请立即处理吧。</p>
			    </div>
			  </div>
    	</div>
    	
    	
    	<div class="input-group">
		  <span class="input-group-addon">@</span>
		  <input type="text" class="form-control" placeholder="用户名">
		  <span class="input-group-addon"><i class="icon icon-heart"></i></span>
		</div>
    	
    	
    	<div class="list-group">
		  <a href="#" class="list-group-item">用div >项目</a>
		  <a href="#" class="list-group-item">待办</a>
		  <a href="#" class="list-group-item">需求</a>
		  <a href="#" class="list-group-item active">任务</a>
		  <a href="#" class="list-group-item">Bug</a>
		  <a href="#" class="list-group-item">用例</a>
		</div>
    	
    	<ul class="nav nav-primary">
		  <li class="active"><a href="your/nice/url">首页</a></li>
		  <li><a href="your/nice/url">动态 <span class="label label-badge label-success">4</span></a></li>
		  <li><a href="your/nice/url">项目 </a></li>
		  <li>
		    <a class="dropdown-toggle" data-toggle="dropdown" href="your/nice/url">更多 <span class="caret"></span></a>
		    <ul class="dropdown-menu">
		      <li><a href="your/nice/url">任务</a></li>
		      <li><a href="your/nice/url">bug</a></li>
		      <li><a href="your/nice/url">需求</a></li>
		      <li><a href="your/nice/url">用例</a></li>
		    </ul>
		  </li>
		</ul>
    	
    	
    	
    	<ul class="pager">
  <li class="previous"><a href="your/nice/url">«</a></li>
  <li><a href="your/nice/url">1</a></li>
  <li class="active"><a href="your/nice/url">2</a></li>
  <li><a href="your/nice/url">3</a></li>
  <li><a href="your/nice/url">4</a></li>
  <li><a href="your/nice/url">5</a></li>
  <li class="next"><a href="your/nice/url">»</a></li>
</ul>
    	
    	
    	
    	<div class="panel panel-primary">
    <div class="panel-heading" contenteditable="">.panel-primary</div>
    <div class="panel-body" contenteditable="">面板内容</div>
  </div>
  <div class="panel panel-success">
    <div class="panel-heading" contenteditable="">.panel-success</div>
    <div class="panel-body" contenteditable="">面板内容</div>
  </div>
  <div class="panel panel-warning">
    <div class="panel-heading" contenteditable="">.panel-warning</div>
    <div class="panel-body" contenteditable="">面板内容</div>
  </div>
  <div class="panel panel-danger">
    <div class="panel-heading" contenteditable="">.panel-danger</div>
    <div class="panel-body" contenteditable="">面板内容</div>
  </div>
  <div class="panel panel-info">
    <div class="panel-heading" contenteditable="">.panel-info</div>
    <div class="panel-body" contenteditable="">面板内容</div>
  </div>
		    	
    	
    	
    	
    	
    	<div class="panel-group" id="accordionPanels" aria-multiselectable="true">
  <div class="panel panel-default">
    <div class="panel-heading" id="headingOne">
      <h4 class="panel-title">
        <a data-toggle="collapse" data-parent="#accordionPanels" href="#collapseOne">
          折叠面板 1
        </a>
      </h4>
    </div>
    <div id="collapseOne" class="panel-collapse collapse in">
      <div class="panel-body">折叠面板内容 1</div>
    </div>
  </div>
  <div class="panel panel-default">
    <div class="panel-heading" id="headingTwo">
      <h4 class="panel-title">
        <a class="collapsed" data-toggle="collapse" data-parent="#accordionPanels" href="#collapseTwo">
          折叠面板 2
        </a>
      </h4>
    </div>
    <div id="collapseTwo" class="panel-collapse collapse">
      <div class="panel-body">折叠面板内容 2</div>
    </div>
  </div>
  <div class="panel panel-default">
    <div class="panel-heading" id="headingThree">
      <h4 class="panel-title">
        <a class="collapsed" data-toggle="collapse" data-parent="#accordionPanels" href="#collapseThree">
          折叠面板 3
        </a>
      </h4>
    </div>
    <div id="collapseThree" class="panel-collapse collapse">
      <div class="panel-body">折叠面板内容 3</div>
    </div>
  </div>
</div>
    	
    	
    	
    	<ul class="tree" data-ride="tree">
  <li>
    <a href="#">水果</a>
    <ul>
      <li><a href="#">苹果</a></li>
      <li>
        <a href="#">热带水果</a>
        <ul>
        </ul>
      </li>
      <li><a href="#">梨子</a></li>
    </ul>
  </li>
  <li><a href="#">粥饭</a></li>
</ul>
    	
    	
    	
    	<form>
  <div class="form-group">
    <label for="exampleInputAccount1">账号</label>
    <input type="text" class="form-control" id="exampleInputAccount1" placeholder="电子邮件/手机号/用户名">
  </div>
  <div class="form-group">
    <label for="exampleInputPassword1">密码</label>
    <input type="password" class="form-control" id="exampleInputPassword1" placeholder="">
  </div>
  <div class="form-group">
    <label for="exampleInputMoney1">捐赠金额</label>
    <div class="input-group">
      <span class="input-group-addon">￥</span>
      <input type="number" class="form-control" id="exampleInputMoney1" placeholder="最低捐赠金额为 ￥10.00">
      <span class="input-group-addon">.00</span>
    </div>
  </div>
  <button type="submit" class="btn btn-primary">提交</button>
<form>
    	
    	
    	
    	
    	
    	<div style="width: 300px;">
    		<a class="card" href="###">
    <img src="http://zui.sexy/docs/img/img2.jpg" alt="">
    <div class="card-heading"><strong>良辰美景</strong></div>
    <div class="card-content text-muted">良辰美景奈何天，赏心乐事谁家院。</div>
    <div class="card-actions">
      <button type="button" class="btn btn-danger"><i class="icon-heart"></i> 喜欢</button>
      <div class="pull-right text-danger"><i class="icon-heart-empty"></i> 520 人喜欢</div>
    </div>
  </a>
    	</div>
    	
    	
  
  
  <div class="margin-zero example">
  <div class="boards" id="myBoard">
    <div class="board panel panel-primary" data-id="board1">
      <div class="panel-heading">
        <strong>未完成</strong>
      </div>
      <div class="panel-body">
        <div class="board-list">
          <div class="board-item board-item-shadow" style="height: 34px;"></div><div class="board-item" data-id="board2">测试</div>
          <div class="board-item" data-id="board3">发布</div>
          <div class="board-item" data-id="board4">庆祝</div>
          <div class="disable-drop board-item">不可拖拽</div>
        <div class="board-item board-item-empty"><i class="icon-plus"></i> 移动到末尾</div></div>
      </div>
    </div>
    <div class="board panel panel-warning" data-id="board5">
      <div class="panel-heading">
        <strong>进行中</strong>
      </div>
      <div class="panel-body">
        <div class="board-list">
          <div class="board-item" data-id="board6">设计界面</div>
          <div class="board-item" data-id="board7">撰写文档</div>
          <div class="board-item" data-id="board8">紧急的任务</div>
        <div class="board-item board-item-empty"><i class="icon-plus"></i> 移动到末尾</div><div class="board-item board-item-shadow" style="height: 34px;"></div></div>
      </div>
    </div>
    <div class="board panel panel-success" data-id="board9">
      <div class="panel-heading">
        <strong>已完成</strong>
      </div>
      <div class="panel-body">
        <div class="board-list">
          <div class="board-item" data-id="board10">初步设计</div>
          <div class="board-item" data-id="board11">数据库设计</div>
          <div class="board-item" data-id="board12">需求整理</div>
        <div class="board-item board-item-empty"><i class="icon-plus"></i> 移动到末尾</div><div class="board-item board-item-shadow" style="height: 34px;"></div></div>
      </div>
    </div>
  </div>
</div>
  
  
  
  
  
    	
    	
    	
    	
    	
    	
    	
    	<br><br><br><br><br><br><br><br>
    	
    	
    	
    	
    	
    	
    	
    	
    	
    	
    	
    	
    	<div onclick="moWfApplyApply.addClick();" style="display:none;border: 1px solid #95B8E7;margin: 5px;float: left;cursor:pointer;" onmouseover="$(this).css({'background-color':'F2F2F2'})" onmouseout="$(this).css({'background-color':'#ffffff'})">
			<table>
				<tr><td align="center" valign="middle"><img src="webpage/com/sinosoft/modules/wf/ui/images/task-50.png" width="65px" height="65px"></td></tr>
				<tr><td align="center" valign="middle"><span>添加</span></td></tr>
			</table>
		</div>
		
		
		
		
		
		
		
		
		
		
    </div>
</div>
