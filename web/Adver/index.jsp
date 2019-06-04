<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page deferredSyntaxAllowedAsLiteral="true"%>
<% if(session.getAttribute("user") == null) response.sendRedirect("login.html"); %>
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

@media ( max-width : 980px) {
	/* Enable use of floated navbar text */
	.navbar-text.pull-right {
		float: none;
		padding-left: 5px;
		padding-right: 5px;
	}
}
.option-button:hover {
	color:red;
}
</style>
</head>
<body>
	<form class="form-inline definewidth m20" action="adver/search"
		method="get">
		标题： <input type="text" name="param" id="param"
			class="abc input-default" placeholder="" value="">&nbsp;&nbsp;
		<button type="submit" class="btn btn-primary">查询</button>
		&nbsp;&nbsp;
		<button type="button" onclick="toAdd()" class="btn btn-success" id="addnew">新增需求</button>
	</form>
	<table class="table table-bordered table-hover definewidth m10">
		<thead>
			<tr>
				<th>编号</th>
				<th>标题</th>
				<th>发布学校</th>
				<th>阅读量</th>
				<th>最后更新时间</th>
				<th>发布者</th>
				<th>操作</th>
			</tr>
		</thead>
		<c:forEach items="${advers }" var="s">
		<tr>
			<td>${s.id }</td>
			<td style="max-width: 220px;overflow: hidden;text-overflow: ellipsis;white-space: nowrap;">
				${s.title }
			</td>
			<td style="max-width: 120px;overflow: hidden;text-overflow: ellipsis;white-space: nowrap;">
				${s.school_id }
			</td>
			<td>${s.hits }</td>
			<td>
				
			${s.create_time }
			</td>
			<td>${s.create_user }</td>
			<td>
				 <a class="option-button" href="AdverEditServlet?id=${s.id }">编辑</a>
				|<a style="cursor: pointer" class="option-button" onclick="Del(${s.id})">删除</a>
				|<a class="option-button" href="AdverInfoServlet?id=${s.id }">查看</a>
			</td>
		</tr>
		</c:forEach>
	</table>
	<div class="inline pull-right page">
		${page.getTotalRow() } 条记录 ${page.index }/${page.getTotalPage() } 页
		<c:choose>
			<c:when test="${page.index == 1 }">
			</c:when>
			<c:otherwise>
				<a href='AdverListServlet?index=1'>首页</a>
				<a href='AdverListServlet?index=${page.index - 1}'>上一页</a>
			</c:otherwise>
		</c:choose>

		<%--循环页数--%>
		<c:forEach var="p" begin="1" end="${page.getTotalPage() }">
			<c:choose>
				<c:when test="${p == page.index }">
					<span class='current'>${p }</span>
				</c:when>
				<c:otherwise>
					<a href="AdverListServlet?index=${p }">${p }</a>
				</c:otherwise>
			</c:choose>
		</c:forEach>


		<c:choose>
			<c:when test="${page.index == page.getTotalPage() }">
			</c:when>
			<c:otherwise>
				<a href='AdverListServlet?index=${page.index + 1 }'>下一页</a>
				<a href='AdverListServlet?index=${page.getTotalPage() }'>尾页</a>
			</c:otherwise>
		</c:choose>
	</div>
</body>
<script>
	function toAdd() {
		window.location.href = "AdverAddServlet";
    }

    function Del(id) {
	    var bool = confirm("确认删除？");
	    if (bool) {
            window.location.href="DelAdverServlet?id="+id;
		}
    }
</script>
</html>