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
	
	function openFilmAddDialog()
	{
		$("#dlg").dialog("open").dialog("setTitle","添加电影信息");
		url = "${pageContext.request.contextPath}/background/film/save.do";
	}
	
	function openFilmModifyDialog()
	{
		var selectedRows = $("#dg").datagrid('getSelections');
		if(selectedRows.length!=1)
		{
			$.messager.alert("系统提示","请选择一条要编辑的数据!");
			return ;
		}
		var row = selectedRows[0];
		$("#dlg").dialog("open").dialog("setTitle","修改电影信息");
		$("#fm").form("load",row);
		var filmTypes = row.filmTypes;
		var temp = [];
		for(var i=0;i<filmTypes.length;i++)
		{
			temp.push(filmTypes[i].id)
		}
		alert(temp);
		$("#typeName").combobox("setValues",temp);
		$("#employeeId").combobox("setValue",row.employee.id);
		url = "${pageContext.request.contextPath}/background/film/save.do?id="+row.id;
	}
	
	function saveFilm()
	{
		$("#fm").form("submit",{
			url:url,
			onSubmit:function()
			{
				var employeeId = $("#employeeId").combobox("getValue");
				var resume = $("#resume").val();
				var coverImage = $("#coverImage").val();
				if((coverImage == null || coverImage == '') && url.indexOf("id") == -1)
				{
					alert("请选择图片");
					return false;
				}
				if(employeeId == null || employeeId == '')
				{
					alert("请选择导演");
					return false;
				}
				if(resume == null || resume == '')
				{
					alert("描述不能为空");
					return false;
				}
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
		
	}
	
	function closeFilmDialog()
	{
		$("#dlg").dialog("close");
		resetValue();
	}
	
	function deleteFilm()
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
				$.post("${pageContext.request.contextPath}/background/film/delete.do",{ids:ids},function(result){
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
	
	function formatCover(val,row)
	{
		if(val != null && val != '')
		{
			return "<img width='100' height='120' src='${pageContext.request.contextPath}/"+val+"'>";
		}
		else
		{
			return null;
		}
	}
	
	function fromatIsHot(val,row)
	{
		if(val == 1)
		{
			return "是";
		}
		else
		{
			return "否";
		}
	}
	
	function fromatFilmType(val,row)
	{
		var types = row.filmTypes;
		var result = "";
		for(var i=0;i<types.length;i++)
		{
			if(i == 0)
			{
				result = result + types[i].typeName;
			}
			else
			{
				result = result + "," + types[i].typeName;
			}
		}
		return result;
	}
	
	function formatDirector(val,row)
	{
		return row.employee.name;
	}

</script>
<title>电影管理</title>
</head>
<body style="margin:5px">

	<table id="dg" title="电影管理" class="easyui-datagrid" pagination="true" rownumbers="true"
		url="${pageContext.request.contextPath}/background/film/list.do" fit="true" toolbar="#tb">
		<thead data-options="frozen:true">
			<tr>
				<th field="cb" width="30" checkbox="true" align="center"></th>
				<th field="id" width="50" align="center">编号</th>
				<th field="name" width="200" align="center">电影名称</th>
				<th field="englishName" width="200" align="center">英文名称</th>
				<th field="cover" width="150" align="center" formatter="formatCover">封面图片</th>
				<th field="resume" width="250" align="center">描述</th>
				<th field="filmType" width="100" align="center" formatter="fromatFilmType">电影类型</th>
			</tr>
		</thead>
		<thead>
			<tr>
				<th field="director" width="150" align="center" formatter="formatDirector">导演</th>
				<th field="publishDate" width="100" align="center">发布时间</th>
				<th field="duration" width="100" align="center">电影时长</th>
				<th field="score" width="100" align="center">豆瓣得分</th>
				<th field="box" width="50" align="center">票房</th>
				<th field="isHot" width="100" align="center" formatter="fromatIsHot">是否热门</th>
				<th field="clickHit" width="100" align="center">点击次数</th>
			</tr>
		</thead>
	</table>
	
	<div id="tb">
		<div>
			<a href="javascript:openFilmAddDialog()" class="easyui-linkbutton" iconCls="icon-add" plain="true">添加</a>
			<a href="javascript:openFilmModifyDialog()" class="easyui-linkbutton" iconCls="icon-edit" plain="true">修改</a>
			<a href="javascript:deleteFilm()" class="easyui-linkbutton" iconCls="icon-remove" plain="true">删除</a>
		</div>
	</div>
	
	<div id="dlg" class="easyui-dialog" style="width:700px;height:450px;padding:10px 20px" closed="true" buttons="#dlg-buttons">
		<form id="fm" method="post" enctype="multipart/form-data">
			<table cellspacing="10px">
				<tr>
					<td>电影名称:</td>
					<td><input type="text" id="name" name="name" class="easyui-validatebox" required="true"><font color="red">*</font></td>
					<td>英文名称:</td>
					<td><input type="text" id="englishName" name="englishName" class="easyui-validatebox" required="true"><font color="red">*</font></td>
				</tr>
				<tr>
					<td>封面图片:</td>
					<td><input type="file" id="coverImage" name="coverImage"/><font color="red">*</font></td>
					<td>电影类型:</td>
					<td><input class="easyui-combobox" id="typeName" name="filmTypeIds" required="true" data-options="panelHeight:'auto',editable:false,valueField:'id',textField:'typeName',multiple:true,url:'${pageContext.request.contextPath}/background/filmType/combList.do'"/><font color="red">*</font></td>
				</tr>
				<tr>
					<td>导演:</td>
					<td><input class="easyui-combobox" id="employeeId" name="employee.id" data-options="panelHeight:'auto',editable:false,valueField:'id',textField:'name',url:'${pageContext.request.contextPath}/background/employee/combList.do'"/><font color="red">*</font></td>
					<td>上映日期:</td>
					<td><input type="text" id="publishDate" name="publishDate" required="true" class="easyui-datebox" editable="false"/><font color="red">*</font></td>
				</tr>
				<tr>
					<td>电影时长:</td>
					<td><input type="text" id="duration" name="duration" class="easyui-validatebox" required="true"><font color="red">*</font></td>
					<td>豆瓣得分:</td>
					<td><input type="text" id="score" name="score" class="easyui-validatebox" required="true"><font color="red">*</font></td>
				</tr>
				<tr>
					<td valign="top">描述:</td>
					<td colspan="3">
						<textarea rows="12" cols="60" id="resume" name="resume"></textarea>
					</td>
				</tr>
			</table>
		</form>
	</div>
	
	<div id="dlg-buttons">
		<a href="javascript:saveFilm()" class="easyui-linkbutton" iconCls="icon-ok">保存</a>
		<a href="javascript:closeFilmDialog()" class="easyui-linkbutton" iconCls="icon-cancel">关闭</a>
	</div>

</body>
</html>