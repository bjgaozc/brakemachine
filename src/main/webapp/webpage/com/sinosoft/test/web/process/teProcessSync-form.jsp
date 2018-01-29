<%@ page language="java" pageEncoding="UTF-8"%>

<input id="id" name="id" type="hidden" value="${teProcessSyncPage.id }">
<input id="createName" name="createName" type="hidden" value="${teProcessSyncPage.createName }">
<input id="createBy" name="createBy" type="hidden" value="${teProcessSyncPage.createBy }">
<input id="createDate" name="createDate" type="hidden" value="${teProcessSyncPage.createDate }">
<input id="updateName" name="updateName" type="hidden" value="${teProcessSyncPage.updateName }">
<input id="updateBy" name="updateBy" type="hidden" value="${teProcessSyncPage.updateBy }">
<input id="updateDate" name="updateDate" type="hidden" value="${teProcessSyncPage.updateDate }">
<table style="width: 100%;" cellpadding="0" cellspacing="1" class="formtable">
	
	<tr>
		<td align="right">
			<label class="Validform_label">
				申请号:
			</label>
		</td>
		<td class="value">
		     	 <input id="syApplyid" name="syApplyid" type="text" style="width: 150px" class="inputxt"  
					               
						       value='${teProcessSyncPage.syApplyid}'>
			<span class="Validform_checktip"></span>
			<label class="Validform_label" style="display: none;">申请号</label>
		</td>
		<td align="right">
			<label class="Validform_label">
				申请类型:
			</label>
		</td>
		<td class="value">
		     	 <input id="syApplytype" name="syApplytype" type="text" style="width: 150px" class="inputxt"  
					               
						       value='${teProcessSyncPage.syApplytype}'>
			<span class="Validform_checktip"></span>
			<label class="Validform_label" style="display: none;">申请类型</label>
		</td>
	</tr>
	<tr>
		<td align="right">
			<label class="Validform_label">
				级别:
			</label>
		</td>
		<td class="value">
		     	 <input id="syLevel" name="syLevel" type="text" style="width: 150px" class="inputxt"  
					               
						       value='${teProcessSyncPage.syLevel}'>
			<span class="Validform_checktip"></span>
			<label class="Validform_label" style="display: none;">级别</label>
		</td>
		<td align="right">
			<label class="Validform_label">
				节点编码:
			</label>
		</td>
		<td class="value">
		     	 <input id="syNodecode" name="syNodecode" type="text" style="width: 150px" class="inputxt"  
					               
						       value='${teProcessSyncPage.syNodecode}'>
			<span class="Validform_checktip"></span>
			<label class="Validform_label" style="display: none;">节点编码</label>
		</td>
	</tr>
	<tr>
		<td align="right">
			<label class="Validform_label">
				节点中文名:
			</label>
		</td>
		<td class="value">
		     	 <input id="syNodename" name="syNodename" type="text" style="width: 150px" class="inputxt"  
					               
						       value='${teProcessSyncPage.syNodename}'>
			<span class="Validform_checktip"></span>
			<label class="Validform_label" style="display: none;">节点中文名</label>
		</td>
		<td align="right">
			<label class="Validform_label">
				用户名:
			</label>
		</td>
		<td class="value">
		     	 <input id="syUsername" name="syUsername" type="text" style="width: 150px" class="inputxt"  
					               
						       value='${teProcessSyncPage.syUsername}'>
			<span class="Validform_checktip"></span>
			<label class="Validform_label" style="display: none;">用户名</label>
		</td>
	</tr>
	<tr>
		<td align="right">
			<label class="Validform_label">
				姓名:
			</label>
		</td>
		<td class="value">
		     	 <input id="syRealname" name="syRealname" type="text" style="width: 150px" class="inputxt"  
					               
						       value='${teProcessSyncPage.syRealname}'>
			<span class="Validform_checktip"></span>
			<label class="Validform_label" style="display: none;">姓名</label>
		</td>
		<td align="right">
			<label class="Validform_label">
				最新流程进度:
			</label>
		</td>
		<td class="value">
		     	 <input id="syCurrentpro" name="syCurrentpro" type="text" style="width: 150px" class="inputxt"  
					               
						       value='${teProcessSyncPage.syCurrentpro}'>
			<span class="Validform_checktip"></span>
			<label class="Validform_label" style="display: none;">最新流程进度</label>
			</td>
		</tr>
	
	<tr>
		<td align="right">
			<label class="Validform_label">
				类型:
			</label>
		</td>
		<td class="value">
		     	 <input id="syType" name="syType" type="text" style="width: 150px" class="inputxt"  
					               
						       value='${teProcessSyncPage.syType}'>
			<span class="Validform_checktip"></span>
			<label class="Validform_label" style="display: none;">类型</label>
		</td>
		<td align="right">
			<label class="Validform_label">
				状态:
			</label>
		</td>
		<td class="value">
		     	 <input id="syStatus" name="syStatus" type="text" style="width: 150px" class="inputxt"  
					               
						       value='${teProcessSyncPage.syStatus}'>
			<span class="Validform_checktip"></span>
			<label class="Validform_label" style="display: none;">状态</label>
		</td>
	</tr>
	<tr>
		<td align="right">
			<label class="Validform_label">
				备注:
			</label>
		</td>
		<td class="value">
		     	 <input id="syNote" name="syNote" type="text" style="width: 150px" class="inputxt"  
					               
						       value='${teProcessSyncPage.syNote}'>
			<span class="Validform_checktip"></span>
			<label class="Validform_label" style="display: none;">备注</label>
		</td>
		<td align="right">
			<label class="Validform_label">
				排序:
			</label>
		</td>
		<td class="value">
		     	 <input id="sySort" name="sySort" type="text" style="width: 150px" class="inputxt"  
					               
						       value='${teProcessSyncPage.sySort}'>
			<span class="Validform_checktip"></span>
			<label class="Validform_label" style="display: none;">排序</label>
		</td>
	</tr>
	
	<tr style="display: none;">
		<td align="right">
			<label class="Validform_label">
				版本:
			</label>
		</td>
		<td class="value" colspan="3">
		     	 <input id="syVersion" name="syVersion" type="text" style="width: 150px" class="inputxt"  
						       value='${teProcessSyncPage.syVersion}'>
			<span class="Validform_checktip"></span>
			<label class="Validform_label" style="display: none;">版本</label>
		</td>
	</tr>
</table>