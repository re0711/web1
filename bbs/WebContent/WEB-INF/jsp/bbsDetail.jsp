<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/fmt"  prefix="fmt"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>${bbs.title}</title>
 <!-- Bootstrap core CSS -->
 <script src="${pageContext.request.contextPath }/statics/js/jquery-2.1.1.min.js"></script>
    <script src="${pageContext.request.contextPath }/statics/js/bootstrap.min.js"></script>
    <link href="${pageContext.request.contextPath }/statics/css/bootstrap.min.css" rel="stylesheet">

    <!-- Custom styles for this template -->
    <link href="${pageContext.request.contextPath }/statics/css/navbar-fixed-top.css" rel="stylesheet">
    <link href="${pageContext.request.contextPath }/statics/css/customize.css" rel="stylesheet">
    <script type="text/javascript">
    $(function(){
    	$("#submit").click(function(){
    		var content = $("#content").val()
        	if(content==''){
        		alert("评论不能为空！")
        		return false
        	}
    	})
    	
    })
    </script>
</head>
<body>
 <jsp:include page="header.jsp"></jsp:include>
 <div class="container  center-container-hx ">
 <div class="contents">

    <h3> ${bbs.title}</h3>
    &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
    <c:if test="${bbs.authorid eq sessionScope.loginUser.id}">
    <a href="${pageContext.request.contextPath }/deleteBbs.action?bid=${bbs.id}">delete</a>
    </c:if>
    
    <br>
   ${bbs.content}
</div>

<hr>

<div class='comments'> 

    <div >
        <span class="glyphicon glyphicon-comment">
        </span>
         ${bbs.commentCount}
    </div>
    <br>

		<c:choose>
		<c:when test="${not empty sessionScope.loginUser }">
        <form action="${pageContext.request.contextPath }/addComment.action" method="POST">
           
            <textarea id="content" cols=80 rows=3 name='content'></textarea>
            <input type="hidden" name="bbsid" value="${bbs.id}" />
            <input type="submit" value="submit comment" id="submit" />
        </form>
        </c:when>
    	<c:otherwise>
        <p>Please <a href='${pageContext.request.contextPath }/toLogin.action'>Login</a> to sumbit a comment!</p>
        </c:otherwise>
    </c:choose>   
    <hr>
    <c:forEach items="${ commentList}" var="comment">
           <fmt:formatDate value="${comment.date}" pattern="yyyy-MM-dd HH:mm:ss"/>
           &nbsp;&nbsp;&nbsp;${comment.username}&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
           <c:if test="${sessionScope.loginUser.id eq comment.userid }">
           
           <a href="${pageContext.request.contextPath }/delectComment.action?id=${comment.id}&bid=${bbs.id}">delete</a>
           </c:if>
            <br><br>
            ${ comment.content }
            <hr>

     </c:forEach>
 
</div> 
 
 </div>

</body>
</html>