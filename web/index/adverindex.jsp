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
            <c:forEach items="${advers }" var="s">
                <li>
                    <a href="index/toAdverShow/${s.id }">
                        <span>${s.title }</span>
                        <span>
         <script type="text/javascript">
			var time = new Date("${s.updateTime }");
			var year = time.getFullYear();
			var month = time.getMonth() + 1;
			var day = time.getDate();
			var hours = time.getHours() + 10;
			if(hours >= 24){
				hours -= 24;
			}
			var minute = time.getMinutes();
			var second = time.getSeconds();
			document.write(year + "-" + month + "-" + day + " " + hours + ":" + minute + ":" + second);
		</script>
         <%-- ${s.updateTime } --%></span>
                    </a>
                </li>
                </c:forEach>
                
            </ul>
            <div class="pageBox">
                <p class="len">共 <span>${total }</span>条记录</p>
                <p class="iNum">当前第 <span>${page.page }/${page.totalPage }</span> 页</p>
                
                <c:choose>
			<c:when test="${page.page == 1 }">
			</c:when>
			<c:otherwise>
				<a href='index/adver' class="first">首页</a>
				<a href='index/adver?page= ${page.page - 1 }' class="prev">上一页</a>
			</c:otherwise>
		</c:choose>
                <c:choose>
			<c:when test="${page.page == page.totalPage }">
			</c:when>
			<c:otherwise>
				<a href='index/adver?page= ${page.page + 1 }' class="next">下一页</a>
				<a href='index/adver?page=${page.totalPage }' class="last">尾页</a>
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