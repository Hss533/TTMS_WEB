<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<link href="${pageContext.request.contextPath}/static/css/sr.css" rel="stylesheet" type="text/css"/>

<Script type="text/javascript">

	$("#searchContent2").keydown(function(e) 
	{  
		if(e.keyCode == 13)
		{  
			$("#xindefrom").submit();
     	}
	});  
	
	function tijiao(type)
	{
		var val = $("#ycdssnr").val();
		window.location.href = "${pageContext.request.contextPath}/manager2/search.html?searchContent="+val+"&type="+type;
	}
	
</Script>

<div style="height: 81px;"></div>
<div class="searchBar">
	<form id="xindefrom" action="${pageContext.request.contextPath}/manager2/search.html" method="post">
		<input id="searchContent2" name="searchContent" value="${searchContent }" type="text" class="search" autocomplete="off" placeholder="请输入你要查询的影视剧、影人..." />
		<input type="hidden" value="${searchContent }" id="ycdssnr"/>
		<button class="tijiao" type="submit" ></button>
	</form> 
</div>
<div class="typeChoose">
	<ul class="daohanglan">
		<li class="ytdh"><a href="javascript:tijiao(1)">影视剧（${count }）</a></li>
		<li class="ytdh"><a href="javascript:tijiao(2)">影人（0）</a></li>
	</ul>
</div>
<c:choose>
	<c:when test="${type == 1 }">
		<jsp:include page="ysj.jsp"></jsp:include>
	</c:when>
	<c:otherwise>
		<jsp:include page="yr.jsp"></jsp:include>
	</c:otherwise>
</c:choose>

<script type="text/javascript">

	var type = "${type}";
	var as = $(".daohanglan a");
	as[type-1].setAttribute("class","active");
	
</script>