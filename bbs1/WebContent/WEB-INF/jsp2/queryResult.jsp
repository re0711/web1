<%@ page language="java" import="java.util.*" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib prefix="lyx" uri="http://itcast.cn/common/"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<%
 Locale locale = request.getLocale();
 ResourceBundle rb = ResourceBundle.getBundle("res", locale);
 %>
<title><%=rb.getString("queryresult") %></title>
<script
	src="${pageContext.request.contextPath }/statics/js/jquery-2.1.1.min.js"></script>
<link
	href="http://tb1.bdstatic.com/??tb/static-common/style/tb_ui_14384e6.css,tb/static-common/style/tb_common_7193cdf.css"
	rel="stylesheet">
<link
	href="http://tb1.bdstatic.com/??/tb/_/http_transform_d41d8cd.css,/tb/_/card_31c1d0d.css,/tb/_/js_pager_5be1e39.css,/tb/_/user_head_35f26e0.css,/tb/_/icons_a2a62be.css,/tb/_/wallet_dialog_b166468.css,/tb/_/flash_lcs_d41d8cd.css,/tb/_/new_message_system_20f9a8c.css,/tb/_/base_user_data_aee5fd4.css,/tb/_/cashier_dialog_2230300.css,/tb/_/qianbao_cashier_dialog_0739539.css,/tb/_/base_dialog_user_bar_008369c.css,/tb/_/qianbao_purchase_member_56b11f9.css,/tb/_/pay_member_d41d8cd.css,/tb/_/userbar_f4eb8c0.css,/tb/_/poptip_f0fdc70.css,/tb/_/suggestion_2ee80a5.css,/tb/_/search_bright_dasou_e1e589c.css,/tb/_/forumList_b3587cd.css,/tb/_/recommend_topic_ec8ba76.css,/tb/_/recommend_post_71c8412.css,/tb/_/sortbar_dbd9f03.css,/tb/_/noresult_b0e6158.css,/tb/_/notice_680ce8d.css,/tb/_/user_1e7c472.css,/tb/_/list_b1f49be.css,/tb/_/history_3b9e0c7.css,/tb/_/pager_d68252a.css,/tb/_/comtrial_907cfaf.css,/tb/_/result_c20339e.css"
	rel="stylesheet">
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/statics2/css/zh.css">
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/statics2/css/page.css">
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/statics2/css/bootstrap.min.css">
<script src="${pageContext.request.contextPath}/statics2/js/zh.js"></script>

<body>
	<jsp:include page="header.jsp" />
	<br>
	<br>
	<br>
	<br>
	<br>

	<div class="s_main" style="padding-left: 100px;">

		<div class="s_post_list">
			<c:forEach items="${page.rows }" var="bbs">
				<div class="s_post">
					<span class="p_title"><a class="bluelink"
						href="${pageContext.request.contextPath }/bbs_detail.action?id=${bbs.id}"
						target="_blank">${bbs.title }</a></span>
					<div class="p_content"></div>
					<%=rb.getString("category") %><a class="p_forum"
						href="${pageContext.request.contextPath }/switchCategory.action?cid=${bbs.categoryid}"
						target="_blank"><font class="p_violet">${bbs.category.name }</font></a><%=rb.getString("author") %><a
						href="${pageContext.request.contextPath }/center.action?id=${bbs.authorid}"
						target="_blank"><font class="p_violet">${bbs.user.username }</font></a>
					<font class="p_green p_date"> <fmt:formatDate
							value="${bbs.createdat}" pattern="yyyy-MM-dd HH:mm:ss" /></font>
				</div>
			</c:forEach>
		</div>
		<div class="col-md-12 text-right">
			<lyx:page url="${pageContext.request.contextPath }/searchBbs.action" />
		</div>
	</div>

</body>
</html>