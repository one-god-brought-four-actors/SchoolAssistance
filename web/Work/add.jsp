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
    <script type="text/javascript" charset="utf-8" src="./ueditor/ueditor.config.js"></script>
    <script type="text/javascript" charset="utf-8" src="./ueditor/ueditor.all.min.js"></script>
    <script type="text/javascript" charset="utf-8" src="./ueditor/lang/zh-cn/zh-cn.js"></script>
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
<form action="work/add" method="post">
<table class="table table-bordered table-hover definewidth m10">
    <tr>
        <td class="tableleft">标题</td>
        <td ><input type="text" id="title" name="title" value="" style="width: 360px;"/></td>
    </tr>
    <tr>
    	<td class="tableleft">详细信息</td>
    	<td>
	    	<div>
		    	<script id="editor" type="text/plain" style="width:800px;height:400px;"></script>
	    	</div>
    	</td>
    </tr>
   
    <tr>
        <td class="tableleft"></td>
        <td>
            <button type="button" id="submit-button" class="btn btn-primary" type="button">保存</button> &nbsp;&nbsp;<button type="button" class="btn btn-success" name="backid" id="backid">返回列表</button>
        </td>
    </tr>
</table>
</form>
</body>
<script type="text/javascript">
    $(function () {
    	
    	var ue = UE.getEditor('editor'); 
    	
		$('#backid').click(function(){
				window.location.href="work/all";
		 });

		$("#submit-button").click(function(){
			var title = $("#title").val();
			var context = ue.getContent();
			
			/* 文本转义防止出现丢失 */
			context = encodeURIComponent(context);
			
			var data  = "&title=" + title;
				data += "&context=" + context;
				
				console.log(data);
				
			$.ajax({
				url:'work/add',
				type:'post',
				async: true,
				data:data,
				success:function(message){
					alert(message);
					window.location.href = "work/all";
				},
				error:function(){
					alert('network is error');
				}
			});
		});
    });
</script>
</html>