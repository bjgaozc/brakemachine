<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<t:datagrid title="团组出访地" name="visitPlaceList" actionUrl="baseEpPbGroupVisitPlaceController.do?initList&groupId=${groupId }" fit="false" queryMode="group">
   <t:dgCol title="团组出访地ID" field="id" hidden="false"/>
   <t:dgCol title="团组ID" field="GROUPID" hidden="false"/>
   <t:dgCol title="国家名称"  field="COUNTRY" width="120"/><!--查询 query="true" -->
   <t:dgCol title="出境城市"  field="OUTCITY" />
   <t:dgCol title="入境城市"  field="INCITY" />
   <t:dgCol title="入境日期"  field="INTIME" />
   <t:dgCol title="出境日期"  field="OUTTIME" />
   <t:dgCol title="过境情况"  field="OUTINNATURE" />
   <t:dgCol title="停留天数"  field="STAYDAYS" />
   <t:dgDelOpt title="删除" url="baseEpPbGroupVisitPlaceController.do?delVistPlace&id={id}"/>
   <t:dgToolBar title="录入" icon="icon-add" url="baseQsspSpGjController.do?index0" funname="add" operationCode="gvpAdd"/>
   <t:dgToolBar title="编辑" icon="icon-edit" url="baseQsspSpGjController.do?toUpdate" funname="update"/>
  <%--  <t:dgToolBar title="查看" icon="icon-search" url="baseEpBiPersonController.do?goUpdate" funname="detail"/> --%>
  </t:datagrid>
  
  </div>
  
  dsfdsdsfdsdsfdsdsfdsdsfds
  <br><br><br><br><br>
  <br><br><br><br><br>
  <br><br><br><br><br>