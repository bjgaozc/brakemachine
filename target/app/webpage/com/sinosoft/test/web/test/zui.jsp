<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@include file="/context/tags.jsp"%>
<app:template title="我的应用" type="zui">
<div style="margin: 30px;">


<button class="btn btn-lg" type="button">大尺寸按钮</button>
<button class="btn btn-primary" type="button">主要按钮</button>
<a class="btn btn-primary" href="#" onclick="bootbox.alert({message:'测试提示',size:'small'});">主要按钮</a>
<button class="btn btn-info " type="button">信息</button>
<button class="btn btn-success " type="button">成功</button>
<button class="btn btn-warning " type="button">警告</button>
<button class="btn btn-danger " type="button">危险</button>
<button class="btn" type="button">标准按钮</button>
<button class="btn btn-link" type="button">链接按钮</button>
<div class="btn-group">
  <button class="btn">按钮组</button>
  <button class="btn">第二个</button>
  <button class="btn">第三个</button>
</div>
<button class="btn btn-sm " type="button">较小的按钮</button>
<button class="btn btn-mini " type="button">迷你按钮</button>
<button class="btn " type="button"><i class="icon icon-star"></i> 带图标的按钮</button>
<button data-toggle="button" class="btn " type="button">状态切换按钮</button>

<div class="btn-group" data-toggle="buttons">
  <label class="btn btn-primary active">
    <input type="radio" name="options" id="option1" checked> 单选1
  </label>
  <label class="btn btn-primary">
    <input type="radio" name="options" id="option2"> 单选2
  </label>
  <label class="btn btn-primary">
    <input type="radio" name="options" id="option3"> 单选3
  </label>
</div>

<br>
<button class="btn btn-block " type="button">块状按钮</button>

<hr>

<span class="label">Default</span>
<span class="label label-primary">Primary</span>
<span class="label label-success">Success</span>
<span class="label label-info">Info</span>
<span class="label label-warning">Warning</span>
<span class="label label-danger">Danger</span>
<span class="label label-badge">Default</span>
<span class="label label-badge label-primary">Primary</span>
<span class="label label-badge label-success">Success</span>
<span class="label label-badge label-info">Info</span>
<span class="label label-badge label-warning">Warning</span>
<span class="label label-badge label-danger">Danger</span>
<span class="label label-dot">Default</span>
<span class="label label-dot label-primary">Primary</span>
<span class="label label-dot label-success">Success</span>
<span class="label label-dot label-info">Info</span>
<span class="label label-dot label-warning">Warning</span>
<span class="label label-dot label-danger">Danger</span>

<div class="example">
  <button class="btn">我的消息 <span class="label label-badge">12</span></button>
  <button class="btn">处理错误 <span class="label label-badge label-primary">12</span></button> <button class="btn">处理错误
  <span class="label label-badge label-success">12</span></button>
  <button class="btn">处理错误 <span class="label label-badge label-info">12</span></button> <button class="btn">处理错误
  <span class="label label-badge label-warning">12</span></button>
  <button class="btn">处理错误 <span class="label label-badge label-danger">12</span></button>
  <br>
  <br>
  <button class="btn btn-primary">联系人 <span class="label label-badge">12</span></button> <button class="btn btn-success">联系人
  <span class="label label-badge">12</span></button> <button class="btn btn-info">联系人 <span class="label label-badge">12</span></button>
  <button class="btn btn-warning">联系人 <span class="label label-badge">12</span></button> <button class="btn btn-danger">联系人
  <span class="label label-badge">12</span></button>
  <br>
  <br>
  <button class="btn">列表 <span class="label label-dot">12</span></button>
  <button class="btn">处理错误 <span class="label label-dot label-primary">12</span></button> <button class="btn">处理错误
  <span class="label label-dot label-success">12</span></button> <button class="btn">处理错误 <span class="label label-dot label-info">12</span></button>
  <button class="btn">处理错误 <span class="label label-dot label-warning">12</span></button> <button class="btn">处理错误
  <span class="label label-dot label-danger">12</span></button>
  <br>
  <br>
  <button class="btn btn-primary">联系人 <span class="label label-dot">12</span></button> <button class="btn btn-success">联系人
  <span class="label label-dot">12</span></button> <button class="btn btn-info">联系人 <span class="label label-dot">12</span></button>
  <button class="btn btn-warning">联系人 <span class="label label-dot">12</span></button> <button class="btn btn-danger">联系人
  <span class="label label-dot">12</span></button>
</div>


<hr>
<div class="row">
  <div class="col-sm-4">
    <div style="border: 1px solid #ddd; padding: 10px">
      <div class="switch">
        <input type="checkbox">
        <label>夜间模式</label>
      </div>
    </div>
  </div>
  
  <div class="col-sm-4">
    <div style="border: 1px solid #ddd; padding: 10px">
      <div class="switch">
        <input type="checkbox">
        <label>是否开启</label>
      </div>
    </div>
  </div>
</div>

<hr>
<div class="example">
  <div class="row">
    <div class="col-xs-6 col-sm-4 col-md-3"><a href="plug-in/sino/ui/sino02/assets/images/gallery/image-6.jpg" data-group="example-3" data-toggle="lightbox" data-caption="img1.jpg" data-lightbox-group="example-3" data-group-index="0"><img src="plug-in/sino/ui/sino02/assets/images/gallery/image-6.jpg" class="img-rounded" alt=""></a></div>
    <div class="col-xs-6 col-sm-4 col-md-3"><a href="plug-in/sino/ui/sino02/assets/images/gallery/image-2.jpg" data-group="example-3" data-toggle="lightbox" data-caption="img2.jpg" data-lightbox-group="example-3" data-group-index="1"><img src="plug-in/sino/ui/sino02/assets/images/gallery/image-2.jpg" class="img-rounded" alt=""></a></div>
    <div class="col-xs-6 col-sm-4 col-md-3"><a href="plug-in/sino/ui/sino02/assets/images/gallery/image-3.jpg" data-group="example-3" data-toggle="lightbox" data-lightbox-group="example-3" data-group-index="2"><img src="plug-in/sino/ui/sino02/assets/images/gallery/image-3.jpg" class="img-rounded" alt=""></a></div>
    <div class="col-xs-6 col-sm-4 col-md-3"><a href="plug-in/sino/ui/sino02/assets/images/gallery/image-4.jpg" data-group="example-3" data-toggle="lightbox" data-caption="最后一张" data-lightbox-group="example-3" data-group-index="3"><img src="plug-in/sino/ui/sino02/assets/images/gallery/image-4.jpg" class="img-rounded" alt=""></a></div>
  </div>
</div>

<hr>
<div class="row">
  <div class="col-sm-4">
    <div style="border: 1px solid #ddd; padding: 10px">
      <img src="plug-in/login/images/login_image/login-content-left-bg.png" width="200px" height="200px" class="img-circle" alt="圆形图片">
    </div>
  </div>
  <div class="col-sm-4">
    <div style="border: 1px solid #ddd; padding: 10px">
      <img src="plug-in/login/images/login_image/login-content-left-bg.png" width="200px" height="200px" class="img-responsive" alt="响应式图片测试">
    </div>
  </div>
</div>



<hr>
<div class="example">
  <div class="alert">
    <h4>你好</h4>
    <hr>
    <p>有一些内容你可能需要知道。</p>
  </div>
  <div class="alert alert-primary">
    <h4>Hello</h4>
    <hr>
    <p>World.</p>
  </div>
  <div class="alert alert-success">
    <h4>太好了!</h4>
    <hr>
    <strong>一切已准备就绪。</strong>
  </div>
  <div class="alert alert-info">
    <strong>Hi!</strong> 这条消息可能需要你注意。
  </div>
  <div class="alert alert-warning">
    <strong>注意!</strong> 看起来遇到一些问题。
  </div>
  <div class="alert alert-danger">
    <h4>不好了!</h4>
    <p>确实遇到了问题，请立即处理吧。</p>
  </div>
</div>



<hr>
<div class="input-group">
  <span class="input-group-addon">姓名</span>
  <input type="text" class="form-control" placeholder="姓氏">
  <span class="input-group-addon fix-border fix-padding"></span>
  <input type="text" class="form-control" placeholder="名字">
</div>
<div class="input-group">
  <input type="text" class="form-control">
  <span class="input-group-btn">
    <button class="btn btn-default" type="button">搜索</button>
  </span>
</div>

<hr>
<div class="list-group">
  <a href="#" class="list-group-item">用div >项目</a>
  <a href="#" class="list-group-item">待办</a>
  <a href="#" class="list-group-item">需求</a>
  <a href="#" class="list-group-item active">任务</a>
  <a href="#" class="list-group-item">Bug</a>
  <a href="#" class="list-group-item">用例</a>
</div>

<hr>
<ul class="nav nav-primary nav-justified">
  <li class="active"><a href="#">首页</a></li>
  <li><a href="#">动态 <span class="label label-badge label-success">4</span></a></li>
  <li><a href="#">项目 </a></li>
  <li>
    <a class="dropdown-toggle" data-toggle="dropdown" href="your/nice/url">更多 <span class="caret"></span></a>
    <ul class="dropdown-menu">
      <li><a href="#">任务</a></li>
      <li><a href="#">bug</a></li>
      <li><a href="#">需求</a></li>
      <li><a href="#">用例</a></li>
    </ul>
  </li>
</ul>

<hr>
<nav class="menu" data-ride="menu" style="width: 200px">
  <button class="btn btn-primary"><i class="icon icon-edit"></i> CREATE</button>
  <button class="btn"><i class="icon icon-cloud-upload"></i> UPLOAD</button>
  <ul class="nav nav-primary">
    <li><a href="javascript:;"><i class="icon icon-th"></i> Dashboard</a></li>
    <li><a href="javascript:;"><i class="icon icon-user"></i> Me</a></li>
    <li class="nav-parent">
      <a href="javascript:;"><i class="icon icon-time"></i> Time</a>
      <ul class="nav">
        <li><a href="javascript:;">Today</a></li>
        <li><a href="javascript:;">Tomarrow</a></li>
        <li><a href="javascript:;">Yestorday</a></li>
        <li><a href="javascript:;">This Week</a></li>
      </ul>
    </li>
    <li><a href="javascript:;"><i class="icon icon-trash"></i> Trash</a></li>
    <li><a href="javascript:;"><i class="icon icon-list-ul"></i> All</a></li>
    <li class="active show nav-parent">
      <a href="javascript:;"><i class="icon icon-tasks"></i> Status</a>
      <ul class="nav">
        <li><a href="javascript:;"><i class="icon icon-circle-blank"></i> Ready</a></li>
        <li class="active"><a href="javascript:;"><i class="icon icon-play-sign"></i> Ongoing</a></li>
        <li><a href="javascript:;"><i class="icon icon-ok-sign"></i> Completed</a></li>
      </ul>
    </li>
  </ul>
</nav>

<hr>
<div class="example">
  <ul class="pager">
    <li class="previous"><a href="#">«</a></li>
    <li class="next"><a href="#">»</a></li>
  </ul>
  <ul class="pager">
    <li class="previous"><a href="#">« 上一页</a></li>
    <li class="next"><a href="#">下一页 »</a></li>
  </ul>
  <ul class="pager">
    <li class="previous"><a href="#">«</a></li>
    <li><a href="#">1</a></li>
    <li class="active"><a href="#">2</a></li>
    <li><a href="#">3</a></li>
    <li><a href="#">4</a></li>
    <li><a href="#">5</a></li>
    <li class="next"><a href="#">»</a></li>
  </ul>
  <ul class="pager">
    <li class="previous"><a href="#">«</a></li>
    <li><a href="#">1</a></li>
    <li><a href="#">2</a></li>
    <li><a href="#">3</a></li>
    <li><a href="#">4</a></li>
    <li class="active"><a href="#">5</a></li>
    <li><a href="###" data-toggle="pager" data-placement="bottom">更多</a></li>
    <li><a href="#">12</a></li>
    <li class="next"><a href="#">»</a></li>
  </ul>
  <ul class="pager">
    <li class="previous"><a href="#">« 上一页</a></li>
    <li><a href="#">1</a></li>
    <li><a href="###" data-toggle="pager" data-placement="top" data-url="?page=%">Pager</a></li>
    <li><a href="#">6</a></li>
    <li class="active"><a href="#">7</a></li>
    <li><a href="#">8</a></li>
    <li><a href="#">9</a></li>
    <li><a href="###" data-toggle="pager" data-placement="top">...</a></li>
    <li><a href="#">12</a></li>
    <li class="next"><a href="#">下一页 »</a></li>
  </ul>
</div>

<hr>
<div class="example">
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
</div>


<hr>
<!-- 对话框触发按钮 -->
<button type="button" class="btn btn-lg btn-primary" data-toggle="modal" data-target="#myModal">启动对话框</button>
<button type="button" class="btn" data-position="fit" data-toggle="modal" data-target="#myModal">默认位置</button>
<button type="button" class="btn" data-position="center" data-toggle="modal" data-target="#myModal">窗口中间</button>
<button type="button" class="btn" data-position="0" data-toggle="modal" data-target="#myModal">靠近上方</button>
<button type="button" class="btn" data-position="100px" data-toggle="modal" data-target="#myModal">距离上方100px</button>
<button type="button" class="btn btn-primary" data-moveable="true" data-remember-pos="rememberMoveableModal" data-toggle="modal" data-target="#myModal"><i class="icon icon-move"></i> 打开我 拖动我</button>


<div class="modal modal-for-page fade in" id="myModal" aria-hidden="false" style="display:none;">
  <div class="modal-dialog" style="margin-top: 150.667px;">
    <div class="modal-content">
      <div class="modal-header">
        <button type="button" class="close" data-dismiss="modal"><span aria-hidden="true">×</span><span class="sr-only">关闭</span></button>
        <h4 class="modal-title">对话框标题</h4>
      </div>
      <div class="modal-body">
        <h4>虞美人·春花秋月何时了 <small>五代·李煜</small></h4>
        <p>春花秋月何时了？往事知多少。小楼昨夜又东风，故国不堪回首月明中。<br>雕栏玉砌应犹在，只是朱颜改。问君能有几多愁？恰似一江春水向东流</p>
      </div>
      <div class="modal-footer">
        <button type="button" class="btn btn-default" data-dismiss="modal">取消</button>
        <button type="button" class="btn btn-primary">确定</button>
      </div>
    </div>
  </div>
</div>

<hr>
<div class="example">
  <div class="messager messager-example messager-success" data-type="success" data-actions="{&quot;cancel&quot;: {&quot;icon&quot;: &quot;undo&quot;, &quot;text&quot;: &quot;撤销&quot;}}"><div class="messager-content"><i class="icon-ok-sign"></i> 你的邮件已成功发送。</div><div class="messager-actions"><button type="button" class="action action-cancel"><i class="icon-undo"></i> 撤销</button><button type="button" class="close action">×</button></div></div>
</div>

<style>
.messager-example {
    position: relative;
    margin-bottom: 10px;
    cursor: pointer;
}
</style>
<script>
$(function(){
	afterPageLoad();
});
function afterPageLoad() {
    $('.show-messager').on('click', function() {
        var $this = $(this);
        var data = $this.data('zui.messager');
        if(data) {
            data.show(new Date());
        }
        else {
            var options = $this.data();
            if(typeof options.actions === 'string') options.actions = $.parseJSON(options.actions);
            $this.data('zui.messager', new $.zui.Messager(options.content, options).show());
        }
    });

    $('.messager-example').click(function() {
        var $this = $(this);
        options = $this.data();
        if(typeof options.actions === 'string') options.actions = $.parseJSON(options.actions);
        new $.zui.Messager($this.find('.messager-content').html(), options).show();
    });
}
</script>


<hr>
<link href="plug-in-ui/zui/dist/lib/calendar/zui.calendar.min.css" rel="stylesheet">
<script src="plug-in-ui/zui/dist/lib/calendar/zui.calendar.min.js"></script>
<div id="calendar" class="calendar"></div>
<script>
$(function(){
	$('#calendar').calendar();
});
</script>


<hr>
<div class="row">
<div class="col-sm-2">
<div class="example-cards example">
  <a class="card" href="###">
    <img src="plug-in/login/images/login_image/login-content-left-bg.png" alt="" width="300">
    <div class="card-heading"><strong>良辰美景</strong></div>
    <div class="card-content text-muted">良辰美景奈何天，赏心乐事谁家院。</div>
    <div class="card-actions">
      <span class="label label-warning">牡丹亭</span>
      <div class="pull-right"><i class="icon-comments-alt"></i> 520</div>
    </div>
  </a>
</div>
</div>
</div>


<hr>
<link href="plug-in-ui/zui/dist/lib/treemap/zui.treemap.min.css" rel="stylesheet">
<script src="plug-in-ui/zui/dist/lib/treemap/zui.treemap.min.js"></script>
<div id="treemapExample1"></div>
<script>
$(function(){
	$('#treemapExample1').treemap({
	    data: {
	        text: '蔬菜',
	        children: [{
	            html: '<i class="icon icon-heart text-danger"></i> 我的菜',
	            children: [{
	                textColor: 'green',
	                text: '青菜'
	            }, {
	                html: '<span class="text-info">菠菜</span>'
	            }]
	        }, {
	            text: '你的瓜',
	            style: {border: '1px solid green'},
	            collapsed: true,
	            tooltip: '点击展开或折叠',
	            children: ['南瓜', '西瓜', '丝瓜', '苦瓜']
	        }, {
	            text: '甘蓝',
	            children: ['大甘蓝']
	        }, {
	            color: 'orange',
	            textColor: 'white',
	            text: '土豆'
	        }]
	    }
	});
});
</script>


<hr>
<link href="plug-in-ui/zui/dist/lib/board/zui.board.min.css" rel="stylesheet">
<script src="plug-in-ui/zui/dist/lib/board/zui.board.min.js"></script>
<div class="boards" id="myBoards">
  <!-- .board 为单个容器 -->
  <div class="board panel panel-primary">
    <div class="panel-heading">
      <strong>未完成</strong>
    </div>
    <div class="panel-body">
      <div class="board-list">
        <!-- 使用 .board-item 来标识可以操作的条目 -->
        <div class="board-item">测试</div>
        <div class="board-item">发布</div>
        <div class="board-item">庆祝</div>
        <!-- 为 .board-item 添加 .disabled-dorp 类来禁止移动此条目 -->
        <div class="disable-drop board-item">不可拖拽</div>
      </div>
    </div>
  </div>
  <div class="board panel panel-warning">
    <div class="panel-heading">
      <strong>进行中</strong>
    </div>
    <div class="panel-body">
      <div class="board-list">
        <div class="board-item">设计界面</div>
        <div class="board-item">撰写文档</div>
        <div class="board-item">紧急的任务</div>
      </div>
    </div>
  </div>
  <div class="board panel panel-success">
    <div class="panel-heading">
      <strong>已完成</strong>
    </div>
    <div class="panel-body">
      <div class="board-list">
        <div class="board-item">初步设计</div>
        <div class="board-item">数据库设计</div>
        <div class="board-item">需求整理</div>
      </div>
    </div>
  </div>
</div>
<script>
$(function(){
	$('#myBoards').boards({
	    drop: function(e){
	        $.zui.messager.show(e.element.text() + " 拖放到 " + e.target.closest('.board').find('.panel-heading').text());
	    }
	});
});
</script>


<hr>
<link href="plug-in-ui/zui/dist/lib/dashboard/zui.dashboard.min.css" rel="stylesheet">
<script src="plug-in-ui/zui/dist/lib/dashboard/zui.dashboard.min.js"></script>
<div id="dashboard" class="dashboard dashboard-draggable" data-height="300">
  <section class="row">
    <div class="col-md-4 col-sm-6">
      <div class="panel" data-id="1">
        <div class="panel-heading">
          <i class="icon icon-list"></i>
          <span class="title">面板标题</span>
        </div>
        <div class="panel-body">
          <p>面板内容。</p>
        </div>
      </div>
    </div>
    <div class="col-md-4 col-sm-6">
      <div class="panel" data-id="2">
        <div class="panel-heading">
          <i class="icon icon-list"></i>
          <span class="title">包含列表组</span>
        </div>
        <div class="panel-body no-padding">
          <div class="list-group">
            ...
          </div>
        </div>
      </div>
    </div>
    <div class="col-md-4 col-sm-6">
      <div class="panel" data-id="3">
        <div class="panel-heading">
          <i class="icon icon-table"></i>
          <span class="title">包含表格</span>
        </div>
        <div class="panel-body no-padding">
          <table class="table">
            ...
          </table>
        </div>
      </div>
    </div>
    <div class="col-md-6">
      <div class="panel" data-id="4">
        <div class="panel-heading">
          <i class="icon icon-bolt"></i>
          <span class="title">包含操作按钮</span>
          <div class="panel-actions">
            <a href="###" data-toggle="tooltip" title="编辑"><i class="icon-pencil"></i></a>
            <button type="button" class="btn" data-toggle="tooltip" title="收藏"><i class="icon-heart-empty"></i></button>
            <div class="dropdown" data-toggle="tooltip" title="更多操作">
              <button class="btn" data-toggle="dropdown" type="button"><i class="icon icon-ellipsis-v"></i></button>
              <ul class="dropdown-menu pull-right">
                <li><a href="###"><i class="icon icon-ok"></i> 确认</a></li>
                <li><a href="###"><i class="icon icon-thumbs-o-up"></i> 自定义操作</a></li>
              </ul>
            </div>
          </div>
        </div>
        <div class="panel-body">
          <p>在面板头部（<code>.panel-heading</code>）包含链接和按钮来自定义操作。</p>
        </div>
      </div>
    </div>
    <div class="col-md-6">
      <div class="panel" data-id="5" data-url="baseCommonController.do?go&p=test/page1" data-height="600">
        <div class="panel-heading">
          <i class="icon icon-globe"></i>
          <span class="title">加载远程内容</span>
          <div class="panel-actions">
            <button type="button" class="btn refresh-panel" data-toggle="tooltip" title="重新从远程获取内容"><i class="icon-refresh"></i></button>
          </div>
        </div>
        <div class="panel-body">等待加载远程内容。</div>
      </div>
    </div>
    <div class="col-md-4 col-sm-6">
      <div class="panel" data-id="6">
        <div class="panel-heading">
          <div class="title">可移除的面板</div>
          <div class="panel-actions">
            <button type="button" class="btn remove-panel" data-toggle="tooltip" title="移除面板"><i class="icon-remove"></i></button>
          </div>
        </div>
        <div class="panel-body">
          <p>点击顶部右侧的 <i class="icon icon-remove"></i> 按钮来移除该面板。</p>
        </div>
      </div>
    </div>
    <div class="col-md-8 col-sm-6">
      <div class="panel panel-loading" data-id="6">
        <div class="panel-heading"><code>.panel-loading</code></div>
        <div class="panel-body">
          <p>为 <code>.panel</code> 添加 <code>.panel-loading</code> 类即可实现正在加载的外观。</p>
        </div>
      </div>
    </div>
  </section>
</div>
<script>
$(function(){
	$('#dashboard').dashboard({draggable: true});
});
</script>


























</div>
<br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br>
</app:template>