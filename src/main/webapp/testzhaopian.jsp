<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<%@ page import="java.io.*"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
		<script type="text/javascript" src="${pageContext.request.contextPath}/static/jquery-easyui-1.3.3/jquery.min.js"></script>
		<title>Success</title>
	</head>
	<body>
		<form  method="get" >
			<input type="button" id="file" name="file" value="下载" onclick="myFunction()"/>
		</form>
		<form method="post" action="./test/upload.do" enctype="multipart/form-data">
			选择文件：<input type="file" id="upload" name="file1">
			<input type="submit" value="上传">
		</form>
		<form method="post" name="nameForm" id="nameForm" >
			请填写姓名
			<input name="name" id="name" type="text">
			<button onclick="javascript:submit1();">ahh</button>
			
		</form>
	</body>
	<script>
		/* 
		$("#file").click(function()
		{
			window.top.location.href="./test/download.do";	
		}); 
		*/
		function myFunction(){
			location.href="./test/download.do";
		}
		function submit1()
		{
			var json={
					"account":"hss"
			};
			var jsonstr=JSON.stringify(json);
			console.log(jsonstr);
			$.ajax({
				type:"post",
				url:"./test/name.do",
				contentType:"application/json;charset=utf-8",
                dataType:"json",
                data:jsonstr,
				success:function(data){
				//	alert(data.username);
					},
				error:function(){
					//alert("失败");
				}

			}); //zheyikuai
			alert();
		}
	</script>
</html>