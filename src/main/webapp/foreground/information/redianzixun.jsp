<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<div class="zuixinzixun">
	<div class="zuixinzixunleft">
		<div>
			<span class="nowInformation">最新资讯</span>
			<span><a href="${pageContext.request.contextPath }/information/hot.html?showType=2" class="allInformation">全部></a></span>
		</div>
		<div class="informationList">
			<c:forEach items="${zuixinzixunList}" var="list">
				<div class="oneInformation">
					<a target="_blank" href="${pageContext.request.contextPath }/information/details/${list.id}.html"><img src="${pageContext.request.contextPath }/${list.cover}"/></a>
					<p style="text-overflow: ellipsis;overflow: hidden;height=30px;"><a target="_blank" href="${pageContext.request.contextPath }/information/details/${list.id}.html">${list.title}</a></p>
					<div class="oneInformationInfo">
						<span>猫眼娱乐</span>
						<span class="liulancishu">${ list.clickHit}</span>
					</div>
				</div>
			</c:forEach>
		</div>
	</div>
	<div class="zuixinzixunright">
		<div>
			<span class="nowInformation">热门资讯</span>
		</div>
		<ul>
			<c:forEach items="${remenzixunList}" var="list" begin="0" end="0">
				<li class="ttttop">
					<div>
						<div class="leftImg">
							<a href="#"><img src="${pageContext.request.contextPath }/${list.cover}" /></a>
							<i>1</i>
						</div>
						<p class="rightContent" style="text-overflow: ellipsis;overflow: hidden;">
							<a href="#">${list.title }</a>
						</p>
					</div>
				</li>
			</c:forEach>
			<c:forEach items="${remenzixunList}" var="list" begin="1" end="2" varStatus="status">
				<li>
					<div>
						<div class="putongzixun">
							<i class="putongi red">${status.index+1 }</i>
							<p><a href="${pageContext.request.contextPath }/information/details/${list.id}.html"></a>${list.title }</p>
						</div>
					</div>
				</li>
			</c:forEach>
			<c:forEach items="${remenzixunList}" var="list" begin="3" end="9" varStatus="status">
				<li>
					<div>
						<div class="putongzixun">
							<i class="putongi">${status.index+1 }</i>
							<p><a href="${pageContext.request.contextPath }/information/details/${list.id}.html"></a>${list.title }</p>
						</div>
					</div>
				</li>
			</c:forEach>
		</ul>
	</div>
</div>
<div class="zuixintuji">
	<div class="zuixintujileft">
		<div>
			<span class="nowInformation yellow">最新图集</span>
			<span><a href="${pageContext.request.contextPath }/information/hot.html?showType=3" class="allInformation yellow">全部></a></span>
		</div>
		<div class="imageList">
			<c:forEach items="${zuixinzixunList}" var="list" begin="0" end="3">
				<div class="oneImage">
					<div class="imagessss">
						<c:forEach items="${list.pictures }" var="plist" begin="0" end="0" >
							<a class="zuoshang" href="#"><img src="${pageContext.request.contextPath }/${plist.url}" /></a>
						</c:forEach>
						<c:forEach items="${list.pictures }" var="plist" begin="1" end="2">
							<a class="youshang" href="#"><img src="${pageContext.request.contextPath }/${plist.url}" /></a>
						</c:forEach>
						<a class="shengyuzhangshu" href="#">${ list.pictureNum}张</a>
						
					</div>
					<div class="imageListxiamian">
						<p>
							<a href="">${list.title}</a>
						</p>
						<span class="liulancishu zaizuobian"></span>
					</div>
				</div>
			</c:forEach>
		</div>
	</div>
</div>