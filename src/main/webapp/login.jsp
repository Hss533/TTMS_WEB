<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page language="java" import="com.ttms.entity.User"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">

<link href="${pageContext.request.contextPath }/static/css/login.css" rel="stylesheet" type="text/css">
<script type="text/javascript" src="${pageContext.request.contextPath}/static/jquery-easyui-1.3.3/jquery.min.js"></script>
<script type="text/javascript">

	function checkForm()
	{
		var userName=$("#userName").val();
		var password=$("#password").val();
		if(userName==null || userName=="")
		{
			$(".error").css("visibility","visible");
			$("#showErrorInfo").val("账号不能为空");
			return false;
		}
		if(password==null || password=="")
		{
			$(".error").css("visibility","visible");
			$("#showErrorInfo").val("密码不能为空");
			return false;
		}
		return true;
	}
	
	window.onload = function()
	{
		var errorInfo = $("#errorInfo").val();
		if(errorInfo != null && errorInfo!= '')
		{
			$("#showErrorInfo").val(errorInfo);
			$(".error").css("visibility","visible");
		}
	}
	
</script>
<title>登陆--皮皮祁电影</title>
</head>
<body>
<%
	if(request.getAttribute("user")==null)
	{
		String userName=null;
		String password=null;
	
		Cookie[] cookies=request.getCookies();
		for(int i=0;cookies!=null && i<cookies.length;i++)
		{
			if(cookies[i].getName().equals("user"))
			{
				userName=cookies[i].getValue().split("-")[0];
				password=cookies[i].getValue().split("-")[1];
			}	
		}
		if(userName==null)
		{
			userName="";
		}
		if(password==null)
		{
			password="";
		}
		pageContext.setAttribute("user", new User(userName,password));
	}
%>
<div class="head">
	<a href="${pageContext.request.contextPath }">
		<img src="${pageContext.request.contextPath }/static/image/movieLogo.png" class="movieLogo">
		<span class="head-title" style="color:black;" >Qipipi Movie</span>
	</a>
</div>
<div class="center">
	<div class="center-img">
		<img src="${pageContext.request.contextPath }/static/image/login.png">
	</div>
	<div class="loginForm">
		<form action="${pageContext.request.contextPath}/user/login.do" method="post" onsubmit="return checkForm()">
			<div class="error">
				<span class="tishi">
					<img src="${pageContext.request.contextPath }/static/image/icon.jpg" />
					<input type="text" id="showErrorInfo">
					<input id="errorInfo" type="hidden" value="${errorInfo }" />
				</span>
			</div>
			<div class="zhanghaodenglu">
				<span>账号登录</span>
			</div>
			<input id="userName" autocomplete="off" type="text" placeholder="用户名" class="inputStyle" value="${user.account }"  name="account" style="background: url('${pageContext.request.contextPath }/static/image/user.png') no-repeat  15px center ;">
			<input id="password" type="password" placeholder="密码" class="inputStyle"  value="${user.password }" name="password" style="background: url('${pageContext.request.contextPath }/static/image/password.png') no-repeat 15px center;"/>
			<input type="checkbox" id="remember" class="remember" name="remember" value="remember-me"/>
			<span style="font-size: 12px;">7天内自动登录</span><a href="#" target="_blank" class="wangjimima">忘记密码?</a>
			<input type="submit" class="tijiao" value="登录">
			<input type="hidden" class="lastUrl" name="lastUrl" />
			<span class="bottom_tishi">
				还没有账号？
				<a href=" ${pageContext.request.contextPath}/registered.jsp" target="_blank">免费注册</a>
			</span>
		</form>
	</div>
</div>
<div class="foot">
	 ©2018 美团网团购 meituan.com 京ICP证070791号 京公网安备11010502025545号 电子公告服务规则
</div>
<script type="text/javascript">
	
	var url = window.location.search;
	if(url != null && url != '')
	{
		var lastUrl = (url.substr(1)).split("=")[1];
		$(".lastUrl").val(lastUrl);
	}
	
</script>
</body>
</html>