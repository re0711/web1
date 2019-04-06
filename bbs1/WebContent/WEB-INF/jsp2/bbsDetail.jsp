<%@ page language="java" import="java.util.*" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
     <%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/fmt"  prefix="fmt"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>${bbs.title}</title>

<link rel="stylesheet"
	href="${pageContext.request.contextPath}/statics2/css/zh2.css">
	 <script src="${pageContext.request.contextPath }/statics/js/jquery-2.1.1.min.js"></script>
	 <script src="${pageContext.request.contextPath }/statics/js/jquery.easyui.min.js"></script>
 <link href="${pageContext.request.contextPath }/statics/css/easyui.css" rel="stylesheet">
    <link href="${pageContext.request.contextPath }/statics/css/icon.css" rel="stylesheet">
<%
 Locale locale = request.getLocale();
 ResourceBundle rb = ResourceBundle.getBundle("res", locale);
 %> 
 <script type="text/javascript">
    $(function(){
    	$("#submit").click(function(){
    		var content = $("#content").val()
        	if(content==''){
        		alert("<%=rb.getString("null") %>")
        		return false
        	}
    	})
    	
    })
    </script>	
</head>
<body class="">
<c:if test="${not empty sessionScope.loginUser and (bbs.authorid eq sessionScope.loginUser.id or sessionScope.loginUser.id eq bbs.category.administratorid) }">
<a id="btn_search" href="${pageContext.request.contextPath }/deleteBbs.action?bid=${bbs.id}" class="easyui-linkbutton" data-options="iconCls:'icon-cancel'" style="position:absolute;right:100px;top:80px;"><%=rb.getString("delete2") %></a>
    </c:if>
	<div id="react-root">
		<div >
			<div class="Layout av-cardBackground">
				<!-- react-empty: 21 -->
				
				<div></div>
				<div
					class="Layout-main av-paddingBottom av-bodyFont Layout-titleImage--normal">
					<div class="PostIndex-header av-paddingTop av-card">
						<h1 class="PostIndex-title av-paddingSide av-titleFont">${bbs.title}</h1>
						 &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
   
						<div class="PostIndex-author">
							<a href="#" ><img
								class="Avatar PostIndex-authorAvatar Avatar--xs" alt=""
								src="upload/${bbs.user.photo }"
								></a><a
								href="${pageContext.request.contextPath }/center.action?id=${bbs.user.id}" target="_blank"
								class="PostIndex-authorName">${bbs.user.username }</a>
							<div class="HoverTitle Badge-wrapper" ></div>
							<span class="Bull"></span>
							<div class="HoverTitle"
								data-hover-title="2015 年 9月 1 日星期二下午 5 点 51 分">
								<time datetime="2015-09-01T09:51:42.000Z"><fmt:formatDate
																value="${bbs.createdat}" pattern="yyyy-MM-dd HH:mm:ss" /></time>
							</div>
							
						</div>
					</div>
					
					<div class="RichText PostIndex-content av-paddingSide av-card">
					 ${bbs.content}	
					</div>
					<!-- <div class="PostIndex-footer">
						<div class="PostIndex-reviewers"></div>
						<div class="PostIndex-vote">
							
						</div>
					</div> -->
					
					<div class="PostComment">
						<div
							class="BlockTitle av-marginLeft av-borderColor PostComment-blockTitle">
							<span class="BlockTitle-title">
								<!-- react-text: 97 --> ${bbs.commentCount} <%=rb.getString("comments") %><!-- /react-text -->
							</span><span class="BlockTitle-line"></span>
						</div>
						<div
							class="CommentEditor PostComment-mainEditor CommentEditor--opened">
							<c:if test="${not empty sessionScope.loginUser}">
							<img class="Avatar CommentEditor-avatar Avatar--xs" alt="s"
								src="upload/${sessionScope.loginUser.photo }">
							</c:if>
							  <c:choose>
		<c:when test="${not empty sessionScope.loginUser }">
        <form action="${pageContext.request.contextPath }/addComment.action" method="POST">
           
            <textarea id="content" cols=80 rows=3 name='content'></textarea>
            <input type="hidden" name="bbsid" value="${bbs.id}" />
            <input type="submit" value="submit comment" id="submit" />
        </form>
        </c:when>
    	<c:otherwise>
        <p>Please <a href='${pageContext.request.contextPath }/toLogin.action'><font color="blue">Login</font></a> to sumbit a comment!</p>
        </c:otherwise>
    </c:choose>  
			</div>
			<c:forEach items="${commentList}" var="comment">
			<div class="PostCommentList">
				<div class="CommentItem">
					<a class="UserAvatar CommentItem-author"
						href="#" target="_blank"><img
						class="Avatar Avatar--xs" alt=""
						src="upload/${comment.photo}"
						></a>
					<div class="CommentItem-headWrapper">
						<div class="CommentItem-head">
							<span class="CommentItem-context"><a
								href="${pageContext.request.contextPath }/center.action?id=${comment.userid}" class=""
								target="_blank">${comment.username}</a></span>
						</div>
					</div>
					<div class="CommentItem-content">${comment.content}</div>
					<div class="CommentItem-foot">
						<span class="CommentItem-like CommentItem-like--empty"
							title="0 人觉得这个很赞">
							<!-- react-text: 235 -->0<!-- /react-text -->
							<!-- react-text: 236 --> 赞<!-- /react-text -->
						</span>
						
						<!-- <button
							class="Button CommentItem-action CommentItem-actionReply Button--plain"
							type="button">
							<i class="icon icon-ic_column_reply"></i>
							回复
						</button>
						<button
							class="Button CommentItem-action CommentItem-actionLike Button--plain"
							type="button">
							<i class="icon icon-ic_comment_like"></i>
							赞
						</button> -->
						 <fmt:formatDate value="${comment.date}" pattern="yyyy-MM-dd HH:mm:ss"/>
						 &nbsp;&nbsp;&nbsp;&nbsp;
						 <c:if test="${not empty sessionScope.loginUser and (sessionScope.loginUser.id eq comment.userid or sessionScope.loginUser.id eq bbs.authorid or bbs.category.administratorid eq sessionScope.loginUser.id)}">
           
           <a href="${pageContext.request.contextPath }/delectComment.action?id=${comment.id}&bid=${bbs.id}"><%=rb.getString("delete3") %></a>
           </c:if>
					</div>
				</div>
			</div>
			</c:forEach>
		</div>
	</div>
	</div>
	</div>
	</div>

</body>
</html>