<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
     <%@ taglib uri="http://java.sun.com/jsp/jstl/fmt"  prefix="fmt"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
  <title>${bbsvo.user.username}的个人中心</title>
	<script src="${pageContext.request.contextPath }/statics/js/jquery-2.1.1.min.js"></script>
    <script src="${pageContext.request.contextPath }/statics/js/bootstrap.min.js"></script>
    <!-- Bootstrap core CSS -->
    <link href="${pageContext.request.contextPath }/statics/css/bootstrap.min.css" rel="stylesheet">

    <!-- Custom styles for this template -->
    <link href="${pageContext.request.contextPath }/statics/css/navbar-fixed-top.css" rel="stylesheet">
    <link href="${pageContext.request.contextPath }/statics/css/customize.css" rel="stylesheet">
  
 <link
	href="http://s2.music.126.net/sep/s/2/pt_frame.css?2187ea118b8bd3d96ccea8d8714a2fe0"
	type="text/css" rel="stylesheet"> 
 <link
	href="http://s2.music.126.net/sep/s/2/core.css?80cb678ca5cfbf98b1747b214748e637"
	type="text/css" rel="stylesheet"> 
 <link
	href="http://s2.music.126.net/sep/s/2/pt_profile_home.css?12c39ed2fbfab4a81b3de4be2f6ae756"
	type="text/css" rel="stylesheet"> 
</head>
<body>
    <jsp:include page="header.jsp"/>
    <div class="container  center-container-hx ">
    <br/><br/><br/>
  <div class="g-bd">
		<div class="g-wrap p-prf">
			<dl class="m-proifo f-cb" id="head-box">
				<dt class="f-pr" id="ava">
					<img
						src="/pic/${bbsvo.user.photo }">

				</dt>
				<dd>
					<div class="name f-cb">
						<div class="f-cb">
						<c:if test="${bbsvo.user.id eq sessionScope.loginUser.id}">
							<div class="edit">
								<a href="${pageContext.request.contextPath }/userEdit.action?id=${bbsvo.user.id}" hidefocus="true"
									class="u-btn2 u-btn2-1"><i>编辑个人资料</i></a>
							</div>
							</c:if>
							<div class="rect" id="newmusician"></div>
							<h2 id="j-name-wrap" class="wrap f-fl f-cb ">
								<span class="tit f-ff2 s-fc0 f-thide">${bbsvo.user.username }</span>
							</h2>
						</div>
					</div>
	<ul class="data s-fc3 f-cb" id="tab-box">
<li class="fst"><a href="/user/event?id=101922024"><strong id="event_count">${bbsvo.userBbsCount }</strong><span>发帖</span></a></li>
<li><a href="/user/follows?id=101922024"><strong id="follow_count">3</strong><span>关注</span></a></li>
<li>
<a href="/user/fans?id=101922024">
<strong id="fan_count">2</strong>
<span>粉丝</span>
<i class="u-icn u-icn-68 f-alpha" id="newCount" style="display:none;"></i>
</a></li>
</ul>
					<div class="inf s-fc3 f-brk">个人介绍：${bbsvo.user.signature }</div>
					<div class="">
						<span class="sep" id="age" data-age="789148800000">&nbsp;年龄：<span>${bbsvo.user.age }</span></span>
					</div>
					<div class="inf s-fc3 f-cb"></div>
				</dd>
			</dl>
			<div class="u-title u-title-1 f-cb m-record-title" id="rHeader">
				<h3>
					<span class="f-ff2 s-fc3">发的帖子</span>
				</h3>
				<span class="n-iconpoint"> </span>
				<div class="nav f-cb">
					<span data-action="songsall" id="songsall">所有时间</span> <i></i> <span
						data-action="songsweek" id="songsweek" class="z-sel">最近一周</span>
				</div>
			</div>
			<div id="m-record" 
				class="m-record">
				<div oncopy="return false;" oncut="return false;"
					ondragstart="return false;" id="auto-id-yTIucT9PU7hx24Ue">
					<div class="j-flag" id="auto-id-nM4sTLcPyo60crnH">
					<c:forEach items="${bbsvo.bbsList }" var="bbs">
						<ul>
							<li id="320697921492304659812"><div class="hd "></div>
							
								<div class="song">
									<div class="tt">
										<div class="ttc">
											<span class="txt"><a href="${pageContext.request.contextPath }/bbs_detail.action?id=${bbs.id}">${bbs.title }</a><span class="ar s-fc8"> </span> </span>

										</div>
									</div>
								</div>
								
								<div class="tops">
									<span class="bg" style="width: 100%;"></span><span
										class="times f-ff2"> <fmt:formatDate value="${bbs.createdat}" pattern="yyyy-MM-dd HH:mm:ss"/></span>
								</div>
								<div class="tops"></div></li>
						</ul>
						</c:forEach>
						<div class="more">
							<a href="#">查看更多&gt;</a>
						</div>
					</div>

				</div>
			</div>
		</div>
	</div>
     </div> 
</body>
</html>