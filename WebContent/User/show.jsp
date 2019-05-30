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
        <td width="10%" class="tableleft">管理员编号</td>
        <td>${manager.id }</td>
    </tr>
    <tr>
        <td class="tableleft">管理员名称</td>
        <td >${manager.userName }</td>
    </tr>
    <tr>
        <td class="tableleft">管理员密码</td>
        <td >${manager.passWord }</td>
    </tr>
    <tr>
        <td class="tableleft">所属学校</td>
        <td >${manager.schId }</td>
    </tr>
    <tr>
        <td class="tableleft">电话</td>
        <td >${manager.telephone }</td>
    </tr>
    <tr>
    	<td class="tableleft">级别</td>
    	<td>${manager.roleId }</select>
    	</td>
    </tr>
    <tr>
    	<td class="tableleft">创建时间</td>
    	<td>${manager.createTime }</td>
    </tr>
    <tr>
    	<td class="tableleft">创建者</td>
    	<td>${manager.createUser }</td>
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
			window.location.href="manager/all";
		 });
    });
</script>
</html>