<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<script type="text/javascript" src="${pageContext.request.contextPath}/static/jquery-easyui-1.3.3/jquery.min.js"></script>
<script type="text/javascript">

	window.onload = function() 
	{
		// 顶部区域
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
	
	function submitSearch()
	{
		$("#searchForm").submit();
	}
	
	$("#searchContent").keydown(function(e) 
	{  
		if(e.keyCode == 13)
		{  
			submitSearch();
     	}
	});  
	
</script>

<div class="head">
	<div class="head-logo">
		<a href="${pageContext.request.contextPath }">
			<img src="${pageContext.request.contextPath }/static/image/movieLogo.png" class="head-movieLogo">
			<span class="head-title" style="color:black;">Qipipi Movie</span>
		</a>
		<div class="city-select">
			西安
		</div>
		<div class="head-navigation">
			<ul>
				<li><a href="${pageContext.request.contextPath }">首页</a></li>
				<li><a href="${pageContext.request.contextPath }/film/show/hotFilms.html" >电影</a></li>
				<li><a href="${pageContext.request.contextPath }/studio/allFilms.html" >影院</a></li>
				<li><a href="${pageContext.request.contextPath }/film/leaderboard/2.html" >榜单</a></li>
				<li><a href="${pageContext.request.contextPath }/information/hot.html?showType=1" >热点</a></li>
			</ul>
		</div>
		<div class="head-search">
			<form id="searchForm" action="${pageContext.request.contextPath}/manager2/search.html" method="post" target="_blank">
				<input id="searchContent" name="searchContent" type="text" class="search" placeholder="请输入你要查询的影视剧、影人..." />
				<img src="${pageContext.request.contextPath }/static/image/search.png" class="searchImage" onclick="submitSearch();">
			</form>
		</div>
		<div class="dropDownUnLogin">
			<a class="userIcon" href="javascript:void(0)">
				<c:choose>
					<c:when test="${currentUser.userImage == null }">
						<img class="imageForUser" src="${pageContext.request.contextPath }/static/image/dropDownUnLogin.png" >
					</c:when>
					<c:otherwise>
						<img class="imageForUser" src="${pageContext.request.contextPath }/${currentUser.userImage}" >
					</c:otherwise>
				</c:choose>
				<img class="toDown" src="${pageContext.request.contextPath }/static/image/ToDown.png" >
			</a>
			<div class="toDialog">
				<ul>
					<c:choose>	
						<c:when test="${currentUser == null }">
							<li><a href="${pageContext.request.contextPath }/login.jsp">登录</a></li>
						</c:when>
						<c:otherwise>
							<li><a href="${pageContext.request.contextPath }/user/show/1.html">我的订单</a></li>
							<li><a href="${pageContext.request.contextPath }/user/show/2.html">基本信息</a></li>
							<li><a href="${pageContext.request.contextPath }/user/logout.html">退出登录</a></li>
						</c:otherwise>
					</c:choose>
				</ul>
			</div>
		</div>
		
	</div>
</div>