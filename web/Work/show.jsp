<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page deferredSyntaxAllowedAsLiteral="true"%>
<<<<<<< HEAD
<% if(request.getAttribute("user") == null) response.sendRedirect("login.html"); %>
=======
<% if(session.getAttribute("user") == null) response.sendRedirect("login.html"); %>
>>>>>>> vvi
<!DOCTYPE html>
<html>
<head>
	<base href="${pageContext.request.contextPath}/" />
    <title></title>
    <meta charset="UTF-8">
    <link rel="stylesheet" type="text/css" href="./Css/bootstrap.css" />
    <link rel="stylesheet" type="text/css" href="./Css/bootstrap-responsive.css" />
    <link rel="stylesheet" type="text/css" href="./Css/style.css" />
    <script type="text/javascript" src="./Js/jquery.js"></script>
    <script type="text/javascript" src="./Js/bootstrap.js"></script>
    <script type="text/javascript" src="./Js/ckform.js"></script>
    <script type="text/javascript" src="./Js/common.js"></script>
    <style type="text/css">
        body {
            padding-bottom: 40px;
        }
        .sidebar-nav {
            padding: 9px 0;
        }

        @media (max-width: 980px) {
            /* Enable use of floated navbar text */
            .navbar-text.pull-right {
                float: none;
                padding-left: 5px;
                padding-right: 5px;
            }
        }


    </style>
</head>
<form action="work/edit" method="post">
<table class="table table-bordered table-hover definewidth m10">
    <tr>
        <td width="10%" class="tableleft">需求编号</td>
        <td>${work.id }</td>
    </tr>
    <tr>
        <td class="tableleft">标题</td>
        <td >${work.title }</td>
    </tr>
    <tr>
    	<td class="tableleft">学校</td>
    	<td>${work.school_id}</td>
    </tr>
    <tr>
    	<td class="tableleft">详细信息</td>
    	<td>
    		${work.info }
    	</td>
    </tr>
   
    <tr>
        <td class="tableleft"></td>
        <td>
            <button type="button" class="btn btn-success" name="backid" id="backid">返回列表</button>
        </td>
    </tr>
</table>
</form>
</body>
<script type="text/javascript">
    $(function () {
		$('#backid').click(function(){
				window.location.href="WorkListServlet";
		 });
    });
</script>
</html>