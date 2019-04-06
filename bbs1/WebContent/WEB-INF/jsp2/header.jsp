<%@ page language="java" import="java.util.*"
	contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<script>
	$(function() {
		$("#zu-top-add-question")
				.click(
						function() {
							window.location.href = "${pageContext.request.contextPath}/toCreateBbs.action?cid=${cid}"
						})

		var uid = ${sessionScope.loginUser.id};//用户的id
		$.post("messageCount.action", {
			uid : uid
		}, function(data) {
			if (data == 0) {
				$(".red").hide();
			} else {
				$(".red").text(data);
			}
		})

	})
</script>
<style>
.red {
	position: absolute;
	width: 16px;
	height: 16px;
	background: red;
	text-align: center;
	font: 12px/15px 微软雅黑;
	border-radius: 8px 8px;
	right: 13px;
	top: 53px;
}
</style>
<%
	Locale locale = request.getLocale();
	ResourceBundle rb = ResourceBundle.getBundle("res", locale);
%>
<div role="navigation" class="zu-top">
	<div class="zg-wrap modal-shifting clearfix" id="zh-top-inner">
		<a href="index.action" class="zu-top-link-logo" id="zh-top-link-logo">PerForum</a>

		<div class="top-nav-profile">
			<c:choose>
				<c:when test="${not empty sessionScope.loginUser }">
					<a class="zu-top-nav-userinfo " id=":0"> <span
						class="name">${sessionScope.loginUser.username }</span> <img
						class="Avatar" src="upload/${sessionScope.loginUser.photo }"
						alt=""> <span id="zh-top-nav-new-pm"
						class="zg-noti-number zu-top-nav-pm-count"
						style="visibility: hidden"> </span> 
					</a>
					<ul class="top-nav-dropdown" id="top-nav-profile-dropdown">


						<li><a
							href="${pageContext.request.contextPath }/center.action?id=${sessionScope.loginUser.id}"
							tabindex="-1" id=":1"> <i class="zg-icon zg-icon-dd-home"></i><%=rb.getString("usercenter")%>
						</a></li>

						<li><a
							href="${pageContext.request.contextPath }/queryMesssage.action?uid=${sessionScope.loginUser.id}"
							tabindex="-1" id=":2">
								<div class="red">${messageCount}</div>
								<i class="zg-icon zg-icon-dd-pm"></i><%=rb.getString("message")%>
						</a></li>

						<li><a
							href="${pageContext.request.contextPath }/logout.action"
							tabindex="-1" id=":4"> <i class="zg-icon zg-icon-dd-logout"></i><%=rb.getString("logout")%>
						</a></li>



					</ul>
				</c:when>
				<c:otherwise>
					<a class="zu-top-nav-userinfo " id=":0"> <span class="name"><%=rb.getString("login")%>
							<%=rb.getString("or")%> <%=rb.getString("signup")%></span>
					</a>
					<ul class="top-nav-dropdown" id="top-nav-profile-dropdown">


						<li><a
							href="${pageContext.request.contextPath }/toRegist.action"
							tabindex="-1" id=":1"> <i class="zg-icon zg-icon-dd-home"></i><%=rb.getString("signup")%>
						</a></li>

						<li><a
							href="${pageContext.request.contextPath }/toLogin.action"
							tabindex="-1" id=":2"> <i class="zg-icon zg-icon-dd-pm"></i><%=rb.getString("login")%><span
								id="zh-top-nav-pm-count"
								class="zu-top-nav-pm-count zg-noti-number"
								style="visibility: hidden"> </span>
						</a></li>





					</ul>
				</c:otherwise>
			</c:choose>
		</div>

		<c:if test="${ cid gt 0}">
			<button class="zu-top-add-question" id="zu-top-add-question"><%=rb.getString("post")%></button>
		</c:if>
		<div id="zg-top-nav" class="zu-top-nav">
			<ul class="zu-top-nav-ul zg-clear">
				<c:forEach items="${ sessionScope.categoryList}" var="category">
					<c:choose>
						<c:when test="${cid eq category.id}">
							<!-- cid为switchCategory方法传值 -->
							<li class="zu-top-nav-li current" id="zh-top-nav-explore"><a
								class="zu-top-nav-link"
								href="${pageContext.request.contextPath }/switchCategory.action?cid=${category.id }">${category.name}</a></li>
						</c:when>
						<c:otherwise>
							<li class="zu-top-nav-li " id="zh-top-nav-explore"><a
								class="zu-top-nav-link"
								href="${pageContext.request.contextPath }/switchCategory.action?cid=${category.id }">${category.name}</a></li>
						</c:otherwise>
					</c:choose>

				</c:forEach>
			</ul>
			<div class="zu-top-nav-live zu-noti7-popup zg-r5px no-hovercard"
				id="zh-top-nav-live-new" role="popup" tabindex="0">
				<div class="zu-top-nav-live-inner zg-r5px">
					<div class="zu-top-live-icon">&nbsp;</div>
					<div class="zu-home-noti-inner" id="zh-top-nav-live-new-inner">
						<div class="zm-noti7-popup-tab-container clearfix" tabindex="0"
							role="tablist">
							<button class="zm-noti7-popup-tab-item message" role="tab">
								<span class="icon">消息</span>
							</button>
							<button class="zm-noti7-popup-tab-item user" role="tab">
								<span class="icon">用户</span>
							</button>
							<button class="zm-noti7-popup-tab-item thanks" role="tab">
								<span class="icon">赞同和感谢</span>
							</button>
						</div>
					</div>
					<div class="zm-noti7-frame-border top"></div>
					<div class="zm-noti7-frame">
						<div class="zm-noti7-content message zh-scroller"
							style="position: relative; overflow: hidden;">
							<div class="zh-scroller-inner"
								style="height: 100%; width: 150%; overflow: auto;">
								<div class="zh-scroller-content"
									style="position: static; display: block; visibility: visible; overflow: hidden; width: 315px; min-height: 100%;">
									<div class="zh-scroller-inner"
										style="height: 100%; width: 150%; overflow: auto;">
										<div class="zh-scroller-content"
											style="position: static; display: block; visibility: visible; overflow: hidden; width: 315px; min-height: 100%;">
											<div class="zh-scroller-inner"
												style="height: 100%; width: 150%; overflow: auto;">
												<div class="zh-scroller-content"
													style="position: static; display: block; visibility: visible; overflow: hidden; width: 315px; min-height: 100%;">
													<div class="zh-scroller-inner"
														style="height: 100%; width: 150%; overflow: auto;">
														<div class="zh-scroller-content"
															style="position: static; display: block; visibility: visible; overflow: hidden; width: 315px; min-height: 100%;">
															<div class="zm-noti7-content-inner">
																<div class="zm-noti7-content-body">
																	<div class="zm-noti7-popup-loading">
																		<span class="noti-spinner-loading"></span>
																	</div>
																</div>
															</div>
														</div>
													</div>
													<div class="zh-scroller-bar-container"
														style="position: absolute; right: 1px; top: 0px; height: 98px; width: 6px; background: rgb(102, 102, 102); border: 1px solid rgb(68, 68, 68); opacity: 0; cursor: default; border-radius: 2px; user-select: none;">
														<div style="user-select: none;"></div>
													</div>
													<div class="zh-scroller-bar"
														style="position: absolute; right: 2px; top: 2px; opacity: 0.5; background: rgb(0, 0, 0); width: 6px; border-radius: 3px; cursor: default; user-select: none; display: none;"></div>
												</div>
											</div>
											<div class="zh-scroller-bar-container"
												style="position: absolute; right: 1px; top: 0px; height: 98px; width: 6px; background: rgb(102, 102, 102) none repeat scroll 0% 0%; border: 1px solid rgb(68, 68, 68); opacity: 0; cursor: default; border-radius: 2px; -moz-user-select: none;">
												<div style="-moz-user-select: none;"></div>
											</div>
											<div class="zh-scroller-bar"
												style="position: absolute; right: 2px; top: 2px; opacity: 0.5; background: rgb(0, 0, 0) none repeat scroll 0% 0%; width: 6px; border-radius: 3px; cursor: default; -moz-user-select: none; display: none;"></div>
										</div>
									</div>
									<div class="zh-scroller-bar-container"
										style="position: absolute; right: 1px; top: 0px; height: 98px; width: 6px; background: rgb(102, 102, 102) none repeat scroll 0% 0%; border: 1px solid rgb(68, 68, 68); opacity: 0; cursor: default; border-radius: 2px; -moz-user-select: none;">
										<div style="-moz-user-select: none;"></div>
									</div>
									<div class="zh-scroller-bar"
										style="position: absolute; right: 2px; top: 2px; opacity: 0.5; background: rgb(0, 0, 0) none repeat scroll 0% 0%; width: 6px; border-radius: 3px; cursor: default; -moz-user-select: none; display: none;"></div>
								</div>
							</div>
							<div class="zh-scroller-bar-container"
								style="position: absolute; right: 1px; top: 0px; height: 98px; width: 6px; background: rgb(102, 102, 102) none repeat scroll 0% 0%; border: 1px solid rgb(68, 68, 68); opacity: 0; cursor: default; border-radius: 2px; -moz-user-select: none;">
								<div style="-moz-user-select: none;"></div>
							</div>
							<div class="zh-scroller-bar"
								style="position: absolute; right: 2px; top: 2px; opacity: 0.5; background: rgb(0, 0, 0) none repeat scroll 0% 0%; width: 6px; border-radius: 3px; cursor: default; -moz-user-select: none; display: none;"></div>
						</div>
						<div class="zm-noti7-content user zh-scroller"
							style="display: none; position: relative; overflow: hidden;">
							<div class="zh-scroller-inner"
								style="height: 100%; width: 150%; overflow: auto;">
								<div class="zh-scroller-content"
									style="position: static; display: block; visibility: visible; overflow: hidden; width: 315px; min-height: 100%;">
									<div class="zh-scroller-inner"
										style="height: 100%; width: 150%; overflow: auto;">
										<div class="zh-scroller-content"
											style="position: static; display: block; visibility: visible; overflow: hidden; width: 315px; min-height: 100%;">
											<div class="zh-scroller-inner"
												style="height: 100%; width: 150%; overflow: auto;">
												<div class="zh-scroller-content"
													style="position: static; display: block; visibility: visible; overflow: hidden; width: 315px; min-height: 100%;">
													<div class="zh-scroller-inner"
														style="height: 100%; width: 150%; overflow: auto;">
														<div class="zh-scroller-content"
															style="position: static; display: block; visibility: visible; overflow: hidden; width: 315px; min-height: 100%;">
															<div class="zm-noti7-content-inner">
																<div class="zm-noti7-content-body">
																	<div class="zm-noti7-popup-loading">
																		<span class="noti-spinner-loading"></span>
																	</div>
																</div>
															</div>
														</div>
													</div>
													<div class="zh-scroller-bar-container"
														style="position: absolute; right: 1px; top: 0px; height: 98px; width: 6px; background: rgb(102, 102, 102); border: 1px solid rgb(68, 68, 68); opacity: 0; cursor: default; border-radius: 2px; user-select: none;">
														<div style="user-select: none;"></div>
													</div>
													<div class="zh-scroller-bar"
														style="position: absolute; right: 2px; top: 2px; opacity: 0.5; background: rgb(0, 0, 0); width: 6px; border-radius: 3px; cursor: default; user-select: none; display: none;"></div>
												</div>
											</div>
											<div class="zh-scroller-bar-container"
												style="position: absolute; right: 1px; top: 0px; height: 98px; width: 6px; background: rgb(102, 102, 102) none repeat scroll 0% 0%; border: 1px solid rgb(68, 68, 68); opacity: 0; cursor: default; border-radius: 2px; -moz-user-select: none;">
												<div style="-moz-user-select: none;"></div>
											</div>
											<div class="zh-scroller-bar"
												style="position: absolute; right: 2px; top: 2px; opacity: 0.5; background: rgb(0, 0, 0) none repeat scroll 0% 0%; width: 6px; border-radius: 3px; cursor: default; -moz-user-select: none; display: none;"></div>
										</div>
									</div>
									<div class="zh-scroller-bar-container"
										style="position: absolute; right: 1px; top: 0px; height: 98px; width: 6px; background: rgb(102, 102, 102) none repeat scroll 0% 0%; border: 1px solid rgb(68, 68, 68); opacity: 0; cursor: default; border-radius: 2px; -moz-user-select: none;">
										<div style="-moz-user-select: none;"></div>
									</div>
									<div class="zh-scroller-bar"
										style="position: absolute; right: 2px; top: 2px; opacity: 0.5; background: rgb(0, 0, 0) none repeat scroll 0% 0%; width: 6px; border-radius: 3px; cursor: default; -moz-user-select: none; display: none;"></div>
								</div>
							</div>
							<div class="zh-scroller-bar-container"
								style="position: absolute; right: 1px; top: 0px; height: 98px; width: 6px; background: rgb(102, 102, 102) none repeat scroll 0% 0%; border: 1px solid rgb(68, 68, 68); opacity: 0; cursor: default; border-radius: 2px; -moz-user-select: none;">
								<div style="-moz-user-select: none;"></div>
							</div>
							<div class="zh-scroller-bar"
								style="position: absolute; right: 2px; top: 2px; opacity: 0.5; background: rgb(0, 0, 0) none repeat scroll 0% 0%; width: 6px; border-radius: 3px; cursor: default; -moz-user-select: none; display: none;"></div>
						</div>
						<div class="zm-noti7-content thanks zh-scroller"
							style="display: none; position: relative; overflow: hidden;">
							<div class="zh-scroller-inner"
								style="height: 100%; width: 150%; overflow: auto;">
								<div class="zh-scroller-content"
									style="position: static; display: block; visibility: visible; overflow: hidden; width: 315px; min-height: 100%;">
									<div class="zh-scroller-inner"
										style="height: 100%; width: 150%; overflow: auto;">
										<div class="zh-scroller-content"
											style="position: static; display: block; visibility: visible; overflow: hidden; width: 315px; min-height: 100%;">
											<div class="zh-scroller-inner"
												style="height: 100%; width: 150%; overflow: auto;">
												<div class="zh-scroller-content"
													style="position: static; display: block; visibility: visible; overflow: hidden; width: 315px; min-height: 100%;">
													<div class="zh-scroller-inner"
														style="height: 100%; width: 150%; overflow: auto;">
														<div class="zh-scroller-content"
															style="position: static; display: block; visibility: visible; overflow: hidden; width: 315px; min-height: 100%;">
															<div class="zm-noti7-content-inner">
																<div class="zm-noti7-content-body">
																	<div class="zm-noti7-popup-loading">
																		<span class="noti-spinner-loading"></span>
																	</div>
																</div>
															</div>
														</div>
													</div>
													<div class="zh-scroller-bar-container"
														style="position: absolute; right: 1px; top: 0px; height: 98px; width: 6px; background: rgb(102, 102, 102); border: 1px solid rgb(68, 68, 68); opacity: 0; cursor: default; border-radius: 2px; user-select: none;">
														<div style="user-select: none;"></div>
													</div>
													<div class="zh-scroller-bar"
														style="position: absolute; right: 2px; top: 2px; opacity: 0.5; background: rgb(0, 0, 0); width: 6px; border-radius: 3px; cursor: default; user-select: none; display: none;"></div>
												</div>
											</div>
											<div class="zh-scroller-bar-container"
												style="position: absolute; right: 1px; top: 0px; height: 98px; width: 6px; background: rgb(102, 102, 102) none repeat scroll 0% 0%; border: 1px solid rgb(68, 68, 68); opacity: 0; cursor: default; border-radius: 2px; -moz-user-select: none;">
												<div style="-moz-user-select: none;"></div>
											</div>
											<div class="zh-scroller-bar"
												style="position: absolute; right: 2px; top: 2px; opacity: 0.5; background: rgb(0, 0, 0) none repeat scroll 0% 0%; width: 6px; border-radius: 3px; cursor: default; -moz-user-select: none; display: none;"></div>
										</div>
									</div>
									<div class="zh-scroller-bar-container"
										style="position: absolute; right: 1px; top: 0px; height: 98px; width: 6px; background: rgb(102, 102, 102) none repeat scroll 0% 0%; border: 1px solid rgb(68, 68, 68); opacity: 0; cursor: default; border-radius: 2px; -moz-user-select: none;">
										<div style="-moz-user-select: none;"></div>
									</div>
									<div class="zh-scroller-bar"
										style="position: absolute; right: 2px; top: 2px; opacity: 0.5; background: rgb(0, 0, 0) none repeat scroll 0% 0%; width: 6px; border-radius: 3px; cursor: default; -moz-user-select: none; display: none;"></div>
								</div>
							</div>
							<div class="zh-scroller-bar-container"
								style="position: absolute; right: 1px; top: 0px; height: 98px; width: 6px; background: rgb(102, 102, 102) none repeat scroll 0% 0%; border: 1px solid rgb(68, 68, 68); opacity: 0; cursor: default; border-radius: 2px; -moz-user-select: none;">
								<div style="-moz-user-select: none;"></div>
							</div>
							<div class="zh-scroller-bar"
								style="position: absolute; right: 2px; top: 2px; opacity: 0.5; background: rgb(0, 0, 0) none repeat scroll 0% 0%; width: 6px; border-radius: 3px; cursor: default; -moz-user-select: none; display: none;"></div>
						</div>
					</div>
					<div class="zm-noti7-frame-border bottom"></div>
					<div class="zm-noti7-popup-footer">
						<a href="/notifications"
							class="zm-noti7-popup-footer-all zg-right">查看全部 »</a> <a
							href="/settings/notification" class="zm-noti7-popup-footer-set"
							title="通知设置"><i class="zg-icon zg-icon-settings"></i></a>
					</div>
				</div>
			</div>

		</div>

	</div>
</div>