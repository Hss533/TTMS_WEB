<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>    
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%> 
<link href="${pageContext.request.contextPath }/static/css/bt.css" rel="stylesheet" type="text/css"/>
<div style="height: 80px;"></div>

<script type="text/javascript">

	
</script>

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
	<div class="xzbf">
		<div class="xzbfleft">
			<div class="tsbf">
				<div class="kexuan example">
					<span>可选座位</span>
				</div>
				<div class="yishou example">
					<span>已售座位</span>
				</div>
				<div class="yixuan example">
					<span>已选座位</span>
				</div>
				<div class="qinglv example">
					<span>情侣座位</span>
				</div>
			</div>
			<div class="xzq">
				<div class="xzqleft">
					<c:forEach items="${perform.seat}" var ="list" begin="1" end="${perform.studio.length}" varStatus="end">
						<span class="szqleftId">${end.index }</span>
					</c:forEach>
				</div>
				<div class="xzqright">
					<div class="xzqrighttop">
						<div class="ymzj">荧幕中央</div>
						<div class="yjfgx"></div>
					</div>
					<div style="display:none">
						<c:forEach items="${soldSeat}" var="slist">
							<span class="soldSeat">${slist}</span>
						</c:forEach>
					</div>
					<div class="xzqrightbottom">
					
					<c:forEach items="${perform.seat}" var="llist" begin="1" end="${ perform.studio.length}" varStatus="row">
							<div class="yhzw">
								<c:forEach items="${perform.seat}" begin="1" end="${perform.studio.width}" varStatus="col">
									<span class="seat " onclick="chooseSeat(this)" id="${row.index},${col.index }">${row.index},${col.index }</span>
								</c:forEach>
							</div>
					</c:forEach>
					</div>
				</div>
			</div>
		</div>
		<div class="xzbfright">
			<div class="dytsqy">
				<div class="tpqy">
					<img src="${pageContext.request.contextPath }/${perform.film.cover}" />
				</div>
				<div class="dyjsqy">
					<p class="dymc ztcl">${perform.film.name }</p>
					<div class="leixingxingxi">
						<span>类型：</span>
						<span class="jtdyllxx"><c:forEach items="${perform.film.filmTypes}" var="list">${list.typeName }&nbsp;</c:forEach></span>
					</div>
					<div class="dysc">
						<span>时长：</span>
						<span class="jtdysj">${perform.film.duration}分钟</span>
					</div>
				</div>
			</div>
			<div class="pjsqy">
				<div class="pjsqyrow">
					<span class="pjsqyrowts">影院</span>
					<span class="pjsqyrowts zzz ztcl">猫爪影院</span>
				</div>
				<div class="pjsqyrow">
					<span class="pjsqyrowts">影厅</span>
					<span class="pjsqyrowts zzz ztcl">${perform.studio.name }</span>
				</div>
				<div class="pjsqyrow">
					<span class="pjsqyrowts">版本</span>
					<span class="pjsqyrowts zzz ztcl">英语3D</span>
				</div>
				<div class="pjsqyrow">
					<span class="pjsqyrowts">场次</span>
					<span class="pjsqyrowts zzz ztcl red"><fmt:formatDate value="${perform.startTime }" pattern="MM月dd日  HH:mm "  type="date" /></span>
				</div>
				<div class="pjsqyrow">
					<span class="pjsqyrowts">票价</span>
					<span class="pjsqyrowts zzz ztcl">￥${perform.price}/张</span>
				</div>
			</div>
			<div class="yxzwqy">
				<div class="yxzwqyts">
					<p class="gpxz">座位：一次最多选6个座位</p>
					<p class="mqmyxz">
						请<span>点击左侧</span>座位图选择座位
					</p>
				</div>
				<div class="yxzzw">
					<span class="zuoweidela">座位：</span>
					<div class="yxzdzw">
					</div>
				</div>
			</div>
			<div class="qrxdqy">
				<span class="zjan">总价：</span>
				<span class="jtdjq"></span>
			</div>
			<div class="qrqy">
				<div id="account">${currentUser.account }</div>
				<div class="tjform bkymd" onclick="qrmp();" id="yiqueren">确认购票</div>
			</div>
		</div>
	</div>
	<!-- 票超过6张的时候弹出 -->
	<div class="cglztcck">
		<div class="jtck">
			<span class="ygxxdtb"></span>
			<p class="tsnra">一次最多购买6张票</p>
			<div class="xydjdkk" onclick="gbzgtc()">我知道了</div>
		</div>
	</div>
</div>
<script type="text/javascript">

	function gbzgtc()
	{
		$(".cglztcck").css("display","none");
	}
	window.onload=function()
	{
		var account=document.getElementById("account").innerHTML;
		/*隐藏区域*/
		document.getElementsByClassName("yxzzw")[0].style.display="none";
		/*填入已经售出的票*/
		var soldSeat=document.getElementsByClassName("soldSeat");
		for(var i=0;i<soldSeat.length;i++)
		{
			var seatDiv=document.getElementById(soldSeat[i].innerHTML);
			
			seatDiv.setAttribute("class","seat sold");
		}
		
	}
	function chooseSeat(div)
	{
		var string= div.className;
		var row=div.innerHTML.split(",")[0];
		var col=div.innerHTML.split(",")[1];
		
		if(string.indexOf("choosed")>0)
		{
			/*显示隐藏区域*/
			var xzdzwxxDiv=document.getElementsByClassName("xzdzwxx");
			if(xzdzwxxDiv.length==1)
			{
				document.getElementsByClassName("yxzwqyts")[0].style.display="block";
				document.getElementsByClassName("yxzzw")[0].style.display="none";
			}
			/*已经选中*/
			div.setAttribute("class","seat"); 
			var divTicket=document.getElementsByClassName("yxzdzw");
			var divT=document.getElementById(row+"排"+col+"座");
			divTicket[0].removeChild(divT);
			document.getElementsByClassName("jtdjq")[0].innerHTML=parseInt(${perform.price})*parseInt(xzdzwxxDiv.length);
			if(xzdzwxxDiv.length<=0)
			{
				
				document.getElementById("yiqueren").setAttribute("class","tjform bkymd");
			}
		}
		else if(string.indexOf("sold")>0)
		{
			/*已经卖出*/
			return ;
		}
		else{
			var xzdzwxxDiv=document.getElementsByClassName("xzdzwxx");
			
			if(xzdzwxxDiv.length>5)
			{
				
				document.getElementsByClassName("cglztcck")[0].style.display="block";
				return;
			}
			/*显示一些区域*/
			document.getElementsByClassName("yxzzw")[0].style.display="block";
			/*隐藏一些区域*/
			document.getElementsByClassName("yxzwqyts")[0].style.display="none";
			/*设置选中 增加电影票*/
			div.setAttribute("class","seat choosed"); 
			
			var divTicket=document.getElementsByClassName("yxzdzw");
			var span = document.createElement("span");
			var node = document.createTextNode(row+"排"+col+"座");
			span.appendChild(node);
			span.setAttribute("class","xzdzwxx");
			span.setAttribute("id",row+"排"+col+"座");
			divTicket[0].appendChild(span);
			if(xzdzwxxDiv.length>0)
			{
				
				//document.getElementById("yiqueren").setAttribute("class","tjform bkred");
				document.getElementById("yiqueren").className="tjform bkred";
				
			}
			/*设置钱数*/
			document.getElementsByClassName("jtdjq")[0].innerHTML=parseInt(${perform.price})*parseInt(xzdzwxxDiv.length);
			
		}
	}
	function qrmp()
	{
		var xzdzwxxDiv=document.getElementsByClassName("xzdzwxx");
			if(xzdzwxxDiv.length<=0)
			{
				
				return;
			}
			var account=document.getElementById("account").innerHTML;
			if(account==null||account=='')
			{

				alert("请登录");
				return;//未登录的话
			}
			//这里应该是一个ajax提交数据
		 	var xzdzwxxDiv=document.getElementsByClassName("xzdzwxx");
			var string=new Array(xzdzwxxDiv.length);
			for(var i=0;i<xzdzwxxDiv.length;i++)
			{
				string[i]=xzdzwxxDiv[i].innerHTML;
				
			}
			var onePrice=parseInt(${perform.price});
			var totalPrice=parseInt(${perform.price})*parseInt(xzdzwxxDiv.length);
			var xmlHttp;
	    	if(window.XMLHttpRequest)
	    	{
	    		xmlHttp = new XMLHttpRequest();
	    	}
	    	else
	    	{
	    		xmlHttp = new ActiveXObject("Microsoft.XMLHTTP");
	    	}
	    	xmlHttp.onreadystatechange=function()
	    	{
	    		if (xmlHttp.readyState==4 && xmlHttp.status==200)
	    		{
	    			
	    			var info=JSON.parse(xmlHttp.responseText);
	    			var performId=info.performId;
	    			var uuid=info.uuid;
	    			var totalPrice=info.totalPrice;
	    			window.open("${pageContext.request.contextPath }/order/payment.do?performId="+performId+"&uuid="+uuid+"&totalPrice="+totalPrice);
	    		}
	    	};
	    	xmlHttp.open("post" ,"../order/qrmp.do", true);
	    	xmlHttp.setRequestHeader("Content-type","application/x-www-form-urlencoded");
	    	xmlHttp.send("string="+string+"&&performId="+${perform.id}+"&&totalPrice="+totalPrice); 
	}


	
</script>