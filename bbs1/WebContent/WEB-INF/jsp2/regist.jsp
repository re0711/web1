<%@ page language="java" import="java.util.*" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>god论坛注册页面</title>
<script src="${pageContext.request.contextPath }/statics/js/jquery-2.1.1.min.js"></script>
<%
 Locale locale = request.getLocale();
 ResourceBundle rb = ResourceBundle.getBundle("res", locale);
 %>
<script type="text/javascript">
$(function(){
	 validateUsername()
	 validateAge()
	$(":submit").click(function(){
		 if($("#ff").find("span").attr("style")=="color:red;"){
			 return false;
		 }
		 var age=$("#age").val();
			
			if(age==''){
				html = "<span style='color:red;'>" + '年龄必须是正整数' + "</span>"
				$("#age").next().remove();
				$("#age").after(html);
				return false;
			}
	})
})

function validateUsername(){
	var oldName = $("#username").val();
	
	$("#username").blur(function(){
		var username=$("#username").val();
		
		//原用户名和现用户名不一致
		if(oldName!=username){
		$.post("${pageContext.request.contextPath }/validateUsername.action",{username:username},function(data){
			if(data==""){
				html = "<span style='color:red;'>" + '<%=rb.getString("Occupied") %>' + "</span>"
				$("#username").next().remove();
				$("#username").after(html);
			}
	})
		}
		//原用户名和现用户名一致，无需校验 或用户名不为空
		if(oldName==username||username!='')
			$(this).next().remove();
	})
}

function validateAge(){
	$("#age").blur(function(){
		
		var age = $(this).val()
		var re = /^[0-9]+$/ 
        var flag = re.test(age)
        if(flag){
        	$(this).next().remove();
        }else{
        	html = "<span style='color:red;'>" + '<%=rb.getString("age") %>' + "</span>"
			$(this).next().remove();
			$(this).after(html);
        }
	})
}
</script>
<style type="text/css">
table{
background-image: url(${pageContext.request.contextPath }/statics2/img/table_back.jpg);
background-repeat: no-repeat;
background-size: 100% 100%; 
}
</style>
</head>

<body>
	<form id="ff" action="${pageContext.request.contextPath }/userSave.action"
		method="POST" enctype="multipart/form-data">
		<table width="650" cellspacing="3" cellpadding="3" border="0"
			 
			 align="center">
			<tbody>
				<tr>
					<td width="600" height="40" colspan="2">
						<p align="center">Register Information</p>
					</td>
				</tr>
				<tr>
					<td><font color="red">${msg} </font></td>
				</tr>
				<tr>
					<td>Username:</td>
					<td><input type="text" size="20" name="username" id="username"></td>
				</tr>
				<tr>
					<td>Password:</td>
					<td><input type="password" size="20" name="password"></td>
				</tr>
				<tr>
				<tr>
					<td>Age:</td>
					<td><input type="text" name="age" id="age" maxlength="5"></td>
				</tr>
				<tr>
					<td>Gender:</td>
					<td><input name="gender" checked="checked" type="radio"
						value="1"> Male <input name="gender" type="radio" value="2">
						Female</td>
				</tr>
				<tr>
					<td>Avator:</td>
					<td><input type="file" name="photo1"></td>
				</tr>
				<tr>
					<td>&nbsp;</td>
					<td align="left"><input type="submit" value="Submit">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<input
						type="reset" value="Reset"></td>
				</tr>
				<tr>
					<td><a
						href="${pageContext.request.contextPath }/toLogin.action"><%=rb.getString("haveanaccount") %></a></td>
				</tr>
			</tbody>
		</table>

	</form>

</body>
</html>