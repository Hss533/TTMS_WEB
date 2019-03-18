<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en" class="no-js">
<head>
<meta charset="UTF-8" />
<meta http-equiv="X-UA-Compatible" content="IE=edge"> 
<meta name="viewport" content="width=device-width, initial-scale=1">
<meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=1.0" />
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath }/static/css/normalize.css" />
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath }/static/css/demo.css" />
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath }/static/css/component.css" />
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath }/static/css/dialog.css">
<script type="text/javascript" src="${pageContext.request.contextPath }/static/js/zepto.min.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath }/static/js/dialog.min.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/static/jquery-easyui-1.3.3/jquery.min.js"></script>

<script type="text/javascript">

	function submitForm()
	{
		var account = document.getElementById("account").value;
		var password = document.getElementById("password").value;
		if(account == '' || account == null)
		{
			popup({type:'error',msg:"账号不能为空！",delay:5000,bg:true,clickDomCancel:true});
			return ;
		}
		if(password == '' || password == null)
		{
			popup({type:'error',msg:"密码不能为空！",delay:5000,bg:true,clickDomCancel:true});
			return ;
		}
		document.getElementById("myForm").submit();
	}
	
	$(function()
	{
		var errorInfo = document.getElementById("errorInfo").value;
		if(errorInfo != '' && errorInfo != null)
		{
			popup({type:'error',msg:errorInfo,delay:5000,bg:true,clickDomCancel:true});
		}
	});

</script>

<!--[if IE]>
<script src="../static/js/html5.js"></script>
<![endif]-->
<title>猫爪电影院</title>
</head>
<body>
	<div class="container demo-1">
		<div class="content">
			<div id="large-header" class="large-header">
				<canvas id="demo-canvas"></canvas>
				<div class="logo_box">
					<h3>猫爪电影院后台登录界面</h3>
					<form id="myForm" action="${pageContext.request.contextPath}/manager2/login.html" name="f" method="post">
						<div class="input_outer">
							<span class="u_user"></span>
							<input id="account" name="account"  AUTOCOMPLETE="off" class="text" style="color: #FFFFFF !important" type="text" placeholder="请输入账户" value="${manager.account }">
						</div>
						<div class="input_outer">
							<span class="us_uer"></span>
							<input id="password" name="password"  class="text" onkeydown="if(event.keyCode==13) submitForm()" style="color: #FFFFFF !important; position:absolute; z-index:100;"value="${manager.password }" type="password" placeholder="请输入密码">
							<input id="errorInfo" name="errorInfo" type="hidden" value="${errorInfo }" />
						</div>
						<div class="mb2">
							<a class="act-but submit" href="javascript:submitForm()" style="color: #FFFFFF">登录</a>
						</div>
					</form>
				</div>
			</div>
		</div>
	</div>
</body>

<script src="${pageContext.request.contextPath }/static/js/TweenLite.min.js"></script>
<script src="${pageContext.request.contextPath }/static/js/EasePack.min.js"></script>
<script src="${pageContext.request.contextPath }/static/js/rAF.js"></script>
<script src="${pageContext.request.contextPath }/static/js/demo-1.js"></script>

</html>