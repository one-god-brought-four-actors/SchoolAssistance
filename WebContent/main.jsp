<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
%>
<!DOCTYPE html>
<html lang="en">
<head>
<base href="<%=basePath %>">
    <title>西藏援藏系统</title>
    <link rel="stylesheet" href="index/css/public.css">
    <link rel="stylesheet" href="index/css/index.css">
</head>
<body>
<!--网页头部-->
<header>
    <div class="content">
        <!--logo-->
        <img src="image/logo.png" alt="" class="logo">
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
			<c:when  test="${manager == null}">
		        <a href="login.html" class="login"><!--<span></span>-->登陆</a>
			</c:when>
			<c:otherwise>
				欢迎您：${manager.userName}<a href="menu/index" class="login"><!--<span></span>-->前往后台</a>
			</c:otherwise>    
		</c:choose>
		
    </div>
</header>
<!--网页内容-->
<section>
    <div class="content">
        <div class="section01">
            <ul class="section01-left">
                <li>
                    <div class="sectionMode01">
                        <span></span>
                        <h1>援藏工作</h1>
                    </div>
                    <div class="sectionMode02">
                        <a href="index/work">查看更多</a>
                    </div>
                </li>
                <li>
                    <div class="sectionMode01">
                        <span></span>
                        <h1>援藏政策</h1>
                    </div>
                    <div class="sectionMode02">
                        <a href="index/policy">查看更多</a>
                    </div>
                </li>
                <li>
                    <div class="sectionMode01">
                        <span></span>
                        <h1>援藏路径</h1>
                    </div>
                    <div class="sectionMode02">
                        <a href="index/process">查看更多</a>
                    </div>
                </li>
                <li>
                    <div class="sectionMode01">
                        <span></span>
                        <h1>人员招聘</h1>
                    </div>
                    <div class="sectionMode02">
                        <a href="index/adver">查看更多</a>
                    </div>
                </li>
                <li>
                    <div class="sectionMode01">
                        <span></span>
                        <h1>援藏需求</h1>
                    </div>
                    <div class="sectionMode02">
                        <a href="index/need">查看更多</a>
                    </div>
                </li>
                <li>
                    <div class="sectionMode01">
                        <span></span>
                        <h1>援藏高校</h1>
                    </div>
                    <div class="sectionMode02">
                        <a href="index/school">查看更多</a>
                    </div>
                </li>
            </ul>
            <div class="section01-right">
                <div class="section01-right-title">
                    <span></span>
                    人员招聘
                </div>
                <ul class="list">
                    <c:forEach items="${advers }" var="n">
                    	<li>
                    		<a href="index/toAdverShow/${n.id }">${n.title }</a>
                    	</li>
                    </c:forEach>
                </ul>
            </div>
        </div>
        <div class="section02">
            <div class="section02-left">
                <div class="section02-left-img">
                    <ul class="section02-slider-img">
                        <li><img src="image/img03.jpg" alt="1"></li>
                        <li><img src="image/img01.jpg" alt="2"></li>
                        <li><img src="image/img02.jpg" alt="3"></li>
                    </ul>
                    <div class="section02-slider-btn">
                        <span index="1" class="on"></span>
                        <span index="2"></span>
                        <span index="3"></span>
                    </div>
                </div>
                <h4>援藏老师和学生户外项目</h4>
            </div>
            <div class="section02-center">
                <div class="section02-center-title">
                    <h1>援藏需求</h1>
                    <a href="index/need">更多</a>
                </div>
                <ul class="list">
                    <c:forEach items="${needs }" var="n">
                    	<li>
                    		<a href="index/toNeedShow/${n.id }">${n.title }</a>
                    	</li>
                    </c:forEach>
                </ul>
            </div>
            <div class="section02-right">
                <div class="section02-right-title">
                    <span></span>
                    常见问题
                </div>
                <ul class="list">
                    <li>更多精彩，敬请期待</li>
                    <li>更多精彩，敬请期待</li>
                    <li>更多精彩，敬请期待</li>
                    <li>更多精彩，敬请期待</li>
                    <li>更多精彩，敬请期待</li>
                </ul>
            </div>
        </div>
    </div>
</section>
<!--网页底部-->
<footer>
    <div></div>
</footer>
</body>
</html>