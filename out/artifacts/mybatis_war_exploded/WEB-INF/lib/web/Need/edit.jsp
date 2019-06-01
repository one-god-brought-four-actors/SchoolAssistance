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
<form action="need/edit" method="post">
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
        		<c:when test="${need.level == 2 }">
        			<input type="radio" id="level" name="level" value="2" checked/> 非常紧急
        			&nbsp;&nbsp;&nbsp;&nbsp;
           			<input type="radio" id="level" name="level" value="1" /> 紧急
        		</c:when>
        		<c:otherwise>
        			<input type="radio" id="level" name="level" value="2"/> 非常紧急
        			&nbsp;&nbsp;&nbsp;&nbsp;
           			<input type="radio" id="level" name="level" value="1" checked/> 紧急
        		</c:otherwise>
        	</c:choose>
        </td>
    </tr>
    <tr>
    	<td class="tableleft">选择学校</td>
    	<td>
    		<select id="schId" name="schId">
    			<option value="${need.schId }">
    				<c:forEach items="${schools }" var="sch">
    					<c:if test="${sch.id == need.schId }">
    						${sch.schName}
    					</c:if>
    				</c:forEach>
    			</option>
    			<c:forEach items="${schools }" var="sch">
    				<option value="${sch.id }">${sch.schName }</option>
    			</c:forEach>
    		</select>
    	</td>
    </tr>
    <tr>
    	<td class="tableleft">详细信息</td>
    	<td>
    		<div>
		    	<script id="editor" type="text/plain" style="width:800px;height:400px;">
						 ${need.context}
				</script>
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
    	
    	$("option").click(function(){
			$("#schId").removeAttr("size");
			$("#schId").blur();
			this.attr("selected","");
		});
 
		$("#schId").focus(function(){
			$("#schId").attr("size","10");
		});
    	
		$('#backid').click(function(){
				window.location.href="need/all";
		 });

		$("#submit-button").click(function(){
			var id = $("#id").val();
			var title = $("#title").val();
			var level = $('input[name="level"]:checked').val();
			var context = ue.getContent();
			var schId = $("#schId").val();
			
			context = encodeURIComponent(context);
			
			var data  = "&title=" + title;
				data += "&level=" + level;
				data += "&context=" + context;
				data += "&schId=" + schId;
				data += "&id=" + id;
				
			$.ajax({
				url:'need/edit',
				type:'post',
				async: true,
				data:data,
				success:function(message){
					alert(message);
					window.location.href = "need/all";
				},
				error:function(){
					alert('network is error');
				}
			});
		});
    });
</script>
</html>