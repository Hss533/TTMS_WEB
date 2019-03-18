<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<link href="${pageContext.request.contextPath}/static/css/hotSpot.css" rel="stylesheet" type="text/css"/>

<div style="height: 80px;"></div>
<div class="informationNav">
	<ul>
		<li><a href="${pageContext.request.contextPath }/information/hot.html?showType=1">热点首页</a></li>
		<li><a href="${pageContext.request.contextPath }/information/hot.html?showType=2">新闻资讯</a></li>
		<li><a href="${pageContext.request.contextPath }/information/hot.html?showType=3">精彩图集</a></li>
	</ul>
</div>
<c:if test="${showType == 1 }">
	<jsp:include page="redianzixun.jsp"></jsp:include>
</c:if>
<c:if test="${showType == 2 }">
	<jsp:include page="xinwenzixun.jsp"></jsp:include>
</c:if>
<c:if test="${showType == 3 }">
	<jsp:include page="jingcaituji.jsp"></jsp:include>
</c:if>

<script type="text/javascript">

	var showType = "${showType}";
	var as = $(".informationNav a");
	as[parseInt(showType)-1].setAttribute("class","active");
	as[parseInt(showType)-1].setAttribute("href","javascript:vois(0)");
	// 将顶部的颜色修改
	var headnavigation = $(".head-navigation a");
	headnavigation[4].setAttribute("class","active");

</script>