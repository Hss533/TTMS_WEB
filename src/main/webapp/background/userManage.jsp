<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/static/jquery-easyui-1.3.3/themes/default/easyui.css">
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/static/jquery-easyui-1.3.3/themes/icon.css">
<script type="text/javascript" src="${pageContext.request.contextPath}/static/jquery-easyui-1.3.3/jquery.min.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/static/jquery-easyui-1.3.3/jquery.easyui.min.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/static/jquery-easyui-1.3.3/locale/easyui-lang-zh_CN.js"></script>
<script type="text/javascript">

	var url;
	
	function openUserAddDialog()
	{
		$("#dlg").dialog("open").dialog("setTitle","添加用户信息");
		url = "${pageContext.request.contextPath}/background/user/save.do";
	}
	
	function openUserModifyDialog()
	{
		var selectedRows = $("#dg").datagrid('getSelections');
		if(selectedRows.length!=1)
		{
			$.messager.alert("系统提示","请选择一条要编辑的数据!");
			return ;
		}
		var row = selectedRows[0];
		$("#dlg").dialog("open").dialog("setTitle","修改用户信息");
		$("#fm").form("load",row);
		$("#powerId").combobox("setValue",row.power.id);
		url = "${pageContext.request.contextPath}/background/user/save.do?id="+row.id;
	}
	
	function saveUser()
	{
		$("#fm").form("submit",{
			url:url,
			onSubmit:function()
			{
				return $(this).form("validate");
			},
			success:function(result)
			{
				var result = eval('(' + result + ')');
				if(result.success)
				{
					$.messager.alert("系统提示","保存成功!");
					resetValue();
					$("#dlg").dialog("close");
					$("#dg").datagrid("reload");
				}
				else
				{
					$.messager.alert("系统提示","保存失败!");
					return ;
				}
			}
		});
	}
	
	function resetValue()
	{
		$("#account").val("");
		$("#password").val("");
		$("#nickname").val("");
		$("#telephone").val("");
		$("#powerId").combobox("setValue","");
	}
	
	function closeUserDialog()
	{
		$("#dlg").dialog("close");
		resetValue();
	}
	
	function deleteUser()
	{
		var selectedRows = $("#dg").datagrid('getSelections');
		if(selectedRows.length < 1)
		{
			$.messager.alert("系统提示","请至少选择一条要删除的数据!");
			return ;
		}
		var strIds = [];
		for(var i=0;i<selectedRows.length;i++)
		{
			strIds.push(selectedRows[i].id);
		}
		var ids = strIds.join(",");
		$.messager.confirm("系统提示","您确定要删除这<font color='red'>"+selectedRows.length+"</font>条数据吗?",function(r){
			if(r)
			{
				$.post("${pageContext.request.contextPath}/background/user/delete.do",{ids:ids},function(result){
					if(result.success)
					{
						$.messager.alert("系统提示","数据已成功删除！");
						$("#dg").datagrid("reload");
					}
					else
					{
						$.messager.alert("系统提示","数据删除失败，请联系管理员！");javascript:void(0)
					}
				},"json");
			}
		});
	}
	function formatTypeName(val,row)
	{
		return row.power.name; 
	}	
</script>
<title>用户管理</title>
</head>
<body style="margin:5px">

	<table id="dg" title="用户信息管理" class="easyui-datagrid" fitColumns="true" pagination="true" rownumbers="true"
		url="${pageContext.request.contextPath}/background/user/list.do" fit="true" toolbar="#tb">
		<thead>
			<tr>
				<th field="cb" checkbox="true" align="center"></th>
				<th field="id" width="50" align="center">编号</th>
				<th field="account" width="100" align="center">用户名</th>
				<th field="password" width="150" align="center">密码</th>
				<th field="nickname" width="150" align="center">昵称</th>
				<th field="telephone" width="150" align="center">联系电话</th>
				<th field="power.id" width="150" align="center" formatter="formatTypeName">权限名称</th>
			</tr>
		</thead>
	</table>
	
	<div id="tb">
		<div>
			<a href="javascript:openUserAddDialog()" class="easyui-linkbutton" iconCls="icon-add" plain="true">添加</a>
			<a href="javascript:openUserModifyDialog()" class="easyui-linkbutton" iconCls="icon-edit" plain="true">修改</a>
			<a href="javascript:deleteUser()" class="easyui-linkbutton" iconCls="icon-remove" plain="true">删除</a>
		</div>
	</div>
	<%--添加 --%>
	<div id="dlg" class="easyui-dialog" style="width:620px;height:350px;padding:10px 20px" closed="true" buttons="#dlg-buttons">
		<form id="fm" method="post">
			<table cellspacing="8px">
				<tr>
					<td>用户名</td>
					<td><input type="text" id="account" name="account" class="easyui-validatebox" required="true"><font color="red">*</font></td>
				</tr>
				<tr>
					<td>密码</td>
					<td><input type="text" id="password" name="password" class="easyui-validatebox" required="true"><font color="red">*</font></td>
				</tr>
				
				<tr>
					<td>权限名称</td>
					<td><input  id="powerId" name="power.id" class="easyui-combobox" 
					data-options="panelHeight:'auto',editable:false,valueField:'id',textField:'name',url:'${pageContext.request.contextPath}/background/power/combList.do'" >
					<font color="red">*</font></td>
				</tr>
			</table>
		</form>
	</div>
	
	<div id="dlg-buttons">
		<a href="javascript:saveUser()" class="easyui-linkbutton" iconCls="icon-ok">保存</a>
		<a href="javascript:closeUserDialog()" class="easyui-linkbutton" iconCls="icon-cancel">关闭</a>
	</div>

</body>
</html>