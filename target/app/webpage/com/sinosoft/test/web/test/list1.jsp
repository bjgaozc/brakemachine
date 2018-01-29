<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<t:datagrid title="人员列表" name="epBiPersonList" actionUrl="baseEpBiPersonController.do?datagrid" fit="false" queryMode="group" pageSize="20">
   <t:dgCol title="编号" field="id" width="300" hidden="true"/>
   <t:dgCol title="人员编号" field="personId" width="120" hidden="true"/>
   <t:dgCol title="姓名"  field="name" query="true" width="120"/>
   <t:dgCol title="拼音"  field="pinyin" width="120"/>
   <t:dgCol title="性别"  field="sex" width="80"/>
   <t:dgCol title="民族"  field="nation" width="80"/>
   <t:dgCol title="出生地"  field="birthplace" width="100"/>
   <t:dgCol title="身份证"  field="idcard" width="150"/>
   <t:dgCol title="单位"  field="department" width="200"/>
   <t:dgCol title="common.operation" field="opt" width="80"></t:dgCol>
   <t:dgDelOpt title="删除" url="baseEpBiPersonController.do?doDel&id={id}"/>
   <t:dgToolBar title="录入" icon="icon-add" url="baseEpBiPersonController.do?goAdd" funname="add"/>
   <t:dgToolBar title="编辑" icon="icon-edit" url="baseEpBiPersonController.do?goUpdate" funname="update"/>
   <t:dgToolBar title="查看" icon="icon-search" url="baseEpBiPersonController.do?goUpdate" funname="detail"/>
  </t:datagrid>
 