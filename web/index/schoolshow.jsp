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
<base href="<%=basePath %>/">
<meta charset="UTF-8">
<title>西藏援藏系统</title>
<link rel="stylesheet" href="Css/public.css">
<link rel="stylesheet" href="Css/utibetDetail.css">
</head>
<body>
	<!--页头-->
	<header>
		<div class="content">
			<!--logo-->
			<img src="Images/logo.png" alt="" class="logo">
			<!--导航-->
			<ul class="navLink">
	            <li><a href="GoMainServlet">首页</a></li>
	            <li><a href="index/work">援藏工作</a></li>
	            <li><a href="index/policy">援藏政策</a></li>
	            <li><a href="index/need">援藏需求</a></li>
	            <li><a href="index/process">援藏路径</a></li>
	            <li><a href="index/school">援藏高校</a></li>
	            <!-- <li><a href="index/work">工作动态</a></li> -->
	            <li><a href="index/adver">人员招聘</a></li>
				<!--登陆-->
				<c:choose>
					<c:when test="${user !=null }">
						<li>
							欢迎您,${user.username }
						</li>
						<li>
							<a style="color: #247ba8;" class="login" href="index.jsp" >前往后台</a>
						</li>

					</c:when>
					<c:otherwise>
						<li>
							<a style="color: #247ba8;" class="login" href="login.html" >登陆</a>
						</li>
					</c:otherwise>
				</c:choose>
        	</ul>

		</div>
	</header>
	<!--内容-->
	<div id="detail">
		<!--顶部面包屑-->
		<div class="crumbs content">
			<a href="index/school">援藏高校</a> <img src="Images/right.png" alt="">
			<a href="index/toSchoolShow/${school.id }">高校详情</a>
		</div>
		<div class="detail content">
			<div class="detail-left">
				<div class="detail-left-top" style="height: 100px;">
					<h1>${school.schName }</h1>
				</div>
				<div class="detail-left-bottom">
					<p>
						需要援助:
						<c:choose>
							<c:when test="${school.recSchool eq 1}">
								是
							</c:when>
							<c:otherwise>
								否
							</c:otherwise>
						</c:choose>
					</p>
					<p>
						前往援助:
						<c:choose>
							<c:when test="${school.isZup eq 1}">
								是
							</c:when>
							<c:otherwise>
								否
							</c:otherwise>
						</c:choose>
					</p>
					<p>
						详细信息:
					</p>
					<p>
						${school.message }
					</p>
					<p>
						援藏历史:
					</p>
					<p>
						${school.supHistory }
					</p>
				</div>
			</div>
			<div class="detail-right">
				<h3>其它学校</h3>
				<ul>
					<c:forEach items="${schools }" var="a">
						<li>
							<h5
								style="max-width: 200px; overflow: hidden; text-overflow: ellipsis; white-space: nowrap;">
								<a href="index/toSchoolShow/${a.id }">${a.schName }</a>
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
	<script src="Js/jquery-1.11.1.min.js"></script>
</body>
</html>