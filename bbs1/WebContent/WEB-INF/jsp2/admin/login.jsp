<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>管理员登录</title>
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/statics2/css/reset.css" />
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/statics2/css/login.css" />
<script type="text/javascript"
	src="${pageContext.request.contextPath}/statics2/js/jquery.min.js"></script>
<script type="text/javascript"
	src="${pageContext.request.contextPath}/statics2/js/login.js"></script>
</head>
<body>
	<div class="page">
		<div class="loginwarrp">
			<div class="logo">管理员登陆</div>
			<div class="login_form">
				<form id="Login"  method="post"  action="${pageContext.request.contextPath}/admin/login.action">
					<li class="login-item"><span>用户名：</span> <input type="text"
						id="username" name="username" class="login_input"> <span
						id="count-msg" class="error"></span></li>
					<li class="login-item"><span>密 码：</span> <input
						type="password" id="password" name="password" class="login_input">
						<span id="password-msg" class="error"></span></li>
					
					<li class="login-sub"><input type="submit" name="Submit"
						value="登录" /> <input type="reset" name="Reset" value="重置" /></li>
						${msg }
				</form>
			</div>
		</div>
	</div>
	<script type="text/javascript">
		window.onload = function() {
			var config = {
				vx : 4,
				vy : 4,
				height : 2,
				width : 2,
				count : 100,
				color : "121, 162, 185",
				stroke : "100, 200, 180",
				dist : 6000,
				e_dist : 20000,
				max_conn : 10
			}
			CanvasParticle(config);
		}
	</script>
	<script type="text/javascript" src="${pageContext.request.contextPath}/statics2/js/canvas-particle.js"></script>
</body>
</html>