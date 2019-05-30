<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page deferredSyntaxAllowedAsLiteral="true"%>

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
<body>
<form action="school/edit" method="post" class="definewidth m20">
<table class="table table-bordered table-hover ">
    <tr>
        <td width="10%" class="tableleft">学校编号</td>
        <td>${school.id }</td>
    </tr>
    <tr>
        <td class="tableleft">学校名称</td>
        <td >${school.school_name }</td>
    </tr>
    <tr>
        <td class="tableleft">需要援助</td>
        <td >
        	<c:choose>
        		<c:when test="${school.isNeed eq 1}">
        			是
        		</c:when>
        		<c:otherwise>
        			否
        		</c:otherwise>
        	</c:choose>
        </td>
    </tr>
    <tr>
        <td class="tableleft">前往援助</td>
        <td >
        	<c:choose>
        		<c:when test="${school.isGo eq 1}">
        			是
        		</c:when>
        		<c:otherwise>
        			否
        		</c:otherwise>
        	</c:choose>
        </td>
    </tr>
    <tr>
    	<td class="tableleft">详细信息</td>
    	<td>
            ${school.info }
    	</td>
    </tr>
    <tr>
    	<td class="tableleft">援藏历史</td>
    	<td>

            ${school.history }
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
			window.location.href="SchoolListServlet";
		 });
    });
</script>
</html>