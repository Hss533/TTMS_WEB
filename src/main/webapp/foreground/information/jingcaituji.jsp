<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<div class="tuji">
	<div class="tujiList">
		<div class="tujiqqq">
			<c:forEach items="${xinwenzixunList}" var="list">
				<div class="onetuji">
					<h4><a href="#">${list.title}</a></h4>
					<div class="tujiPic">
						<c:forEach items="${list.pictures }" var="plist" begin="0" end="2">
							<a href="#"><img src="${pageContext.request.contextPath }/${plist.url}"/></a>
						</c:forEach>
						<a class="gengduo" href="#"><span>${list.pictureNum}张</span></a>
					</div>
					<div class="ppdibu">
						<span class="tagggg"><a href="${pageContext.request.contextPath }/film/show/${list.film.id}.html">${list.film.name}</a></span>
						<span class="liulancishu">${list.clickHit }</span>
					</div>
				</div>
			</c:forEach>
		</div>
	</div>
</div>