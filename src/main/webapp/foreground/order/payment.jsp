<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>  

<link href="${pageContext.request.contextPath }/static/css/pm.css" rel="stylesheet" type="text/css"/>
<div style="height: 80px;"></div>

<div class="mpqy">
	<div class="mpqytop">
		<div class="mpqytopd active first">
			<span class="titile">1</span>
			<div class="mpqytopdBar"></div>
			<span class="ttext">选择影片场次</span>
		</div>
		<div class="mpqytopd active">
			<span class="titile">2</span>
			<div class="mpqytopdBar"></div>
			<span class="ttext">选择座位</span>
		</div>
		<div class="mpqytopd active">
			<span class="titile">3</span>
			<div class="mpqytopdBar"></div>
			<span class="ttext">15分钟内付款</span>
		</div>
		<div class="mpqytopd last">
			<span class="titile">4</span>
			<div class="mpqytopdBar"></div>
			<span class="ttext">影院取票观影</span>
		</div>
	</div>
	<div class="ttsj">
		<div class="ttsjxx">
			<p class="timeLip">
				请在<span id="minute">15</span>分钟<span id="second">0</span>秒内完成订单
			</p>
			<p class="ttsjxxts">超时订单会自动取消，如遇支付问题，请致电猫眼客服：1010-5335</p>
		</div>
	</div>
	<p class="warning">请仔细核对场次信息，出票后将<span>无法退票和改签</span></p>
	<table class="orderTable">
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
				<td class="dymca">${perform.film.name}</td>
				<td class="syrqa"><fmt:formatDate value="${perform.startTime}" pattern="MM月dd日  HH:mm"  type="date" /></td>
				<td class="dydza">猫爪影院</td>
				<td>
					<span class="jhfyt">${perform.studio.name}</span>
					<div class="zuowei">
						<div class="">
							<c:forEach items="${seatList}" var="list">
								<span class="ybk">
									<i>${list.row }</i>排<i>${list.col}</i>座
								</span>
							</c:forEach>
						</div>
					</div>
				</td>
			</tr>
		</tbody>
	</table>
	<div class="zfqy">
		<div class="zfqyjp">
			<span>实际支付：</span>
			<span class="qa">
				${floatTotalPrice }
			</span>
		</div>
		<div class="zfqnn">
			<div class="zfana" onclick="pay()">确认支付</div>
			<div id="payDate" style="display:none">${payDate}</div>
		</div>
	</div>
	
	<!-- 这个时间应该由后台向前台传递 -->
	<!-- 支付失败后弹出窗口，修改display属性即可  -->
	<div class="zhifushibaick">
		<div class="zhifushibaimain">
			<span class="tishi"></span>
			<p>支付超时，该订单已失效，请重新购买</p>
			<div class="ygxan" onclick="tzhq()">我知道了</div>
		</div>
	</div>
</div>
<script type="text/javascript">
	function pay()
	{
		window.location.href="${pageContext.request.contextPath }/order/details/${uuid}.html?ispay=1"
	}
	function tzhq()
	{
		//到时候要跳转到选择的电影
		window.location.href="${pageContext.request.contextPath }/studio/allFilms.html?filmId=${perform.film.id}";
	}
	var payDate=new Date(document.getElementById("payDate").innerHTML);//获取支付时间
	function showTime()
	{
		var date=new Date();//获取当前时间
		var minute=parseInt(15-(date-payDate)/(60*1000));
		var second=parseInt(60-((date-payDate)/1000)%60);
		$("#second").text(second);
		$("#minute").text(minute);
		if(minute<0||(minute==0&&second==0))
		{
			window.clearInterval(jsff);
			$(".zhifushibaick").css("display","block");
		}
		
	}
	
	// 每过1S执行一次的方法
	var jsff = window.setInterval("showTime()",1000);
	
</script>