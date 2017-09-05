<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<title>你的消息</title>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<script
	src="${pageContext.request.contextPath }/statics/js/jquery-2.1.1.min.js"></script>
<script
	src="${pageContext.request.contextPath }/statics/js/jquery.easyui.min.js"></script>
<link href="${pageContext.request.contextPath }/statics/css/easyui.css"
	rel="stylesheet">
<link href="${pageContext.request.contextPath }/statics/css/icon.css"
	rel="stylesheet">
<link type="text/css" rel="stylesheet"
	href="http://tb1.bdstatic.com/??tb/static-common/style/tb_ui_4b47954.css,tb/static-common/style/tb_common_7193cdf.css">
<link type="text/css" rel="stylesheet"
	href="http://tb1.bdstatic.com/??/tb/_/feed_d3224ac.css,/tb/_/head_foot_3214ced.css,/tb/_/nothing_tip_be2796a.css,/tb/_/friendapplylist_db6b629.css,/tb/_/sub_tab_b31f977.css,/tb/_/msgremind_0cc7a07.css,/tb/_/pager_c34b6ed.css,/tb/_/profile_41c6dc1.css,/tb/_/bind_phone_46a0299.css,/tb/_/aside_other_47a99f3.css,/tb/_/myinfo_5f942cf.css,/tb/_/aside_nav_1f7f698.css,/tb/_/go_top_cf21bfb.css,/tb/_/index_4f7da6f.css">
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/statics2/css/zh.css">

<script src="${pageContext.request.contextPath}/statics2/js/zh.js"></script>
<script type="text/javascript">
	$(function() {
		$("#rm").click(function() {
			deleteMessage();
		})
		$("#remark").click(function() {
			remark();
		})

		count();
	})
	id = ${messageList[0].message.recipientid};//用户id

	function deleteMessage() {
		$.messager.confirm('您确认删除吗？', '您确认删除所有消息吗？', function(r) {
			if (r) {
				var params = {
					id : id
				};
				$.post("deleteMessage.action", params, function(data) {
					if (data == 'ok') {
						$.messager.alert('提示', '删除消息成功!', undefined,
								function() {
									$(".j_del_ctrl").each(function() {
										$(this).remove();
									})
								});
					}
				});
			}
		});
	}

	//标记信息为已读
	function remark() {

		var params = {id : id};
		$.post("remarkMessage.action", params, function(data) {
			if (data == 'ok') {
				$.messager.alert('提示', '标记已读成功!', undefined);
			}
		});

	}

	function count() { //单项回复的条数
		var comment = $("#comment").find(".replyme_content").length;
		/* $("#tt").next().attr("title", "回复我的("+count1+")");
		$("#tt").children().eq(1).attr("title","d");  */
		var tab = $('#tt').tabs('getTab', 0); // 取得第一个tab 
		$('#tt').tabs('update', {
			tab : tab,
			options : {
				title : "回复我的(" + comment + ")"
			}
		});

	}
</script>
<title>我的消息</title>
</head>
<body>
	<jsp:include page="header.jsp" />

	<ul class="nav_bar"
		style="width: 800px; position: absolute; left: 300px; top: 86px;">
		<li class="nav_item"><a href="#" target="_self">论坛首页</a></li>
		<li class="nav_item"><a href="#" target="_self" id="rm">清空所有消息</a></li>
		<li class="nav_item"><a href="#" target="_self" id="remark">标记为已读</a></li>
	</ul>
	<div id="tt" class="easyui-tabs"
		style="width: 800px; position: absolute; left: 300px; top: 130px;">
		<div title="2" style="padding: 20px;" id="comment">

			<c:forEach items="${messageList }" var="vo">
				<c:if test="${vo.message.type==1}">
					<div class="feed_left j_del_ctrl clearfix">
						<div class="replyme_text clearfix j_replyme">
							<div class="replyme_user">
								<a href="center.action?id=${vo.message.sponsorid}">${vo.username}：</a>
							</div>
							<div class="replyme_content">
								<a href="#">回复 你 ：${vo.message.content}</a>
							</div>
						</div>
						<div class="feed_rich">
							<!---->
						</div>
						<div class="feed_from">
							回复我的主题：“<a class="itb_thread"
								href="bbs_detail.action?id=${vo.message.bbsid}">${vo.title}</a>”
							&gt; <a class="itb_kw" href="#">${vo.categoryName}</a>
						</div>
					</div>
					<div class="feed_right j_del_ctrl">
						<div class="feed_time">
							<fmt:formatDate value="${vo.message.date }"
								pattern="yyyy-MM-dd HH:mm:ss" />
						</div>
						<div class="reply icon_reply">
							<a href="#">回复</a>
						</div>
					</div>
				</c:if>

			</c:forEach>
		</div>
		<div title="通知(0)" data-options=""
			style="overflow: auto; padding: 20px;">tab2</div>

	</div>

</body>
</html>