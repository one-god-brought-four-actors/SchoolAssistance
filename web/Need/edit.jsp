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
    <script type="text/javascript"  src="./ueditor/ueditor.config.js"></script>
    <script type="text/javascript"  src="./ueditor/ueditor.all.min.js"></script>
    <script type="text/javascript"  src="./ueditor/lang/zh-cn/zh-cn.js"></script>
 
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
<body><% if(session.getAttribute("user") == null) response.sendRedirect("login.html"); %>
<form action="NeedEditServlet" method="post">
<table class="table table-bordered table-hover definewidth m10">
    <tr>
        <td width="10%" class="tableleft">需求编号</td>
        <td><input type="text" id="id" name="id" value="${need.id }" readonly="readonly"/></td>
    </tr>
    <tr>
        <td class="tableleft">标题</td>
        <td ><input type="text" id="title" name="title" value="${need.title }" style="width: 300px;"/></td>
    </tr>
    <tr>
        <td class="tableleft">紧急状态</td>
        <td >
        	<c:choose>
        		<c:when test="${need.risk_level == 2 }">
        			<input type="radio"  name="level" value="2" checked/> 非常紧急
        			&nbsp;&nbsp;&nbsp;&nbsp;
           			<input type="radio"  name="level" value="1" /> 紧急
        		</c:when>
        		<c:otherwise>
        			<input type="radio"  name="level" value="2"/> 非常紧急
        			&nbsp;&nbsp;&nbsp;&nbsp;
           			<input type="radio"  name="level" value="1" checked/> 紧急
        		</c:otherwise>
        	</c:choose>
        </td>
    </tr>
    <tr>
    	<td class="tableleft">选择学校</td>
    	<td>
    		<select id="schId" name="schId">
    			<option value="${need.school_id }">
    				<c:forEach items="${schools }" var="sch">
    					<c:if test="${sch.id == need.school_id }">
    						${sch.school_name}
    					</c:if>
    				</c:forEach>
    			</option>
    			<c:forEach items="${schools }" var="sch">
    				<option value="${sch.id }">${sch.school_name }</option>
    			</c:forEach>
    		</select>
    	</td>
    </tr>
    <tr>
    	<td class="tableleft">详细信息</td>
    	<td>
    		<div>
		    	<script id="editor" name="info" type="text/plain" style="width:800px;height:400px;">
						 ${need.info}
				</script>
	    	</div>
    	</td>
    </tr>
   
    <tr>
        <td class="tableleft"></td>
        <td>
            <button type="submit" id="submit-button" class="btn btn-primary" type="button">保存</button> &nbsp;&nbsp;<button type="button" class="btn btn-success" name="backid" id="backid">返回列表</button>
        </td>
    </tr>
</table>
</form>
</body>
<script type="text/javascript">
    $(function () {
    	
    	var ue = UE.getEditor('editor');
		$('#backid').click(function(){
			window.location.href="NeedListServlet";
		});
    });
</script>
</html>