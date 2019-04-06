<%@ page language="java" import="java.util.*" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
 <%
 Locale locale = request.getLocale();
 ResourceBundle rb = ResourceBundle.getBundle("res", locale);
 %>
<title><%=rb.getString("mymessage") %></title>
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
	href="${pageContext.request.contextPath }/statics2/css/tieba.css">
<link type="text/css" rel="stylesheet"
	href="${pageContext.request.contextPath }/statics2/css/tieba1.css">
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/statics2/css/zh.css">

<script src="${pageContext.request.contextPath}/statics2/js/zh.js"></script>

<script type="text/javascript">
	$(function() {
		count();
		$("#rm").click(function() {
			deleteMessage();
		})
		$("#remark").click(function() {
			remark();
		})

		
	})
	id = ${messageList[0].message.recipientid};//用户id

	function deleteMessage() {
		$.messager.confirm('<%=rb.getString("confirm") %>', '<%=rb.getString("confirm1") %>', function(r) {
			if (r) {
				var params = {
					id : id
				};
				$.post("deleteMessage.action", params, function(data) {
					if (data == 'ok') {
						$.messager.alert('<%=rb.getString("reply") %>', '<%=rb.getString("deletep") %>', undefined,
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
				$.messager.alert('<%=rb.getString("reply") %>', '<%=rb.getString("markp") %>', undefined);
			}
		});

	}

	function count() { //单项回复的条数
		var comment = $("#comment").find(".replyme_content").length;
		var tab = $('#tt').tabs('getTab', 0); // 取得第一个tab 
		$('#tt').tabs('update', {
			tab : tab,
			options : {
				title : "<%=rb.getString("reply3") %>" + comment + ")"
			}
		});

	}
</script>

</head>
<body>
	<jsp:include page="header.jsp" />

	<ul class="nav_bar"
		style="width: 800px; position: absolute; left: 300px; top: 86px;">
		<li class="nav_item"><a href="#" target="_self"><%=rb.getString("home") %></a></li>
		<li class="nav_item"><a href="#" target="_self" id="rm"><%=rb.getString("clear") %></a></li>
		<li class="nav_item"><a href="#" target="_self" id="remark"><%=rb.getString("mark") %></a></li>
	</ul>
	<div id="tt" class="easyui-tabs"
		style="width: 800px; position: absolute; left: 300px; top: 130px;">
		<div title="<%=rb.getString("reply3") %>0)" style="padding: 20px;" id="comment">

			<c:forEach items="${messageList }" var="vo">
				<c:if test="${vo.message.type==1}">
					<div class="feed_left j_del_ctrl clearfix">
						<div class="replyme_text clearfix j_replyme">
							<div class="replyme_user">
								<a href="center.action?id=${vo.message.sponsorid}">${vo.username}：</a>
							</div>
							<div class="replyme_content">
								<a href="#"><%=rb.getString("reply") %> <%=rb.getString("you") %>${vo.message.content}</a>
							</div>
						</div>
						<div class="feed_rich">
							<!---->
						</div>
						<div class="feed_from">
							<%=rb.getString("reply2") %>"<a class="itb_thread"
								href="bbs_detail.action?id=${vo.message.bbsid}">${vo.title}</a>"
							&gt; <a class="itb_kw" href="#">${vo.categoryName}</a>
						</div>
					</div>
					<div class="feed_right j_del_ctrl">
						<div class="feed_time">
							<fmt:formatDate value="${vo.message.date }"
								pattern="yyyy-MM-dd HH:mm:ss" />
						</div>
						<div class="reply icon_reply">
							<a href="#"><%=rb.getString("reply") %></a>
						</div>
					</div>
				</c:if>

			</c:forEach>
		</div>
		<div title="Information(0)" data-options=""
			style="overflow: auto; padding: 20px;">tab2</div>

	</div>

</body>
</html>