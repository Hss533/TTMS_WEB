<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>

<link href="${pageContext.request.contextPath }/static/css/hotFilms.css" rel="stylesheet" type="text/css"/>
<script type="text/javascript" src="${pageContext.request.contextPath}/static/jquery-easyui-1.3.3/jquery.min.js"></script>

<script type="text/javascript">
	var catId;
	var typeId;
	var sortId;
	
	window.onload = function()
	{
		var url = window.location.search;
		catId = 1;
		typeId = 0;
		sortId = 1;
		if(url == "");
		else
		{
			var strs = (url.substr(1)).split("&");
			for(var i=0;i<strs.length;i++)
			{
				var message = strs[i].split("=")[0];
				if(message == 'catId')
				{
					catId = strs[i].split("=")[1];
				}
				else if(message == 'typeId')
				{
					typeId = strs[i].split("=")[1];
				}
				else if(message == 'sortId')
				{
					sortId = strs[i].split("=")[1];
				}			
			}
		}
		// 获取顶部两个标签
		var filmnav = $(".filmnav a");
		filmnav[catId-1].setAttribute("class","active");
		filmnav[catId-1].setAttribute("href","javascript:void(0)");
		
		var tags = $(".tags a");
		for(var i=0;i<tags.length;i++)
		{
			if(tags[i].getAttribute("value") == typeId)
			{
				tags[i].setAttribute("class","active");
				tags[i].setAttribute("href","javascript:void(0)");
				break;
			}
		}
		
		// 获取底部排序
		var filmtype = $(".filmtype input");
		filmtype[sortId-1].setAttribute("checked","checked");
		filmtype[sortId-1].setAttribute("onclick","void(0)");
		
		// 将顶部的颜色修改
		var headnavigation = $(".head-navigation a");
		headnavigation[1].setAttribute("class","active");
		
		$(".userIcon,.toDialog").hover(function()
		{
			$(".dropDownUnLogin").css("border-left","1px solid #CCCCCC");
			$(".dropDownUnLogin").css("border-right","1px solid #CCCCCC");
			$(".toDialog").css("display","block");
		},
		function()
		{
			$(".dropDownUnLogin").css("border-left","1px solid white");
			$(".dropDownUnLogin").css("border-right","1px solid white");
			$(".toDialog").css("display","none");
		});

	}
	
	function change(typeId)
	{
		window.location.href="${pageContext.request.contextPath }/film/show/hotFilms.html?catId="+catId+"&typeId="+typeId+"&sortId="+sortId;
	}
	
	function changeCheck(sortId)
	{
		window.location.href="${pageContext.request.contextPath }/film/show/hotFilms.html?catId="+catId+"&typeId="+typeId+"&sortId="+sortId;
	}
	
	
</script>

<div style="height: 80px;"></div>
<div class="filmnav">
	<ul>
		<li><a href="${pageContext.request.contextPath}/film/show/hotFilms.html?catId=1">正在热映</a></li>
		<li><a href="${pageContext.request.contextPath}/film/show/hotFilms.html?catId=2">经典影片</a></li>
	</ul>
</div>
<div class="w">
	<div class="choose">
		<ul class="typeul">
			<li class="type">
				<span class="tip">类型:</span>
				<ul class="tags">
					<li><a href="javascript:change(0);" value="0">全部</a></li>
					<c:forEach var="list" items="${filmTypeList}" varStatus="status" >
						<li><a href="javascript:change('${list.id }');" value="${list.id }">${list.typeName }</a></li>
					</c:forEach>				
				</ul>
            </li>
		</ul>
	</div>
</div>
<div class="w">
	<div class="film choose">
		<div class="filmtype">
			<div class="check"><input type="radio" name="chooseme" onclick="changeCheck(1)" id="radio1"><label for="radio1">按评分排序</label></div>
			<div class="check"><input type="radio" name="chooseme" onclick="changeCheck(2)" id="radio2"><label for="radio2">按热门排序</label></div>
			<div class="check"><input type="radio" name="chooseme" onclick="changeCheck(3)" id="radio3"><label for="radio3">按日期排序</label ></div>
		</div>      
		<div class="film">
			<c:forEach  items="${filmList }" var="list" varStatus="status">
				<c:if test="${(status.index+1)%6 != 0}">
					<div class="filmbox">
						<a href="${pageContext.request.contextPath }/film/show/${list.id}.html" target="_blank">
							<img src="${ pageContext.request.contextPath}/${ list.cover}" alt="name" width="160px;" height="220px;">
						</a>
						<div class="filmname">
							<a href="#" target="_blank">${list.name }</a>
						</div>
						<div class="filmscore">
							<i class="firstscore">${fn:split(""+list.score,".")[0] }.</i>
							<i class="nextscore">${fn:split(""+list.score,".")[1].substring(0,1) }</i>
						</div>
					</div>
				</c:if>
				<c:if test="${(status.index+1)%6 == 0}">
					<div class="filmbox box6">
						<a href="${pageContext.request.contextPath }/film/show/${list.id}.html" target="_blank">
							<img src="${ pageContext.request.contextPath}/${ list.cover}" alt="name" width="160px;" height="220px;">
						</a>
						<div class="filmname">
							<a href="#" target="_blank">${list.name }</a>
						</div>
						<div class="filmscore">
							<i class="firstscore">${fn:split(""+list.score,".")[0] }.</i>
							<i class="nextscore">${fn:split(""+list.score,".")[1].substring(0,1) }</i>
						</div>
					</div>
				</c:if>
			</c:forEach>
		</div>
		<div class="pageturn">
			<ul>
				<li class="pagechoose">1</li>
				<li>2</li>
				<li>3</li>
				<li>4</li>
				<li>5</li>
				<li>...</li>
				<li>25807</li>
				<li>下一页</li>
			</ul>
		</div>
	</div>
</div>