<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@include file="/context/tags.jsp"%>
<app:template type="wxs" title="首页" autoloadjs="true" >

<div class="weui-tab">
      <div class="weui-tab__bd">
        <div id="tab1" class="weui-tab__bd-item weui-tab__bd-item--active">
          
          	<div class="swiper-container" style="height: 200px;">
			  <div class="swiper-wrapper">
			    <div class="swiper-slide"><img src="//gqianniu.alicdn.com/bao/uploaded/i4//tfscom/i1/TB1n3rZHFXXXXX9XFXXXXXXXXXX_!!0-item_pic.jpg_320x320q60.jpg" alt=""></div>
			    <div class="swiper-slide"><img src="//gqianniu.alicdn.com/bao/uploaded/i4//tfscom/i4/TB10rkPGVXXXXXGapXXXXXXXXXX_!!0-item_pic.jpg_320x320q60.jpg" alt=""></div>
			    <div class="swiper-slide"><img src="//gqianniu.alicdn.com/bao/uploaded/i4//tfscom/i1/TB1kQI3HpXXXXbSXFXXXXXXXXXX_!!0-item_pic.jpg_320x320q60.jpg" alt=""></div>
			  </div>
		  	</div>
          
          <div class="weui-grids">
			  <a href="#" class="weui-grid js_grid">
			    <div class="weui-grid__icon">
			      <img src="${ctx}/plug-in/sino/ui/wxs/images/icon_nav_button.png" alt="">
			    </div>
			    <p class="weui-grid__label">按钮</p>
			  </a>
			  <a href="#" class="weui-grid js_grid">
			    <div class="weui-grid__icon">
			      <img src="${ctx}/plug-in/sino/ui/wxs/images/icon_nav_cell.png" alt="">
			    </div>
			    <p class="weui-grid__label">列表</p>
			  </a>
			  <a href="#" class="weui-grid js_grid">
			    <div class="weui-grid__icon">
			      <img src="${ctx}/plug-in/sino/ui/wxs/images/icon_nav_dialog.png" alt="">
			    </div>
			    <p class="weui-grid__label">窗口</p>
			  </a>
			  
			  <a href="#" class="weui-grid js_grid">
			    <div class="weui-grid__icon">
			      <img src="${ctx}/plug-in/sino/ui/wxs/images/icon_nav_button.png" alt="">
			    </div>
			    <p class="weui-grid__label">按钮</p>
			  </a>
			  <a href="#" class="weui-grid js_grid">
			    <div class="weui-grid__icon">
			      <img src="${ctx}/plug-in/sino/ui/wxs/images/icon_nav_cell.png" alt="">
			    </div>
			    <p class="weui-grid__label">列表</p>
			  </a>
			  <a href="#" class="weui-grid js_grid">
			    <div class="weui-grid__icon">
			      <img src="${ctx}/plug-in/sino/ui/wxs/images/icon_nav_dialog.png" alt="">
			    </div>
			    <p class="weui-grid__label">窗口</p>
			  </a>
			  
			  <a href="#" class="weui-grid js_grid">
			    <div class="weui-grid__icon">
			      <img src="${ctx}/plug-in/sino/ui/wxs/images/icon_nav_button.png" alt="">
			    </div>
			    <p class="weui-grid__label">按钮</p>
			  </a>
			  <a href="#" class="weui-grid js_grid">
			    <div class="weui-grid__icon">
			      <img src="${ctx}/plug-in/sino/ui/wxs/images/icon_nav_cell.png" alt="">
			    </div>
			    <p class="weui-grid__label">列表</p>
			  </a>
			  <a href="#" class="weui-grid js_grid">
			    <div class="weui-grid__icon">
			      <img src="${ctx}/plug-in/sino/ui/wxs/images/icon_nav_dialog.png" alt="">
			    </div>
			    <p class="weui-grid__label">窗口</p>
			  </a>
			  
			  
			</div>
          
        </div>
        <div id="tab2" class="weui-tab__bd-item">
          <h1>页面二</h1>
        </div>
        <div id="tab3" class="weui-tab__bd-item">
          <h1>页面三</h1>
        </div>
        <div id="tab4" class="weui-tab__bd-item">
          <h1>页面四</h1>
        </div>
      </div>

      <div class="weui-tabbar">
        <a href="#tab1" class="weui-tabbar__item weui-bar__item--on">
          <span class="weui-badge" style="position: absolute;top: -.4em;right: 1em;">8</span>
          <div class="weui-tabbar__icon">
            <img src="${ctx}/plug-in/sino/ui/wxs/images/icon_nav_button.png" alt="">
          </div>
          <p class="weui-tabbar__label">微信</p>
        </a>
        <a href="#tab2" class="weui-tabbar__item">
          <div class="weui-tabbar__icon">
            <img src="${ctx}/plug-in/sino/ui/wxs/images/icon_nav_msg.png" alt="">
          </div>
          <p class="weui-tabbar__label">通讯录</p>
        </a>
        <a href="#tab3" class="weui-tabbar__item">
          <div class="weui-tabbar__icon">
            <img src="${ctx}/plug-in/sino/ui/wxs/images/icon_nav_article.png" alt="">
          </div>
          <p class="weui-tabbar__label">发现</p>
        </a>
        <a href="#tab4" class="weui-tabbar__item">
          <div class="weui-tabbar__icon">
            <img src="${ctx}/plug-in/sino/ui/wxs/images/icon_nav_cell.png" alt="">
          </div>
          <p class="weui-tabbar__label">我</p>
        </a>
      </div>
    </div>




<script>$(function(){m.initAll();});</script>
</app:template>