<%@ page language="java" import="java.util.*"
	contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>${bbsvo.user.username}  -  PerForum</title>
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/statics2/css/zh.css">

<script src="${pageContext.request.contextPath}/statics2/js/zh.js"></script>
<script
	src="${pageContext.request.contextPath}/statics/js/jquery-2.1.1.min.js"></script>

<link
	href="${pageContext.request.contextPath}/statics2/css/pt_frame.css"
	type="text/css" rel="stylesheet">
<link
	href="http://s2.music.126.net/sep/s/2/core.css?80cb678ca5cfbf98b1747b214748e637"
	type="text/css" rel="stylesheet">
<link
	href="${pageContext.request.contextPath}/statics2/css/pt_profile_home.css"
	type="text/css" rel="stylesheet">
<style type="text/css">
.u-btn-6 i, .u-btn-ygz i {
	padding-left: 23px;
}
</style>
<%
	Locale locale = request.getLocale();
	ResourceBundle rb = ResourceBundle.getBundle("res", locale);
%>
<script type="text/javascript">
	$(function(){
		bid = ${sessionScope.loginUser.id}
		aid = ${bbsvo.user.id} 
		
		request("getFollow.action",{aid:aid,bid:bid},getFollow)
		
		$("#gz").click(function(){
			$(this).next().show()
			$(this).hide()
			//改变页面显示 1为增加 0为减少
			change(1)
			//更新数据库 1为增加 0为减少
			AddOrReduce(1)
		})
		
		$("#Kq").mouseover(function(){
			$(this).find("i").text("<%=rb.getString("unfollow")%>")
		}).mouseout(function(){
			$(this).find("i").text("<%=rb.getString("followed")%>")
		}).click(function() {
			$(this).prev().show();
			$(this).hide();
			//改变页面显示 1为增加 0为减少
			change(0);
			//更新数据库 1为增加 0为减少
			AddOrReduce(0);
		})
		
			/* $("body").on("click",function() {
				alert(1)
				var followCount= ${user.followCount};
				var fanCount= ${user.fanCount};
				if(followCount==0){
					$(this).href="#";
				}
				if(fanCount==0){
					$(this).href="#";
				}
			}) */
		

	})

	function change(flag) {
		fan_count = $("#fan_count").text()
		if (flag == 1) {
			fan_count = parseInt(fan_count) + 1
		} else {
			fan_count = parseInt(fan_count) - 1
		}
		$("#fan_count").text(fan_count)
	}

	function AddOrReduce(type) {

		if (type == 1) {
			param = {
				aid : aid,
				bid : bid,
				type : 1
			}
		} else if (type == 0) {
			param = {
				aid : aid,
				bid : bid,
				type : 0
			}
		}
		request("funCount.action", param, null)

	}

	function request(url, data, func) {
		$.post(url, data, func)
	}

	function getFollow(data) {
		if (data == "ok") {
			$("#gz").hide()
			$("#Kq").show()
		}
	}
</script>
</head>
<body>
	<jsp:include page="header.jsp" />
	<div class="container  center-container-hx ">
		<br /> <br /> <br />
		<div class="g-bd">
			<div class="g-wrap p-prf">
				<dl class="m-proifo f-cb" id="head-box">
					<dt class="f-pr" id="ava">
						<img src="upload/${bbsvo.user.photo }">

					</dt>
					<dd>
						<div class="name f-cb">
							<div class="f-cb">
								<c:if test="${bbsvo.user.id eq sessionScope.loginUser.id}">
									<div class="edit">
										<a
											href="${pageContext.request.contextPath }/userEdit.action?id=${bbsvo.user.id}" target="_self"
											class="u-btn2 u-btn2-1"><i><%=rb.getString("editprofile")%></i></a>
									</div>
								</c:if>

								<div class="rect" id="newmusician"></div>
								<h2 id="j-name-wrap" class="wrap f-fl f-cb ">
									<span class="tit f-ff2 s-fc0 f-thide">${bbsvo.user.username }</span>
									<i class="icn u-icn u-icn-01"></i>
								</h2>
								<div id="head-oper">
									<c:if
										test="${sessionScope.loginUser !=null &&sessionScope.loginUser.id != bbsvo.user.id}">
										<a href="#" class="btn u-btn u-btn-8 f-tdn" id="gz"><%=rb.getString("follow")%></a>
									</c:if>
									<a href="#" class="btn u-btn u-btn-6 f-tdn" id="Kq"
										style="display: none"><i><%=rb.getString("followed")%></i></a>
								</div>
							</div>

						</div>
						<ul class="data s-fc3 f-cb" id="tab-box">
							<li class="fst"><a href="#"><strong id="event_count">${bbsvo.userBbsCount }</strong><span><%=rb.getString("posts")%></span></a></li>
							<li><a
								href="${pageContext.request.contextPath }/showFanOrFollow.action?id=${bbsvo.user.id }&type=follow" target="_self"><strong
									id="follow_count">${bbsvo.user.followCount }</strong><span><%=rb.getString("following")%></span></a></li>
							<li><a
								href="${pageContext.request.contextPath }/showFanOrFollow.action?id=${bbsvo.user.id }&type=fan" target="_self">
									<strong id="fan_count">${bbsvo.user.fanCount }</strong> <span><%=rb.getString("followers")%></span>
									<i class="u-icn u-icn-68 f-alpha" id="newCount"
									style="display: none;"></i>
							</a></li>
						</ul>
						<c:if test="${not empty bbsvo.user.signature}">
							<div class="inf s-fc3 f-brk"><%=rb.getString("selfintroduce")%>${bbsvo.user.signature }</div>
						</c:if>

						<c:if test="${empty bbsvo.user.signature}">

						</c:if>
						<div class="">
							<span class="sep" id="age">&nbsp;<%=rb.getString("age")%><span>${bbsvo.user.age }</span></span>
						</div>
						<div class="inf s-fc3 f-cb"></div>
					</dd>
				</dl>
				<div class="u-title u-title-1 f-cb">
					<h3>
						<c:choose>
							<c:when test="${type eq 'fan' }">
								<span class="f-ff2 s-fc3"><%=rb.getString("followers")%>(<span
									id="follow_count_down">${bbsvo.user.fanCount }</span>) </span>
							</c:when>
							<c:otherwise>
								<span class="f-ff2 s-fc3"><%=rb.getString("following")%>(<span
									id="follow_count_down">${bbsvo.user.followCount }</span>) </span>
							</c:otherwise>
						</c:choose>
					</h3>
				</div>
				<ul class="m-fans f-cb" id="main-box">
					<c:forEach items="${bbsvo.userList}" var="user" varStatus="i">
						<c:choose>
							<c:when test="${i.index%2==0 }">
								<li class="odd bg"><a href="#" class="ava f-pr"><img
										src="upload/${user.photo }"></a>
									<div class="info">
										<p>
											<a
												href="${pageContext.request.contextPath }/center.action?id=${user.id}" target="_self"
												class="s-fc7 f-fs1 nm f-thide" title="${user.username }">${user.username }</a>&nbsp;&nbsp;<i
												class="icn u-icn u-icn-s-00"></i>
										</p>
										<p>
											<a href="showFanOrFollow.action?id=${user.id }&type=follow" target="_self"><%=rb.getString("following")%><em
												class="s-fc7">${user.followCount }</em></a><span class="line">|</span><a
												href="showFanOrFollow.action?id=${user.id }&type=fan" target="_self"><%=rb.getString("followers")%><em
												class="s-fc7">${user.fanCount }</em></a>
										</p>
									</div></li>
							</c:when>
							<c:otherwise>
								<li class="bg"><a href="#" class="ava f-pr"><img
										src="upload/${user.photo }"></a>
									<div class="info">
										<p>
											<a
												href="${pageContext.request.contextPath }/center.action?id=${user.id}" target="_self"
												class="s-fc7 f-fs1 nm f-thide" title="${user.username }">${user.username }</a>&nbsp;&nbsp;<i
												class="icn u-icn u-icn-s-00"></i>
										</p>
										<p>
											<a href="showFanOrFollow.action?id=${user.id }&type=follow" target="_self"><%=rb.getString("following")%><em
												class="s-fc7">${user.followCount }</em></a><span class="line">|</span><a
												href="showFanOrFollow.action?id=${bbsvo.user.id }&type=follow" target="_self"><%=rb.getString("followers")%><em
												class="s-fc7">${user.fanCount }</em></a>
										</p>
									</div></li>
							</c:otherwise>
						</c:choose>

					</c:forEach>
				</ul>
			</div>
		</div>
	</div>
</body>

</html>
