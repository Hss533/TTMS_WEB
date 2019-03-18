<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<link href="${pageContext.request.contextPath }/static/css/userMessage.css" rel="stylesheet" type="text/css"/>
<script type="text/javascript" src="${pageContext.request.contextPath}/static/jquery-easyui-1.3.3/jquery.min.js"></script>

<div style="height: 80px;"></div>

<div class="gerenzhongxin">
	<div class="grzxnr">
		<div class="neirong">
			<div class="shitineirong">
				<div class="shitineirongleft">
					<h1>个人中心</h1>
					<a href="${pageContext.request.contextPath }/user/show/1.html">我的订单</a>
					<a href="${pageContext.request.contextPath }/user/show/2.html">基本信息</a>
				</div>
				<div class="shitineirongright">
					<c:if test="${id==2 }">
						<jsp:include page="jibenxinxi.jsp"></jsp:include>
					</c:if>
					<c:if test="${id==1 }">
						<jsp:include page="wodedingdan.jsp"></jsp:include>
					</c:if>
				</div>
			</div>
		</div>
		
		<div class="tanchuImg">
			<div class="tanchukuang">
				<div class="tanchukuangimg">预览效果<span class="gbicon" onclick="guanbiDialog()"></span></div>
				<div class="tanchukuangcenter">
					<div class="jutiiitupian">
						<img class="tttttp"/>
					</div>
				</div>
				<div class="tanchukuangfoot">
					<div class="bbcan" onclick="saveImage()">确认</div>
					<div class="qqqx" onclick="guanbiDialog()">取消</div>
				</div>
			</div>
		</div>
	</div>
</div>

<script type="text/javascript">
	
	var id = "${id}";
	var tittles = $(".shitineirongleft a");
	tittles[id-1].setAttribute("class","active");
	tittles[id-1].setAttribute("href","javascript:void(0)");
	
	$(".csImg").change(function(){
		$(".tanchuImg").css("display","block");
		$(".tttttp").attr("src",URL.createObjectURL($(this)[0].files[0]));
	});
	
	
	function guanbiDialog()
	{
		$(".tanchuImg").css("display","none");
		$(".csImg").val("");
	}
	
	//上传的时候要进行预览
	function saveImage()
	{
		$("#imgfm").form("submit",{
			url:"${pageContext.request.contextPath }/user/modifyUser.html",
			onSubmit:function(){return true;},
			success:function(result)
			{
				//将一个JSON字符串转换为一个对象
				var result = JSON.parse(result);
				if(result.success)
				{
					$(".tanchuImg").css("display","none");
					alert("修改成功");
					$(".csImg").val("");
					var pathImg = result.userImage;
					//给头像设置属性
					$("#touxiang").attr("src","${pageContext.request.contextPath }/"+pathImg);
				}
				else
				{
					alert("修改失败,请联系管理员");
					$(".csImg").val("");
					$(".tanchuImg").css("display","none");
				}
			}
		});
	}
	
</script>