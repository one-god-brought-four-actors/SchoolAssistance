<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE HTML>
<html>
<head>
<title>援藏路线新增</title>
<base href="${pageContext.request.contextPath }/"/>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
<link rel="stylesheet" type="text/css" href="./Process/style.css" />
<script type="text/javascript" src="./Process/create.js"></script>
<script type="text/javascript" src="./Js/jquery.js"></script>
</head>
<body>
	<div>
		路线名称：
		<input type="text" id="processName" value="四川大学援藏路线"/>
		<br />
		<input value="" id="name" placeholder="点解流程节点可以删除" />
		<input type="button" value="增加" onclick="add();" />
		<input type="submit" value="提交" onclick="enter();"/>
	</div>
</body>
<script type="text/javascript">
	var enter = function(){
		var ele = document.getElementsByClassName("roundedRectangle");
		var datas = "";
		for(var i = 0; i < ele.length; i++){
			datas += "&params=" + (ele[i].getElementsByTagName("p")[0]).innerHTML;
		}

		datas = datas.substring(1);
		
		var processName = $("#processName").val();
		if(!processName){
			alert("路线名不能为空！");
			return;
		}
		
		datas += "&processName=" + processName;
		
		$.ajax({
			url:"process/add",
			type:"post",
			data:datas,
			success:function(result){
				alert(result);
				window.location.href = "process/all";
			}
		});
	}
</script>
</html>