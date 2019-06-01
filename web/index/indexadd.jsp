<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page deferredSyntaxAllowedAsLiteral="true"%>

<!DOCTYPE html>
<html>
<head>
<base href="${pageContext.request.contextPath}/" />
<title></title>
<meta charset="UTF-8">
<link rel="stylesheet" type="text/css" href="./Css/bootstrap.css" />
<link rel="stylesheet" type="text/css"
	href="./Css/bootstrap-responsive.css" />
<link rel="stylesheet" type="text/css" href="./Css/style.css" />
<script type="text/javascript" src="./Js/jquery.js"></script>
<script type="text/javascript" src="./Js/bootstrap.js"></script>
<script type="text/javascript" src="./Js/ckform.js"></script>
<script type="text/javascript" src="./Js/common.js"></script>
<script type="text/javascript" charset="utf-8"
	src="./ueditor/ueditor.config.js"></script>
<script type="text/javascript" charset="utf-8"
	src="./ueditor/ueditor.all.min.js"></script>
<script type="text/javascript" charset="utf-8"
	src="./ueditor/lang/zh-cn/zh-cn.js"></script>

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
</style>
</head>
<body>
	<form action="school/edit" method="post" class="definewidth m20">
		<table class="table table-bordered table-hover ">
			<tr>
				<td class="tableleft">姓名</td>
				<td><input type="text" id="userName" name="userName"/></td>
			</tr>
			<tr>
				<td class="tableleft">支援课程</td>
				<td>
				<input type="text" id="courseName" name="courseName" value=""/>
					<!--<select id="courseName" name="courseName">
						<option value="1">JAVA</option>
						<option value="2">PYTHON</option>
						<option value="3">C/C++</option>
						<option value="4">WEB</option>
						<option value="5">PHP</option>
					</select>-->
				</td>
			</tr>
			<tr>
				<td class="tableleft">所属学校</td>
				<td>
				<input type="text" id="schId" name="schId" value=""/>
				<!--	<select id="schId" name="schId">
						<option value="1001">北京大学</option>
						<option value="1002">清华大学</option>
						<option value="1003">复旦大学</option>
						<option value="1004">北京航空航天大学</option>
						<option value="1005">南开大学</option>
					</select>-->
				</td>
			</tr>
			<tr>
				<td class="tableleft">电话</td>
				<td><input type="text" id="telephone" name="telephone"/></td>
			</tr>
			<tr>
				<td class="tableleft">QQ</td>
				<td><input type="text" id="qq" name="qq"/></td>
			</tr>
			<tr>
				<td class="tableleft"></td>
				<td>
					<button type="button" id="submit-button" class="btn btn-primary"
						type="button">提交</button> &nbsp;&nbsp;
					<button type="button" class="btn btn-success" name="backid"
						id="backid">返回</button>
				</td>
			</tr>
		</table>
	</form>
</body>
<script type="text/javascript">
	$(function() {
		$('#backid').click(function() {
			window.location.href = "main";
		});

		$("#submit-button").click(function() {
			var userName = $("#userName").val();
			var courseName = $('#courseName').val();
			var schId = $("#schId").val();
			var telephone = $('#telephone').val();
			var qq = $("#qq").val();

			var data = "&userName=" + userName;
			data += "&courseName=" + courseName;
			data += "&telephone=" + telephone;
			data += "&qq=" + qq;
			data += "&schId=" + schId;

			$.ajax({
				url : 'index/addEnterName',
				type : 'post',
				async : true,
				data : data,
				success : function(message) {
					alert(message);
					window.location.href = "main";
				},
				error : function() {
					alert('network is error');
				}
			});
		});
	});
</script>
</html>