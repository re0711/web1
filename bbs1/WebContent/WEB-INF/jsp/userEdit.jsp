<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<script
	src="${pageContext.request.contextPath }/statics/js/jquery-2.1.1.min.js"></script>
<script
	src="${pageContext.request.contextPath }/statics/js/bootstrap.min.js"></script>
<!-- Bootstrap core CSS -->
<link
	href="${pageContext.request.contextPath }/statics/css/bootstrap.min.css"
	rel="stylesheet">

<!-- Custom styles for this template -->
<link
	href="${pageContext.request.contextPath }/statics/css/navbar-fixed-top.css"
	rel="stylesheet">
<link
	href="${pageContext.request.contextPath }/statics/css/customize.css"
	rel="stylesheet">
<link
	href="http://s2.music.126.net/sep/s/2/core.css?049063c38551d8174a105a9213f97dee"
	type="text/css" rel="stylesheet">
<link
	href="http://s2.music.126.net/sep/s/2/pt_frame.css?622f72da10a103069afc47d31ce6446a"
	type="text/css" rel="stylesheet">

	<script type="text/javascript">
	$(function(){
		validateUsername()
		validateAge()
		
		$(":submit").click(function(){
			 var err = $("#err").attr("style")
			  var aerr = $("#a-err").attr("style")
			  if(""==err||""==aerr)
				  return false
		})
	})
	
	function validateUsername(){

		var oldName = $("#username").val()
		
		$("#username").blur(function(){
			var username=$("#username").val()
			
			if(username==''){
				$(".u-err").children("span").text("昵称不能为空")
				$("#err").attr("style","")
			}
			
			//原用户名和现用户名不一致
			if(oldName!=username){
			$.post("${pageContext.request.contextPath }/validateUsername.action",{username:username},function(data){
				if(data==""){
					$(".u-err").children("span").text("昵称已存在")
					$("#err").attr("style","")
				}
		})
			}
			//原用户名和现用户名一致，无需校验 或用户名不为空
			if(oldName==username||username!='')
			$("#err").attr("style","display: none;")	
		})
	}
	
	function validateAge(){
		$("#age").blur(function(){
			var age = $(this).val()
			var re = /^[0-9]+$/ 
            var flag = re.test(age)
            if(flag){
            	$("#a-err").attr("style","display: none;")	
            }else{
            	$("#a-err").attr("style","年龄必须为整数")
            }
              
		})
	}
	</script>
</head>
<body>
	<jsp:include page="header.jsp" />
	<div class="container  center-container-hx ">
	<br>
	<br>
	<div class="g-bd">
		<div class="g-wrap" id="baseBox">
			<div class="u-title u-title-2 f-cb">
				<h3>
					<span class="f-ff2">个人设置</span>
				</h3>
			</div>
			<ul class="m-tabs f-cb">
				<li class="fst"><a href="#" class="z-slt"><em>基本设置</em></a></li>
				<li></li>
				<li></li>
			</ul>
			<form action="${pageContext.request.contextPath }/userSave.action"
				id="update_form" enctype="multipart/form-data" method="post">
				<input type="hidden" name="id" value="${sessionScope.loginUser.id}"/>
				<div class="n-base f-cb">
					<div class="frm m-frm">
						<div class="itm">
							<label class="lab">昵称：</label> <input type="text" name="username"
								class="u-txt txt" value="${sessionScope.loginUser.username }" id="username"
								maxlength="30">
							<div class="u-err" style="display: none;" id="err">
								<i class="u-icn u-icn-25"></i><span>昵称已存在！</span>
							</div>
						</div>
						<div class="itm f-cb">
							<label class="lab">介绍：</label>
							<div class="u-txtwrap f-pr">
								<textarea name="signature" class="u-txt area" id="signature">${sessionScope.loginUser.signature}</textarea>
								<span class="zs s-fc2" id="remain">130</span>
							</div>
						</div>
						<div class="itm">
							<label class="lab">年龄：</label> <input type="text" name="age"
								class="u-txt txt" value="${sessionScope.loginUser.age }" id="age"
								maxlength="5">
								<div class="a-err" style="display: none;"  id="a-err">
								<i class="u-icn u-icn-25"></i><span>年龄必须是正整数！</span>
							</div>
							
						</div>
						<div class="itm f-cb">
							<label class="lab">性别：</label>
							<div class="f-cb">
								<label class="check"> 
								<c:if test="${sessionScope.loginUser.gender eq 1}">
										<input name="gender" checked="checked" type="radio" class="u-rdi" value="1"> 男</label>
								<label class="check"><input name="gender" type="radio"
									class="u-rdi" value="2"> 女</label>
								</c:if>

								<c:if test="${sessionScope.loginUser.gender eq 2}">
									<input name="gender" type="radio" class="u-rdi" value="1"> 男</label>
									<label class="check"><input checked="checked" name="gender" type="radio"
										class="u-rdi" value="2"> 女</label>
								</c:if>
							</div>
						</div>

						<div class="itm ft">
							<input type="submit" value="保存">
						</div>
					</div>
					<div class="avatar f-pr">
						<img src="/pic/${sessionScope.loginUser.photo }" id="avatar"> <input
							type="file" name="photo1">
					</div>
				</div>
			</form>
		</div>

	</div>
	</div>
</body>
</html>