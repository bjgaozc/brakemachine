<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@include file="/context/tags.jsp"%>
<app:template title="选择国家">
<link rel="stylesheet" type="text/css" href="plug-in/jquery-plugs/gridster/jquery.gridster.min.css">
<link rel="stylesheet" href="plug-in/jquery-plugs/gridster/style.css">
<script src="plug-in/jquery-plugs/gridster/jquery.gridster.js"></script>
<script>
var gridster;

$(function(){

  gridster = $(".gridster > ul").gridster({
      widget_margins: [10, 10],
      widget_base_dimensions: [140, 140],
      min_cols: 6
  }).data('gridster');

});
</script>

<section class="demo">

	<div class="gridster">
		<ul>
			<li data-row="1" data-col="1" data-sizex="2" data-sizey="1">
			</li>
			<li data-row="3" data-col="1" data-sizex="1" data-sizey="1"></li>
			<li data-row="3" data-col="2" data-sizex="2" data-sizey="1"></li>
			<li data-row="1" data-col="2" data-sizex="2" data-sizey="2"></li>
			<li class="try" data-row="1" data-col="4" data-sizex="1" data-sizey="1"></li>
			<li data-row="2" data-col="4" data-sizex="2" data-sizey="1"></li>
			<li data-row="3" data-col="4" data-sizex="1" data-sizey="1"></li>
			<li data-row="1" data-col="5" data-sizex="1" data-sizey="1"></li>
			<li data-row="3" data-col="5" data-sizex="1" data-sizey="1"></li>
			<li data-row="1" data-col="6" data-sizex="1" data-sizey="1"></li>
			<li data-row="2" data-col="6" data-sizex="1" data-sizey="2"></li>
		</ul>
	</div>

</section>


</app:template>