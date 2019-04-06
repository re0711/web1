<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>用户登录</title>
	<script src="${pageContext.request.contextPath }/statics/js/jquery-2.1.1.min.js"></script>
    <script src="${pageContext.request.contextPath }/statics/js/bootstrap.min.js"></script>
    <!-- Bootstrap core CSS -->
    <link href="${pageContext.request.contextPath }/statics/css/bootstrap.min.css" rel="stylesheet">

    <!-- Custom styles for this template -->
    <link href="${pageContext.request.contextPath }/statics/css/navbar-fixed-top.css" rel="stylesheet">
    <link href="${pageContext.request.contextPath }/statics/css/customize.css" rel="stylesheet">
</head>
<body>
 <jsp:include page="header.jsp"/>
 <div class="container  center-container-hx ">
    
      <div>
    <form action='${pageContext.request.contextPath }/login.action' method='POST'>
        username:<input type='text' name='username' value="刘爷爷" /> <br/><br/>
        password:<input type='password' name='password' value="123"/> <br/><br/>
       
        <input type='submit' value='Login' />

         <span style='color:red'>${msg}</span>
    </form>
</div>
    </div> 
</body>
</html>