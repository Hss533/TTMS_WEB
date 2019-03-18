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
	
	function openLinkAddDialog()
	{
		$("#dlg").dialog("open").dialog("setTitle","添加友情链接信息");
		url = "${pageContext.request.contextPath}/background/link/save.do";
	}
	
	function openLinkModifyDialog()
	{
		var selectedRows = $("#dg").datagrid('getSelections');
		if(selectedRows.length!=1)
		{
			$.messager.alert("系统提示","请选择一条要编辑的数据!");
			return ;
		}
		var row = selectedRows[0];
		$("#dlg").dialog("open").dialog("setTitle","修改友情链接信息");
		$("#fm").form("load",row);
		url = "${pageContext.request.contextPath}/background/link/save.do?id="+row.id;
	}
	
	function saveLink()
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
		$("#linkName").val("");
		$("#linkUrl").val("");
	}
	
	function closeLinkDialog()
	{
		$("#dlg").dialog("close");
		resetValue();
	}
	
	function deleteLink()
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
				$.post("${pageContext.request.contextPath}/background/link/delete.do",{ids:ids},function(result){
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
<title>友情链接管理</title>
</head>
<body style="margin:5px">

	<table id="dg" title="友情链接管理" class="easyui-datagrid" fitColumns="true" pagination="true" rownumbers="true"
		url="${pageContext.request.contextPath}/background/link/list.do" fit="true" toolbar="#tb">
		<thead>
			<tr>
				<th field="cb" checkbox="true" align="center"></th>
				<th field="id" width="50" align="center">编号</th>
				<th field="linkName" width="100" align="center">友情链接名称</th>
				<th field="linkUrl" width="150" align="center">友情链接地址</th>
			</tr>
		</thead>
	</table>
	
	<div id="tb">
		<div>
			<a href="javascript:openLinkAddDialog()" class="easyui-linkbutton" iconCls="icon-add" plain="true">添加</a>
			<a href="javascript:openLinkModifyDialog()" class="easyui-linkbutton" iconCls="icon-edit" plain="true">修改</a>
			<a href="javascript:deleteLink()" class="easyui-linkbutton" iconCls="icon-remove" plain="true">删除</a>
		</div>
	</div>
	
	<div id="dlg" class="easyui-dialog" style="width:620px;height:150px;padding:10px 20px" closed="true" buttons="#dlg-buttons">
		<form id="fm" method="post">
			<table cellspacing="8px">
				<tr>
					<td>友情链接名称:</td>
					<td><input type="text" id="linkName" name="linkName" class="easyui-validatebox" required="true"><font color="red">*</font></td>
				</tr>
				<tr>
					<td>友情链接地址:</td>
					<td><input type="text" id="linkUrl" name="linkUrl" class="easyui-validatebox" required="true" validType="url"><font color="red">*</font></td>
				</tr>
			</table>
		</form>
	</div>
	
	<div id="dlg-buttons">
		<a href="javascript:saveLink()" class="easyui-linkbutton" iconCls="icon-ok">保存</a>
		<a href="javascript:closeLinkDialog()" class="easyui-linkbutton" iconCls="icon-cancel">关闭</a>
	</div>

</body>
</html>