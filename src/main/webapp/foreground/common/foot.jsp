<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<link href="${pageContext.request.contextPath }/static/css/foot.css" rel="stylesheet" type="text/css"/>

<div class="foot">
	<p class="foot_text" style="padding-top: 40px">
		<span class="foot_text">违法和不良信息举报电话:&nbsp;&nbsp;4006018900&nbsp;&nbsp;举报邮箱:&nbsp;jubao.maoyan@maoyan.com</span><br>
		<span class="foot_text">友情链接&nbsp;&nbsp;:&nbsp;&nbsp;
			<c:forEach items="${linkList}" var="list"  begin="0" end="${linkList.size()-2 }">
				<a href="${list.linkUrl }" target="_blank" >${list.linkName }</a>&nbsp;&nbsp;|&nbsp;&nbsp;
			</c:forEach>
			<c:forEach items="${linkList}" var="list"  begin="${linkList.size()-1 }" end="${linkList.size()-1 }">
				<a href="${list.linkUrl }" target="_blank" >${list.linkName }</a>
			</c:forEach>
		</span>
		<br>
		<span class="foot_text">©2016&nbsp;&nbsp;猫眼电影&nbsp;&nbsp;maoyan.com&nbsp;&nbsp;京ICP证160733号&nbsp;&nbsp;京ICP备16022489号-1&nbsp;&nbsp;京公网安备&nbsp;&nbsp;11010502030881号&nbsp;&nbsp;网络文化经营许可证&nbsp;&nbsp;电子公告服务规则</span><br>
		<span class="foot_text">西安皮皮祁文化传媒无限公司</span><br>
	</p>
</div>