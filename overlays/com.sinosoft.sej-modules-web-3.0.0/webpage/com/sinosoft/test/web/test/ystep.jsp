<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@include file="/context/tags.jsp"%>
<app:template title="我的应用" type="planeui">
<div class="pui-layout" style="width:96%;">
<link href="plug-in-ui/jquery-plugs/ystep/css/ystep.css" rel="stylesheet">
<script src="plug-in-ui/jquery-plugs/ystep/js/ystep.js"></script>

<br><br><br><br><br>
<!-- ystep容器 -->
<div class="ystep1"></div>

<br><br><br><br><br>

<div class="ystep2"></div>

<br><br><br><br><br>

<div class="ystep3"></div>

<br><br><br><br><br>

<div class="ystep4"></div>

<script type="text/javascript">
//根据jQuery选择器找到需要加载ystep的容器
//loadStep 方法可以初始化ystep
$(".ystep1").loadStep({
  //ystep的外观大小
  //可选值：small,large
  size: "small",
  //ystep配色方案
  //可选值：green,blue
  color: "green",
  //ystep中包含的步骤
  steps: [{
	//步骤名称
	title: "发起",
	//步骤内容(鼠标移动到本步骤节点时，会提示该内容)
	content: "实名用户/公益组织发起项目"
  },{
	title: "审核",
	content: "乐捐平台工作人员审核项目"
  },{
	title: "募款",
	content: "乐捐项目上线接受公众募款"
  },{
	title: "执行",
	content: "项目执行者线下开展救护行动"
  },{
	title: "结项",
	content: "项目执行者公示善款使用报告"
  }]
});

$(".ystep2").loadStep({
  size: "large",
  color: "green",
  steps: [{
	title: "发起",
	content: "实名用户/公益组织发起项目"
  },{
	title: "审核",
	content: "乐捐平台工作人员审核项目"
  },{
	title: "募款",
	content: "乐捐项目上线接受公众募款"
  },{
	title: "执行",
	content: "项目执行者线下开展救护行动"
  },{
	title: "结项",
	content: "项目执行者公示善款使用报告"
  }]
});

$(".ystep3").loadStep({
  size: "small",
  color: "blue",
  steps: [{
	title: "发起",
	content: "实名用户/公益组织发起项目"
  },{
	title: "审核",
	content: "乐捐平台工作人员审核项目"
  },{
	title: "募款",
	content: "乐捐项目上线接受公众募款"
  },{
	title: "执行",
	content: "项目执行者线下开展救护行动"
  },{
	title: "结项",
	content: "项目执行者公示善款使用报告"
  }]
});

$(".ystep4").loadStep({
  size: "large",
  color: "blue",
  steps: [{
	title: "发起",
	content: "实名用户/公益组织发起项目"
  },{
	title: "审核",
	content: "乐捐平台工作人员审核项目"
  },{
	title: "募款",
	content: "乐捐项目上线接受公众募款"
  },{
	title: "执行",
	content: "项目执行者线下开展救护行动"
  },{
	title: "结项",
	content: "项目执行者公示善款使用报告"
  }]
});

$(".ystep1").setStep(2);
$(".ystep2").setStep(5);
$(".ystep3").setStep(3);

</script>


</div>
</app:template>