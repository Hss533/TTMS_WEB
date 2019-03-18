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
	
	function openPowerAddDialog()
	{
		$("#dlg").dialog("open").dialog("setTitle","添加权限信息");
		url = "${pageContext.request.contextPath}/background/power/save.do";
	}
	
	function openPowerModifyDialog()
	{
		var selectedRows = $("#dg").datagrid('getSelections');
		if(selectedRows.length!=1)
		{
			$.messager.alert("系统提示","请选择一条要编辑的数据!");
			return ;
		}
		var row = selectedRows[0];
		$("#dlg").dialog("open").dialog("setTitle","修改权限信息");
		$("#fm").form("load",row);
		url = "${pageContext.request.contextPath}/background/power/save.do?id="+row.id;
	}
	
	function savePower()
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
		$("#name").val("");
		$("#powerDescribe").val("");
		$("#floor").val("");
		$("#discount").val("");
	}
	
	function closePowerDialog()
	{
		$("#dlg").dialog("close");
		resetValue();
	}
	
	function deletePower()
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
				$.post("${pageContext.request.contextPath}/background/power/delete.do",{ids:ids},function(result){
					if(result.success)
					{
						$.messager.alert("系统提示","数据已成功删除！");
						$("#dg").datagrid("reload");
					}
					else
					{
						$.messager.alert("系统提示","数据删除失败，请联系管理员！");
					}
				},"json");
			}
		});
	}

</script>
<title>权限管理</title>
</head>
<body style="margin:5px">

	<table id="dg" title="权限管理" class="easyui-datagrid" fitColumns="true" pagination="true" rownumbers="true"
		url="${pageContext.request.contextPath}/background/power/list.do" fit="true" toolbar="#tb">
		<thead>
			<tr>
				<th field="cb" checkbox="true" align="center"></th>
				<th field="id" width="50" align="center">编号</th>
				<th field="name" width="100" align="center">权限名称</th>
				<th field="powerDescribe" width="150" align="center">权限描述</th>
				<th field="floor" width="50" align="center">下限(满足折扣的最低价)</th>
				<th field="discount" width="50" align="center">折扣</th>
			</tr>
		</thead>
	</table>
	
	<div id="tb">
		<div>
			<a href="javascript:openPowerAddDialog()" class="easyui-linkbutton" iconCls="icon-add" plain="true">添加</a>
			<a href="javascript:openPowerModifyDialog()" class="easyui-linkbutton" iconCls="icon-edit" plain="true">修改</a>
			<a href="javascript:deletePower()" class="easyui-linkbutton" iconCls="icon-remove" plain="true">删除</a>
		</div>
	</div>
	
	<div id="dlg" class="easyui-dialog" style="width:620px;height:350px;padding:10px 20px" closed="true" buttons="#dlg-buttons">
		<form id="fm" method="post">
			<table cellspacing="8px">
				<tr>
					<td>权限名称</td>
					<td><input type="text" id="name" name="name" class="easyui-validatebox" required="true"><font color="red">*</font></td>
				</tr>
				<tr>
					<td>权限描述</td>
					<td><input type="text" id="powerDescribe" name="powerDescribe" class="easyui-validatebox" required="true" ><font color="red">*</font></td>
				</tr>
				<tr>
					<td>下限(满足折扣的最低价)</td>
					<td><input type="text" id="floor" name="floor" class="easyui-validatebox" required="true" validType="digits"><font color="red">*</font></td>
				</tr>
				<tr>
					<td>折扣</td>
					<td><input type="text" id="discount" name="discount" class="easyui-validatebox" required="true" validType="number"><font color="red">*</font></td>
				</tr>
			</table>
		</form>
	</div>
	
	<div id="dlg-buttons">
		<a href="javascript:savePower()" class="easyui-linkbutton" iconCls="icon-ok">保存</a>
		<a href="javascript:closePowerDialog()" class="easyui-linkbutton" iconCls="icon-cancel">关闭</a>
	</div>

</body>
</html>