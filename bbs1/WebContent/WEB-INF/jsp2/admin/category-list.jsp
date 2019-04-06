<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<table class="easyui-datagrid" id="categoryList" title="bbs列表"
	data-options="singleSelect:true,collapsible:true,pagination:true,url:'bbs/category.action',method:'get',pageSize:30,toolbar:toolbar">
	<thead>
		<tr>
			<th data-options="field:'ck',checkbox:true"></th>
			<th data-options="field:'id',width:60,">板块ID</th>
			<th data-options="field:'name',width:300">板块名称</th>
			<th data-options="field:'administratorid',width:60">管理员ID</th>
		</tr>
	</thead>
</table>

<div id="win" title="编辑" style="width: 400px; display: none">
	<div style="padding: 10px 60px 20px 60px;">
		<form id="ff" method="post" action="addCategory.action">
			<input type="hidden" name="id" value="${id }">
			<table cellpadding="5">
				<tr>
					<td>板块名称:</td>
					<td><input class="easyui-validatebox" type="text" name="name"
						value="${name }" required="true"></input></td>
				</tr>
				<tr>
					<td>板块管理员:</td>
					<td><input class="easyui-validatebox" type="text"
						name="administratorid" value="${administratorid }"
						required="true" validType="integer"></input></td>
				</tr>
			</table>
		</form>
		<div style="text-align: center; padding: 5px">
			<a href="javascript:void(0)" class="easyui-linkbutton"
				onclick="submitForm()">Submit</a> <a href="javascript:void(0)"
				class="easyui-linkbutton" onclick="clearForm()">Clear</a>
		</div>
	</div>
</div>

<script>
	function getSelectionsIds() {
		var categoryList = $("#categoryList");
		var sels = categoryList.datagrid("getSelections");
		var id = sels[0].id;

		return id;
	}

	function submitForm() {
		$("#ff").ajaxSubmit({
			type : "POST",
			url : "saveCategory.action",
			success : function(data) {
				if (data.status == 200) {
					$.messager.alert('提示', '操作成功!', undefined, function() {
						$('#win').window('close');  
						$("#categoryList").datagrid("reload");
					});
				}
			}
		})
	}
	function clearForm() {
		$('#ff').form('clear');
	}

	$(function() {

		datagrid = $("#categoryList").datagrid({
			
					queryParams : {

					}, //查询参数
					toolbar : [
							{
								text : '添加',
								iconCls : 'icon-add',
								handler : function() {
									$("#win").window({
										height : 200,
										width : 400,
										modal : true,
										//关掉窗口后清空信息
										onClose : function() {
											$("[name='id']").val("")
											$("[name='name']").val("")
											$("[name='adminstratorid']").val("")
										}
									})
									$("#win").show();

								}
							},
							'-',
							{
								text : '修改',
								iconCls : 'icon-edit',
								handler : function() {
									var ids = getSelectionsIds();
									if (typeof (ids) == "undefind") {
										$.messager.alert('提示', '未选中板块!');
										return;
									}
									$("#win").window({
										height : 200,
										width : 400,
										modal : true,
										onClose : function() {
											$("[name='id']").val("")
											$("[name='name']").val("")
											$("[name='adminstratorid']").val("")
										}
									})
									$("#win").show();
									$("[name='id']").val(
											$("tbody :checkbox:checked")
													.parent().parent().next()
													.children().eq(0).text())
									$("[name='name']").val(
											$("tbody :checkbox:checked")
													.parent().parent().next()
													.next().children().eq(0)
													.text())
									$("[name='administratorid']").val(
											$("tbody :checkbox:checked")
													.parent().parent().next()
													.next().next().children()
													.eq(0).text())
													
												

								}
							}, '-' ],
					

				});
	});
</script>