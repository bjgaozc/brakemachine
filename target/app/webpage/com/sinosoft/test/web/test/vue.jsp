<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@include file="/context/tags.jsp"%>
<app:template title="我的应用" type="vue" autoloadjs="true">
<style>
.counter{
  font-family:LED;
  font-size:100px;
}
[v-cloak]:after{
  content:' ';
  display:block;
  border-bottom:2px solid red;
  animation: progress 2s infinite;
}
@keyframes progress{
  0%{width:0%}
  100%{width:90%}
}
</style>

<div id="app" v-cloak>
  <button @click="reset">RESET</button>
  <div class="counter">{{counter}}</div>
</div> 

</app:template>