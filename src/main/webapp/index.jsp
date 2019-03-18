<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link href="${pageContext.request.contextPath }/static/css/index.css" rel="stylesheet" type="text/css"/>
<script type="text/javascript" src="${pageContext.request.contextPath}/static/jquery-easyui-1.3.3/jquery.min.js"></script>
<title>
<c:choose>
	<c:when test="${pageTitle==null}">
		皮皮祁电影--一网打进好电影
	</c:when>
	<c:otherwise>
		${pageTitle}
	</c:otherwise>
</c:choose>
</title>
</head>
<body>
	
	<jsp:include page="foreground/common/head.jsp"></jsp:include>
	<c:choose>
		<c:when test="${mainPage==null}">
			<jsp:include page="foreground/common/main.jsp"></jsp:include>
		</c:when>
		<c:otherwise>
			<jsp:include page="${mainPage}.jsp"></jsp:include>
		</c:otherwise>
	</c:choose>
	<jsp:include page="foreground/common/foot.jsp"></jsp:include>

</body>
</html>