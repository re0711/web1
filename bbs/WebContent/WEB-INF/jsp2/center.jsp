<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>${bbsvo.user.username}的个人中心</title>
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/statics2/css/zh.css">

<script src="${pageContext.request.contextPath}/statics2/js/zh.js"></script>
<script src="${pageContext.request.contextPath}/statics/js/jquery-2.1.1.min.js"></script>

<link
	href="http://s2.music.126.net/sep/s/2/pt_frame.css?2187ea118b8bd3d96ccea8d8714a2fe0"
	type="text/css" rel="stylesheet">
<link
	href="http://s2.music.126.net/sep/s/2/core.css?80cb678ca5cfbf98b1747b214748e637"
	type="text/css" rel="stylesheet">
<link
	href="http://s2.music.126.net/sep/s/2/pt_profile_home.css?12c39ed2fbfab4a81b3de4be2f6ae756"
	type="text/css" rel="stylesheet">
	<script type="text/javascript">
	$(function(){
		bid = ${sessionScope.loginUser.id}   //登录用户id
		aid = ${bbsvo.user.id}               //页面用户id
		
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
			$(this).find("i").text("取消关注")
		}).mouseout(function(){
			$(this).find("i").text("已关注")
		}).click(function(){
			$(this).prev().show()
			$(this).hide()
			//改变页面显示 1为增加 0为减少
			change(0)
			//更新数据库 1为增加 0为减少
			AddOrReduce(0)
		})
		
	})
	
	function change(flag){
		fan_count = $("#fan_count").text()
		if(flag==1){
			fan_count=parseInt(fan_count)+1
		}else{
			fan_count=parseInt(fan_count)-1	
		}
		$("#fan_count").text(fan_count)
	}
	
	function AddOrReduce(type){
		
		if(type==1){
			param={aid:aid,bid:bid,type:1}
		}else if(type==0){
			param={aid:aid,bid:bid,type:0}
		}
		request("funCount.action",param,null)
		
	}
	
	function request(url,data,func){
		$.post(url,data,func)
	}
	
	function getFollow(data){
		if(data=="ok"){
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
						<img src="/pic/${bbsvo.user.photo }">

					</dt>
					<dd>
						<div class="name f-cb">
							<div class="f-cb">
								<c:if test="${bbsvo.user.id eq sessionScope.loginUser.id}">
									<div class="edit">
										<a
											href="${pageContext.request.contextPath }/userEdit.action?id=${bbsvo.user.id}"
											 class="u-btn2 u-btn2-1"><i>编辑个人资料</i></a>
									</div>
								</c:if>

								<div class="rect" id="newmusician"></div>
								<h2 id="j-name-wrap" class="wrap f-fl f-cb ">
									<span class="tit f-ff2 s-fc0 f-thide">${bbsvo.user.username }</span>
									<i class="icn u-icn u-icn-01"></i>
								</h2>
								<div id="head-oper">
								<c:if test="${sessionScope.loginUser !=null &&sessionScope.loginUser.id != bbsvo.user.id}">
									<a href="#" class="btn u-btn u-btn-8 f-tdn"
										id="gz">关 注</a> 
								</c:if>		
										<a href="#"
										class="btn u-btn u-btn-6 f-tdn" 
										id="Kq" style="display:none"><i>已关注</i></a>
								</div>
							</div>

						</div>
						<ul class="data s-fc3 f-cb" id="tab-box">
							<li class="fst"><a href="#"><strong
									id="event_count">${bbsvo.userBbsCount }</strong><span>发帖</span></a></li>
							<li><a href="${pageContext.request.contextPath }/showFanOrFollow.action?id=${bbsvo.user.id }&type=follow"><strong
									id="follow_count">${bbsvo.user.followCount }</strong><span>关注</span></a></li>
							<li><a href="${pageContext.request.contextPath }/showFanOrFollow.action?id=${bbsvo.user.id }&type=fan"> <strong
									id="fan_count">${bbsvo.user.fanCount }</strong> <span>粉丝</span> <i
									class="u-icn u-icn-68 f-alpha" id="newCount"
									style="display: none;"></i>
							</a></li>
						</ul>
						<div class="inf s-fc3 f-brk">个人介绍：${bbsvo.user.signature }</div>
						<div class="">
							<span class="sep" id="age" >&nbsp;年龄：<span>${bbsvo.user.age }</span></span>
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
						<span  id="songsall">所有时间</span> <i></i> <span
							 id="songsweek" class="z-sel">最近一周</span>
					</div>
				</div>
				<div id="m-record" class="m-record">
					<div oncopy="return false;" oncut="return false;"
						ondragstart="return false;" id="auto-id-yTIucT9PU7hx24Ue">
						<div class="j-flag" id="auto-id-nM4sTLcPyo60crnH">
							<c:forEach items="${bbsvo.bbsList }" var="bbs">
								<ul>
									<li id="320697921492304659812"><div class="hd "></div>

										<div class="song">
											<div class="tt">
												<div class="ttc">
													<span class="txt"><a
														href="${pageContext.request.contextPath }/bbs_detail.action?id=${bbs.id}">${bbs.title }</a><span
														class="ar s-fc8"> </span> </span>

												</div>
											</div>
										</div>

										<div class="tops">
											<span class="bg" style="width: 100%;"></span><span
												class="times f-ff2"> <fmt:formatDate
													value="${bbs.createdat}" pattern="yyyy-MM-dd HH:mm:ss" /></span>
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