<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@include file="/context/tags.jsp"%>
<app:template title="首页" autoloadjs="true">

<input type="hidden" id="rootpath" value="${rootpath}">

<div class="search-box pd-15 pd-l-15 pd-r-15">
	<div class="easyui-accordion" id="filedset">
		<div title="查询条件" data-options="selected:true, iconCls:'fa fa-search no-bg'" style="padding:15px;">
			<form>
				<div class="col-1 pd-r-5">
					<div class="form-group">
						<input class="form-control easyui-validatebox" id="syApplyid" name="syApplyid" placeholder="申请号">
					</div>
				</div>
				<div class="col-2 pd-r-5">
					<div class="form-group">
						<input class="form-control easyui-validatebox" id="syApplytype" name="syApplytype" placeholder="申请类型">
					</div>
				</div>
				<div class="col-1 pd-r-5">
					<div class="form-group">
						<select id="syType" name="syType">
							<option value="">操作类型</option>
							<option value="1">进入</option>
							<option value="-1">离开</option>
						</select>
					</div>
				</div>
				<div class="col-2 pd-l-5 ">
					<a id="btn_search" href="javascript:void(0);" class="easyui-linkbutton" data-options="iconCls:'fa fa-search'" style="width:45%;">查询</a>
					<a id="btn_reset" href="javascript:void(0);" class="easyui-linkbutton" data-options="iconCls:'fa fa-undo'" style="width:45%;">重置</a>
				</div>
			</form>
		</div>
	</div>
</div>


<div class="search-box pd-15">
	<div class="easyui-accordion" id="filedset" style="width: 100%">
		<div title="流程同步列表" data-options="selected:true, iconCls:'fa fa-credit-card'" >

<t:datagrid name="teProcessSyncList" actionUrl="teProcessSyncController.do?datagrid" fit="false">
   <t:dgCol title="主键"  field="id"  hidden="true" ></t:dgCol>
   <t:dgCol title="申请号"  field="syApplyid" ></t:dgCol>
   <t:dgCol title="申请类型"  field="syApplytype" ></t:dgCol>
   <t:dgCol title="级别"  field="syLevel" ></t:dgCol>
   <t:dgCol title="节点编码"  field="syNodecode" ></t:dgCol>
   <t:dgCol title="节点中文名"  field="syNodename" ></t:dgCol>
   <t:dgCol title="用户名"  field="syUsername" ></t:dgCol>
   <t:dgCol title="姓名"  field="syRealname" ></t:dgCol>
   <t:dgCol title="最新流程进度"  field="syCurrentpro" ></t:dgCol>
   
   <t:dgCol title="类型"  field="syType" ></t:dgCol>
   <t:dgCol title="状态"  field="syStatus" ></t:dgCol>
   <t:dgCol title="备注"  field="syNote"  hidden="true" ></t:dgCol>
   <t:dgCol title="排序"  field="sySort" ></t:dgCol>
   <t:dgCol title="版本"  field="syVersion"  hidden="true" ></t:dgCol>
   
   <t:dgCol title="创建人名称"  field="createName"  hidden="true" ></t:dgCol>
   <t:dgCol title="创建人登录名称"  field="createBy"  hidden="true" ></t:dgCol>
   <t:dgCol title="创建日期"  field="createDate" formatter="yyyy-MM-dd" hidden="true" ></t:dgCol>
   <t:dgCol title="更新人名称"  field="updateName"  hidden="true" ></t:dgCol>
   <t:dgCol title="更新人登录名称"  field="updateBy"  hidden="true" ></t:dgCol>
   <t:dgCol title="更新日期"  field="updateDate" formatter="yyyy-MM-dd" hidden="true" ></t:dgCol>
   
   <t:dgCol title="操作" field="opt" width="100"></t:dgCol>
   <t:dgDelOpt title="删除" url="teProcessSyncController.do?doDel&id={id}" />
   <t:dgToolBar title="录入" icon="fa fa-plus" url="teProcessSyncController.do?goAdd" funname="add"></t:dgToolBar>
   <t:dgToolBar title="编辑" icon="fa fa-edit" url="teProcessSyncController.do?goUpdate" funname="update"></t:dgToolBar>
   <t:dgToolBar title="批量删除"  icon="fa fa-remove" url="teProcessSyncController.do?doBatchDel" funname="deleteALLSelect"></t:dgToolBar>
   <t:dgToolBar title="查看123" icon="fa fa-eye" url="teProcessSyncController.do?goUpdate" funname="detail" operationCode="detail"></t:dgToolBar>
  </t:datagrid></div>
  
		</div>
	</div>
</div>

<script>$(function(){teProcessSyncIndex.initAll();});</script>
</app:template>