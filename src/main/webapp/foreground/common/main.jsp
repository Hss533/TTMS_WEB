<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<link href="${pageContext.request.contextPath }/static/css/carousel.css" rel="stylesheet" type="text/css"/>
<link href="${pageContext.request.contextPath }/static/css/main.css" rel="stylesheet" type="text/css"/>

<div id="container">
	<div id="list" style="left: -1420px; border:none;">
		<img src="${pageContext.request.contextPath }/static/image/2.jpg" alt="4" />
		<c:forEach items="${informationList }" var="information" varStatus="status">
			<a target="_blank" href="${pageContext.request.contextPath }/information/details/${information.id}.html"><img src="${pageContext.request.contextPath }/${information.cover}" alt="${status.index }" /></a>
		</c:forEach>
		<img src="${pageContext.request.contextPath }/static/image/1.jpg" alt="1" />
	</div>
	<div id="buttons">
		<span index="1" class="on"></span>
		<span index="2"></span>
        <span index="3"></span>
		<span index="4"></span>
	</div>
	<a href="javascript:void(0);" id="prev" class="arrow">&lt;</a>
	<a href="javascript:void(0)" id="next" class="arrow">&gt;</a>
</div>

<div class="movies">
	<div class="movies-left">
		<div>
			<span class="nowAction">正在热映（${hotFilmNum}部）</span>
			<span><a href="${pageContext.request.contextPath }/film/show/hotFilms.html" class="allAction">全部></a></span>
		</div>
		<div class="movieList">
			<c:forEach items="${hotFilmList }" var="list" >
				<div class="one-movie">
					<a target="_black" href="${pageContext.request.contextPath }/film/show/${list.id}.html" ><img src="${pageContext.request.contextPath }/${list.cover}"></a>
					<span class="jieshao">${list.name }</span>
					<span class="pingfeng">${list.score}</span>
					<a target="_black" href="${pageContext.request.contextPath }/film/show/${list.id}.html" class="buyTicket">购票</a>
				</div>
			</c:forEach>
		</div>
	</div>
	<div class="movies-right">
		<div>
			<span class="nowAction">今日票房</span>
		</div>
		<c:forEach items="${boxFilmList}" var="list"  begin="0" end="0">
			<div class="topMovie">
				<a target="_black" href="${pageContext.request.contextPath }/film/show/${list.id}.html"><img src="${pageContext.request.contextPath }/${list.cover}" width="120px" height="78px"></a>
				<a target="_black" href="${pageContext.request.contextPath }/film/show/${list.id}.html" class="button-right">
					<span class="button-right-movie">${list.name }</span>
					<span class="button-right-box">${list.box}万</span>
				</a>
			</div>
		</c:forEach>
		<div class="box-movies">
			<ul>
				<c:forEach items="${boxFilmList}" var="list"  varStatus="cou" begin="1" end="10">
					<li>
						<a target="_black" href="${pageContext.request.contextPath }/film/show/${list.id}.html" target="_blank">
							<span class="indexNumber"><i> ${cou.index+1}&nbsp;</i></span>
							<span class="box-movieName">${list.name }</span>
							<span class="movieMoney">${list.box}万</span>
						</a>
					</li>
				</c:forEach>
			</ul>
		</div>
	</div>
</div>

<div class="movies">
	<div class="movies-left" style="margin-top: 80px;">
		<div>
			<span class="nowAction">热播电影</span>
			<span class="small_Type">
				<c:forEach var="filmType" items="${filmTypes }">
					<a href="${pageContext.request.contextPath }/film/show/hotFilms.html?typeId=${filmType.id}">${filmType.typeName }</a>
				</c:forEach>
			</span>
			<span><a href="${pageContext.request.contextPath }/film/show/hotFilms.html?sortId=2" class="allAction">全部></a></span>
		</div>
		<div class="movieList">
			<c:forEach items="${clickHitFilm}" var="list"  begin="0" end="0">
				<div class="one-movie-jd">
					<a target="_black" href="${pageContext.request.contextPath }/film/show/${list.id}.html" ><img src="${pageContext.request.contextPath }/${list.cover}" width="350px" height="220px"></a>
					<span class="jieshao-down">${list.name }</span>
					<span class="pingfeng-down">${list.score}</span>
				</div>
			</c:forEach>
			<c:forEach items="${clickHitFilm}" var="list"  begin="1" end="7">
				<div class="one-movie">
					<a target="_black" href="${pageContext.request.contextPath }/film/show/${list.id}.html" ><img src="${pageContext.request.contextPath }/${list.cover}" width="160px" height="220px"></a>
					<span class="jieshao-down">${list.name }</span>
					<span class="pingfeng-down">${list.score}</span>
				</div>
			</c:forEach>
		</div>
	</div>
	<div class="movies-right" style="margin-top: 80px;">
		<div>
			<span class="nowAction" style="color: #ffb400;">TOP100</span>
			<span><a href="${pageContext.request.contextPath }/film/leaderboard/2.html" class="allAction" style="color: #ffb400;padding-right: 0px;">查看完整榜单></a></span>
		</div>
		<c:forEach items="${scoreFilm}" var="list"  begin="0" end="0">
			<div class="topMovie">
				<a target="_black" href="${pageContext.request.contextPath }/film/show/${list.id}.html"><img src="${pageContext.request.contextPath }/${list.cover}" width="120px" height="78px"></a>
				<a target="_black" href="${pageContext.request.contextPath }/film/show/${list.id}.html" class="button-right">
					<span class="button-right-movie">${list.name }</span>
					<span class="button-right-box">${list.score }分</span>
				</a>
			</div>
		</c:forEach>
		<div class="box-movies">
			<ul>
				<c:forEach items="${scoreFilm}" var="list"  begin="1" end="9" varStatus="cou" >
					<li>
						<a target="_black" href="${pageContext.request.contextPath }/film/show/${list.id}.html" target="_blank">
							<span class="indexNumber" style="color: #ffb400;"><i>${cou.index+1 }&nbsp;</i></span>
							<span class="box-movieName">${list.name }</span>
							<span class="movieMoney">${list.score }分</span>
						</a>
					</li>
				</c:forEach>
			</ul>
		</div>
	</div>
</div>

<script type="text/javascript" src="${pageContext.request.contextPath}/static/js/carousel.js"></script>