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
<link rel="stylesheet" href="Css/aidTibetJob.css">
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
					<a href="login.html" class="login"> <!--<span></span>-->登陆
					</a>
				</c:when>
				<c:otherwise>
				欢迎您：${manager.userName}<a href="index.jsp" class="login"> <!--<span></span>-->前往后台
					</a>
				</c:otherwise>
			</c:choose>
		</div>
	</header>
	<!--内容-->
	<div class="banner content">
		<img src="Images/twoPage_03.png" alt="">
	</div>
	<div class="content">
		<div class="inForBox">
			<div class="inForBox01">
				<ul class="pageMain">
					<c:forEach items="${needs }" var="s">
						<li><a href="NeedShowServlet?id=${s.id }"> <span>${s.title }</span>
								<span>${s.create_time }</span>
						</a></li>
					</c:forEach>

				</ul>
				<div class="inline pull-right page">
					${page.getTotalRow() } 条记录 ${page.index }/${page.getTotalPage() } 页
					<c:choose>
						<c:when test="${page.index == 1 }">
						</c:when>
						<c:otherwise>
							<a href='NeedIndexServlet?index=1'>首页</a>
							<a href='NeedIndexServlet?index=${page.index - 1}'>上一页</a>
						</c:otherwise>
					</c:choose>

					<%--循环页数--%>
					<c:forEach var="p" begin="1" end="${page.getTotalPage() }">
						<c:choose>
							<c:when test="${p == page.index }">
								<span class='current'>${p }</span>
							</c:when>
							<c:otherwise>
								<a href="NeedIndexServlet?index=${p }">${p }</a>
							</c:otherwise>
						</c:choose>
					</c:forEach>


					<c:choose>
						<c:when test="${page.index == page.getTotalPage() }">
						</c:when>
						<c:otherwise>
							<a href='NeedIndexServlet?index=${page.index + 1 }'>下一页</a>
							<a href='NeedIndexServlet?index=${page.getTotalPage() }'>尾页</a>
						</c:otherwise>
					</c:choose>
				</div>
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
</body>
</html>