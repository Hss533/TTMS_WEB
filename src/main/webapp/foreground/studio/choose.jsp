<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>  
<link href="${pageContext.request.contextPath }/static/css/choose.css" rel="stylesheet" type="text/css"/>
<script type="text/javascript" src="${pageContext.request.contextPath}/static/jquery-easyui-1.3.3/jquery.min.js"></script>
<!-- <script type="text/javascript" src="http://api.map.baidu.com/api?v=2.0&ak=OOOsGR15n4DDeVnyqtgldN0mW2SI4buM"></script> -->
 
<div style="height: 80px;"></div>

<div class=topBox>
	<div class="dianyinglanwei">
		<div class="dianyinglanwei-left">
			<div class="imgContent">
				<img src="${pageContext.request.contextPath}/static/image/studio.png" />
			</div>
		</div>
		<div class="dianyinglanwei-center">
			<h3 class="studioName">祁皮皮电影院</h3>
			<div class="studioPlace">西安邮电大学计算机学院东区教学楼</div>
			<div class="telephone">电话：029-62358787</div>
			<div class="yingyuanfuwu">
				<div class="yingyuanfuwu-title">影院服务</div>
				<div class="xiaotishi">
					<span>3D眼睛</span>
					<p>免费提供3D眼镜</p>
				</div>
				<div class="xiaotishi">
					<span>儿童优惠</span>
					<p>1.2米以下儿童可在家长陪同下无座观看普通影片，观看儿童片可享受优惠购票.</p>
				</div>
				<div class="xiaotishi">
					<span>可停车</span>
					<p>楼下有停车位</p>
				</div>
			</div>
		</div>
		<div class="dianyinglanwei-right">
			<div id="allmap"></div>
		</div>
	</div>
</div>
<div class="containBox">
	<div class="containBox-movies">
		<div id="lllist" class="movie-list-lunbo" style="left: 0px;">
			<c:forEach items="${filmList }" var="list" varStatus="status">
				<div class="movie-list-lunbo-img" id="${list.id }">
					<a href="javascript:clickFilm(${status.index+1})"><img src="${pageContext.request.contextPath}/${list.cover}" /></a>
				</div>
			</c:forEach>
		</div>
		<span class="zuobianjiantou">
			<a id="ppprev" href="javascript:void(0)">
				<img src="${pageContext.request.contextPath}/static/image/zuobian.png" />
			</a>
		</span>
		<span class="youbianjiantou">
			<a id="nnnext" href="javascript:void(0)">
				<img src="${pageContext.request.contextPath}/static/image/youbian.png" />
			</a>
		</span>
	</div>
	<c:forEach items="${filmList}" var="flist">
		<div class="ygdyjtxx" id="${flist.id }">
			<div class="jutixingxi">
				<div class="jutixingxihead">
					<div class="dianyingxinxi">
						<h3>${flist.name}</h3>
						<span>${flist.score }</span>
					</div>
					<div class="jutixingxi2">
						<div class="whyerror">
							<span class="canshu">时长：</span>
							<span class="jutizhi">${flist.duration}分钟</span>
						</div>
						<div class="whyerror">
							<span class="canshu">类型：</span>
							<span class="jutizhi">动画</span>
						</div>
						<div class="whyerror">
							<span class="canshu">主角：</span>
							<span class="jutizhi">${flist.employee.name}</span>
						</div>
					</div>
				</div>
			</div>
			<div class="guanyingshijian">
				<span>观影时间：</span>
			</div>
			<div class="biaoge">
				<table class="shujulala">
					<thead>
						<tr>
							<th>放映时间</th>
							<th>语言版本</th>
							<th>放映厅</th>
							<th>售价（元）</th>
							<th>选座购票</th>
						</tr>
					</thead>
					<tbody>
						<c:forEach items="${flist.performs }" var="perform"  varStatus="status">
							<tr>
								<td>
									<span class="beginTime"><fmt:formatDate value="${perform.startTime}" pattern="HH:mm"  type="date" /></span>
									<input type="hidden" value="<fmt:formatDate value="${perform.startTime}" pattern="yyyy-MM-dd"  type="date" />" class="shangyingriqi"/>
									<br>
									<span class="endTime"><fmt:formatDate value="${perform.endTime}" pattern="HH:mm"  type="date" />散场</span>
								</td>
								<td>
									<span class="putongspan">国语2D</span>
								</td>
								<td>
									<span class="putongspan">${perform.studio.name }</span>
								</td>
								<td>
									<span class="piaojia"><span class="jutiqianshu">${perform.price }</span></span>
								</td>
								<td>
									<a href="javascript:choosePerform(${flist.id},${perform.id });" class="xuanzuogoupiao">选座购票</a>
								</td>
							</tr>
						</c:forEach>
					</tbody>
				</table>
			</div>
		</div>
	</c:forEach>
</div>
<script type="text/javascript">
	
	var movielistlunboimgs = $(".movie-list-lunbo-img");
	var hddy = $(".ygdyjtxx");
	
 	var width = 170 * movielistlunboimgs.length ;
 	$(".movie-list-lunbo").css("width",width+'px');
 	var xingqiji = ["星天","星一","星二","星三","星四","星五","星六"];
 	
 	function clickFilm(number)
 	{
 		
 		// 去除之前电影自动添加的观影时间<span>字段
 		var guanyingshijian = $(".active .guanyingshijian");
 		var guanyingshijianDays = $(".active .guanyingshijianDay")
		for(var i=0;i<guanyingshijianDays.length;i++)
		{
			guanyingshijian[0].removeChild(guanyingshijianDays[i]);
		}
 		
 		// 将选择的电影设置新样式，原选择电影去除样式
 		var movielistlunboimgactive = $(".movie-list-lunbo-img.active");
 		movielistlunboimgactive[0].setAttribute("class","movie-list-lunbo-img");
 		movielistlunboimgs[number-1].setAttribute("class","movie-list-lunbo-img active");
 		
 		// 将选择电影的具体信息显示出来，原具体信息设为隐藏
 		var zzxsddyxx = $(".ygdyjtxx.active");
 		zzxsddyxx[0].setAttribute("class","ygdyjtxx");
 		hddy[number-1].setAttribute("class","ygdyjtxx active");
 		
 		// 计算观影时间，将新的<span>标签添加进去
 		jsgysj();
 	}
 	
 	// 格式化js时间，返回yyyy-MM-dd HH:mm:ss 或者 yyyy-MM-dd
	Date.prototype.Format = function(fmt)   
	{  
		var o = 
		{   
			"M+" : this.getMonth()+1,                 //月份   
			"d+" : this.getDate(),                    //日   
			"h+" : this.getHours(),                   //小时   
			"m+" : this.getMinutes(),                 //分   
			"s+" : this.getSeconds(),                 //秒   
			"q+" : Math.floor((this.getMonth()+3)/3), //季度   
			"S"  : this.getMilliseconds()             //毫秒   
		};   
	  	if(/(y+)/.test(fmt))
	  	{
	  		fmt=fmt.replace(RegExp.$1, (this.getFullYear()+"").substr(4 - RegExp.$1.length));   	
	  	}
	  	for(var k in o)
	  	{
	  		if(new RegExp("("+ k +")").test(fmt))
	  		{
	  			fmt = fmt.replace(RegExp.$1, (RegExp.$1.length==1) ? (o[k]) : (("00"+ o[k]).substr((""+ o[k]).length)));
	  		}
	  	}
		return fmt;   
	}
	
 	// 计算两个时间差多少天，输入必须为两个字符串，格式为yyyy-MM-dd
	function daysBetween(DateOne,DateTwo)
	{   
	    var OneMonth = DateOne.substring(5,DateOne.lastIndexOf ('-'));  
	    var OneDay = DateOne.substring(DateOne.length,DateOne.lastIndexOf ('-')+1);  
	    var OneYear = DateOne.substring(0,DateOne.indexOf ('-'));  
	  
	    var TwoMonth = DateTwo.substring(5,DateTwo.lastIndexOf ('-'));  
	    var TwoDay = DateTwo.substring(DateTwo.length,DateTwo.lastIndexOf ('-')+1);  
	    var TwoYear = DateTwo.substring(0,DateTwo.indexOf ('-'));  
	  
	    var cha=((Date.parse(OneMonth+'/'+OneDay+'/'+OneYear)- Date.parse(TwoMonth+'/'+TwoDay+'/'+TwoYear))/86400000);   
	    return Math.abs(cha);  
	}
	
	// 点击具体时间
	function djjtsj(djsj)
	{
		// 将之前点击的按钮样式去除
		var yqdjsj = $(".active.guanyingshijianDay");
		if(yqdjsj != null && yqdjsj.length != 0)
		{
			yqdjsj[0].setAttribute("class","guanyingshijianDay");
		}
		// 将以前被隐藏的tr设置为可见
		var trs = $(".active tbody tr");
		for(var i=0;i<trs.length;i++)
		{
			trs[i].style.display="table-row";
			trs[i].setAttribute("class","");
		}
		if(djsj == null)
		{
			return ;
		}
		djsj.setAttribute("class","guanyingshijianDay active");
		var time = djsj.innerText.substring(3).split("月");
		if(time[0].length == 1)
		{
			time[0] = "0"+time[0];
		}
		if(time[1].length == 1)
		{
			time[1] = "0"+time[1];
		}
		var xzsj = time[0]+time[1];
		var ygtrTime = $(".active .shangyingriqi");
		var jundge = 0;
		var jundge2 = 0;
		for(var i=0;i<trs.length;i++)
		{
			var bjsj = ygtrTime[i].value.substring(5).replace(/[^0-9]/ig, "");
			if(jundge == 0 && xzsj == bjsj)
			{
				jundge = jundge + 1;
				jundge2 = jundge2 + 1;
			}
			else if(jundge == 0 && xzsj != bjsj)
			{
				trs[i].style.display="none";
			}
			else if(jundge == 1 && xzsj == bjsj)
			{
				jundge2 = jundge2 + 1;
				if(jundge2 % 2 == 0)
				{
					trs[i].setAttribute("class","beijingse");
				}
			}
			else if(jundge == 1 && xzsj != bjsj)
			{
				jundge = jundge + 1;
				trs[i].style.display="none";
			}
			else
			{
				trs[i].style.display="none";
			}
		}
	}
	
	// 计算关于时间
    function jsgysj()
    {
	    var beginTimes = $(".active .shangyingriqi");
	    var nowTime = new Date().Format("yyyy-MM-dd");
	    var guanyingshijian = $(".active .guanyingshijian");
	    var leTime,chazhi;
	    if(beginTimes == null)
	    {
	    	return;
	    }
	    for(var i=0;i<beginTimes.length;i++)
	    {
	    	leTime = new Date(beginTimes[i].value);
	    	var leTimeFor = leTime.Format("yyyy-MM-dd");
	    	if(i == 0)
	    	{
	    		chazhi = daysBetween(leTimeFor,nowTime);
	    		var month = leTime.getMonth() + 1;
	    		var dat = leTime.getDate();
	    		var day = leTime.getDay();
	    		if(chazhi == 0)
	    		{
	    			var span = document.createElement("span");
	    			var node = document.createTextNode("今天 "+month+"月"+dat);
	    			span.appendChild(node);
	    			span.setAttribute("class","guanyingshijianDay");
	    			span.setAttribute("onClick","djjtsj(this)");
	    			guanyingshijian[0].appendChild(span);
	    		}
	    		else if(chazhi == 1)
	    		{
	    			var span = document.createElement("span");
	    			var node = document.createTextNode("明天 "+month+"月"+dat);
	    			span.appendChild(node);
	    			span.setAttribute("class","guanyingshijianDay");
	    			span.setAttribute("onClick","djjtsj(this)");
	    			guanyingshijian[0].appendChild(span);
	    		}
	    		else if(chazhi == 2)
	    		{
	    			var span = document.createElement("span");
	    			var node = document.createTextNode("后天 "+month+"月"+dat);
	    			span.appendChild(node);
	    			span.setAttribute("class","guanyingshijianDay");
	    			span.setAttribute("onClick","djjtsj(this)");
	    			guanyingshijian[0].appendChild(span);
	    		}
	    		else
	    		{
	    			var span = document.createElement("span");
	    			var node = document.createTextNode(xingqiji[day]+" "+month+"月"+dat);
	    			span.appendChild(node);
	    			span.setAttribute("class","guanyingshijianDay");
	    			span.setAttribute("onClick","djjtsj(this)");
	    			guanyingshijian[0].appendChild(span);
	    		}
	    	}
	    	else
	    	{
	    		var nowchazhi = daysBetween(leTimeFor,nowTime);
	    		if(nowchazhi == chazhi);
	    		else
	    		{
	    			chazhi = nowchazhi;
		    		var month = leTime.getMonth() + 1;
		    		var dat = leTime.getDate();
		    		var day = leTime.getDay();
		    		if(chazhi == 1)
		    		{
		    			var span = document.createElement("span");
		    			var node = document.createTextNode("明天 "+month+"月"+dat);
		    			span.appendChild(node);
		    			span.setAttribute("class","guanyingshijianDay");
		    			span.setAttribute("onClick","djjtsj(this)");
		    			guanyingshijian[0].appendChild(span);
		    		}
		    		else if(chazhi == 2)
		    		{
		    			var span = document.createElement("span");
		    			var node = document.createTextNode("后天 "+month+"月"+dat);
		    			span.appendChild(node);
		    			span.setAttribute("class","guanyingshijianDay");
		    			span.setAttribute("onClick","djjtsj(this)");
		    			guanyingshijian[0].appendChild(span);
		    		}
		    		else
		    		{
		    			var span = document.createElement("span");
		    			var node = document.createTextNode(xingqiji[day]+" "+month+"月"+dat);
		    			span.appendChild(node);
		    			span.setAttribute("class","guanyingshijianDay");
		    			span.setAttribute("onClick","djjtsj(this)");
		    			guanyingshijian[0].appendChild(span);
		    		}
	    		}	    	
	    	}
	    }
		
	    // 默认选择第一个观影时间
	    var guanyingshijianDays = $(".guanyingshijianDay");
	    djjtsj(guanyingshijianDays[0]);
    }
	
	//百度地图API功能
/* 	var map = new BMap.Map("allmap");
	map.centerAndZoom(new BMap.Point(108.913327,34.159654),14.5);
	var top_right_navigation = new BMap.NavigationControl({anchor: BMAP_ANCHOR_TOP_RIGHT, type: BMAP_NAVIGATION_CONTROL_SMALL}); 
	map.addControl(top_right_navigation); 
	map.enableScrollWheelZoom(true);
	map.clearOverlays(); 
	var new_point = new BMap.Point(108.913327,34.159654);
	var marker = new BMap.Marker(new_point);
	map.addOverlay(marker);
	map.panTo(new_point); */

	window.onload = function()
	{
	    var list = document.getElementById('lllist');
	    var prev = document.getElementById('ppprev');
	    var next = document.getElementById('nnnext');
	    
	    var moveloaction = parseInt(list.style.left);
	    var jixian = parseInt(width/1020)*1020;
	    
	    function yidongyidong(offset)
	    {
	    	var currentlocation = parseInt(list.style.left);
	    	while(currentlocation!=moveloaction)
	        {
	            return false;
	        }
	    	moveloaction = currentlocation + offset;
	    	
	    	var speed;
	    	
	    	if(offset > 0)
	        {
	            speed = 20;
	        }
	    	else
	        {
	            speed = -20;     
	        }
	    	if(moveloaction < -1*jixian)
	    	{
	    		moveloaction = moveloaction - offset;
	    		return false;
	    	}
	    	if(moveloaction > 0)
	        {
	    		moveloaction = moveloaction - offset;
				return false;
	        }
	    	
	    	// 消除之前选中电影选择观影时间带来的影响
	    	djjtsj(null);
	    	
	    	// 消除之前被选中电影的观影时间span
	    	var guanyingshijian = $(".active .guanyingshijian");
	 		var guanyingshijianDays = $(".active .guanyingshijianDay")
			for(var i=0;i<guanyingshijianDays.length;i++)
			{
				guanyingshijian[0].removeChild(guanyingshijianDays[i]);
			}
	 		
	    	for(var i=0;i<movielistlunboimgs.length;i++)
	    	{
	    		var shuxing = movielistlunboimgs[i].getAttribute("class");
	    		if(shuxing.indexOf("active") != -1)
	    		{
	    			if(speed < 0)
	    			{
	    				if(i+6 < movielistlunboimgs.length)
		    			{
	    					movielistlunboimgs[i].setAttribute("class","movie-list-lunbo-img");
		    				movielistlunboimgs[i+6].setAttribute("class","movie-list-lunbo-img active");
		    				
		    		 		hddy[i].setAttribute("class","ygdyjtxx");
		    		 		hddy[i+6].setAttribute("class","ygdyjtxx active");
		    		 		jsgysj();
		    			}
		    			else
		    			{
		    				movielistlunboimgs[i].setAttribute("class","movie-list-lunbo-img");
		    				movielistlunboimgs[movielistlunboimgs.length-1].setAttribute("class","movie-list-lunbo-img active");
		    			
		    				hddy[i].setAttribute("class","ygdyjtxx");
		    		 		hddy[movielistlunboimgs.length-1].setAttribute("class","ygdyjtxx active");
		    		 		jsgysj();
		    			}
	    			}
	    			else
	    			{
	    				if(i-6 > 0 )
		    			{
	    					movielistlunboimgs[i].setAttribute("class","movie-list-lunbo-img");
		    				movielistlunboimgs[i-6].setAttribute("class","movie-list-lunbo-img active");
		    				
		    				hddy[i].setAttribute("class","ygdyjtxx");
		    		 		hddy[i-6].setAttribute("class","ygdyjtxx active");
		    		 		jsgysj();
		    			}
		    			else
		    			{
		    				movielistlunboimgs[i].setAttribute("class","movie-list-lunbo-img");
		    				movielistlunboimgs[0].setAttribute("class","movie-list-lunbo-img active");
		    				
		    				hddy[i].setAttribute("class","ygdyjtxx");
		    		 		hddy[0].setAttribute("class","ygdyjtxx active");
		    		 		jsgysj();
		    			}
	    			}
	    			break;
	    		}
	    	}
	    	
	    	currentlocation = parseInt(list.style.left);
	    	timer2 = setInterval(function()
   	        {
   	            list.style.left = currentlocation + speed +"px";
   	            currentlocation = parseInt(list.style.left);
   	            var result = moveloaction - currentlocation;
   	            if(Math.abs(result)<=20)
   	            {
   	                clearInterval(timer2);
   	                list.style.left = moveloaction +"px";
   	            }
   	        },1)
   	        return true;
	    }
	    
	    prev.onclick = function()
	    {
	        if(yidongyidong(1020));
	    }
	    next.onclick = function()
	    {
	        if(yidongyidong(-1020));
	    }
	    
	    var headnavigation = $(".head-navigation a");
		headnavigation[2].setAttribute("class","active");
	    
	    $(".userIcon,.toDialog").hover(function()
   		{
   			$(".dropDownUnLogin").css("border-left","1px solid #CCCCCC");
   			$(".dropDownUnLogin").css("border-right","1px solid #CCCCCC");
   			$(".toDialog").css("display","block");
   		},
   		function()
   		{
   			$(".dropDownUnLogin").css("border-left","1px solid white");
   			$(".dropDownUnLogin").css("border-right","1px solid white");
   			$(".toDialog").css("display","none");
   		});
	    
	    var filmId = "${filmId}";
	    if(filmId == null || filmId == "")
	    {
	    	hddy[0].setAttribute("class","ygdyjtxx active");
	    	movielistlunboimgs[0].setAttribute("class","movie-list-lunbo-img active")
	    }
	    else
	    {
	    	for(var i=0;i<hddy.length;i++)
		    {
		    	if(hddy[i].getAttribute("id") == filmId)
		    	{
		    		hddy[i].setAttribute("class","ygdyjtxx active");
		    		movielistlunboimgs[i].setAttribute("class","movie-list-lunbo-img active");
		    		break;
		    	}
	    		if(i != 0 && i%6 == 0)
	    		{
	    			yidongyidong(-1020);
	    		}
		    }
	    }
	    jsgysj();
	}
	
	function choosePerform(filmId,performId)
	{
		
		window.location.href="${pageContext.request.contextPath}/order/buyTicket.html?filmId="+filmId+"&performId="+performId;
	}

</script>