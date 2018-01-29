<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@include file="/context/tags.jsp"%>
<app:template title="我的应用" type="planeui">

<div class="pui-layout" style="width:96%;">

<h1 class="pui-normal">Hello World! <small>副标题文本</small></h1>
<h2 class="pui-normal">你好，世界！ <small>副标题文本</small></h2>
<h3 class="pui-normal">标题H3</h3>
<h4 class="pui-normal">标题H4</h4>
<h5 class="pui-normal">标题H5</h5>
<h6 class="pui-normal">标题H6</h6>


<hr>


<ul class="pui-menu pui-menu-bordered pui-menu-inline pui-menu-bordered-radius clear">
    <li>
        <a href="javascript:;" class="active">首页</a>
    </li>
    <li>
        <a href="javascript:;">产品特性 <span class="pui-arrow-down"></span></a>
    </li>
    <li>
        <a href="javascript:;">开发文档 <span class="pui-arrow-down"></span></a>
        <ul class="pui-menu pui-menu-dropdown" style="width:200%;">
            <li class="pui-menu-header">Header</li>
            <li>
                <a href="javascript:;" class="active" style="margin-left:-1px;">下拉菜单一</a>
            </li>
            <li>
                <a href="javascript:;">下拉菜单二<label class="pui-badge pui-badge-success">5</label></a>
            </li>
            <li>
                <a href="javascript:;">下拉菜单三XXX</a>
            </li>
            <li class="pui-menu-divider"></li> 
            <li>
                <a href="javascript:;" class="disabled">Downloads</a>
            </li>
            <li>
                <a href="javascript:;">下拉菜单四XXXXXX <label class="pui-badge pui-badge-warning pui-badge-circle">1</label></a>
            </li>
            <li>
                <a href="javascript:;">下拉菜单五</a>
            </li>
        </ul>
    </li>
    <li>
        <a href="javascript:;">交流社区</a>
    </li> 
    <li>
        <a href="javascript:;" style="width: 120px\9;">Downloads <span class="pui-badge pui-badge-warning">10</span></a>
        
    </li>
    <li>
        <span class="pui-badge pui-badge-info pui-badge-dot"></span>
        <a href="javascript:;">联系方式</a>
    </li>
</ul>

<hr>
<button type="button" class="pui-btn pui-btn-default pui-btn-large">
	下拉菜单按钮 <span class="arrow-down"></span>
</button>
<button type="button" class="pui-btn pui-btn-primary">
	下拉菜单按钮 <span class="arrow-down"></span>
</button>
<button class="pui-btn pui-btn-secondary">
           正常 <a href="javascript:;" class="pui-badge pui-badge-success pui-badge-circle">99</a>
</button>


<hr>
<form action="./php/post.php" method="post">
    <div class="pui-form-group">
        <label>请选择：</label>
        <pui-checkbox class="checked" name="option[]" value="选项一">选项一<input type="checkbox" name="option[]" value="选项一" checked="checked"></pui-checkbox>
        <pui-checkbox name="option[]" value="选项二">选项二<input type="checkbox" name="option[]" value="选项二"></pui-checkbox>
        <pui-checkbox name="option[]" value="选项三" disabled="">选项三<input type="checkbox" name="option[]" value="选项三" disabled="disabled"></pui-checkbox> 
    </div>
    <div class="pui-form-group">
        <label>请选择性别：</label>
        <pui-radio name="sex" value="男" class="checked">男<input type="radio" name="sex" value="男" checked="checked"></pui-radio>
        <pui-radio name="sex" value="女">女<input type="radio" name="sex" value="女"></pui-radio>
        <pui-radio name="sex" value="保密" disabled="">保密<input type="radio" name="sex" value="保密" disabled="disabled"></pui-radio>
    </div>
    <div class="pui-form-group">
        <input type="button" class="pui-btn pui-btn-default" checkbox-checked-all="option[]" value="复选框全选">
        <input type="button" class="pui-btn pui-btn-default" checkbox-cancel="option[]" value="复选框取消全选">
        <input type="button" class="pui-btn pui-btn-default" checkbox-inverse="option[]" value="复选框反选"> 
    </div>
    <div class="pui-form-group">
        <input type="submit" name="submit" class="pui-btn pui-btn-success" value="提交表单">
    </div>
</form>


<hr>
<div class="pui-card pui-card-image pui-card-radius pui-card-column">
    <div class="pui-card-left pui-bg-green pui-height-32rem">
        <h1>八月照相馆<small>韩国爱情电影</small></h1>
        <p><img src="plug-in/sino/ui/sino02/assets/images/gallery/image-6.jpg" class="pui-width-18rem"></p>
    </div>
    <div class="pui-card-box">
        <h1>《八月照相馆》<small>韩国爱情电影</small></h1>
        <p class="pui-text-indent">《八月照相馆》是由许秦豪执导，韩石圭、沈银河主演的爱情电影。影片讲述了一个发生在已经收到死亡宣告的男子温暖而美丽的故事。该片于1998年1月24日在韩国上映。影片获第34届韩国百想艺术大赏和第19届韩国青龙电影奖最佳电影奖。</p>
        <p class="pui-text-indent">《八月照相馆》的故事灵感来源于韩国已故歌手金光硕一张表情安详温暖的遗照，而该片的大多数主创人员都是出生在八月，所以片名叫做片名《八月照相馆》。</p>
        <p class="pui-text-right"><br><a href="#" class="pui-btn pui-btn-default pui-unbordered">详细 &gt;&gt;</a></p>
    </div>
</div>


<hr>
<article class="pui-notice pui-notice-icon pui-notice-icon-message">
    <i class="pui-close pui-close-circle"></i>
    <header class="pui-notice-head">
        <strong>通知标题</strong><small>副标题</small>
    </header>
    <div class="pui-notice-content pui-notice-content-scrollable"> 
        <p>
            You asked, Font Awesome delivers with 40 shiny new icons in version 4.2.
            Want to request new icons? <a href="../community/#requesting-new-icons">Here's how</a>. 
            Need vectors or want to use on the desktop? Check the <a href="../cheatsheet/">cheatsheet</a>.
          </p> 
        <p>
            You asked, Font Awesome delivers with 40 shiny new icons in version 4.2.
            Want to request new icons? <a href="../community/#requesting-new-icons">Here's how</a>. 
            Need vectors or want to use on the desktop? Check the <a href="../cheatsheet/">cheatsheet</a>.
          </p> 
        <p>
            You asked, Font Awesome delivers with 40 shiny new icons in version 4.2.
            Want to request new icons? <a href="../community/#requesting-new-icons">Here's how</a>. 
            Need vectors or want to use on the desktop? Check the <a href="../cheatsheet/">cheatsheet</a>.
          </p> 
        <p>
            You asked, Font Awesome delivers with 40 shiny new icons in version 4.2.
            Want to request new icons? <a href="../community/#requesting-new-icons">Here's how</a>. 
            Need vectors or want to use on the desktop? Check the <a href="../cheatsheet/">cheatsheet</a>.
          </p> 
    </div>
</article>

<article class="pui-notice pui-notice-icon pui-notice-icon-success">
    <i class="pui-close pui-close-circle"></i>
    <div class="pui-notice-content">
        <p>
            You asked, Font Awesome delivers with 40 shiny new icons in version 4.2.
            Want to request new icons? <a href="../community/#requesting-new-icons">Here's how</a>. 
            Need vectors or want to use on the desktop? Check the <a href="../cheatsheet/">cheatsheet</a>.
          </p> 
    </div>
</article>



<hr>
<div class="pui-timeline">
    <div class="pui-timeline-list">
        <div class="pui-timeline-divider pui-timeline-divider-line">2015年</div>
        <div class="pui-timeline-item pui-timeline-badge-date">
            <label class="pui-badge pui-badge-info">2015年01月</label>
            <div class="pui-timeline-item-context">
                                                               时间XXXXX dfdfdfdfdsfdfsfdsdfds
            </div>
        </div> 
        <div class="pui-timeline-divider pui-timeline-divider-line">2014年</div>
        <div class="pui-timeline-item pui-timeline-badge-date">
            <label class="pui-badge pui-badge-info">2014-12-05</label>
            <div class="pui-timeline-item-context">
                                                               时间XXXXX dfdfdfdfdsfdfsfdsdfds
            </div>
        </div> 
        <div class="pui-timeline-item pui-timeline-badge-datetime">
            <label class="pui-badge pui-badge-info">2014-12-05 12:12:15</label>
            <div class="pui-timeline-item-context">
               	 时间XXXXX dfdfdfdfdsfdfsfdsdfds
            </div>
        </div> 
        <div class="pui-timeline-item">
            <label class="pui-badge pui-badge-info">12月</label>
            <div class="pui-timeline-item-context">
                	时间XXXXX dfdfdfdfdsfdfsfdsdfds
            </div>
        </div> 
        <div class="pui-timeline-item">
            <label class="pui-badge pui-badge-success">18</label>
            <div class="pui-timeline-item-context">
                <div class="pui-tooltip pui-tooltip-bordered pui-tooltip-arrow-lt pui-tooltip-warning-light">
                   	 时间XXXXX dfdfdfdfdsfdfsfdsdfds
                </div>
            </div>
        </div> 
        <div class="pui-timeline-divider pui-timeline-divider-dashed-line">2013年</div>
        <div class="pui-timeline-item">
            <label class="pui-badge pui-badge-info pui-badge-dot"></label>
            <div class="pui-timeline-item-context">
                <div class="pui-tooltip pui-tooltip-bordered pui-tooltip-arrow-lt pui-tooltip-info-light">
                   	 时间XXXXX dfdfdfdfdsfdfsfdsdfds
                </div>
            </div>
        </div> 
    </div>
</div>















</div>


<br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br>
</app:template>