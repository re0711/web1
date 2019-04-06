<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>用户登录</title>
	<link rel="stylesheet"
	href="${pageContext.request.contextPath}/statics2/css/zh.css">

<script
	src="${pageContext.request.contextPath}/statics2/js/zh.js"></script>
</head>
<body>
 <jsp:include page="header.jsp"/>
    <br> <br> <br> <br> <br> 
     <form action="${pageContext.request.contextPath }/login.action" method="POST">
		<table width="600" cellspacing="3" cellpadding="3" border="0"
			background="${pageContext.request.contextPath }/statics2/img/table_back.jpg" align="center">
			<tbody>
				<tr>
					<td width="600" height="40" colspan="2">
						<p align="center">Register Information</p>
					</td>
				</tr>
                
				<tr>
					<td>username:</td>
					<td><input type="text" size="20" name="username"></td>
				</tr>
				<tr>
					<td>Password:</td>
					<td><input type="password" size="20" name="password"></td>
				</tr>
				<tr>
				
				<tr>
					<td>&nbsp;</td>
					<td align="left"><input type="submit" value="Submit">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<input
						type="reset"  value="Reset"></td>
				</tr>
				<tr>
					<td><font color="red">${msg}</font></td>
				</tr>
			</tbody>
		</table>
	</form>
</body>
</html>