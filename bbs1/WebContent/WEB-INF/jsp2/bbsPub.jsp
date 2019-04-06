<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>发帖</title>
 <!-- Bootstrap core CSS -->
 <script src="${pageContext.request.contextPath }/statics/js/jquery-2.1.1.min.js"></script>
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/statics2/css/zh.css">

<script
	src="${pageContext.request.contextPath}/statics2/js/zh.js"></script>  
	 
</head>
<body>
 <jsp:include page="header.jsp"/>
 <br> <br> <br> <br>
 <div>

<!-- Place inside the <head> of your HTML -->
<script type="text/javascript" src="${pageContext.request.contextPath }/statics/tinymce/js/tinymce/tinymce.min.js"></script>
<script type="text/javascript">
tinymce.init({
    selector: "textarea",
    theme: "modern",
    plugins: [
        "advlist autolink lists link image charmap print preview hr anchor pagebreak",
        "searchreplace wordcount visualblocks visualchars code fullscreen",
        "insertdatetime media nonbreaking save table contextmenu directionality",
        "emoticons template paste textcolor colorpicker textpattern"
    ],
    toolbar1: "insertfile undo redo | styleselect | bold italic | alignleft aligncenter alignright alignjustify | bullist numlist outdent indent | link image",
    toolbar2: "print preview media | forecolor backcolor emoticons",
    image_advtab: true,
    templates: [
        {title: 'Test template 1', content: 'Test 1'},
        {title: 'Test template 2', content: 'Test 2'}
    ]
 });
</script>
<script type="text/javascript">
$(function(){
	$("#submit").click(function(){
		var title = $("#title").val()
		var content = $("#textarea").text()
	
		if(title==''){
    		alert("标题不能为空！")
    		return false
    	}
		
    	if(content==''){
    		alert("内容不能为空！")
    		return false
    	}
	})
})

</script>
<!-- Place this in the body of the page content -->
<form method="post" action='${pageContext.request.contextPath }/bbsPub.action'>
	title:&nbsp;&nbsp;<input type="text" size="64" name="title" id="title" style="width: 900px"><br/><br/>
    <textarea name="content" id="textarea">请输入内容</textarea>
    <input type="hidden" name="categoryid" value="${cid} ">
    <input type='submit' value='submit' id="submit" />
</form>

</div>
 

</body>
</html>