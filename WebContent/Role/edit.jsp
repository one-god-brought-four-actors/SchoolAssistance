<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page deferredSyntaxAllowedAsLiteral="true"%>
<!DOCTYPE html>
<html>
<head>
<base href="${pageContext.request.contextPath}/"/>
<title></title>
<meta charset="UTF-8">
<link rel="stylesheet" type="text/css" href="Css/bootstrap.css" />
<link rel="stylesheet" type="text/css"
	href="Css/bootstrap-responsive.css" />
<link rel="stylesheet" type="text/css" href="Css/style.css" />
<script type="text/javascript" src="Js/jquery.js"></script>
<script type="text/javascript" src="Js/bootstrap.js"></script>
<script type="text/javascript" src="Js/ckform.js"></script>
<script type="text/javascript" src="Js/common.js"></script>
<link href="assets/layui/css/layui.css" rel="stylesheet" />
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
		<form class="layui-form" action="">
			<div id="layui-xtree-demo1" style="width:300px;height:500px; border:1px solid black; margin:20px;"></div>

			<input type="button" value="获取全部选中的checkbox" id="btn_getCk" />

		</form>
	</body>

</html>
<!--引入你自己的layui文件-->
<script src="assets/layui/layui.js"></script>
<!--xtree的js文件-->
<script src="assets/layui-xtree/layui-xtree.js"></script>
<script type="text/javascript">

var roleId = '${roleId }';
var menus = '${menus }';
var checkeds = '${checkeds }';

console.log(menus);
console.log(checkeds);

menus = eval(menus);
checkeds = eval(checkeds);

	//tree数据结构
	var json = [
	];

	// 渲染树型结构
	for(var i = 0; i < menus.length; i++){
		var item = {
			title:menus[i].menuName,
			value:menus[i].id,
			data:[]
		}
		json.push(item);
	}
	
	layui.use('form', function() {
		var form = layui.form;

		//创建tree
		var xtree = new layuiXtree({
			elem: 'layui-xtree-demo1' //放xtree的容器（必填）
				,
			form: form //layui form对象 （必填）
				,
			data: json //数据，结构请参照下面 （必填）
				,
			//isopen: true //初次加载时全部展开，默认true （选填）
			//	,
			color: "#000" //图标颜色 （选填）
				,
			icon: { //图标样式 （选填）
				open: "&#xe7a0;" //节点打开的图标
					,
				close: "&#xe622;" //节点关闭的图标
					,
				end: "&#xe621;" //末尾节点的图标
			}
		});
		
		
		// 默认选中
		for(var i = 0; i < checkeds.length; i++){
			var id = checkeds[i].id;
			var ele = document.getElementById("input-" + id);
			var xtree_p = ele.parentNode.parentNode;
			var xtree_all = xtree_p.getElementsByClassName('layui-xtree-item');
			xtree_p.getElementsByClassName('layui-xtree-checkbox')[id-1].checked = true;
	        xtree_p.getElementsByClassName('layui-xtree-checkbox')[id-1].nextSibling.classList.add('layui-form-checked');
			
		}
		
		document.getElementById('btn_getCk').onclick = function() {

			var oCks = xtree.GetChecked(); //获取全部选中的末级节点checkbox对象

			for(var i = 0; i < oCks.length; i++) {
				console.log(oCks[i].value);
			}
			
			var data = "menuIds=";
			for(var i = 0; i < oCks.length; i++) {
				data += oCks[i].value + ",";
			}
			data = data.substring(0, data.length - 1);
			data += "&roleId=" + roleId;
			$.ajax({
				url:'role/edit',
				type:'post',
				async: true,
				data:data,
				success:function(message){
					alert(message);
					window.location.href = "role/all";
				},
				error:function(){
					alert('network is error');
				}
			});
		}

	});
</script>
