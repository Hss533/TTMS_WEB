<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<link href="${pageContext.request.contextPath }/static/css/information.css" rel="stylesheet" type="text/css"/>
<script type="text/javascript" src="${pageContext.request.contextPath}/static/jquery-easyui-1.3.3/jquery.min.js"></script>

<div class="information">
	<div class="information-left">
		<div class="information-left-title">
			<h1>${information.title }</h1>
		</div>
		<div class="information-message">
			<span>
				${information.source }&nbsp;<fmt:formatDate value="${information.uploadTime }" type="date" pattern="MM-dd HH:mm"/>&nbsp;&nbsp;<img src="${pageContext.request.contextPath }/static/image/information.png"/>${information.clickHit }次
			</span>
		</div>
		<div class="information-left-content">
			${information.content }
			<div class="dibuanniu">
				<span class="dianzan">
					<span class="dianzanIcon"></span>&nbsp;&nbsp;
					<span class="dianzanNum">${information.praiseHit }</span>
				</span>
				<div class="fenxiang">
					<div class="fengxianganniu">
						<span class="fengxiangtupian"></span>&nbsp;&nbsp;分享
					</div>
				</div>
			</div>
		</div>
	</div>
	<div class="information-right">
		<div class="information-right-title">
			<h3>相关电影</h3>
		</div>
		<div class="information-right-movie">
			<a target="_black" href="${pageContext.request.contextPath }/film/show/${information.film.id}.html" ><img src="${pageContext.request.contextPath }/${information.film.cover }"></a>
			<a target="_black" href="${pageContext.request.contextPath }/film/show/${information.film.id}.html" class="information-right-movie-title">${information.film.name }</a>
			<span class="information-right-movie-pingfeng">${information.film.score }</span>
		</div>
	</div>
</div>

<script type="text/javascript">
	
	var spans = $(".dianzan span");
	var nowUrl = window.location.pathname.substr(6);
	
	$(".dianzan").click(function()
	{
		var accountId = "${currentUser.id}";
		var informationId = "${information.id}";

		if(accountId == null || accountId == '')
		{
			window.location.href="${pageContext.request.contextPath }/login.jsp?lastUrl="+nowUrl;
			return ;
		}
		if(spans[0].getAttribute("class").indexOf("active") != -1)
		{
			var dianzanshu = spans[1].innerHTML;
			spans[1].innerHTML = parseInt(dianzanshu)-1;
			spans[0].setAttribute("class","dianzanIcon");
			$.post("${pageContext.request.contextPath}/user/fabulous.html",{type:2,userId:accountId,informationId:informationId},function(result){});
		}
		else
		{
			var dianzanshu = spans[1].innerHTML;
			spans[1].innerHTML = parseInt(dianzanshu)+1;
			spans[0].setAttribute("class","dianzanIcon active");
			$.post("${pageContext.request.contextPath}/user/fabulous.html",{type:1,userId:accountId,informationId:informationId},function(result){});
		}
	});
	var jundge = "${jundge}";
	if(jundge == "true")
	{
		spans[0].setAttribute("class","dianzanIcon active");
	}
	
</script>