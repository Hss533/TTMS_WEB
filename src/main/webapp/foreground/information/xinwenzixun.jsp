<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<div class="zixunaaa">
	<div class="zixunaaaList">
		<div>
			<c:forEach items="${ xinwenzixunList}" var="list" >
				<div class="zixunaaaListOne">
					<a class="zixunaaaListOneImg" href="${pageContext.request.contextPath }/information/details/${list.id}.html" target="_blank"><img src="${pageContext.request.contextPath }/${list.cover}"/></a>
					<div class="zixunaaaListOneContent">
						<h4><a href="${pageContext.request.contextPath }/information/details/${list.id}.html" target="_blank">${list.title}</a></h4>
						<div class="zixunaaaListOneContentzhong">
							${list.content}
						</div>
						<div class="zixunaaaListOneContentbootom">
							<span class="dianyingqqq">皮皮祁电影</span>
							<span class="shijianqqq"><fmt:formatDate value="${list.uploadTime}" pattern="MM-dd"  type="date" /></span>
							<span class="dizhiqqq"><!--相关电影-->
								<a href="${pageContext.request.contextPath }/film/show/${list.film.id}.html" target="_blank">${list.film.name}</a>
							</span>
							<span class="liulancishu">${list.clickHit }</span>
						</div>
					</div>
				</div>
			</c:forEach>
		</div>
	</div>
</div>