<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE HTML>
<html>
<head>
<title>援藏路线修改</title>
<base href="${pageContext.request.contextPath }/"/>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
<link rel="stylesheet" type="text/css" href="./Process/style.css" />
<script type="text/javascript" src="./Process/create.js"></script>
<script type="text/javascript" src="./Js/jquery.js"></script>
</head>
<body>
	<div>
		路线名称：
		<input type="text" id="processName" value="${process.pathName }"/>
		<br />
		<input value="" id="name" placeholder="点解流程节点可以删除" />
		<input type="button" value="增加" onclick="add();" />
		<input type="submit" value="提交" onclick="enter();"/>
	</div>
</body>
<script type="text/javascript">

	var param = '${process.context }';
	
	var params = param.split("|");
	
	for(var i = 0; i < params.length; i++){
		var body=document.body;
		var childs=body.children;
			if(childs.length!=1){
			
			var div2=document.createElement("div");
			div2.setAttribute("class", "center");
			body.appendChild(div2);
			
			var div3=document.createElement("div");
			div3.setAttribute("class", "to_right");
			body.appendChild(div3);
			}
			
			var div=document.createElement("div");
			var p=document.createElement("p");
			
			p.innerHTML = params[i];
			div.setAttribute("class", "roundedRectangle");
		    p.setAttribute("onclick","deletediv(this);");	
			div.appendChild(p);
			body.appendChild(div);
	}
	
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
		var processId = '${process.id }';
		datas += "&processName=" + processName;
		datas += "&processId=" + processId;
		$.ajax({
			url:"process/edit",
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