<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<link href="${pageContext.request.contextPath }/static/css/ddxq.css" rel="stylesheet" type="text/css"/>
<div style="height: 80px;"></div>

<div class="dingdanxiangqing">
	<div class="ddxq">
		<div class="ddxqtop finish" id="01" style="display:none">
			<p class="ddxqtopTitle">已完成</p>
			<p class="ddtkts"></p>
		</div>
		<div class="ddxqtop tuikuan" id="02" style="display:none">
			<p class="ddxqtopTitle">退款成功</p>
			<p class="ddtkts">退款到账时间视银行处理速度而定，一般1～3个工作日内可到账</p>
		</div>
		<div class="ddxqtop unpaid" id="03" style="display:none">
			<p class="ddxqtopTitle">待支付</p>
			<p class="ddtkts">
				请在<span id="minute">15</span>分钟<span id="second">0</span>秒内完成订单
			</p>
		</div>
	</div>
	<div class="xxddh">
		<span class="xxddid">皮皮祁订单号:${ orderDetials.uuid}</span>
		<span class="xxddts">（有订单问题可拨打客服电话<i>1010-5335</i>，工作时间: 9:00-24:00）</span>
	</div>
	<table class="xxddtable">
		<thead>
			<tr>
				<th>影片</th>
				<th>时间</th>
				<th>影院</th>
				<th>座位</th>
			</tr>
		</thead>
		<tbody>
			<tr>
				<td class="xxddtablename">${perform.film.name }</td>
				<td class="xxddtabletime"><fmt:formatDate value="${perform.startTime}" pattern="MM月dd日  HH:mm"  type="date" /></td>
				<td class="xxddtabledian">皮皮影城</td>
				<td>
					<span class="tingting">${perform.studio.name }</span>
					<div class="seatssss">
						<div>
							<c:forEach items="${ ticket}" var="list">
								<span><i>${list.seat.row}</i>排<i>${list.seat.col }</i>座</span>
								
							</c:forEach>
						</div>
					</div>
				</td>
			</tr>
		</tbody>
	</table>
	<div class="ddxqxm">
		<div class="ddxqxmjtxx">
			<div class="ddxqxmleft">
				<p class="ddxqxmleftn">皮皮影城</p>
				<p class="ddxqxmleftd">地址: 西安邮电大学东区教学楼</p>
				<p class="ddxqxmleftt">电话: 029-61816959</p>
			</div>
			<div class="ddxqxmright">
				<span>总价：</span>
				<span class="zhdjq">${totalPrice }</span>
			</div>
		</div>
	</div>
</div>
<script type="text/javascript">
	window.onload=function()
	{
		
			var state=parseInt(${orderDetials.state});
			
			if(state==1){
				//待支付
				document.getElementById("03").style.display="block";
			}
			if(state==2){
				//待支付
				document.getElementById("01").style.display="block";
			}
			if(state==3){
				//待支付
				document.getElementById("02").style.display="block";
			}
	}
</script>