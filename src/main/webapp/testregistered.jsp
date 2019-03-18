<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<script type="text/javascript" src="${pageContext.request.contextPath}/static/jquery-easyui-1.3.3/jquery.min.js"></script>

<script>

</script>
<script>
	//使用ajax进行提交
	function a(){
		
	//这个不是ajaxti提交
	//这个方法好像没有 ,一会再看看
	/* $("#reform").form("submit",{
		url:"${pageContext.request.contextPath}/user/registered.do",
		onSubmit:function(){return true;},
		success:function(result)
		{
			var result=JSON.parse(result);
			if(result.success)
			{
				alert("注册成功");
			}
			else
			{
				alert("注册失败");
			}
		}
	}); */
	
	var xmlHttp;
	if(window.XMLHttpRequest)
	{
		xmlHttp=new XMLHttpRequest();
	}
	else
	{
		xmlHttp = new ActiveXObject("Microsoft.XMLHTTP");
	}
	//Ajax返回的
		xmlHttp.onreadystatechage=function()
		{
				
		}
	xmlHttp.open("post","./user.registered.do",true);
	xmlHttp.setRequestHeader("Content-type","application/x-www-form-urlencoded");
	xmlHttp.send("account=" + account);
	xmlHttp.send
	}
</script>
</head>
<body>
<form id="reform" method="post">
<table>
<tr>
	<td>姓名：</td>
	<td><input  type="text" name="account" id="account"></td>
	
</tr>
<tr>
	<td>密码：</td>
	<td><input type="text" name="password" id="password" /></td>
</tr>
<tr>
<td>验证码</td>
<!-- 放入验证码 -->
<!-- 这儿加javascript的原因是直接掉用这个函数，如果不加的话可能要再-->
<td><img onclick="javascript:loadingImage();" title="换一张试试"  name="randImage" id="randImage" src="${pageContext.request.contextPath }/image.jsp"/></td>
<td><input type="text" name="yanzhengma" id="yanzhengma"></td>
</tr>
</table>
<input type="submit" value="注册该用户" onclick="javascript:a()">
</form>
</body>
</html>