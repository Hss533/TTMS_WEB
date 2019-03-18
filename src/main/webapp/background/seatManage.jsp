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

	function formatStudioName(val,row)
	{
		
		return row.studio.name;
	}
	
	function formatTypeName(val,row)
	{
		return row.seatType.name;
	}

</script>
<title>座位信息管理</title>
</head>
<body style="margin:5px">

	<table id="dg" title="座位信息管理" class="easyui-datagrid" fitColumns="true" pagination="true" rownumbers="true"
		url="${pageContext.request.contextPath}/background/seat/list.do" fit="true" toolbar="#tb">
		<thead>
			<tr>
				<th field="cb" checkbox="true" align="center"></th>
				<th field="id" width="50" align="center">编号</th>
				<th field="studio.name" width="100" align="center" formatter="formatStudioName">所在演出厅</th>
				<th field="row" width="150" align="center">行数</th>
				<th field="col" width="150" align="center">列数</th>
				<th field="seatType.name" width="150" align="center" formatter="formatTypeName">座位状态</th>
			</tr>
		</thead>
	</table>
	
	<div id="tb">
		<div>
			<a href="#" class="easyui-linkbutton" iconCls="icon-edit" plain="true">##</a>
		</div>
	</div>

</body>
</html>