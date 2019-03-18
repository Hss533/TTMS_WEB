<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link href="${pageContext.request.contextPath }/static/css/registered.css" rel="stylesheet" type="text/css">
<script type="text/javascript" src="${pageContext.request.contextPath}/static/jquery-easyui-1.3.3/jquery.min.js"></script>
<script type="text/javascript">

	function submitFunction()
	{
		var account = $("#account").val();
		var password = $("#password").val();
		var repassword = $("#repassword").val();
		var yanzhengma = $("#yanzhengma").val();
		var i = 0;
		if(account == null||account == "")
		{
			i = i + 1;
			$(".tishiyonghu span").text("请输入您的账号");
			$(".tishiyonghu").css("visibility","visible")
		}
		else
		{
			$(".tishiyonghu").css("visibility","hidden")
		}
		if(password == null||password == "")
		{
			i = i + 1;
			$(".tishimima span").text("请输入您的密码");
			$(".tishimima").css("visibility","visible")
		}
		else
		{
			$(".tishimima").css("visibility","hidden")
		}
		if(repassword == null||repassword == "")
		{
			i = i + 1;
			$(".tishiquerenmima span").text("请输入您的确认密码");
			$(".tishiquerenmima").css("visibility","visible")
		}
		else
		{
			$(".tishiquerenmima").css("visibility","hidden")
		}
		if(yanzhengma == null||yanzhengma == "")
		{
			i = i + 1;
			$(".tishiyanzhengma span").text("请输入您的验证码");
			$(".tishiyanzhengma").css("visibility","visible")
		}
		else
		{
			$(".tishiyanzhengma").css("visibility","hidden")
		}
		var resultMessage = $("#resultMessage").val();
		if(resultMessage == 'no')
		{
			i = i + 1;
			$(".tishiyonghu span").text("用户名已存在,请重新输入");
			$(".tishiyonghu").css("visibility","visible")
		}
		var resultMessage2 = $("#resultMessage2").val();
		if(resultMessage2 == 'no')
		{
			i = i + 1;
			$(".tishiquerenmima span").text("密码和确认密码不相同");
			$(".tishiquerenmima").css("visibility","visible")
		}
		if(i > 0)
		{
			return false;
		}
		return true;
	}
	
	function checkPassword()
	{
		var password = $("#password").val();
		var repassword = $("#repassword").val();
		if(password != repassword)
		{
			$("#resultMessage2").val("no");
			$(".tishiquerenmima span").text("密码和确认密码不相同");
			$(".tishiquerenmima").css("visibility","visible")
		}
		else
		{
			$("#resultMessage2").val("yes");
			$(".tishiquerenmima").css("visibility","hidden")
		}
	}
	
	function checkAccount()
	{
		var account = $("#account").val();
		if(account !=null && account != '')
		{
	    	var xmlHttp;
	    	if(window.XMLHttpRequest)
	    	{
	    		xmlHttp = new XMLHttpRequest();
	    	}
	    	else
	    	{
	    		xmlHttp = new ActiveXObject("Microsoft.XMLHTTP");
	    	}
	    	xmlHttp.onreadystatechange=function()
	    	{
	    		if (xmlHttp.readyState==4 && xmlHttp.status==200)
	    		{
	    			var message =  JSON.parse(xmlHttp.responseText);
	    			$("#resultMessage").val(message.result);
	    			if(message.result == 'no')
	    			{
		    			$(".tishiyonghu span").text("用户名已存在,请重新输入");
		    			$(".tishiyonghu").css("visibility","visible")
	    			}
	    			else
	    			{
	    				$(".tishiyonghu").css("visibility","hidden")
	    			}
	    		}
	    	};
	    	xmlHttp.open("post" ,"./user/accountCheck.do", true);
	    	xmlHttp.setRequestHeader("Content-type","application/x-www-form-urlencoded");
	    	xmlHttp.send("account=" + account);
		}
	}
	
	function checkPassword2()
	{
		var password = $("#password").val();
		if(password == null && password == '')
		{
			$(".tishimima span").text("请输入您的密码");
			$(".tishimima").css("visibility","visible")
		}
		else
		{
			$(".tishimima").css("visibility","hidden");
		}
	}
	
	function loadimage()
	{
		document.getElementById("randImage").src="./image.jsp?"+Math.random();
	}
	
	window.onload = function()
	{
		var success = $("#success").val();
		alert(success);
		var errorResult = $("#errorResult").val();
		if(success == 'true')
		{
			//在js中进行页面跳转
			window.setTimeout("location.href='../login.jsp'",3000);
			alert("注册成功，系统将会3S后跳转到登录页面");
		}
		else
		{
			if(errorResult == "添加失败")
			{
				alert("系统出现bug，等稍后重试!");
			}
			else if(errorResult == "验证码错误")
			{
				$(".tishiyanzhengma span").text("验证码错误");
				$(".tishiyanzhengma").css("visibility","visible")
			}
		}
	}
	
</script>

<title>注册--皮皮祁电影</title>
</head>
<body>

<div class="head">
	<div class="movieLogo">
		<a href="${pageContext.request.contextPath }">
			<img src="${pageContext.request.contextPath }/static/image/movieLogo.png">
			<span style="color:black;">Qipipi Movie</span>
		</a>
	</div>
	<div class="content">
		<form action="${pageContext.request.contextPath }/user/registered.do" method="post" onsubmit="return submitFunction()">
			<div class=form-zhuce>
	 			<div class="yonghuming">
					<label>用户名</label>
					<input type="text" id="account" name="account" autocomplete="off" value="${user.account }" onblur="checkAccount()">
					<div class="tishiyonghu">
						<img src="${pageContext.request.contextPath }/static/image/-.jpg"/>
						<span></span>
					</div>
					<input type="hidden" id="resultMessage" />
				</div>
				<div class="yonghuming">
					<label>密码</label>
					<input type="password" id="password" name="password" value="${user.password }" onblur="checkPassword2()">
					<div class="tishimima">
						<img src="${pageContext.request.contextPath }/static/image/-.jpg"/>
						<span></span>
					</div>
				</div>
				<div class="yonghuming">
					<label>确认密码</label>
					<input type="password" id="repassword" name="rePassword" value="${user.password }" onblur="checkPassword()">
					<div class="tishiquerenmima">
						<img src="${pageContext.request.contextPath }/static/image/-.jpg"/>
						<span></span>
					</div>
					<input type="hidden" id="resultMessage2" />
				</div>
				<div class="yanzhengma">
					<label>验证码</label>
					<input type="text" id="yanzhengma" name="yanzhengma">
					<img class="randImage" onclick="javascript:loadimage();" title="换一张试试" name="randImage" id="randImage" src="${pageContext.request.contextPath }/image.jsp">
					<div class="tishiyanzhengma">
						<img src="${pageContext.request.contextPath }/static/image/-.jpg"/>
						<span></span>
					</div>
				</div>
				<div class="tijiaoanniu">
					<input type="submit" class="buttonStyle" value="确认并注册" >
				</div>
			</div>
		</form>
	</div>
	
	<input type="hidden" id="success" value="${success }">
	<input type="hidden" id="errorResult" value="${errorResult }">
</div>

</body>
</html>