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
<script type="text/javascript" charset="gbk" src="${pageContext.request.contextPath}/static/ueditor/ueditor.config.js"></script>
<script type="text/javascript" charset="gbk" src="${pageContext.request.contextPath}/static/ueditor/ueditor.all.min.js"> </script>
<script type="text/javascript" charset="gbk" src="${pageContext.request.contextPath}/static/ueditor/lang/zh-cn/zh-cn.js"></script>
<script type="text/javascript">
	
	function sumbitData()
	{
		var coverImage = $("#coverImage").val();
		var filmId = $("#filmName").combobox('getValue');
		var content = UE.getEditor('editor').getContent();
		if(filmId == null || filmId== '')
		{
			alert("请选择相关电影");
			return ;
		}
		if(content == null || content== '')
		{
			alert("请输入咨询内容");
			return ;
		}
		$("#filmName2").val(filmId);
		$("#content").val(content);
		$("#fm").form("submit",{
			url:'${pageContext.request.contextPath}/background/information/save.do?id='+${param.id},
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
				}
				else
				{
					$.messager.alert("系统提示","保存失败!");
					return ;
				}
			}
		});
	}
	
</script>
<title>修改资讯</title>
</head>
<body style="margin:5px">
	<div id="p" class="easyui-panel" title="添加资讯" style="padding:10px;font-size: 16px;">
		<form id="fm" method="post" enctype="multipart/form-data">
			<table cellspacing="10px" >
				<tr>
					<td width="80px">资讯标题：</td>
					<td><input type="text" id="title" name="title" style="width:400px" class="easyui-validatebox" required="true"><font color="red">*</font></td>
				</tr>
				<tr>
					<td width="80px">相关电影：</td>
					<td>
						<input class="easyui-combobox" id="filmName" name="filmName" data-options="panelHeight:'auto',editable:false,valueField:'id',textField:'name',url:'${pageContext.request.contextPath}/background/film/combList.do'"/>
						<input type="hidden" id="filmName2" name="film.id" />
					</td>
				</tr>
				<tr>
					<td width="80px">封面图片：</td>
					<td>
						<input type="file" id="coverImage" name="coverImage" style="width:200px" />
						<input type="text" id="forgetName" name="forgetName" style="width:400px;border:none;" readonly="readonly"/>
					</td>
				</tr>
				<tr>
					<td width="80px">资讯来源：</td>
					<td><input type="text" id="source" name="source" style="width:400px" class="easyui-validatebox" required="true"><font color="red">*</font></td>
				</tr>
				<tr>
					<td valign="top">资讯内容：</td>
					<td style="width:1200px">
						<script id="editor" name="editor" type="text/plain" style="width:100%;height:500px;"></script>
						<input type="hidden" id="content" name="content" />
					</td>
				</tr>
				<tr>
					<td></td>
					<td>
						<a href="javascript:sumbitData()" class="easyui-linkbutton" data-options="iconCls:'icon-submit'">添加资讯</a>
					</td>
				</tr>
			</table>
		</form>
	</div>
	
	<script type="text/javascript">
		var ue = UE.getEditor('editor');
		
		ue.addListener("ready",function(){
	    	UE.ajax.request("${pageContext.request.contextPath}/background/information/findById.html",{
				method:"post",
				async:false,
				data:{"id":"${param.id}"},
				onsuccess:function(result)
				{
					result = JSON.parse(result.responseText);
					$("#title").val(result.title);
					$("#forgetName").val(result.cover);
					$("#filmName").combobox("setValue",result.film.id);
					$("#source").val(result.source);
					UE.getEditor('editor').setContent(result.content);
	    		}
	   		});
	    });
	</script>
</body>
</html>