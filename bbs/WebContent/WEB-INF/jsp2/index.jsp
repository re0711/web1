<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>god论坛</title>
<script
	src="${pageContext.request.contextPath }/statics/js/jquery-2.1.1.min.js"></script>
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/statics2/css/zh.css">

<script src="${pageContext.request.contextPath}/statics2/js/zh.js"></script>
<script
	src="${pageContext.request.contextPath }/statics/js/jquery.easyui.min.js"></script>
<link href="${pageContext.request.contextPath }/statics/css/easyui.css"
	rel="stylesheet">
<link href="${pageContext.request.contextPath }/statics/css/icon.css"
	rel="stylesheet">
<script type="text/javascript">
	$(function() {
		$("#btn_search").click(function() {
			$("#window").show()
			$("#window").window({
				title : "搜索",
			})
		})

	})
	//需要至少填写一项
	function submitForm() {
		var flag = false;
		$(":text")
				.each(
						function() {
							if ($(this).val() != ''
									&& $(this).val().replace(/^ +| +$/g, '').length != 0) {
								flag = true;
							}

						})
		if (flag) {
			$("#ff").submit()
		}
	}

	function clearForm() {
		$(":text").each(function() {
			$(this).val("")
		})
	}
</script>
</head>
<body class="zhi ">

	<jsp:include page="header.jsp" />
	<a id="btn_search" href="#" class="easyui-linkbutton"
		data-options="iconCls:'icon-search'"
		style="position: absolute; right: 100px; top: 80px;">搜索</a>
	<div class="zg-wrap zu-main clearfix " role="main">
		<div class="zu-main-content">
			<div class="zu-main-content-inner">

				<div class="zg-section" id="zh-home-list-title">
					<i class="zg-icon zg-icon-feedlist"></i> 最新动态 <input
						id="is-topstory" type="hidden"> <span
						class="zg-right zm-noti-cleaner-setting" style="list-style: none"><a
						href="#" class="zg-link-gray-normal"><i
							class="zg-icon zg-icon-settings"></i>设置</a></span>
				</div>
				<c:forEach items="${bbsList }" var="bbs">
					<div class="zu-main-feed-con navigable" id="zh-question-list">
						<a href="javascript:;" class="zu-main-feed-fresh-button"
							id="zh-main-feed-fresh-button" style="display: none"></a>
						<div id="js-home-feed-list"
							class="zh-general-list topstory clearfix">

							<div class="feed-item folding feed-item-hook feed-item-0
"
								id="feed-0">
								<div class="feed-item-inner">
									<div class="avatar">
										<a class="zm-item-link-avatar"
											href="${pageContext.request.contextPath }/center.action?id=${bbs.user.id}"
											target="_blank"> <img src="/pic/${bbs.user.photo }"
											class="side-topic-avatar">
										</a>
									</div>
									<div class="feed-main">
										<div class="feed-source">
											来自: <a href="#">${bbs.category.name }</a>

										</div>
										<div class="feed-content">
											<h2 class="feed-title">
												<a class="question_link"
													href="${pageContext.request.contextPath }/bbs_detail.action?id=${bbs.id}"
													target="_blank"> ${bbs.title } </a>
											</h2>
											<div class="feed-question-detail-item">

												<div class="question-description-plain zm-editable-content">

												</div>

											</div>
											<div class="expandable entry-body">

												<div class="zm-item-vote">
													<a class="zm-item-vote-count js-expand js-vote-count"
														href="javascript:;">88</a>
												</div>

												<div class="zm-votebar goog-scrollfloater"
													data-za-module="VoteBar" style=""></div>

												<div class="zm-item-answer-author-info">

													<span class="summary-wrapper"> <span
														class="author-link-line"> <a class="author-link"
															target="_blank"
															href="${pageContext.request.contextPath }/center.action?id=${bbs.user.id}">${bbs.user.username }</a>
													</span><span> ${bbs.user.signature} </span>
													</span>
												</div>

												<div class="zm-item-vote-info">

													<span class="voters text"><a href="#"
														class="more text"><span class="js-voteCount">888</span>&nbsp;人赞同</a></span>

												</div>
												<div class="zm-item-rich-text expandable js-collapse-body">

													<div class="zh-summary summary clearfix"
														style="display: block;">${bbs.summary }</div>
													<p class="visible-expanded"></p>
												</div>
											</div>
											<div class="feed-meta">
												<div
													class="zm-item-meta answer-actions clearfix js-contentActions">
													<div class="zm-meta-panel">
														<a href="#" name="addcomment"
															class="meta-item toggle-comment js-toggleCommentBox">
															<i class="z-icon-comment"></i> <fmt:formatDate
																value="${bbs.createdat}" pattern="yyyy-MM-dd HH:mm:ss" />
														</a> <a href="#" name="addcomment"
															class="meta-item toggle-comment js-toggleCommentBox">
															<i class="z-icon-comment"></i>${bbs.commentCount } 条评论
														</a> <a href="#" class="meta-item zu-autohide js-thank"><i
															class="z-icon-thank"></i>感谢</a> <a href="#"
															class="meta-item zu-autohide js-collect"><i
															class="z-icon-collect"></i>收藏</a> <span class="zg-bull">•</span>
														<a href="/terms#sec-licence-1" target="_blank"
															class="meta-item copyright"> 作者保留权利 </a>


														<button class="meta-item item-collapse js-collapse">
															<i class="z-icon-fold"></i>收起
														</button>
													</div>
												</div>

											</div>
										</div>
									</div>
								</div>

							</div>

						</div>

					</div>
				</c:forEach>
			</div>
		</div>

		<div class="zu-main-sidebar">

			<div class="shameimaru-placeholder"></div>

		</div>

	</div>
	<div id="window" style="display: none;">
		<div style="margin: 20px 0;"></div>
		<div class="easyui-panel" style="width: 400px">
			<div style="padding: 10px 60px 20px 60px">
				<form id="ff"
					action="${pageContext.request.contextPath }/searchBbs.action"
					method="get">
					<table cellpadding="5">
						<tr>
							<td>Author:</td>
							<td><input class="easyui-textbox" type="text"
								name="bbs.user.username" id="username"
								data-options="required:true"> </input></td>
						</tr>

						<tr>
							<td>Title:</td>
							<td><input class="easyui-textbox" type="text" id="title"
								name="bbs.title" data-options="required:true"> </input></td>
						</tr>
						<tr>
							<td>Category:
							<td><input class="easyui-textbox" type="text" id="category"
								name="bbs.category.name" data-options="required:true"> </input></td>
						</tr>
					</table>
				</form>
				<div style="text-align: center; padding: 5px">
					<a id="submit" class="easyui-linkbutton" onclick="submitForm()">Submit</a>
					<a href="javascript:void(0)" class="easyui-linkbutton"
						onclick="clearForm()">Clear</a>
				</div>
			</div>
		</div>
	</div>
</body>
</html>