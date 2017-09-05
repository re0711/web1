<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/fmt"  prefix="fmt"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<script src="${pageContext.request.contextPath }/statics/js/jquery-2.1.1.min.js"></script>
    <script src="${pageContext.request.contextPath }/statics/js/bootstrap.min.js"></script>
    <script src="${pageContext.request.contextPath }/statics/js/jquery.easyui.min.js"></script>
    <!-- Bootstrap core CSS -->
    <link href="${pageContext.request.contextPath }/statics/css/bootstrap.min.css" rel="stylesheet"> 

    <!-- Custom styles for this template -->
    <link href="${pageContext.request.contextPath }/statics/css/navbar-fixed-top.css" rel="stylesheet">  
    <link href="${pageContext.request.contextPath }/statics/css/customize.css" rel="stylesheet">
    <link href="${pageContext.request.contextPath }/statics/css/easyui.css" rel="stylesheet">
    <link href="${pageContext.request.contextPath }/statics/css/icon.css" rel="stylesheet">
    <link type="text/css" rel="stylesheet" href="http://tb1.bdstatic.com/??tb/static-common/style/tb_ui_4b47954.css,tb/static-common/style/tb_common_7193cdf.css">
        <link type="text/css" rel="stylesheet" href="http://tb1.bdstatic.com/??/tb/_/feed_d3224ac.css,/tb/_/head_foot_3214ced.css,/tb/_/nothing_tip_be2796a.css,/tb/_/friendapplylist_db6b629.css,/tb/_/sub_tab_b31f977.css,/tb/_/msgremind_0cc7a07.css,/tb/_/pager_c34b6ed.css,/tb/_/profile_41c6dc1.css,/tb/_/bind_phone_46a0299.css,/tb/_/aside_other_47a99f3.css,/tb/_/myinfo_5f942cf.css,/tb/_/aside_nav_1f7f698.css,/tb/_/go_top_cf21bfb.css,/tb/_/index_4f7da6f.css">
<title>Insert title here</title>
</head>
<body>
	<jsp:include page="header.jsp"/>
	
	<ul class="nav_bar" style="width:800px;position:absolute;left:300px;top:156px;"><li class="nav_item"><a href="#"  target="_self">贴吧首页</a></li><li class="nav_cur"><a href="#" target="_self">我的i贴吧</a></li></ul>	
	<div id="tt" class="easyui-tabs" style="width:800px;position:absolute;left:300px;top:200px;">   
    <div title="回复我的" style="padding:20px;">   
    <c:forEach items="${messageList }" var="vo">
       <div class="feed_left j_del_ctrl clearfix" >
	<div class="replyme_text clearfix j_replyme">
		<div class="replyme_user"><a href="#" target="_blank">${vo.username}：</a></div>
		<div class="replyme_content"><a href="#" target="_blank">回复 你 ：${vo.message.content}</a></div>
	</div>
	<div class="feed_rich"><!----></div>
	<div class="feed_from">
		回复我的主题：“<a class="itb_thread" href="/p/4852482237"  target="_blank">${vo.title}</a>” &gt; <a class="itb_kw" href="/f?kw=iosnba2k17" target="_blank">${vo.categoryName}</a>
	</div>
</div><div class="feed_right j_del_ctrl" >
	<div class="feed_time"><fmt:formatDate value="${vo.message.date }" pattern="yyyy-MM-dd HH:mm:ss"/></div>
	<div class="reply icon_reply"><a href="#">回复</a></div>
</div>
</c:forEach>
    </div>   
    <div title="通知" data-options="" style="overflow:auto;padding:20px;">   
        tab2    
      
</div>  
  	</div>
  
</body>
</html>