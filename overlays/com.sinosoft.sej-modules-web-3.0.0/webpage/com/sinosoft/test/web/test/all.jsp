<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@include file="/context/tags.jsp"%>
<app:template title="所有示例">

<style type="text/css">
	.module-title {
		background-color: #F2F2F2;
		padding: 5px 0;
		border-bottom: 2px solid #007fd0;
	}
</style>
<div class="easyui-layout" fit="true">
	<div data-options="region:'center',border:false">
		<div class="box">
			<div>
				<h2 class="module-title">All Component</h2>
				<div style="margin:10px 0;">
					<p>
						<a href="${ctx}/plug-in/easyui/index.html" target="_blank">
							<ins><i class="fa fa-link"></i> 查看全部jeasyui组件样例 </ins>
						</a>
					</p>
				</div>
			</div>
		
			<!-- 文本大小样式-------------------------------------------->
			<div>
				<h2 class="module-title">Base Text</h2>
				<h1><a href="javascript:void(0);">h1&gt;a文本样例</a></h1>
				<h2><a href="javascript:void(0);">h2&gt;a文本样例</a></h2>
				<h3><a href="javascript:void(0);">h3&gt;a文本样例</a></h3>
				<h4><a href="javascript:void(0);">h4&gt;a文本样例</a></h4>
				<h5><a href="javascript:void(0);">h5&gt;a文本样例</a></h5>
				<h6><a href="javascript:void(0);">h6&gt;a文本样例</a></h6>
				<p><u>下划线文本样例</u>&nbsp;<strong>加粗文本样例</strong>&nbsp;<del>被删除文本样例</del>&nbsp;<em>斜体文本样例</em></p>
			</div>
			
			<!-- 取色板样式----------------------------------------------->
			<div>
				<h2 class="module-title">Base Colors</h2>
				<div style="margin:10px 0;">
					<style type="text/css">
					    .color-ul li {
					        float: left;
					        margin-right: 20px;
					        list-style: none;
					    }
					    .color-ul li>div {
					        width: 30px;
					        height: 30px;
					    }
					</style>
					<ul class="color-ul">
					    <li>
						    <div class="bg-navy"></div>
						    <span class="navy">navy</span>
						</li>
						<li>
						    <div class="bg-blue"></div>
						    <span class="blue">blue</span>
						</li>
						<li>
						    <div class="bg-aqua"></div>
						    <span class="aqua">aqua</span>
						</li>
						<li>
						    <div class="bg-teal"></div>
						    <span class="teal">teal</span>
						</li>
						<li>
						    <div class="bg-olive"></div>
						    <span class="olive">olive</span>
						</li>
						<li>
						    <div class="bg-green"></div>
						    <span class="green">green</span>
						</li>
						<li>
						    <div class="bg-lime"></div>
						    <span class="lime">lime</span>
						</li>
						<li>
						    <div class="bg-yellow"></div>
						    <span class="yellow">yellow</span>
						</li>
						<li>
						    <div class="bg-orange"></div>
						    <span class="orange">orange</span>
						</li>
						<li>
						    <div class="bg-red"></div>
						    <span class="red">red</span>
						</li>
						<li>
						    <div class="bg-fuchsia"></div>
						    <span class="fuchsia">fuchsia</span>
						</li>
						<li>
						    <div class="bg-purple"></div>
						    <span class="purple">purple</span>
						</li>
						<li>
						    <div class="bg-maroon"></div>
						    <span class="maroon">maroon</span>
						</li>
						<li>
						    <div class="bg-silver"></div>
						    <span class="silver">silver</span>
						</li>
						<li>
						    <div class="bg-gray"></div>
						    <span class="gray">gray</span>
						</li>
						<li>
						    <div class="bg-black"></div>
						    <span class="black">black</span>
						</li>
						<li>
						    <div class="bg-white"></div>
						    <span class="white">white</span>
						</li>
					</ul>
					<div class="clearfix"></div>
				</div>
			</div>
			
			<!-- 基础消息样式----------------------------------------------->
			<div>
				<h2 class="module-title">Base Messager</h2>
				<div style="margin:10px 0;">
					<a href="#" class="easyui-linkbutton" onclick="show()">Show</a>
					<a href="#" class="easyui-linkbutton" onclick="slide()">Slide</a>
					<a href="#" class="easyui-linkbutton" onclick="fade()">Fade</a>
					<a href="#" class="easyui-linkbutton" onclick="progress()">Progress</a>
					<a href="#" class="easyui-linkbutton" onclick="confirm1();">Confirm</a>
					<a href="#" class="easyui-linkbutton" onclick="prompt1()">Prompt</a>
					<a href="#" class="easyui-linkbutton" onclick="alert1()">Alert</a>
					<a href="#" class="easyui-linkbutton" onclick="alert2()">Error</a>
					<a href="#" class="easyui-linkbutton" onclick="alert3()">Info</a>
					<a href="#" class="easyui-linkbutton" onclick="alert4()">Question</a>
					<a href="#" class="easyui-linkbutton" onclick="alert5()">Warning</a>
				</div>
				<script type="text/javascript">
					function show(){
						$.messager.show({
							title:'My Title',
							msg:'Message will be closed after 4 seconds.',
							showType:'show'
						});
					}
					function slide(){
						$.messager.show({
							title:'My Title',
							msg:'Message will be closed after 5 seconds.',
							timeout:5000,
							showType:'slide'
						});
					}
					function fade(){
						$.messager.show({
							title:'My Title',
							msg:'Message never be closed.',
							timeout:0,
							showType:'fade'
						});
					}
					function progress(){
						var win = $.messager.progress({
							title:'Please waiting',
							msg:'Loading data...'
						});
						setTimeout(function(){
							$.messager.progress('close');
						},5000);
					}
					function confirm1(){
						$.messager.confirm('My Title', 'Are you confirm this?', function(r){
							if (r){
								alert('confirmed: '+r);
							}
						});
					}
					function prompt1(){
						$.messager.prompt('My Title', 'Please type something', function(r){
							if (r){
								alert('you type: '+r);
							}
						});
					}
					function alert1(){
						$.messager.alert('My Title','Here is a message!');
					}
					function alert2(){
						$.messager.alert('My Title','Here is a error message!','error');
					}
					function alert3(){
						$.messager.alert('My Title','Here is a info message!','info');
					}
					function alert4(){
						$.messager.alert('My Title','Here is a question message!','question');
					}
					function alert5(){
						$.messager.alert('My Title','Here is a warning message!','warning');
					}
				</script>
			</div>
			
			<!-- 基础模态框样式----------------------------------------------->
			<div>
				<h2 class="module-title">Base Modal</h2>
				<div style="margin:10px 0;">
					<a href="javascript:void(0)" class="easyui-linkbutton" onclick="$('#w').window('open')">Open Window</a>
					<a href="javascript:void(0)" class="easyui-linkbutton" onclick="$('#dlg').edialog('open')">Open Edialog</a>
				</div>
				<div id="w" class="easyui-window" title="Modal Window" data-options="modal:true,closed:true,iconCls:'fa fa-save'" style="width:500px;height:200px;padding:10px;">
					The window content.
				</div>
				<div id="dlg" class="easyui-edialog" title="Toolbar and Buttons" style="width:400px;height:200px;padding:10px"
					data-options="
						iconCls: 'fa fa-save',
						modal: true,
						closed: true,
						toolbar: [{
							text:'添加',
							iconCls:'fa fa-plus',
							handler:function(){
								$.messager.alert('Message','add','info');
							}
						},'-',{
							text:'保存',
							iconCls:'fa fa-save',
							handler:function(){
								$.messager.alert('Message','save','info');
							}
						}],
						buttons: [{
							text:'确定',
							iconCls:'fa fa-check',
							handler:function(){
								$.messager.alert('Message','ok','info');
							}
						},{
							text:'取消',
							iconCls:'fa fa-remove',
							handler:function(){
								$.messager.alert('Message','cancel','info');
							}
						}]
					">
					The Edialog content.
				</div>
			</div>
				
			<!-- 按钮样式----------------------------------------------->
			<div>
				<h2 class="module-title">Base Button</h2>
				<div style="padding:5px 0;">
					<a href="#" class="easyui-linkbutton" data-options="iconCls:'fa fa-plus'">Add</a>
					<a href="#" class="easyui-linkbutton" data-options="iconCls:'fa fa-remove',iconAlign:'right'">Remove</a>
					<a href="#" class="easyui-linkbutton" data-options="iconCls:'fa fa-save',iconAlign:'top'">Save</a>
					<a href="#" class="easyui-linkbutton" data-options="iconCls:'fa fa-cut',disabled:true">Cut</a>
					<a href="#" class="easyui-linkbutton">Text Button</a>
					<a href="#" class="easyui-linkbutton" data-options="iconCls:'fa fa-search'" style="width:80px">Search</a>
					<a href="#" class="easyui-linkbutton" data-options="iconCls:'fa fa-print'" style="width:80px">Print</a>
					<a href="#" class="easyui-linkbutton" data-options="iconCls:'fa fa-refresh'" style="width:80px">Reload</a>
					<a href="#" class="easyui-linkbutton" data-options="iconCls:'fa fa-question'" style="width:80px">Help</a>
					
				</div>
				<div style="padding:15px 0;">
					<div>
						<a href="#" class="easyui-linkbutton c1" style="width:120px">Button1</a>
						<a href="#" class="easyui-linkbutton c2" style="width:120px">Button2</a>
						<a href="#" class="easyui-linkbutton c3" style="width:120px">Button3</a>
						<a href="#" class="easyui-linkbutton c4" style="width:120px">Button4</a>
						<a href="#" class="easyui-linkbutton c5" style="width:120px">Button5</a>
						<a href="#" class="easyui-linkbutton c6" style="width:120px">Button6</a>
						<a href="#" class="easyui-linkbutton c7" style="width:120px">Button7</a>
						<a href="#" class="easyui-linkbutton c8" style="width:120px">Button8</a>
					</div>
				</div>
			</div>
			
			<!-- 基础图标样式----------------------------------------------->
			<div>
				<h2 class="module-title">Base iCons</h2>
				<div style="margin:10px 0;">
					<p>
						<a href="http://www.fontawesome.com.cn/faicons/" target="_blank">
							<ins><i class="fa fa-link"></i> fontawesome中文网 </ins>
						</a>
					</p>
					<p>
						<a href="http://fontawesome.io/icons/" target="_blank">
							<ins><i class="fa fa-link"></i> fontawesome官网</ins>
						</a>
					</p>
					<p>
						<a href="https://icomoon.io/" target="_blank">
							<ins><i class="fa fa-link"></i> icomoon官网(自定义字体图标)</ins>
						</a>
					</p>
					<p>
						<a href="http://www.iconfont.cn/plus" target="_blank">
							<ins><i class="fa fa-link"></i> iconfont官网(阿里巴巴矢量图库)</ins>
						</a>
					</p>
					<ul class="easyui-datalist" title="Common Icon" lines="true" style="width:100%;height:650px">
						<li><i class="fa fa-plus"></i> <code>&lt;i class="fa fa-plus"&gt;&lt;/i&gt;</code> 新增</li>
						<li><i class="fa fa-edit"></i> <code>&lt;i class="fa fa-edit"&gt;&lt;/i&gt;</code> 修改/编辑</li>
						<li><i class="fa fa-trash-o"></i> <code>&lt;i class="fa fa-trash-o"&gt;&lt;/i&gt;</code> 删除/注销</li>
						<li><i class="fa fa-search"></i> <code>&lt;i class="fa fa-search"&gt;&lt;/i&gt;</code> 查询</li>
						<li><i class="fa fa-undo"></i> <code>&lt;i class="fa fa-undo"&gt;&lt;/i&gt;</code> 重置</li>
						<li><i class="fa fa-save"></i> <code>&lt;i class="fa fa-save"&gt;&lt;/i&gt;</code> 保存</li>
						<li><i class="fa fa-send-o"></i> <code>&lt;i class="fa fa-send"&gt;&lt;/i&gt;</code> 提交</li>
						<li><i class="fa fa-remove"></i> <code>&lt;i class="fa fa-remove"&gt;&lt;/i&gt;</code> 关闭</li>
						<li><i class="fa fa-hand-paper-o"></i> <code>&lt;i class="fa fa-hand-paper-o"&gt;&lt;/i&gt;</code> 驳回</li>
						<li><i class="fa fa-smile-o"></i> <code>&lt;i class="fa fa-smile-o"&gt;&lt;/i&gt;</code> 通过</li>
						<li><i class="fa fa-frown-o"></i> <code>&lt;i class="fa fa-frown-o"&gt;&lt;/i&gt;</code> 不通过</li>
						<li><i class="fa fa-download"></i> <code>&lt;i class="fa fa-download"&gt;&lt;/i&gt;</code> 下载</li>
						<li><i class="fa fa-upload"></i> <code>&lt;i class="fa fa-upload"&gt;&lt;/i&gt;</code> 上传</li>
						<li><i class="fa fa-print"></i> <code>&lt;i class="fa fa-print"&gt;&lt;/i&gt;</code> 打印</li>
						<li><i class="fa fa-filter"></i> <code>&lt;i class="fa fa-filter"&gt;&lt;/i&gt;</code> 核查</li>
						<li><i class="fa fa-arrow-circle-up"></i> <code>&lt;i class="fa fa-arrow-circle-up"&gt;&lt;/i&gt;</code> 上移</li>
						<li><i class="fa fa-arrow-circle-down"></i> <code>&lt;i class="fa fa-arrow-circle-down"&gt;&lt;/i&gt;</code> 下移</li>
					</ul>
				</div>
			</div>
			
			<!-- 基础栅格样式----------------------------------------------->
			<div>
				<h2 class="module-title">Base Grid</h2>
				<div style="margin:10px 0;">
					<div class="col-12 bg-silver blue pd-10 mg-b-5 text-center">col-12</div>
					
					<div class="col-6 bg-silver blue pd-10 mg-b-5 text-center">col-6</div>
					<div class="col-6 bg-gray blue pd-10 mg-b-5 text-center">col-6</div>
					
					<div class="col-4 bg-silver blue pd-10 mg-b-5 text-center">col-4</div>
					<div class="col-4 bg-gray blue pd-10 mg-b-5 text-center">col-4</div>
					<div class="col-4 bg-black white pd-10 mg-b-5 text-center">col-4</div>
					
					<div class="col-3 bg-silver blue pd-10 mg-b-5 text-center">col-3</div>
					<div class="col-3 bg-gray blue pd-10 mg-b-5 text-center">col-3</div>
					<div class="col-3 bg-navy white pd-10 mg-b-5 text-center">col-3</div>
					<div class="col-3 bg-black white pd-10 mg-b-5 text-center">col-3</div>
					
					<div class="col-2 bg-aqua blue pd-10 mg-b-5 text-center">col-2</div>
					<div class="col-2 bg-lime white pd-10 mg-b-5 text-center">col-2</div>
					<div class="col-2 bg-green white pd-10 mg-b-5 text-center">col-2</div>
					<div class="col-2 bg-teal white pd-10 mg-b-5 text-center">col-2</div>
					<div class="col-2 bg-olive white pd-10 mg-b-5 text-center">col-2</div>
					<div class="col-2 bg-blue white pd-10 mg-b-5 text-center">col-2</div>
					
					<div class="col-1 bg-aqua blue pd-10 mg-b-5 text-center">col-1</div>
					<div class="col-1 bg-lime white pd-10 mg-b-5 text-center">col-1</div>
					<div class="col-1 bg-green white pd-10 mg-b-5 text-center">col-1</div>
					<div class="col-1 bg-teal white pd-10 mg-b-5 text-center">col-1</div>
					<div class="col-1 bg-olive white pd-10 mg-b-5 text-center">col-1</div>
					<div class="col-1 bg-blue white pd-10 mg-b-5 text-center">col-1</div>
					<div class="col-1 bg-yellow white pd-10 mg-b-5 text-center">col-1</div>
					<div class="col-1 bg-orange white pd-10 mg-b-5 text-center">col-1</div>
					<div class="col-1 bg-red white pd-10 mg-b-5 text-center">col-1</div>
					<div class="col-1 bg-fuchsia white pd-10 mg-b-5 text-center">col-1</div>
					<div class="col-1 bg-purple white pd-10 mg-b-5 text-center">col-1</div>
					<div class="col-1 bg-maroon white pd-10 mg-b-5 text-center">col-1</div>

					<div class="clearfix"></div>
				</div>
			</div>
			
			<!-- 基础分页样式----------------------------------------------->
			<div>
				<h2 class="module-title">Base Pagination</h2>
				<div style="margin:10px 0">
					<select class="easyui-combobox" id="pageChange">
						<option value="1">Previous Next</option>
						<option value="2">Manual Page Input</option>
						<option value="3">Numeric Links</option>
						<option value="4">Previous Links Next</option>
						<option value="5">Go To Page</option>
					</select>
				</div>
				<div id="pp" class="easyui-pagination" style="border:1px solid #ddd;margin:10px 0;" data-options="
							total:114,layout:['first','prev','next','last']"></div>
				<script>
					$(function(){
						$("#pageChange").combobox({
							onChange: function (newval,oldval) {
								setLayout(newval);
							}
						});
					});
					function setLayout(type){
						var p = $('#pp');
						switch(parseInt(type)){
						case 1:
							p.pagination({layout:['first','prev','next','last']});
							break;
						case 2:
							p.pagination({
								layout:['list','sep','first','prev','sep','manual','sep','next','last','sep','refresh'],
								beforePageText:'Page',
								afterPageText:'of {pages}'
							});
							break;
						case 3:
							p.pagination({layout:['links']});
							break;
						case 4:
							p.pagination({layout:['first','prev','links','next','last']});
							break;
						case 5:
							p.pagination({
								layout:['first','prev','next','last','sep','links','sep','manual'],
								beforePageText:'Go Page',
								afterPageText:''
							});
							break;
						}
					}
				</script>
			</div>
			
			<!-- 基础表单样式----------------------------------------------->
			<div>
				<h2 class="module-title">Basic Form</h2>
				<form class="form-inline" role="form">
					<div>
						<label>行内文本框</label>
					</div>
					<div class="form-group">
						<label class="sr-only" for="exampleInputEmail2">Email address</label>
						<input type="email" class="form-control easyui-validatebox" id="exampleInputEmail2" placeholder="Enter email" data-options="required:true">
					</div>
					<div class="form-group">
						<div class="input-group">
							<div class="input-group-addon">@</div>
							<input class="form-control easyui-validatebox" type="email" placeholder="Enter email" data-options="required:true">
						</div>
					</div>
					<div class="form-group">
						<label class="sr-only" for="exampleInputPassword2">Password</label>
						<input type="password" class="form-control easyui-validatebox" id="exampleInputPassword2" placeholder="Password" data-options="required:true">
					</div>
					<div class="form-group">
						<label class="sr-only" for="disabledinput">Disabled Input</label>
						<input type="password" class="form-control easyui-validatebox" id="disabledinput" placeholder="Disabled Input" disabled="disabled">
					</div>
				</form>
				<hr>
				<form class="form-horizontal">
					<div class="col-3 pd-r-5">
						<div class="form-group">
							<label class="col-6 control-label" for="exampleInputEmail1">横向文本<strong class="red">*</strong></label>
							<input type="email" class="col-6 form-control easyui-validatebox" id="exampleInputEmail1" placeholder="块级文本框">
						</div>
						<div class="form-group">
							<label class="col-6 control-label" for="exampleInputEmail1">横向文本<strong class="red">*</strong></label>
							<input type="email" class="col-6 form-control easyui-validatebox" id="exampleInputEmail1" placeholder="块级文本框">
						</div>
						<div class="form-group">
							<label class="col-6 control-label" for="exampleInputEmail1">横向文本</label>
							<input type="email" class="col-6 form-control easyui-validatebox" id="exampleInputEmail1" placeholder="块级文本框">
						</div>
					</div>
					<div class="col-3 pd-r-5">
						<div class="form-group">
							<label class="col-6 control-label" for="exampleInputEmail1">横向横向文本<strong class="red">*</strong></label>
							<input type="email" class="col-6 form-control easyui-validatebox" id="exampleInputEmail1" placeholder="块级文本框">
						</div>
						<div class="form-group">
							<label class="col-6 control-label" for="exampleInputEmail1">横向文本</label>
							<input type="email" class="col-6 form-control easyui-validatebox" id="exampleInputEmail1" placeholder="块级文本框">
						</div>
						<div class="form-group">
							<label class="col-6 control-label" for="exampleInputEmail1">横向文本</label>
							<input type="email" class="col-6 form-control easyui-validatebox" id="exampleInputEmail1" placeholder="块级文本框">
						</div>
					</div>
					<div class="col-3 pd-r-5">
						<div class="form-group">
							<label class="col-6 control-label" for="exampleInputEmail1">横向文本</label>
							<input type="email" class="col-6 form-control easyui-validatebox" id="exampleInputEmail1" placeholder="块级文本框">
						</div>
						<div class="form-group">
							<label class="col-6 control-label" for="exampleInputEmail1">横向横向文本</label>
							<input type="email" class="col-6 form-control easyui-validatebox" id="exampleInputEmail1" placeholder="块级文本框">
						</div>
						<div class="form-group">
							<label class="col-6 control-label" for="exampleInputEmail1">横向文本</label>
							<input type="email" class="col-6 form-control easyui-validatebox" id="exampleInputEmail1" placeholder="块级文本框">
						</div>
					</div>
					<div class="col-3">
						<div class="form-group">
							<label class="col-6 control-label" for="exampleInputEmail1">横向横向文本</label>
							<input type="email" class="col-6 form-control easyui-validatebox" id="exampleInputEmail1" placeholder="块级文本框">
						</div>
						<div class="form-group">
							<label class="col-6 control-label" for="exampleInputEmail1">横向文本</label>
							<input type="email" class="col-6 form-control easyui-validatebox" id="exampleInputEmail1" placeholder="块级文本框">
						</div>
						<div class="form-group">
							<label class="col-6 control-label" for="exampleInputEmail1">横向文本</label>
							<input type="email" class="col-6 form-control easyui-validatebox" id="exampleInputEmail1" placeholder="块级文本框">
						</div>
					</div>
					<div class="col-12">
						<div class="form-group">
							<label class="col-2 control-label" for="exampleInputEmail1">横向横向文本</label>
							<input type="email" class="col-10 form-control easyui-validatebox" id="exampleInputEmail1" placeholder="块级文本框">
						</div>
					</div>
					<div class="col-12">
						<div class="form-group">
							<label class="col-2 control-label textarea-lebal" for="exampleInputEmail1">横向横向文本</label>
							<textarea class="col-10 form-control easyui-validatebox" id="exampleInputEmail1" placeholder="块级文本框"></textarea>
						</div>
					</div>
					<div class="clearfix"></div>
					<script>
						$(document).ready(function(){
							$("form label").each(function(){
								$(this).tooltip({
									position: 'top',
									content: '<span class="black">' + $(this).html() + '</span>',
									onShow: function(){
										$(this).tooltip('tip').css({
											backgroundColor: "#FAFFBD"
										});
									}
								});
							});
						});
					</script>
				</form>
				<form role="form">
					<div class="form-group">
						<label for="exampleInputEmail1">块级文本框</label>
						<input type="email" class="form-control easyui-validatebox" id="exampleInputEmail1" placeholder="块级文本框" data-options="required:true">
					</div>
					<div class="form-group">
						<label for="exampleInputPassword1">块级密码框</label>
						<input type="password" class="form-control easyui-validatebox" id="exampleInputPassword1" placeholder="块级密码框" data-options="required:true">
					</div>
					<div class="form-group">
						<div>
							<label for="searchbox">搜索框</label>
						</div>
						<input class="easyui-searchbox form-control" id="searchbox" data-options="prompt:'Please Input Value',searcher:doSearch" style="width:300px"/>
						<script>
							function doSearch(value){
								$.messager.alert('消息','您的输入: ' + value,'info');
							}
						</script>
					</div>
					<div class="form-group">
						<label for="exampleInputFile">文件选择框</label>
						<div class="fileinput-button fileinput-button-block">
							<span>点击选择文件</span>
							<input type="file" id="exampleInputFile" accept="image/*" multiple/>
						</div>
						<p class="help-block">Example block-level help text here.</p>
					</div>
				</form>
				<div class="form-group">
					<div class="checkbox checkbox-primary checkbox-inline">
						<input id="checkbox4" name="checkboxinline" type="checkbox">
						<label for="checkbox4">
							行内未选中
						</label>
					</div>
					<div class="checkbox checkbox-primary checkbox-inline">
						<input id="checkbox5" name="checkboxinline" type="checkbox" checked="checked">
						<label for="checkbox5">
							行内已选中
						</label>
					</div>
					<div class="checkbox checkbox-primary checkbox-inline">
						<input id="checkbox6" name="checkboxinline" type="checkbox" disabled="disabled">
						<label for="checkbox6">
							行内不可选
						</label>
					</div>
				</div>
				<div class="form-group">
					<div class="checkbox checkbox-primary">
						<input id="checkbox7" name="checkboxblock" type="checkbox">
						<label for="checkbox7">
							块级未选中
						</label>
					</div>
					<div class="checkbox checkbox-primary">
						<input id="checkbox8" name="checkboxblock" type="checkbox" checked="checked">
						<label for="checkbox8">
							块级已选中
						</label>
					</div>
					<div class="checkbox checkbox-primary">
						<input id="checkbox9" name="checkboxblock" type="checkbox" disabled="disabled">
						<label for="checkbox9">
							块级不可选
						</label>
					</div>
				</div>
				<div class="form-group">
					<div class="radio radio-primary radio-inline">
						<input type="radio" id="radio1" name="radioinline">
						<label for="radio1"> 行内单选未选中 </label>
					</div>
					<div class="radio radio-primary radio-inline">
						<input type="radio" id="radio2" name="radioinline" checked="checked">
						<label for="radio2"> 行内单选已选中 </label>
					</div>
					<div class="radio radio-primary radio-inline">
						<input type="radio" id="radio3" name="radioinline" disabled="disabled">
						<label for="radio3"> 行内单选不可用 </label>
					</div>
				</div>
				<div class="form-group">
					<div class="radio radio-primary">
						<input type="radio" id="radio4" name="radioblack">
						<label for="radio4"> 块级单选未选中 </label>
					</div>
					<div class="radio radio-primary">
						<input type="radio" id="radio5" name="radioblack" checked="checked">
						<label for="radio5"> 块级单选已选中 </label>
					</div>
					<div class="radio radio-primary">
						<input type="radio" id="radio6" name="radioblack" disabled="disabled">
						<label for="radio6"> 块级单选不可用 </label>
					</div>
				</div>
				<div class="form-group">
					<label for="oneselect">单选下拉框</label>
					<select id="oneselect" class="form-control">
						<option>1</option>
						<option>2</option>
						<option>3</option>
						<option>4</option>
						<option>5</option>
					</select>
					<br>
					<label for="mulselect">多选下拉框</label>
					<select id="mulselect" multiple class="form-control">
						<option>1</option>
						<option>2</option>
						<option>3</option>
						<option>4</option>
						<option>5</option>
					</select>
					<br>
					<label for="easyuiselect">easyui下拉框</label>
					<p>
						<select class="easyui-combobox" id="easyuiselect" name="language"><option value="ar">Arabic</option><option value="bg">Bulgarian</option><option value="ca">Catalan</option><option value="zh-cht">Chinese Traditional</option><option value="cs">Czech</option><option value="da">Danish</option><option value="nl">Dutch</option><option value="en">English</option><option value="et">Estonian</option><option value="fi">Finnish</option><option value="fr">French</option><option value="de">German</option><option value="el">Greek</option><option value="ht">Haitian Creole</option><option value="he">Hebrew</option><option value="hi">Hindi</option><option value="mww">Hmong Daw</option><option value="hu">Hungarian</option><option value="id">Indonesian</option><option value="it">Italian</option><option value="ja">Japanese</option><option value="ko">Korean</option><option value="lv">Latvian</option><option value="lt">Lithuanian</option><option value="no">Norwegian</option><option value="fa">Persian</option><option value="pl">Polish</option><option value="pt">Portuguese</option><option value="ro">Romanian</option><option value="ru">Russian</option><option value="sk">Slovak</option><option value="sl">Slovenian</option><option value="es">Spanish</option><option value="sv">Swedish</option><option value="th">Thai</option><option value="tr">Turkish</option><option value="uk">Ukrainian</option><option value="vi">Vietnamese</option></select>
					</p>
				</div>
			</div>
			
			<!-- 基础可编辑表格样式----------------------------------------------->
			<div>
				<h2 class="module-title">Base Row Editing in DataGrid</h2>
				<table id="dg" class="easyui-datagrid" title="Row Editing in DataGrid" style="width:700px;height:auto"
						data-options="
							iconCls: 'fa fa-edit',
							singleSelect: true,
							toolbar: '#tb',
							url: 'plug-in/easyui/demo/datagrid/datagrid_data1.json',
							method: 'get',
							onClickRow: onClickRow
						">
					<thead>
						<tr>
							<th data-options="field:'itemid',width:80">Item ID</th>
							<th data-options="field:'productid',width:100,
									formatter:function(value,row){
										return row.productname;
									},
									editor:{
										type:'combobox',
										options:{
											valueField:'productid',
											textField:'productname',
											url:'plug-in/easyui/demo/datagrid/products.json',
											required:true
										}
									}">Product</th>
							<th data-options="field:'listprice',width:80,align:'right',editor:{type:'numberbox',options:{precision:1}}">List Price</th>
							<th data-options="field:'unitcost',width:80,align:'right',editor:'numberbox'">Unit Cost</th>
							<th data-options="field:'attr1',width:250,editor:'text'">Attribute</th>
							<th data-options="field:'status',width:60,align:'center',editor:{type:'checkbox',options:{on:'P',off:''}}">Status</th>
						</tr>
					</thead>
				</table>
				<div id="tb" style="height:auto">
					<a href="javascript:void(0)" class="easyui-linkbutton" data-options="iconCls:'fa fa-plus',plain:true" onclick="append()">添加</a>
					<a href="javascript:void(0)" class="easyui-linkbutton" data-options="iconCls:'fa fa-remove',plain:true" onclick="removeit()">删除</a>
					<a href="javascript:void(0)" class="easyui-linkbutton" data-options="iconCls:'fa fa-save',plain:true" onclick="accept()">保存</a>
					<a href="javascript:void(0)" class="easyui-linkbutton" data-options="iconCls:'fa fa-undo',plain:true" onclick="reject()">撤销</a>
					<a href="javascript:void(0)" class="easyui-linkbutton" data-options="iconCls:'fa fa-search',plain:true" onclick="getChanges()">查看</a>
				</div>
				<br>
				<script type="text/javascript">
					var editIndex = undefined;
					function endEditing(){
						if (editIndex == undefined){return true}
						if ($('#dg').datagrid('validateRow', editIndex)){
							var ed = $('#dg').datagrid('getEditor', {index:editIndex,field:'productid'});
							var productname = $(ed.target).combobox('getText');
							$('#dg').datagrid('getRows')[editIndex]['productname'] = productname;
							$('#dg').datagrid('endEdit', editIndex);
							editIndex = undefined;
							return true;
						} else {
							return false;
						}
					}
					function onClickRow(index){
						if (editIndex != index){
							if (endEditing()){
								$('#dg').datagrid('selectRow', index)
										.datagrid('beginEdit', index);
								editIndex = index;
							} else {
								$('#dg').datagrid('selectRow', editIndex);
							}
						}
					}
					function append(){
						if (endEditing()){
							$('#dg').datagrid('appendRow',{status:'P'});
							editIndex = $('#dg').datagrid('getRows').length-1;
							$('#dg').datagrid('selectRow', editIndex)
									.datagrid('beginEdit', editIndex);
						}
					}
					function removeit(){
						if (editIndex == undefined){return}
						$('#dg').datagrid('cancelEdit', editIndex)
								.datagrid('deleteRow', editIndex);
						editIndex = undefined;
					}
					function accept(){
						if (endEditing()){
							$('#dg').datagrid('acceptChanges');
						}
					}
					function reject(){
						$('#dg').datagrid('rejectChanges');
						editIndex = undefined;
					}
					function getChanges(){
						var rows = $('#dg').datagrid('getChanges');
						$.messager.alert('消息',rows.length+' rows are changed!','info');
					}
				</script>
			</div>
			
			<!-- 基础折叠表格样式----------------------------------------------->
			<div>
				<h2 class="module-title">Base Propertygrid</h2>
				<table class="easyui-propertygrid" style="width:300px;" data-options="
							url: 'plug-in/easyui/demo/propertygrid/propertygrid_data.json',
							method: 'get',
							showGroup: true,
							scrollbarSize: 0,
							groupFormatter: groupFormatter
						">
				</table>
				<br>
				<script>
					function groupFormatter(fvalue, rows){
						return fvalue + ' - <span class="red">' + rows.length + ' rows</span>';
					}
				</script>	
			</div>
			
			<!-- 基础选项卡样式----------------------------------------------->
			<div>
				<h2 class="module-title">Base Tab</h2>
				<div style="margin:10px 0;">
					<span>选项卡位置:</span>
					<select class="easyui-combobox" id="change">
						<option value="top">上</option>
						<option value="bottom">下</option>
						<option value="left">左</option>
						<option value="right">右</option>
					</select>
				</div>
				<div id="tt" class="easyui-tabs" style="width:700px;height:150px">
					<div title="About" style="padding:10px">
						<ul>
							<li>easyui is a collection of user-interface plugin based on jQuery.</li>
						</ul>
					</div>
					<div title="My Documents" style="padding:10px">
						This is the My Documents content.
					</div>
					<div title="Help" data-options="iconCls:'fa fa-question-circle',closable:true" style="padding:10px">
						This is the help content.
					</div>
				</div>
				<script>
					$(function(){
						$("#change").combobox({
							onChange: function(newval,oldval){
								$('#tt').tabs({tabPosition:newval})
							}
						})
					});
				</script>
				<br>
			</div>
			
			<!-- 基础滑动条样式----------------------------------------------->
			<div>
				<h2 class="module-title">Base Slider Rule</h2>
				<div style="margin: 30px 0 0 10px;">
					<input class="easyui-slider" style="width:390px" data-options="
								showTip:true,rule: [0,'|',25,'|',50,'|',75,'|',100]">
				</div>
				<div style="height: 30px;"></div>
			</div>
			
			<!-- 基础手风琴样式----------------------------------------------->
			<div>
				<h2 class="module-title">Basic Accordion</h2>
				<div class="easyui-accordion" style="width:700px;height:250px;">
					<div title="About" data-options="iconCls:'fa fa-check'" style="overflow:auto;padding:10px;">
						<h3 style="color:#0099FF;">Accordion for jQuery</h3>
						<p>Accordion is a part of easyui framework for jQuery. It lets you define your accordion component on web page more easily.</p>
					</div>
					<div title="Help" data-options="iconCls:'fa fa-question-circle'" style="padding:10px;">
						<p>The accordion allows you to provide multiple panels and display one or more at a time. Each panel has built-in support for expanding and collapsing. Clicking on a panel header to expand or collapse that panel body. The panel content can be loaded via ajax by specifying a 'href' property. Users can define a panel to be selected. If it is not specified, then the first panel is taken by default.</p> 		
					</div>
					<div title="TreeMenu" data-options="iconCls:'fa fa-search'" style="padding:10px;">
						<ul class="easyui-tree">
							<li>
								<span>Foods</span>
								<ul>
									<li>
										<span>Fruits</span>
										<ul>
											<li>apple</li>
											<li>orange</li>
										</ul>
									</li>
									<li>
										<span>Vegetables</span>
										<ul>
											<li>tomato</li>
											<li>carrot</li>
											<li>cabbage</li>
											<li>potato</li>
											<li>lettuce</li>
										</ul>
									</li>
								</ul>
							</li>
						</ul>
					</div>
				</div>
				<br>
			</div>
			
			<!-- 基础搜索框样式----------------------------------------------->
			<div class="search-box">
				<h2 class="module-title">Base Search</h2>
				<div class="easyui-accordion" id="filedset" style="width:100%;">
					<div title="查询条件" data-options="selected:true, iconCls:'fa fa-search'">
						<form class="form-pd-15" action="" method="post">
					    	<div class="col-4 pd-r-5">
					    		<div class="form-group">
									<input class="form-control easyui-combobox" style="width:100%;" value="${zhInInvitation.countryName}" 
										name="countryName" id="countryName"  maxlength="50"
										data-options="prompt:'申请签证国家/地区'">
								</div>
								<div class="form-group">
									<input type="text" class="form-control easyui-validatebox" style="width:100%;" value="${zhInInvitation.totalDays}"
										name="totalDays" id="totalDays" maxlength="3"
										placeholder="最长停留天数"  validType="integer">
								</div>
							</div>
							<div class="col-4 pd-l-5 pd-r-5">
					    		<div class="form-group">
									<input class="form-control easyui-combobox" style="width:100%;" value="${zhInInvitation.realCountry}"
										name="realCountry" id="realCountry" 
										data-options="prompt:'申请签证使/领馆'">
								</div>
								<div class="form-group">
									<input type="text" class="form-control easyui-validatebox" value="${zhInInvitation.visitPlace}"
										name="visitPlace" id="visitPlace" 
										placeholder="访问地点"">
								</div>
								<div class="form-group">
									<a href="#" class="easyui-linkbutton" data-options="iconCls:'fa fa-search'" style="width:45%;">搜索</a>
									<a href="#" class="easyui-linkbutton pull-right" data-options="iconCls:'fa fa-undo'" style="width:45%;">重置</a>
								</div>
							</div>
							<div class="col-4 pd-l-5">
					    		<div class="form-group">
									<input class="easyui-datebox" style="width:100%;" value="<fmt:formatDate value="${zhInInvitation.visitDate}" pattern="yyyy-MM-dd"/>"
										name="visitDate" id="visitDate" 
										data-options="prompt:'拟入境时间',editable:false">
								</div>
								<div class="form-group">
									<input class="form-control easyui-combobox" style="width:100%;" value="${zhInInvitation.visitReason}"
										name="visitReason" id="visitReason" 
										data-options="prompt:'来华事由'">
								</div>
							</div>
						</form>
					</div>
				</div>
				<div class="clearfix"></div>
				<table id="dg" class="easyui-datagrid" title="Fluid DataGrid" style="width:100%;height:250px"
						data-options="singleSelect:true,collapsible:true,url:'plug-in/easyui/demo/datagrid/datagrid_data1.json',method:'get'">
					<thead>
						<tr>
							<th data-options="field:'itemid',resizable:false" width="15%">Item ID(15%)</th>
							<th data-options="field:'productid',resizable:false" width="15%">Product(15%)</th>
							<th data-options="field:'listprice',align:'right',resizable:false" width="15%">List Price(15%)</th>
							<th data-options="field:'unitcost',align:'right',resizable:false" width="15%">Unit Cost(15%)</th>
							<th data-options="field:'attr1',resizable:false" width="25%">Attribute(25%)</th>
							<th data-options="field:'status',align:'center',resizable:false" width="15%">Status(15%)</th>
						</tr>
					</thead>
				</table>
			</div>
			<br>
			
		</div>
	</div>
</div>

</app:template>