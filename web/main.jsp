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

    <link rel="stylesheet" href="index/css/index.css">
    <link rel="stylesheet" href="index/css/public.css">
    <link rel="stylesheet" href="Css/bootstrap.min.css">
    <style>
        .glyphicon-chevron-right:before {
            content:">";
            font-size: 40px;
        }
        .glyphicon-chevron-left:before {
            content:"<";
            font-size: 40px;
        }
        .myuser{
            color: #fff;
            margin-top: 14px;
            display: block;
        }
        ul, ol {
            list-style: none;
        }
    </style>
</head>
<body>
<!--网页头部-->
<header>
    <div class="content">
        <!--logo-->
        <img src="index/image/logo.png" alt="" class="logo">
        <!--导航-->
        <ul class="navLink">
            <li>
                <a href="GoMainServlet">
                    <img src="index/image/index.png" >首  页
                </a>
            </li>
            <li>
                <a href="WorkIndexServlet">
                    <img src="index/image/work.png" >援藏工作
                </a>
            </li>
            <li>
                <a href="PolicyIndexServlet">
                    <img src="index/image/policy.png" >援藏政策
                </a>
            </li>
            <li>
                <a href="NeedIndexServlet">
                    <img src="index/image/need.png" >援藏需求
                </a>
            </li>
            <li>
                <a href="ProcessIndexServlet">
                    <img src="index/image/path.png" >援藏路径
                </a>
            </li>
            <li>
                <a href="SchoolIndexServlet">
                    <img src="index/image/school.png" >援藏高校
                </a>
            </li>
            <!-- <li><a href="index/work">工作动态</a></li> -->
            <li>
                <a href="AdverIndexServlet">
                    <img src="index/image/recruit.png" >人员招聘
                </a>
            </li>

                <!--登陆-->
                <c:choose>
                    <c:when test="${user !=null }">
                        <li>
                            <span class="myuser">欢迎您,${user.username }</span>
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
<!--网页内容-->
<section>
    <!-- 轮播 -->
    <div id="myCarousel" class="carousel slide">
        <!-- 轮播指标 -->
        <ol class="carousel-indicators">
            <li data-target="#myCarousel" data-slide-to="0" class="active"></li>
            <li data-target="#myCarousel" data-slide-to="1"></li>
            <li data-target="#myCarousel" data-slide-to="2"></li>
        </ol>
        <!-- 轮播 -->
        <div class="carousel-inner">
            <div class="item active">
                <img class="carousel-inner-img" src="index/image/banner1.jpg" alt="First slide">
            </div>
            <div class="item">
                <img class="carousel-inner-img" src="index/image/banner2.jpg" alt="Second slide">
            </div>
            <div class="item">
                <img class="carousel-inner-img" src="index/image/banner3.jpg" alt="Third slide">
            </div>
        </div>
        <!-- 轮播导航 -->
        <a class="left carousel-control" href="#myCarousel" role="button" data-slide="prev">
            <span class="glyphicon glyphicon-chevron-left" aria-hidden="true"></span>
            <span class="sr-only">Previous</span>
        </a>
        <a class="right carousel-control" href="#myCarousel" role="button" data-slide="next">
            <span class="glyphicon glyphicon-chevron-right" aria-hidden="true"></span>
            <span class="sr-only">Next</span>
        </a>
    </div>
    <div class="content">
        <div id="sestion1">
            <h1>最新动态</h1>
            <div class="sestion1_a">
                <div class="sestion1_head">
                    <a href="NeedIndexServlet">援藏需求> ></a>
                </div>
                <ul>
                    <c:forEach items="${needs }" var="n">
                        <li>
                            <a href="NeedShowServlet?id=${n.id }"> <span>${n.title }</span>
                            <span>${n.create_time }</span>
                            </a>
                        </li>
                    </c:forEach>

                </ul>
            </div>
            <div class="sestion1_b">
                <div class="sestion1_head">
                    <a href="AdverIndexServlet">人员招聘> ></a>
                </div>
                <ul>
                    <c:forEach items="${advers }" var="s">
                        <li>
                            <a href="AdverShowServlet?id=${s.id }">
                                <span>${s.title }</span>
                                <span>${s.create_time}</span>
                            </a>
                        </li>
                    </c:forEach>
                </ul>
            </div>
            <div class="sestion1_c">
                <div class="sestion1_head">
                    <a href="#">常见问题> ></a>
                </div>
                <ul>
                    <li><a href="#">别问 问就是找人</a></li>
                    <li><a href="#">别问 问就是找人</a></li>
                    <li><a href="#">别问 问就是找人</a></li>
                    <li><a href="#">别问 问就是找人</a></li>
                    <li><a href="#">别问 问就是找人</a></li>
                    <li><a href="#">别问 问就是找人</a></li>
                    <li><a href="#">别问 问就是找人</a></li>

                </ul>
            </div>
        </div>

        <div id="sestion2">
            <h1>活动展示</h1>
            <div class="sestion2_a">
                <div class="sestion2_msg">发放课外书和作业本子</div>
            </div>
            <div class="sestion2_b">
                <div class="sestion2_msg">援藏老师和学生户外项目</div>
            </div>
            <div class="sestion2_c">
                <div class="sestion2_msg">援藏老师和学生举行升旗仪式</div>
            </div>
        </div>
    </div>
</section>
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
<!-- 导入js和jq -->
<script src="Js/jquery.js"></script>

<!-- 导入bt -->
<script src="Js/popper.min.js"></script>
<script src="Js/bootstrap.js"></script>
<script>
    window.onload=function(){
        $("#myCarousel").css("height",$(".carousel-inner-img").css("height"));
    }
    window.onresize=function(){
        $("#myCarousel").css("height",$(".carousel-inner-img").css("height"));
    }
</script>
</html>