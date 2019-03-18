<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<script type="text/javascript" src="${pageContext.request.contextPath}/static/jquery-easyui-1.3.3/jquery.easyui.min.js"></script>

<div class="jbtitle">基本信息</div>
<div class="jbimage">
	<div>
		<img src="${pageContext.request.contextPath }/static/image/404.png" id="touxiang"/>
		<input type="hidden" id="hushasha" value="${currentUser.userImage}" >
		<div class="genghuananniu">
		<!-- 提交文件 -->
		<!-- 这种上传不同于其他的是有预览效果的 -->
		<form id="imgfm" method="post" enctype="multipart/form-data">
			<input class="anniu" type="button" value="更换头像"  />
			<input type="file" id="fileUpload" class="csImg" name="fileImage">
		</form>
		</div>
		<div class="jbimagetishi">
			支持JPG,JPEG,PNG格式,且文件需小于1M
		</div>
	</div>
</div>
<form id="fm" method="post" action="${pageContext.request.contextPath }/user/modifyUser.html"  enctype="multipart/form-data">
	<input type="hidden" value="${currentUser.id }" name="id" />
	<div class="nnnchen fmtop">
		<p>昵称：</p>
		<span>
			<input type="text" placeholder="2-15个字，支持中英文、数字" id="nickname" name="nickname" value="${currentUser.nickname }"/>
		</span>
	</div>
	<div class="nnnchen">
		<p>性别：</p>
		<span>
			<input type="radio" id="nan" value="男" name="sex">
			<label>男</label>
		</span>
		<span>
			<input type="radio" id="nv" value="女" name="sex" class="sexxx">
			<label>女</label>
		</span>
	</div>
	<div class="nnnchen xsr">
		<p>生日：</p>
		<span>
			<div class="selectTime">
				<select id="yearrr" class="selectTime" onchange="changeYear(this.selectedIndex)">
					<option value="">--</option>
				</select>
			</div>
			<span>年</span>
		</span>
		<span>
			<div class="selectTime">
				<select id="month" class="selectTime" onchange="changeMonth(this.selectedIndex)">
					<option value="">--</option>
				</select>
			</div>
			<span>月</span>
		</span>
		<span>
			<div class="selectTime">
				<select id="day" class="selectTime">
					<option value="">--</option>
				</select>
			</div>
			<span>日</span>
		</span>
		<input type="hidden" name="shengri" id="shengri" />
	</div>
	<div class="nnnchen">
		<p>生活状态：</p>
		<span>
			<input type="radio" name="lifeStatus" id="danshen" value="单身">
			<label>单身</label>
		</span>
		<span>
			<input type="radio" name="lifeStatus" value="热恋中" id="relian" class="sexxx">
			<label>热恋中</label>
		</span>
		<span>
			<input type="radio" name="lifeStatus" value="已婚" id="yihun" class="sexxx">
			<label>已婚</label>
		</span>
		<span>
			<input type="radio" name="lifeStatus" value="为人父母" id="weiren" class="sexxx">
			<label>为人父母</label>
		</span>
	</div>
	<div class="nnnchen xsr">
		<p>从事行业：</p>
		<span>
			<div class="selectTime">
				<select id="industry" class="selectTime" onchange="changIndustry(this.selectedIndex)">
				</select>
			</div>
		</span>
		<span>
			<div class="selectTime">
				<select id="industryjt" class="selectTime">
					<option value="">--</option>
				</select>
			</div>
		</span>
		<input type="hidden" name="work" id="work" />
	</div>
	<div class="nnnchen duoxuan">
		<p>兴趣：</p>
		<div class="duoxuankuang">
			<span>
				<input type="checkbox" value="美食" />
				<label onclick="chooseInterest(1)">美食</label>
			</span>
			<span>
				<input type="checkbox" value="动漫" />
				<label onclick="chooseInterest(2)">动漫</label>
			</span>
			<span>
				<input type="checkbox" value="摄影" />
				<label onclick="chooseInterest(3)">摄影</label>
			</span>
			<span>
				<input type="checkbox" value="电影" />
				<label onclick="chooseInterest(4)">电影</label>
			</span>
			<span>
				<input type="checkbox" value="体育" />
				<label onclick="chooseInterest(5)">体育</label>
			</span>
			<span>
				<input type="checkbox" value="财经" />
				<label onclick="chooseInterest(6)">财经</label>
			</span>
			<span>
				<input type="checkbox" value="音乐" />
				<label onclick="chooseInterest(7)">音乐</label>
			</span>
			<span>
				<input type="checkbox" value="游戏" />
				<label onclick="chooseInterest(8)">游戏</label>
			</span>
			<span>
				<input type="checkbox" value="科技" />
				<label onclick="chooseInterest(9)">科技</label>
			</span>
			<span>
				<input type="checkbox" value="旅游" />
				<label onclick="chooseInterest(10)">旅游</label>
			</span>
			<span>
				<input type="checkbox" value="文字" />
				<label onclick="chooseInterest(11)">文字</label>
			</span>
			<span>
				<input type="checkbox" value="公益" />
				<label onclick="chooseInterest(12)">公益</label>
			</span>
			<span>
				<input type="checkbox" value="汽车" />
				<label onclick="chooseInterest(13)">汽车</label>
			</span>
			<span>
				<input type="checkbox" value="时尚" />
				<label onclick="chooseInterest(14)">时尚</label>
			</span>
			<span>
				<input type="checkbox" value="宠物" />
				<label onclick="chooseInterest(15)">宠物</label>
			</span>
			<span class="xingqutishi">选择你的兴趣使你获得个性化的电影推荐哦</span>
			<input type="hidden" id="interest" name="interest" />
		</div>
	</div>
	<div class="nnnchen fmtop">
		<p>个性签名：</p>
		<span>
			<input type="text" placeholder="20个字以内" name="signature" value="${currentUser.signature }"/>
		</span>
	</div>
	<div class="baocunanniu nnnqqqq">
		<input type="button" value="保存" class="eeendBu" onclick="submitForm()"/>
	</div>
</form>
<script type="text/javascript">

	//登录
	function submitForm()
	{
		var nickName = $("#nickname").val();
		if(nickName == null || nickName == '')
		{
			alert("用户呢称不能为空");
			return false;
		}
		var nian = $("#yearrr").val();
		var yue = $("#month").val();
		var ri = $("#day").val();
		if(nian != null && yue != null && ri != null && nian != '' && yue != '' && ri !='')
		{
			var shengri = nian;
			if(yue<10)
			{
				shengri = shengri+"-0"+yue;
			}
			else
			{
				shengri = shengri="-"+yue;
			}
			if(ri<10)
			{
				shengri = shengri+"-0"+ri;
			}
			else
			{
				shengri = shengri+"-"+ri;
			}
			$("#shengri").val(shengri);
		}
		var industry = $("#industry").val();
		var industryjt = $("#industryjt").val();
		if(industry != null && industryjt!= null && industry!='' && industryjt != '')
		{
			var work = industry + "," + industryjt;
			$("#work").val(work);
		}
		var xinqus = $(".duoxuankuang input[type=checkbox]");
		var xingqu = "";
		for(var i=0;i<xinqus.length;i++)
		{
			var Ifchecked = xinqus[i].getAttribute("checked") + "";
			if(Ifchecked == "true")
			{
				if(xingqu == "")
				{
					xingqu = xingqu + xinqus[i].getAttribute("value");
				}
				else
				{
					xingqu = xingqu + "," + xinqus[i].getAttribute("value");
				}
			}
		}
		if(xingqu != '')
		{
			$("#interest").val(xingqu);
		}
		$("#fm").form("submit",{
			url:"${pageContext.request.contextPath }/user/modifyUser.html",
			onSubmit:function(){return true},
			success:function(result)
			{
				var result = JSON.parse(result);
				if(result.success)
				{
					alert("保存成功");
				}
				else
				{
					alert("保存失败，请联系管理员");
				}
			}
		});
	}

	// 处理兴趣选择
	function chooseInterest(number)
	{
		var Ints = $(".duoxuankuang input[type=checkbox]");
		var labels = $(".duoxuankuang label");
		var ifChecked = Ints[number-1].getAttribute("checked");
		if(ifChecked == "true")
		{
			Ints[number-1].setAttribute("checked","false");
			labels[number-1].setAttribute("class","");
		}
		else
		{
			Ints[number-1].setAttribute("checked","true");
			labels[number-1].setAttribute("class","active");
		}
	}
	
	var industry  = ['','信息技术','金融保险','商业服务','建筑地产','工程制造','交通运输','文化传媒','娱乐体育','公共事业','学生','其他'];	
	var industry_jt =[
		[''],
		['互联网','IT','通信','电子','游戏'],
		['投资','股票基金','保险','银行','信托担保'],
		['资讯','贸易','美容保健','家政服务','旅游','餐饮酒店','娱乐休闲','批发零售','汽车'],
		['房地产','建筑','物业','装修'],
		['机械制造','生物医药','食品','服装','能源','化工'],
		['航空','铁路','航运船舶','公共交通','物流运输'],
		['媒体出版','广告创意','动漫','公关会展','摄影'],
		['影视','运动体育','音乐','模特'],
		['医疗教育','政府机关','科研','公益机构','农林渔牧'],
		['学生'],
		['其他']
		];

	for(var i=0;i<industry.length;i++)
	{
		if(i == 0)
		{
			$("#industry").append("<option value=''>--</option>");
		}
		else
		{
			$("#industry").append("<option value='"+industry[i]+"'>"+industry[i]+"</option>");
		}
	}
	
	function changIndustry(selectId)
	{
		var industryselect = industry_jt[selectId];
		var industryjt = $("#industryjt");
		industryjt.empty();
		for(var i=0;i<industryselect.length;i++)
		{
			industryjt.append("<option value='"+industryselect[i]+"'>"+industryselect[i]+"</option>");
		}
		industryjt.find("option[index='0']").attr("selected",true);
	}
	
	var year = $("#yearrr");
	var month = $("#month");
	var day = $("#day");
	
	function changeYear(selectId)
	{
		if(selectId == 0)
		{
			month.empty();
			day.empty();
			month.append("<option value=''>--</option>");
			day.append("<option value=''>--</option>");
		}
		else
		{
			for(var i=1;i<12;i++)
			{
				month.append("<option value="+i+">"+i+"</option>");
			}
		}
	}
	
	function changeMonth(selectId)
	{
		if(selectId == 0)
		{
			day.empty();
			day.append("<option value=''>--</option>");
		}
		else
		{
			var nian = $("#yearrr").val();
			var yue = $("#month").val();
			if(yue==1 || yue==3||yue==5||yue==7||yue==8||yue==10||yue==12)
			{
				for(var i=1;i<32;i++)
				{
					day.append("<option value="+i+">"+i+"</option>");
				}
			}
			else if(yue != 2)
			{
				for(var i=1;i<31;i++)
				{
					day.append("<option value="+i+">"+i+"</option>");
				}
			}
			else
			{
				if(nian/400 !=0 && nian/4 == 0)
				{
					for(var i=1;i<30;i++)
					{
						day.append("<option value="+i+">"+i+"</option>");
					}
				}
				else
				{
					for(var i=1;i<29;i++)
					{
						day.append("<option value="+i+">"+i+"</option>");
					}
				}
			}
		}
	}
	
	var myDate = new Date();
	var year = myDate.getFullYear();
	for(var i=year;i>year-80;i--)
	{
		$("#yearrr").append("<option value="+i+">"+i+"</option>");
	}
	
	var sex = "${currentUser.sex}";
	if(sex == "男")
	{
		$("#nan").attr('checked', 'true');
	}
	if(sex == "女")
	{
		$("#nv").attr('checked', 'true');
	}
	
	var shengrii = "${currentUser.birthday}";
	var shengriii = new Date(shengrii);
	var niann = shengriii.getFullYear();
	var yueee = shengriii.getMonth() + 1;
	var riiii = shengriii.getDate();
	$("#yearrr").val(niann);
	changeYear($('#yearrr').prop('selectedIndex'));
	$("#month").val(yueee);
	changeMonth($('#month').prop('selectedIndex'));
	$("#day").val(riiii);
	
	var lifeStatus = "${currentUser.lifeStatus}";
	if(lifeStatus == "单身")
	{
		$("#danshen").attr('checked', 'true');
	}
	if(lifeStatus == "热恋中")
	{
		$("#relian").attr('checked', 'true');
	}
	if(lifeStatus == "已婚")
	{
		$("#yihun").attr('checked', 'true');
	}
	if(lifeStatus == "为人父母")
	{
		$("#weiren").attr('checked', 'true');
	}
	
	var work = "${currentUser.work}";
	if(work != null && work != '')
	{
		var workl = work.split(",")[0];
		var workr = work.split(",")[1];
		$("#industry").find("option:contains('"+workl+"')").attr("selected",true);
		changIndustry($('#industry').prop('selectedIndex'));
		$("#industryjt").find("option:contains('"+workr+"')").attr("selected",true);
	}
	
	var interest = "${currentUser.interest}";
	if(interest != null && interest != '')
	{
		var dxks = $(".duoxuankuang input[type=checkbox]");
		var labels = $(".duoxuankuang label");
		for(var i=0;i<dxks.length;i++)
		{
			var xq = dxks[i].getAttribute("value");
			if(interest.indexOf(xq) != -1)
			{
				dxks[i].setAttribute("checked",true);
				labels[i].setAttribute("class","active");
			}
		}
	}
	
	var tupianlujing = $("#hushasha").val();
	if(tupianlujing != null && tupianlujing != '')
	{
		$("#touxiang").attr("src","${pageContext.request.contextPath }/"+tupianlujing);
	}
	
</script>