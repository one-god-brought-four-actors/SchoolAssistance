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
<form action="UserEditServlet" method="post" class="definewidth m20">
<table class="table table-bordered table-hover ">
    <tr>
        <td width="10%" class="tableleft">管理员编号</td>
        <td><input type="text" id="id" name="id" value="${user.id }" readonly="readonly"/></td>
    </tr>
    <tr>
        <td class="tableleft">管理员名称</td>
        <td ><input type="text" id="userName" name="username" value="${user.username }"/></td>
    </tr>
    <tr>
        <td class="tableleft">管理员密码</td>
        <td ><input type="text" id="passWord" name="password" value="${user.password }"/></td>
    </tr>
    <tr>
        <td class="tableleft">所属学校</td>
        <td >${user.schoolId }</td>
    </tr>
    <tr>
        <td class="tableleft">电话</td>
        <td >
        	<input type="text" id="telephone" name="phone" value="${user.phone }"/>
        </td>
    </tr>
    <tr>
    	<td class="tableleft">级别</td>
    	<td>

    		<select id="roleId" name="level">
    			<c:if test="${user.level == 1 }">
    				<option value="1" selected="selected">超级管理员</option>
    				<option value="2">权限管理员</option>
    				<option value="3">菜单管理员</option>
    				<option value="4">数据管理员</option>
    				<option value="5">普通管理员</option>
    			</c:if>
    			<c:if test="${user.level == 2 }">
    				<option value="1">超级管理员</option>
    				<option value="2" selected="selected">权限管理员</option>
    				<option value="3">菜单管理员</option>
    				<option value="4">数据管理员</option>
    				<option value="5">普通管理员</option>
    			</c:if>
    			<c:if test="${user.level == 3 }">
    				<option value="1">超级管理员</option>
    				<option value="2">权限管理员</option>
    				<option value="3" selected="selected">菜单管理员</option>
    				<option value="4">数据管理员</option>
    				<option value="5">普通管理员</option>
    			</c:if>
    			<c:if test="${user.level == 4 }">
    				<option value="1">超级管理员</option>
    				<option value="2">权限管理员</option>
    				<option value="3">菜单管理员</option>
    				<option value="4" selected="selected">数据管理员</option>
    				<option value="5">普通管理员</option>
    			</c:if>
    			<c:if test="${user.level == 5 }">
    				<option value="1">超级管理员</option>
    				<option value="2">权限管理员</option>
    				<option value="3">菜单管理员</option>
    				<option value="4">数据管理员</option>
    				<option value="5" selected="selected">普通管理员</option>
    			</c:if>
    		</select>
    	</td>
    </tr>
    <tr>
    	<td class="tableleft">创建时间</td>
    	<td>${user.create_time }</td>
    </tr>
    <tr>
    	<td class="tableleft">创建者</td>
    	<td>${manager.createUser }</td>
    </tr>
    <tr>
        <td class="tableleft"></td>
        <td>
            <button type="submit" id="submit-button" class="btn btn-primary" type="button">保存</button>
            &nbsp;&nbsp;
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