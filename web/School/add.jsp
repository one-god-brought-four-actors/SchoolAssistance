<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page deferredSyntaxAllowedAsLiteral="true"%>
<!DOCTYPE html>
<html>
<head>
	<base href="${pageContext.request.contextPath}/" />
    <title></title>
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
<form action="SchoolAddServlet" method="post">
<table class="table table-bordered table-hover definewidth m10">
    <tr>
        <td class="tableleft">学校名称</td>
        <td ><input type="text" id="schName" name="school_name" value=""/></td>
    </tr>
    <tr>
        <td class="tableleft">需要援助</td>
        <td >
        	<input type="radio" id="recSchool" name="is_need" value="1" checked/> 是
        	&nbsp;&nbsp;&nbsp;&nbsp;
           	<input type="radio" id="recSchool" name="is_need" value="0" /> 否
        </td>
    </tr>
    <tr>
        <td class="tableleft">前往援助</td>
        <td >
        	<input type="radio" id="isZup" name="is_go" value="1" checked/> 是
        	&nbsp;&nbsp;&nbsp;&nbsp;
           	<input type="radio" id="isZup" name="is_go" value="0" /> 否
        </td>
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
    	<td class="tableleft">援藏历史</td>
    	<td>
    		<textarea rows="5" cols="20" id="supHistory" name="history" style="width: 500px;"></textarea>
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


		$("#submit-button").click(function(){
			var schName = $("#schName").val();
			var recSchool = $('input[name="is_need"]:checked').val();
			var isZup = $('input[name="is_go"]:checked').val();
			var message = ue.getContent();
			var history = $("#history").val();

			/* 文本转义防止出现丢失 */
			// message = encodeURIComponent(message);

			$.ajax({
				url:'SchoolAddServlet',
				type:'post',
				async: true,
				data: {
                    school_name: schName,
                    is_need: recSchool,
                    is_go: isZup,
                    history: history,
                    message: message
                },
				success:function(message){
					alert(message);
					window.location.href = "SchoolListServlet";
				},
				error:function(){
					alert('network is error');
				}
			});
		});
    });
</script>
</html>