<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>  
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>

<link href="${pageContext.request.contextPath }/static/css/list.css" rel="stylesheet" type="text/css"/>
<script type="text/javascript" src="${pageContext.request.contextPath}/static/jquery-easyui-1.3.3/jquery.min.js"></script>

<script type="text/javascript">

	window.onload=function()
	{
		var myDate = new Date();
		var year = myDate.getFullYear();
		var month = myDate.getMonth() + 1;
		var day = myDate.getDate();
		var time = year+"-"+month+"-"+day+"<span>已更新</span>";
		$(".tishiquyutime").html(time);
		
		var url = document.location.href;
		var topAnnius = $(".filmnav a");
		var centertishis = $(".tishiquyu p");
		
		if(url.indexOf("1") != -1)
		{
			topAnnius[2].setAttribute("class", "active");
			centertishis[3].style.display="block";
		}
		else if(url.indexOf("2") != -1)
		{
			topAnnius[0].setAttribute("class", "active");
			centertishis[1].style.display="block";
		}
		else
		{
			topAnnius[1].setAttribute("class", "active");
			centertishis[2].style.display="block";
		}
		
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
		
		var headnavigation = $(".head-navigation a");
		headnavigation[3].setAttribute("class","active");
	}

</script>

<div style="height: 80px;"></div>
<div class="filmnav">
	<ul>
		<li><a href="${pageContext.request.contextPath }/film/leaderboard/2.html">热映口碑榜</a></li>
		<li><a href="${pageContext.request.contextPath }/film/leaderboard/3.html">国内票房榜</a></li>
		<li><a href="${pageContext.request.contextPath }/film/leaderboard/1.html">TOP100榜</a></li>
	</ul>
</div>

<div class="tishiquyu">
	<p class="tishiquyutime"></p>
	<p style="display:none;">榜单规则：将昨日国内热映的影片，按照点击次数从高到低排列取前10名，每天上午10点更新。相关数据来源于“皮皮专业版”及“皮皮电影库”。</p>
	<p style="display:none;">榜单规则：将昨日国内热映的影片，按照昨日票房从高到低排列，每天上午10点更新。相关数据来源于“皮皮专业版”。</p>
	<p style="display:none;">榜单规则：将皮皮电影库中的经典影片，按照点击次数从高到低综合排序取前100名，每天上午10点更新。相关数据来源于“皮皮电影库”。</p>
</div>
<div class="paihangbang">
	<c:forEach items="${ filmList}" begin="0" end="0" varStatus="status" var="list">
		<div class="topbangdan">
			<div class="topbangdanleft">
				<div class="topbangdanleftxuhao">
					<img src="${pageContext.request.contextPath}/static/image/huangguan.png" />
				</div>
			</div>
			<div class="topbangdanimg">
				<a href="${pageContext.request.contextPath}/film/show/${list.id}.html">
					<img src="${pageContext.request.contextPath}/${list.cover}" />
				</a>
			</div>
			<div class="topbangdancenter">
				<a href="${pageContext.request.contextPath}/film/show/${list.id}.html" class="name">${list.name}</a>
				<p class="yanyuan">导演:${list.employee.name}</p>
				<p class="shangyinriqi">上映时间：<fmt:formatDate value="${list.publishDate}" pattern="yyyy-MM-dd"  type="date" /> </p>
				<div class="doubanpingfeng">
					<i class="firstscore">${fn:split(""+list.score,".")[0] }.</i>
					<i class="nextscore">${fn:split(""+list.score,".")[1].substring(0,1) }</i>
				</div>
			</div>
		</div>	
	</c:forEach>
	<ul>
		<c:forEach items="${ filmList}" begin="1" end="2" varStatus="status" var="list">
			<li>
				<div class="topbangdan">
					<div class="topbangdanleft">
						<div class="topbangdanleftxuhao2">
							<input type="text" value="${status.index+1 }"/>
						</div>
					</div>
					<div class="topbangdanimg">
						<a href="${pageContext.request.contextPath}/film/show/${list.id}.html">
						<img src="${pageContext.request.contextPath}/${list.cover}" />
						</a>
					</div>
					<div class="topbangdancenter">
						<a href="${pageContext.request.contextPath}/film/show/${list.id}.html" class="name">${list.name}</a>
						<p class="yanyuan">导演:${list.employee.name}</p>
						<p class="shangyinriqi">上映时间：<fmt:formatDate value="${list.publishDate}" pattern="yyyy-MM-dd"  type="date" /> </p>
						<div class="doubanpingfeng">
							<i class="firstscore">${fn:split(""+list.score,".")[0] }.</i>
							<i class="nextscore">${fn:split(""+list.score,".")[1].substring(0,1) }</i>
						</div>
					</div>
				</div>
			</li>
		</c:forEach>
		<c:forEach items="${ filmList}" begin="3" end="10" varStatus="status" var="list">
			<li>
				<div class="topbangdan">
					<div class="topbangdanleft">
						<div class="topbangdanleftxuhao3">
							<input type="text" value="${status.index+1 }"/>
						</div>
					</div>
					<div class="topbangdanimg">
					<a href="${pageContext.request.contextPath}/film/show/${list.id}.html">
						<img src="${pageContext.request.contextPath}/${list.cover}" />
						</a>
					</div>
					<div class="topbangdancenter">
						<a href="${pageContext.request.contextPath}/film/show/${list.id}.html" class="name">${list.name }</a>
						<p class="yanyuan">导演：${list.employee.name}</p>
						<p class="shangyinriqi">上映时间:
						<fmt:formatDate value="${list.publishDate}" pattern="yyyy-MM-dd"  type="date" /> </p> 
						<div class="doubanpingfeng">
							<i class="firstscore">${fn:split(""+list.score,".")[0] }.</i>
							<i class="nextscore">${fn:split(""+list.score,".")[1].substring(0,1) }</i>
						</div>
					</div>
				</div>
			</li>
		</c:forEach>
	</ul>
</div>