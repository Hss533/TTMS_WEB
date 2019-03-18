<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

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
	
	$(function(){
		$(".easyui-accordion").accordion('getSelected').panel('collapse');
	});
	
	function openTab(text,url,iconCls)
	{
		if($("#tabs").tabs("exists",text))
		{
			$("#tabs").tabs("select",text);
			return ;
		}
		var content="<iframe frameborder=0 scrolling='auto' style='width:100%;height:100%' src='${pageContext.request.contextPath}/background/"+url+"'></iframe>";
		$("#tabs").tabs("add",{
			title:text,
			iconCls:iconCls,
			closable:true,
			content:content
		});
	}
	
	function openPasswordModifyDialog()
	{
		$("#dlg").dialog("open").dialog("setTitle","修改用户密码");
		url="${pageContext.request.contextPath}/manager2/modifyPassword.do?id=${currentManager.id}";
	}
	
	function modifyPassword()
	{
		$("#fm").form("submit",{
			url:url,
			onSubmit:function()
			{
				var oldPassword = $("#oldPassword").val();
				var newPassword = $("#newPassword").val();
				var newPassword2 = $("#newPassword2").val();
				if(!$(this).form("validate"))
				{
					return false;
				}
				if(oldPassword != "${currentManager.password}")
				{
					$.messager.alert("系统提示","用户原密码错误!");
					return false;
				}
				if(newPassword != newPassword2)
				{
					$.messager.alert("系统提示","新密码和确认密码不同!");
					return false;
				}
				return true;
			},
			success:function(result)
			{
				var result = eval('('+result+')');
				if(result.success)
				{
					$.messager.alert("系统提示","密码修改成功，下次登录生效");
					resetValue();
					$("#dlg").dialog("close");
				}
				else
				{
					$.messager.alert("系统提示","修改失败!");
					return ;
				}
			}
		});
	}
	
	function refreshSystem()
	{
		$.post("${pageContext.request.contextPath}/background/system/refreshSystem.do",{},
			function(result)
			{
				if(result.success)
				{
					$.messager.alert("系统提示","刷新成功");
				}
				else
				{
					$.messager.alert("系统提示","刷新失败");
				}
			},"json");
	}
	
	function closemodifyPasswordDialog()
	{
		$("#dlg").dialog("close");
		resetValue();
	}
	
	function resetValue()
	{
		$("#oldPassword").val("");
		$("#newPassword").val("");
		$("#newPassword2").val("");
	}
	
	function logout()
	{
		$.messager.confirm("系统提示","您确定要退出系统吗?",function(r){
			if(r)
			{
				window.location.href="${pageContext.request.contextPath}/manager2/logout.do";
			}
		});
	}

</script>
<title>皮皮胡电影院后台管理</title>
</head>
<body class="easyui-layout">
	<div region="north"	style="height:90px;background-color:#E0ECFF; padding:none;margin:none;">
		<table width="100%">
			<tr>
				<td width="50%">
					<div style="padding:1px 25px; margin: none;">
						<img alt="logo" src="${pageContext.request.contextPath}/static/image/logo.jpg" />
					</div>
				</td>
				<td valign="bottom" align="right" width="50%">
					<div style="padding-right: 15px;">
						<font size="3">&nbsp;&nbsp;<strong>
						<c:if test="${currentManager.power == 1 }">
							系统管理员：
						</c:if> 
						<c:if test="${currentManager.power == 2 }">
							售票员：
						</c:if> 
						</strong>${currentManager.name }</font>
					</div>
				</td>
			</tr>
		</table>
	</div>
	
	<div region="center">
		<div class="easyui-tabs" fit="true" border="false" id="tabs">
			<div title="首页" data-options="iconCls:'icon-home'">
				<div align="center" style="padding-top:100px">
					<font color="red" size="10">欢迎使用</font>
				</div>
			</div>
		</div>
	</div>
	<!-- addInformation -->
	
	<div region="west" style="width:200px" title="导航菜单" split="true">
		<c:if test="${currentManager.power == 1 }">
			<div class="easyui-accordion" data-options="fit:true,border:false">
				<div title="常用操作" data-options="iconCls:'icon-item'" style="padding: 10px">
					<a href="javascript:openTab('电影信息管理','filmManage.jsp','icon-yxjhgl')" class="easyui-linkbutton" data-options="plain:true,iconCls:'icon-yxjhgl'" style="width: 150px;">电影信息管理</a>
					<a href="javascript:openTab('添加资讯','test.jsp','icon-yxjhgl')" class="easyui-linkbutton" data-options="plain:true,iconCls:'icon-yxjhgl'" style="width: 150px">添加资讯</a>
					<a href="javascript:openTab('演出计划管理','performManage.jsp','icon-yxjhgl')" class="easyui-linkbutton" data-options="plain:true,iconCls:'icon-yxjhgl'" style="width: 150px;">演出计划管理</a>
					<a href="javascript:refreshSystem()" class="easyui-linkbutton" data-options="plain:true,iconCls:'icon-refresh'" style="width: 150px;">刷新系统缓存</a>
					<a href="javascript:openPasswordModifyDialog()" class="easyui-linkbutton" data-options="plain:true,iconCls:'icon-modifyPassword'" style="width: 150px;">修改密码</a>
					<a href="javascript:openTab('用户管理','userManage.jsp','icon-notice')" class="easyui-linkbutton" data-options="plain:true,iconCls:'icon-notice'" style="width: 150px;">用户管理</a>			
				</div>
				<div title="电影管理" data-options="iconCls:'icon-yxgl'" style="padding:10px">
					<a href="javascript:openTab('电影信息管理','filmManage.jsp','icon-yxjhgl')" class="easyui-linkbutton" data-options="plain:true,iconCls:'icon-yxjhgl'" style="width: 150px;">电影信息管理</a>
					<a href="javascript:openTab('电影类型管理','filmTypeManage.jsp','icon-khkfjh')" class="easyui-linkbutton" data-options="plain:true,iconCls:'icon-khkfjh'" style="width: 150px;">电影类型管理</a>
				</div>
				<div title="演出计划管理"  data-options="iconCls:'icon-khgl'" style="padding:10px;">
					<a href="javascript:openTab('演出计划管理','performManage.jsp','icon-yxjhgl')" class="easyui-linkbutton" data-options="plain:true,iconCls:'icon-yxjhgl'" style="width: 150px;">演出计划管理</a>
				</div>
				<div title="演出厅管理"  data-options="iconCls:'icon-khgl'" style="padding:10px;">
					<a href="javascript:openTab('演出厅信息管理','studioManage.jsp','icon-khkfjh')" class="easyui-linkbutton" data-options="plain:true,iconCls:'icon-khkfjh'" style="width: 150px;">演出厅管理</a>
					<a href="javascript:openTab('座位状态信息管理','seatTypeManage.jsp','icon-yxjhgl')" class="easyui-linkbutton" data-options="plain:true,iconCls:'icon-yxjhgl'" style="width: 150px;">座位状态管理</a>
					<a href="javascript:openTab('座位信息管理管理','seatManage.jsp','icon-khkfjh')" class="easyui-linkbutton" data-options="plain:true,iconCls:'icon-khkfjh'" style="width: 150px;">座位信息管理</a>
				</div>
				<div title="客户管理"  data-options="iconCls:'icon-khgl'" style="padding:10px;">
					<a href="javascript:openTab('用户管理','userManage.jsp','icon-notice')" class="easyui-linkbutton" data-options="plain:true,iconCls:'icon-notice'" style="width: 150px;">用户管理</a>
					<a href="javascript:openTab('权限管理','powerManage.jsp','icon-notice')" class="easyui-linkbutton" data-options="plain:true,iconCls:'icon-notice'" style="width: 150px;">权限管理</a>
				</div>
				<div title="订单管理"  data-options="iconCls:'icon-khgl'" style="padding:10px;">
					<a href="javascript:openTab('订单管理','ticketManage.jsp','icon-notice')" class="easyui-linkbutton" data-options="plain:true,iconCls:'icon-notice'" style="width: 150px;">订单管理</a>
					
				</div>
				<div title="电影资讯管理" data-options="iconCls:'icon-khgl'" style="padding:10px;">
					<a href="javascript:openTab('添加资讯','addInformation.jsp','icon-yxjhgl')" class="easyui-linkbutton" data-options="plain:true,iconCls:'icon-yxjhgl'" style="width: 150px">添加资讯</a>
					<a href="javascript:openTab('资讯管理','informationManage.jsp','icon-notice')" class="easyui-linkbutton" data-options="plain:true,iconCls:'icon-notice'" style="width: 150px;">资讯管理</a>
				</div>
				<div title="报表统计"  data-options="iconCls:'icon-khgl'" style="padding:10px;">
					
				</div>
				<div title="留言管理"  data-options="iconCls:'icon-khgl'" style="padding:10px;">
					
				</div>
				<div title="标签管理"  data-options="iconCls:'icon-tag'" style="padding:10px">
					<a href="javascript:openTab('友情链接管理','linkManage.jsp','icon-notice')" class="easyui-linkbutton" data-options="plain:true,iconCls:'icon-notice'" style="width: 150px;">友情链接管理</a>
				</div>
				<div title="系统管理"  data-options="iconCls:'icon-item'" style="padding:10px">
					<a href="javascript:openPasswordModifyDialog()" class="easyui-linkbutton" data-options="plain:true,iconCls:'icon-modifyPassword'" style="width: 150px;">修改密码</a>
					<a href="javascript:refreshSystem()" class="easyui-linkbutton" data-options="plain:true,iconCls:'icon-refresh'" style="width: 150px;">刷新系统缓存</a>
					<a href="javascript:logout()" class="easyui-linkbutton" data-options="plain:true,iconCls:'icon-exit'" style="width: 150px;">安全退出</a>
				</div>
			</div>
		</c:if>
		<c:if test="${currentManager.power == 2 }">
			<div class="easyui-accordion" data-options="fit:true,border:false">
				<div title="常用操作" data-options="iconCls:'icon-item'" style="padding: 10px">
					<a href="javascript:openTab('电影信息管理','filmManage.jsp','icon-yxjhgl')" class="easyui-linkbutton" data-options="plain:true,iconCls:'icon-yxjhgl'" style="width: 150px;">电影信息管理</a>
					<a href="javascript:openTab('添加资讯','addInformation.jsp','icon-yxjhgl')" class="easyui-linkbutton" data-options="plain:true,iconCls:'icon-yxjhgl'" style="width: 150px">添加资讯</a>
					<a href="javascript:openPasswordModifyDialog()" class="easyui-linkbutton" data-options="plain:true,iconCls:'icon-modifyPassword'" style="width: 150px;">修改密码</a>
				</div>
				<div title="电影管理" data-options="iconCls:'icon-yxgl'" style="padding:10px">
					<a href="javascript:openTab('电影信息管理','filmManage.jsp','icon-yxjhgl')" class="easyui-linkbutton" data-options="plain:true,iconCls:'icon-yxjhgl'" style="width: 150px;">电影信息管理</a>
					<a href="javascript:openTab('电影类型管理','filmTypeManage.jsp','icon-khkfjh')" class="easyui-linkbutton" data-options="plain:true,iconCls:'icon-khkfjh'" style="width: 150px;">电影类型管理</a>
				</div>
				<div title="订单管理"  data-options="iconCls:'icon-khgl'" style="padding:10px;">
					
				</div>
				<div title="电影资讯管理" data-options="iconCls:'icon-khgl'" style="padding:10px;">
					<a href="javascript:openTab('添加资讯','addInformation.jsp','icon-yxjhgl')" class="easyui-linkbutton" data-options="plain:true,iconCls:'icon-yxjhgl'" style="width: 150px">添加资讯</a>
					<a href="javascript:openTab('资讯管理','informationManage.jsp','icon-notice')" class="easyui-linkbutton" data-options="plain:true,iconCls:'icon-notice'" style="width: 150px;">资讯管理</a>
				</div>
				<div title="系统管理"  data-options="iconCls:'icon-item'" style="padding:10px">
					<a href="javascript:openPasswordModifyDialog()" class="easyui-linkbutton" data-options="plain:true,iconCls:'icon-modifyPassword'" style="width: 150px;">修改密码</a>
					<a href="javascript:logout()" class="easyui-linkbutton" data-options="plain:true,iconCls:'icon-exit'" style="width: 150px;">安全退出</a>
				</div>
			</div>
		</c:if>
	</div>
	
	<div region="south" style="height:30px; padding:5px" align="center">
		
	</div>
	
	<div id="dlg" class="easyui-dialog" style="width:400px;height:250px;padding:10px 20px" closed="true" buttons="#dlg-buttons">
		<form id="fm" method="post">
			<table cellspacing="8px">
				<tr>
					<td>用户名:</td>
					<td><input type="text" id="account" name="account" value="${currentManager.account }" readonly="readonly" style="width:200px;"></td>
				</tr>
				<tr>
					<td>原密码:</td>
					<td><input type="password" id="oldPassword" name="oldPassword" class="easyui-validatebox" required="true" style="width:200px;"></td>
				</tr>
				<tr>
					<td>新密码:</td>
					<td><input type="password" id="newPassword" name="newPassword" class="easyui-validatebox" required="true" style="width:200px;"></td>
				</tr>
				<tr>
					<td>确认新密码:</td>
					<td><input type="password" id="newPassword2" name="newPassword2" class="easyui-validatebox" required="true" style="width:200px;"></td>
				</tr>
			</table>
		</form>
	</div>
	
	<div id="dlg-buttons">
		<a href="javascript:modifyPassword()" class="easyui-linkbutton" iconCls="icon-ok">保存</a>
		<a href="javascript:closemodifyPasswordDialog()" class="easyui-linkbutton" iconCls="icon-cancel">关闭</a>
	</div>

</body>
</html>