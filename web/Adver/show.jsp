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
<form action="adver/edit" method="post">
<table class="table table-bordered table-hover definewidth m10">
    <tr>
        <td width="10%" class="tableleft">需求编号</td>
        <td>${adver.id }</td>
    </tr>
    <tr>
        <td class="tableleft">标题</td>
        <td >${adver.title }</td>
    </tr>
    <tr>
    	<td class="tableleft">学校</td>
    	<td>${adver.school_id}</td>
    </tr>
    <tr>
    	<td class="tableleft">详细信息</td>
    	<td>
    		${adver.info }
    	</td>
    </tr>
   
    <tr>
        <td class="tableleft"></td>
        <td>
            <button type="button" class="btn btn-success"  id="submit-button">返回列表</button>

        </td>
    </tr>
</table>
</form>
</body>
<script type="text/javascript">
    $(function () {
        $("#submit-button").click(function(){
            var readNum =${adver.hits};
            readNum++;
            var id = ${adver.id };
            /* 文本转义防止出现丢失 */
            // message = encodeURIComponent(message);

            $.ajax({
                url:'AdverInfoServlet',
                type:'post',
                async: true,
                data: {
                    id: id,
                    readNum:readNum
                },
                success:function(message){
                    window.location.href = "AdverListServlet";
                },
                error:function(){
                    alert('network is error');
                }
            });
        });
    });
</script>
</html>