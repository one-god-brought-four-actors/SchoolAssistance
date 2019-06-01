<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
%>
<!DOCTYPE html>
<html lang="en">
<head>
<base href="<%=basePath %>">
<meta charset="UTF-8">
<title>西藏援藏系统</title>
<link rel="stylesheet" href="Css/public.css">
<link rel="stylesheet" href="Css/utibetDetail.css">
<link rel="stylesheet" type="text/css" href="./Css/bootstrap.css" />
<link rel="stylesheet" type="text/css" href="./Css/bootstrap-responsive.css" />
<link rel="stylesheet" type="text/css" href="./Css/style.css" />
<script type="text/javascript" src="./Js/jquery.js"></script>
<style type="text/css">
.box {
	width: 300px;
	height: 330px;
	background: white;
	position: absolute;
	top: 15%;
	left: 35%;
	z-index: 20;
	transition: all 1s ease;
	transform: rotate(0deg) scale(0);
	opacity: 0;
	overflow: hidden;
}

.son01 {
	width: 50px;
	height: 50px;
	position: absolute;
	right: -6px;
	top: -2px;
	transform: scale(.5)
}

.son01>div {
	width: 50px;
	height: 10px;
	background: gray;
	border-radius: 5px;
	position: absolute;
}

.son0101 {
	transform: rotate(45deg);
	top: 10px;
}

.son0102 {
	transform: rotate(-45deg);
	top: 10px;
}
</style>
</head>
<body>
	<!--页头-->
	<header>
		<div class="content">
			<!--logo-->
			<img src="Images/logo.png" alt="" class="logo">
			<!--导航-->
			<ul class="navLink">
	            <li><a href="main">首页</a></li>
	            <li><a href="index/work">援藏工作</a></li>
	            <li><a href="index/policy">援藏政策</a></li>
	            <li><a href="index/need">援藏需求</a></li>
	            <li><a href="index/process">援藏路径</a></li>
	            <li><a href="index/school">援藏高校</a></li>
	            <!-- <li><a href="index/work">工作动态</a></li> -->
	            <li><a href="index/adver">人员招聘</a></li>
       		</ul>	
			<!--登陆-->
			<c:choose>
				<c:when test="${manager == null}">
					<a href="login.html" class="login">
						<!--<span></span>-->登陆
					</a>
				</c:when>
				<c:otherwise>
				欢迎您：${manager.userName}<a href="index.jsp" class="login">
						<!--<span></span>-->前往后台
					</a>
				</c:otherwise>
			</c:choose>
		</div>
	</header>
	<!--内容-->
	<div id="detail">
		<!--顶部面包屑-->
		<div class="crumbs content">
			<a href="index/need">援藏需求</a> <img src="Images/right.png" alt="">
			<a href="index/toNeedShow/${need.id }">需求详情</a>
		</div>
		<div class="detail content">
			<div class="detail-left">
				<div class="detail-left-top" style="height: 195px;">
					<h1 style="text-align: center;">${need.title }</h1>
					<section>
						<div class="btn" style="margin: 10px auto;" onclick="openJoin()">点击报名</div>

						<!--  <a href="index/indexadd.jsp" class="btn" style="margin: 10px auto;">点击报名</a>
                -->
					</section>
				</div>
				<div class="box">
					<div class="son01" onclick="closeJoin()">
						<div class="son0101"></div>
						<div class="son0102"></div>
					</div>
					<table class="table table-bordered table-hover " style="margin: 45px auto;">
						<tr>
							<td class="tableleft">姓名</td>
							<td><input type="text" id="userName" name="userName" /></td>
						</tr>
						<tr>
							<td class="tableleft">支援课程</td>
							<td><input type="text" id="courseName" name="courseName"
								value="" /></td>
						</tr>
						<tr>
							<td class="tableleft">所属学校</td>
							<td><input type="text" id="schId" name="schId" value="" /></td>
						</tr>
						<tr>
							<td class="tableleft">电话</td>
							<td><input type="text" id="telephone" name="telephone" /></td>
						</tr>
						<tr>
							<td class="tableleft">QQ</td>
							<td><input type="text" id="qq" name="qq" /></td>
						</tr>
						<tr>
							<td class="tableleft"></td>
							<td>
								<button type="button" id="submit-button" class="btn btn-primary"
									type="button">提交</button> &nbsp;&nbsp;
								<button type="button" class="btn btn-success" name="backid"
									id="backid">返回</button>
							</td>
						</tr>
					</table>
				</div>
				<div class="detail-left-bottom">
					<p>${need.context }</p>
				</div>
			</div>
			<div class="detail-right">
				<h3>相似的项目</h3>
				<ul>
					<c:forEach items="${needs }" var="n">
						<li>
							<h5
								style="max-width: 200px; overflow: hidden; text-overflow: ellipsis; white-space: nowrap;">
								<a href="index/toNeedShow/${n.id }">${n.title }</a>
							</h5>
							
						</li>
					</c:forEach>
				</ul>
			</div>
		</div>
	</div>
	<!--页脚-->
	<footer>
		<div class="content">
			<div class="footer-blue">
				<img src="Images/blue.png" alt="">
			</div>
			<div class="footerContent">
				<p>
					版权所有©西藏大学 藏ICP备05000064号 <a
						style="height: 20px; line-height: 20px; text-decoration: none;"
						target="_blank"
						href="http://www.beian.gov.cn/portal/registerSystemInfo?recordcode=54010202000088"><img
						src="Images/beiantubiao.png">藏公网安备54010202000088号</a>
				</p>
				<p>
					地址：西藏自治区拉萨市城关区藏大东路10号 邮政编码：850000 <img src="Images/pic1.gif" alt="">
				</p>
				<p>达内时代科技集团提供技术支持</p>
			</div>
			<div class="QrCode">
				<img src="Images/app.jpg" alt="">
			</div>
		</div>
	</footer>
	<script type="text/javascript">
var box = document.getElementsByClassName("box")[0];
function openJoin(){
    box.style.transform = "rotate(360deg) scale(1)";
    box.style.opacity="1";
}
function closeJoin(){
    box.style.transform = "rotate(0deg) scale(0)";
    box.style.opacity="0";
}
$(function() {
	$('#backid').click(function() {
		closeJoin();
	});

	$("#submit-button").click(function() {
		var needId = ${need.id};
		var userName = $("#userName").val();
		var courseName = $('#courseName').val();
		var schId = $("#schId").val();
		var telephone = $('#telephone').val();
		var qq = $("#qq").val();

		var data = "&userName=" + userName;
		data += "&courseName=" + courseName;
		data += "&telephone=" + telephone;
		data += "&qq=" + qq;
		data += "&schName=" + schId;
		data += "&needId=" + needId;

		$.ajax({
			url : 'index/addEnterName',
			type : 'post',
			async : true,
			data : data,
			success : function(message) {
				alert(message);
				window.location.href = "index/need";
			},
			error : function() {
				alert('network is error');
			}
		});
	});
});
</script>
</body>
</html>