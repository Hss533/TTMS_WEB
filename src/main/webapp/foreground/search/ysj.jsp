<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<script type="text/javascript">

	

</script>

<div class="ssjgqy">
	<div class="ssjgzyqy">
		<c:choose>
			<c:when test="${count == 0}">
				<div class="cwtsqy">
					<h3>很抱歉，没找到相关的影视剧</h3>
					<dl>
						<dt>小喵建议您：</dt>
						<dd>1. 请检查输入的关键词是否有误</dd>
						<dd>2. 请缩短关键词</dd>
					</dl>
				</div>
			</c:when>
			<c:otherwise>
				<dl class="dylb">
					<c:forEach items="${filmList }" var="film">
						<dd>
							<div class="tpbfff">
								<a href="${pageContext.request.contextPath}/film/show/${film.id}.html">
									<div class="yztppp">
										<img src="${pageContext.request.contextPath}/${film.cover}" >
									</div>
								</a>
							</div>
							<div class="dymcbfff">
								<a href="${pageContext.request.contextPath}/film/show/${film.id}.html">${film.name }</a>
							</div>
							<div class="dyjsbfff">${film.englishName }</div>
							<div class="sysjbfff">
								<div class="sysjbfffp">${film.score }</div>
								<div class="sysjbfffl">
									<c:forEach items="${film.filmTypes}" var="list">
										${list.typeName}&nbsp;
									</c:forEach>
								</div>
								<div class="sysjbfffs"><fmt:formatDate value="${film.publishDate}" pattern="yyyy-MM-dd"  type="date" />大陆首播</div>
							</div>
						</dd>
					</c:forEach>
				</dl>
			</c:otherwise>
		</c:choose>
	</div>
</div>

