<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
    <!-- Fixed navbar -->
    <nav class="navbar navbar-default navbar-fixed-top" role="navigation">
      <div class="container ">
        <div class="navbar-header">
          <button type="button" class="navbar-toggle collapsed" data-toggle="collapse" data-target="#navbar" aria-expanded="false" aria-controls="navbar">
            <span class="sr-only">Toggle navigation</span>
            <span class="icon-bar"></span>
            <span class="icon-bar"></span>
            <span class="icon-bar"></span>
          </button>
          <a class="navbar-brand" href="#">god论坛</a>
        </div>
        <div id="navbar" class="navbar-collapse collapse">
          <ul class="nav navbar-nav">
            <li class=""><a href="${pageContext.request.contextPath }/index.action">全部</a></li>
             <c:forEach items="${ sessionScope.categoryList}" var="category">             
               <c:choose>
               <c:when test="${cid eq category.id}"> <!-- cid为switchCategory方法传值 -->
               <li class="active">
               <a href="${pageContext.request.contextPath }/switchCategory.action?cid=${category.id }">${category.name }</a>
                     </li>
               </c:when>
               <c:otherwise>
               		
               <li class="">
              <a href="${pageContext.request.contextPath }/switchCategory.action?cid=${category.id }">${category.name }</a>
                </li>
               </c:otherwise>
               </c:choose>

                </c:forEach>  
          </ul>

          <ul class="nav navbar-nav navbar-right">
            <li class="dropdown">
              <a href="#" class="dropdown-toggle  pull-right" data-toggle="dropdown">
               <c:choose>
		<c:when test="${empty sessionScope.loginUser }">
			  登录或注册
              <span class="caret "></span></a>
              <ul class="dropdown-menu" role="menu">
                <li><a href="${pageContext.request.contextPath }/toLogin.action">登录</a></li>

              </ul>
		</c:when>
		<c:otherwise>
			您好：${sessionScope.loginUser.username }&nbsp;&nbsp;|&nbsp;&nbsp;
			<span class="caret "></span></a>
              <ul class="dropdown-menu" role="menu">
                <li><a href="${pageContext.request.contextPath }/logout.action">退出</a></li>
                <li><a href="${pageContext.request.contextPath }/center.action?id=${sessionScope.loginUser.id}">个人中心</a></li>
                <li><a href="${pageContext.request.contextPath }/queryMesssage.action?uid=${sessionScope.loginUser.id}">消息</a></li>

              </ul>
		</c:otherwise>
	</c:choose>
              
               
            </li>
            
          </ul>

        </div><!--/.nav-collapse -->
      </div>
    </nav>

     
     