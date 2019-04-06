<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>发帖</title>
<link
	href="${pageContext.request.contextPath }/statics/kindeditor-4.1.10/themes/default/default.css"
	type="text/css" rel="stylesheet">
<link
	href="${pageContext.request.contextPath }/statics/css/style_15_common.css"
	type="text/css" rel="stylesheet">
<script type="text/javascript" charset="utf-8"
	src="${pageContext.request.contextPath }/statics/js/common.js"></script>
<script type="text/javascript" charset="utf-8"
	src="${pageContext.request.contextPath }/statics/kindeditor-4.1.10/kindeditor-all-min.js"></script>
<script type="text/javascript" charset="utf-8"
	src="${pageContext.request.contextPath }/statics/kindeditor-4.1.10/lang/en.js"></script>
<script
	src="${pageContext.request.contextPath }/statics/js/jquery-2.1.1.min.js"></script>
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/statics2/css/zh.css">

<script src="${pageContext.request.contextPath}/statics2/js/zh.js"></script>
</head>
<body>
	<jsp:include page="header.jsp" />
	<br>
	<br>
	<br>
	<br>
	<div>

		<!-- Place inside the <head> of your HTML -->
		<script type="text/javascript">
			
		</script>
		<script type="text/javascript">
		
			$(function() {
				var itemAddEditor;
				//创建富文本编辑器
				itemAddEditor = E3.createEditor("#itemAddForm [name=content]");
			
				$("#submit").click(function() {
					var title = $("#title").val();
					var content = itemAddEditor.document.getBody().getText();

					if (title == '') {
						alert("Title is required!");
						return false;
					}

					if (content == '') {
						alert("Content is required!");
						return false;
					}
				})
			})
		</script>
		<!-- Place this in the body of the page content -->
		<form method="post" id="itemAddForm"
			action='${pageContext.request.contextPath }/bbsPub.action'>
			<div class="d">
			<div class="inner">
			<input type="text" name="title" id="title" class="px"
						value="""
						style="width: 37em"  tabindex="1">
			</div>
			<textarea style="width: 900px; height: 400px; visibility: hidden;"
				name="content" id="textarea"></textarea>
			<input type="hidden" name="categoryid" value="${cid} "> <input
				type='submit' value='submit' id="submit" />
				</div>
		</form>

	</div>


</body>
</html>