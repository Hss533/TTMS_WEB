<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
    
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
	
	function openPerformAddDialog()
	{
		$("#dlg").dialog("open").dialog("setTitle","添加演出计划信息");
		url = "${pageContext.request.contextPath}/background/perform/save.do";
	}
	
	function openPerformModifyDialog()
	{
		var selectedRows = $("#dg").datagrid('getSelections');
		if(selectedRows.length!=1)
		{
			$.messager.alert("系统提示","请选择一条要编辑的数据!");
			return ;
		}
		var row = selectedRows[0];
		alert(row.id);
		$("#dlg").dialog("open").dialog("setTitle","修改权限信息");
		$("#fm").form("load",row);
		url = "${pageContext.request.contextPath}/background/perform/save.do?id="+row.id;
	}
	
	function savePerform()
	{
		var filmSelect= $("#filmId").combobox("getValue");
		if(filmSelect=="")
		{
			alert("请在电影下拉框进行选择");
			return;		
		}
		var studioSelect=$("#studioId").combobox("getValue");
		if(studioSelect=="")
		{
			alert("请在演出厅下拉框进行选择");
			return;		
		}
		
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
			$("#startTime").val("");
			$("#price").val("");
			$("#studioId").combobox("setValue","");
			$("#filmId").combobox("setValue","");
			
		}
	
	
	function deletePerform()
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
				$.post("${pageContext.request.contextPath}/background/perform/delete.do",{ids:ids},function(result){
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
	function closePerformDialog()
	{
		$("#dlg").dialog("close");
		resetValue();
	}
	

	function formatStudioName(val,row)
	{
		return row.studio.name;
	}
	function formatFilmName(val,row)
	{
		return row.film.name;
	}
	
</script>
<title>演出计划管理</title>
</head>
<body style="margin:5px">

	<table id="dg" title="演出计划" class="easyui-datagrid" fitColumns="true" pagination="true" rownumbers="true"
		url="${pageContext.request.contextPath}/background/perform/list.do" fit="true" toolbar="#tb">
		<thead>
		
			<tr>
				<th field="cb" checkbox="true" align="center"></th>
				<th field="id" width="50" align="center">编号</th>
				<th field="film.name" width="100" align="center" formatter="formatFilmName">所选电影</th>
				<th field="studio.name" width="100" align="center" formatter="formatStudioName">所在演出厅</th>
				<th field='startTime' width="100" align="center" >开始时间</th>
				<th field="endTime" width="100" align="center" >结束时间</th>
				<th field="price" width="100" align="center" >票价</th>
				<th field="sold" width="150" align="center">已售票数</th>
			</tr>
		</thead>
	</table>
	<div id="tb">
		<div>
		
			<a href="javascript:openPerformAddDialog()" class="easyui-linkbutton" iconCls="icon-add" plain="true">添加</a>
			<a href="javascript:openPerformModifyDialog()" class="easyui-linkbutton" iconCls="icon-edit" plain="true">修改</a>
			<a href="javascript:deletePerform()" class="easyui-linkbutton" iconCls="icon-remove" plain="true">删除</a>
		</div>
	</div>
	<%--进行添加和修改--%>
	<div id="dlg" class="easyui-dialog" style="width:620px;height:350px;padding:10px 20px" closed="true" buttons="#dlg-buttons">
		<form id="fm" method="post">
			<table cellspacing="8px">
				<tr>
					<td>开始时间</td>
					<td>
					<input type="text" id="startTime" name="startTime" required="true" class="easyui-datetimebox" editable="false"/><font color="red">*</font>
					</td>
				</tr>
				<tr>
					<td>电影选择</td>
					<td><input  id="filmId" name="film.id" class="easyui-combobox" 
					data-options="panelHeight:'auto',editable:false,valueField:'id',textField:'name',url:'${pageContext.request.contextPath}/background/film/combList.do'" >
					<font color="red">*</font></td>
				</tr>
				
				<tr>
					<td>所在演出厅</td>
					<td><input  id="studioId" name="studio.id" class="easyui-combobox" 
					data-options="panelHeight:'auto',editable:false,valueField:'id',textField:'name',url:'${pageContext.request.contextPath}/background/studio/combList.do'" >
					<font color="red">*</font></td>
				</tr>
				<tr>
					<td>票价</td>
					<td><input type="text" id="price" name="price" class="easyui-numberbox" required="true"><font color="red">*</font></td>
				</tr>
			</table>
		</form>
	</div>
	
	<div id="dlg-buttons">
		<a href="javascript:savePerform()" class="easyui-linkbutton" iconCls="icon-ok">保存</a>
		<a href="javascript:closePerformDialog()" class="easyui-linkbutton" iconCls="icon-cancel">关闭</a>
	</div>

</body>
</html>