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
            <li>
                <a href="GoMainServlet">首页</a>
                <span></span>
            </li>
            <li>
                <a href="WorkIndexServlet">援藏工作</a>
                <span></span>
            </li>
            <li>
                <a href="PolicyIndexServlet">援藏政策</a>
                <span></span>
            </li>
            <li>
                <a href="NeedIndexServlet">援藏需求</a>
                <span></span>
            </li>
            <li>
                <a href="#">援藏路径</a>
                <span></span>
            </li>
            <li>
                <a href="SchoolIndexServlet">援藏高校</a>
                <span></span>
            </li>
            <li>
                <a href="AdverIndexServlet">人员招聘</a>
                <span></span>
            </li>
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
<div class="banner content">
    <img src="Images/twoPage_03.png" alt="">
</div>
<div class="content">
    <div class="inForBox">
        <div class="inForBox01">
            <ul class="pageMain">
            <c:forEach items="${policys }" var="s">
                <li>
                    <a title="点击下载文件" href="PolicyDownloadServlet?id=${s.id }">
                        <span>${s.title }</span>
                        <span>
                            ${s.create_time }
						</span>
                    </a>
                </li>
                </c:forEach>
                
            </ul>
            <div class="pageBox">
                <p class="len">共 <span>${page.getTotalRow() }</span>条记录</p>
                <p class="iNum">当前第 <span>${page.index }/${page.getTotalPage() }</span> 页</p>
                
                <c:choose>
			<c:when test="${page.index == 1 }">
			</c:when>
			<c:otherwise>
				<a href='PolicyIndexServlet' class="first">首页</a>
				<a href='PolicyIndexServlet?id=${page.index - 1 }' class="prev">上一页</a>
			</c:otherwise>
		</c:choose>
                <c:choose>
			<c:when test="${page.index == page.getTotalPage() }">
			</c:when>
			<c:otherwise>
				<a href='PolicyIndexServlet?id=${page.index + 1 }' class="next">下一页</a>
				<a href='PolicyIndexServlet?id=${page.getTotalPage() }' class="last">尾页</a>
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
                版权所有©西藏大学 藏ICP备05000064号 <a style="height:20px;line-height:20px;text-decoration:none;" target="_blank" href="http://www.beian.gov.cn/portal/registerSystemInfo?recordcode=54010202000088"><img src="Images/beiantubiao.png">藏公网安备54010202000088号</a></p>
            <p>地址：西藏自治区拉萨市城关区藏大东路10号 邮政编码：850000 <img src="Images/pic1.gif" alt=""></p>
            <p>达内时代科技集团提供技术支持</p>
        </div>
        <div class="QrCode">
            <img src="Images/app.jpg" alt="">
        </div>
    </div>
</footer>
</body>
</html>