<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>  
<link href="${pageContext.request.contextPath }/static/css/show.css" rel="stylesheet" type="text/css"/>

<div style="height: 80px;"></div>
<div class="topbox">
	<div class="w imgm">
		<div class="mainimg">
			<img src="${pageContext.request.contextPath }/${film.cover}" alt="">
		</div>
		<div class="int">
			<h1>${film.name }</h1>
	        <h2>${ film.englishName}</h2>
			<div class="time">
				<span>
					<c:forEach items="${film.filmTypes}" var="list">
						${list.typeName}&nbsp;
					</c:forEach>
				</span>
                <span>中国大陆 / ${ film.duration}分钟</span>
                <span><fmt:formatDate value="${film.publishDate}" pattern="yyyy-MM-dd"  type="date" />大陆上映</span>
            </div>
            <div class="btn">
                <button><a href="#">想看</a></button>
                <button><a href="#">评分</a></button>
                <button><a href="${pageContext.request.contextPath }/studio/allFilms.html?filmId=${film.id }">特惠购票</a></button>
            </div>
        </div>
        <div class="star">
            <span>用户评分</span>
            <span class="shuzi" style="color: yellow">${film.score }</span>
            <span>累计票房</span>
            <span class="shuzi">${film.box }<i>亿</i></span>
        </div>
    </div>
</div>
<div class=" w content">
    <div class="detail">
        <div class="classify">
            <ul>
                <li class="active">介绍</li>
                <li>演职员表</li>
                <li>奖项</li>
                <li>图集</li>
            </ul>
        </div>
        <div class="filmintr">
            <span>剧情简介</span>
            <p class="cos">
            	 ${film.resume }
            </p>
            <div class="actor">
                <span>演职员表</span>
                <span><a href="#">全部></a></span>
            </div>
            <div class="actorphoto">
            	<div class="per">
					导演
                    <img src="${pageContext.request.contextPath }/static/image/9a9c5b34273a3cb9ad41765b7ae692dc30143.jpg" alt="">
                    <p>苏伦</p>
                </div>
                <div class="per">演员
                    <img src="${pageContext.request.contextPath }/static/image/5fcb244b8ac5c9444fe7e4268f2d3d5f44647.jpg" alt="">
                    <p>雷佳音<br>
                    <p style="font-size: 14px;color: #ddd;">饰：陆鸣 / 陆石屹</p>
                </div>
                <div class="per other">
                    <img src="${pageContext.request.contextPath }/static/image/349a61dc9ef598ae6aba03e2defb35c840152.jpg" alt="">
                    <p>佟丽娅</p>
                    <p style="font-size: 14px;color: #ddd;">饰：谷小焦</p>
                </div>
                <div class="per other"><img src="${pageContext.request.contextPath }/static/image/2b98c9d2e6d23a7eff25dcac8b584b0136045.jpg" alt="">
                    <p>徐峥</p>
                    <p style="font-size: 14px;color: #ddd;">饰：捞海底服务员</p>
                </div>
                <div class="per other box5"><img src="${pageContext.request.contextPath }/static/image/c1d74ee093c2478ddc12c1a70e77f42141449.jpg" alt="">
                    <p>张衣</p>
                    <p style="font-size: 14px;color: #ddd;">饰：赵俊以</p>
                </div>
            </div>
            <div class="actor">
                <span>图集</span>
                <span><a href="#">全部></a></span>
            </div>
            <div class="filmphoto">
            	<c:forEach items="${film.pictures }" var="picture"  begin="0" end="0">
            		<img src="${pageContext.request.contextPath }/${picture.url }" style="width:465px;height:258px;" alt="">
            	</c:forEach>
            	<c:forEach items="${film.pictures }" var="picture"  begin="1" end="4">
            		<img src="${pageContext.request.contextPath }/${picture.url }" style="width:126px;height:126px;" alt="">
            	</c:forEach>
            </div>
            <div class="actor">
                <span>热门评论</span>
                <button>写短评</button>
            </div>
            <div class="comment"></div>
        </div>
    </div>

    <div class="trends">
		<c:choose>
			<c:when test="${informationList==null || informationList.size() == 0}">
			</c:when>
			<c:otherwise>
				<div class="related">
					<span>相关资讯</span>
					<c:forEach items="${informationList }" var="list" begin="0" end="2">
		           		<div class="news">
			                <a target="_blank" href="${pageContext.request.contextPath }/information/details/${list.id}.html"><img src="${pageContext.request.contextPath }/${list.cover}" alt="" width="140px" height="86px"></a>
			                <a target="_blank" class="butong" href="${pageContext.request.contextPath }/information/details/${list.id}.html">${list.title }</a>
			                <p>皮皮祁电影</p>
			                <p>浏览量<i>${list.clickHit}</i></p>
			                <p>评论<i>${list.praiseHit }</i></p>
			            </div>
	           		</c:forEach>
	           	</div>
			</c:otherwise>
		</c:choose>
        <div class="relatedfilm">
            <span>相关电影</span>
            <div class="xiangguandianying">
            <c:forEach items="${filmAbout }" var="list" begin="0" end="5">
            	<div class="xiangguan" >
					<a target="_blank" href="${pageContext.request.contextPath }/film/show/${list.id}.html" ><img src="${pageContext.request.contextPath }/${list.cover}"></a>
					<a target="_blank" class="xiangguanname" href="${pageContext.request.contextPath }/film/show/${list.id}.html" >${list.name }</a>
					<p>${list.score }</p>
            	</div>
            </c:forEach>
        	</div>
    	</div>
	</div>
<div style="clear: both;"></div>
</div>