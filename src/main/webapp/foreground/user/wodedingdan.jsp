<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>  

<div class="jbtitle">我的订单</div>
<c:forEach items="${orderDetialsList}" var="list" >
<div class="oneOrder">
	<div class="oneOrderHeader">
		<span class="oneOrderTimer"></span>
		<span class="oneOrderpdh">猫眼订单号:${list.uuid }</span>
		<span class="scannn"></span>
	</div>
	<c:forEach items="${ list.tickets}" var="tlist" varStatus="con">
		<div class="oneOrderContent">
			<div class="oneOrderImage">
				<img src="${pageContext.request.contextPath }/${tlist.perform.film.cover}" />
			</div>
			<div class="oneOrderjs">
				<div class="movieName"><fmt:formatDate value="${list.orderDateTime}" pattern="yyyy-MM-dd  HH:mm"  type="date" /></div>
				<div class="studioName">皮皮祁影院</div>
				<div class="selectSeat">
					<span>${tlist.perform.studio.name }</span> 
					<span>${tlist.seat.row }排${tlist.seat.col }座</span>
				</div>
				<div class="showwwtime"><fmt:formatDate value="${tlist.perform.startTime}" pattern="MM月dd日  HH:mm"  type="date" /></div>
			</div>
			<div class="saleMoney">￥${tlist.perform.price}</div>
			<span class="payStatue" style="display:none">${list.state}</span>
			<div class="orderStateee" ></div>
			<div class="ckxqqq">
				
				<c:choose>
					<c:when test="${list.state ==1 }">
						<div>
							<a href="${pageContext.request.contextPath }/order/payment.html?uuid=${list.uuid }&totalPrice=${tlist.perform.price}&performId=${tlist.perform.id}">查看详情</a>
						</div>							
					</c:when>
					<c:otherwise>
						<div>
							<a href="${pageContext.request.contextPath }/order/details/${list.uuid }.html">查看详情</a>
						</div>
					</c:otherwise>	
				</c:choose>
			</div>
		</div>
	</c:forEach>
</div>
</c:forEach>
<script type="text/javascript">
	window.onload=function()
	{
		
		var state=document.getElementsByClassName("payStatue");
		var a=document.getElementsByClassName("orderStateee");
		
		for(var i=0;i<state.length;i++)
		{
			var intState=parseInt(state[i].innerHTML);
			if(intState==1)
			{
				
				a[i].innerHTML="待支付";
			}
			if(intState==2)
			{
				
				a[i].innerHTML="已完成";
			}
			if(intState==3)
			{
				
				a[i].innerHTML="已取消";
			}
			if(intState==4)
			{
				
				a[i].innerHTML="已退款";
			}	
		}
		
	}
</script>