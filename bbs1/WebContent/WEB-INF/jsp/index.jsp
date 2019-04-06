<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
     <%@ taglib uri="http://java.sun.com/jsp/jstl/fmt"  prefix="fmt"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
  <title>god论坛</title>
	<script src="${pageContext.request.contextPath }/statics/js/jquery-2.1.1.min.js"></script>
    <script src="${pageContext.request.contextPath }/statics/js/bootstrap.min.js"></script>
    <script src="${pageContext.request.contextPath }/statics/js/jquery.easyui.min.js"></script>
    <!-- Bootstrap core CSS -->
    <link href="${pageContext.request.contextPath }/statics/css/bootstrap.min.css" rel="stylesheet"> 

    <!-- Custom styles for this template -->
    <link href="${pageContext.request.contextPath }/statics/css/navbar-fixed-top.css" rel="stylesheet">  
    <link href="${pageContext.request.contextPath }/statics/css/customize.css" rel="stylesheet">
    <link href="${pageContext.request.contextPath }/statics/css/easyui.css" rel="stylesheet">
    <link href="${pageContext.request.contextPath }/statics/css/icon.css" rel="stylesheet">
    
    <script type="text/javascript">
    $(function(){
    	 $("#btn_search").click(function(){
    		 $("#window").show()
    	        $("#window").window({ 
    	        	title:"搜索",
    	        })
    	    })
    	    
    })
    //需要至少填写一项
   function submitForm(){
    	var flag = false;
    	$(":text").each(function(){
    		if($(this).val()!=''&& $(this).val().replace(/^ +| +$/g,'').length !=0){
    			flag = true;
    		}
    		
    	})
    		if(flag){
    			$("#ff").submit()
    		}
    	 } 
    
    	function clearForm(){
    		$(":text").each(function(){
        		$(this).val("")
        	})
    	}
    </script>
</head>
<body>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
 <c:if test="${ cid gt 0}">
<a id="btn" href="${pageContext.request.contextPath }/toCreateBbs.action?cid=${cid}" class="easyui-linkbutton" data-options="iconCls:'icon-add'" style="position:absolute;left:200px;top:80px;">发帖</a>
</c:if>
    <jsp:include page="header.jsp"/>
     <a id="btn_search" href="#" class="easyui-linkbutton" data-options="iconCls:'icon-search'" style="position:absolute;right:100px;top:80px;">搜索</a>
  	<div class="container  center-container-hx ">
      <div class="contents">
         <c:forEach items="${bbsList }" var="bbs">
           <font size="5"><a href="${pageContext.request.contextPath }/bbs_detail.action?id=${bbs.id}" target="_blank">${ bbs.title}</a></font> 
             <br/>
             <fmt:formatDate value="${bbs.createdat}" pattern="yyyy-MM-dd HH:mm:ss"/>
             <br/>
            author：<a href="${pageContext.request.contextPath }/center.action?id=${bbs.user.id}">${bbs.user.username}</a>
            <br/><br/>
            ${bbs.summary}
            <hr>
          </c:forEach>
      </div>
    </div> 
   <div id="window" style=" display: none;">
            <div style="margin:20px 0;">
            </div>
            <div class="easyui-panel" style="width:400px">
                <div style="padding:10px 60px 20px 60px">
                    <form id="ff"  action="${pageContext.request.contextPath }/searchBbs.action" method="get" >
                        <table cellpadding="5">
                            <tr>
                                <td>
                                    Author:
                                </td>
                                <td>
                                    <input class="easyui-textbox" type="text" name="user.username" id="username" data-options="required:true">
                                    </input>
                                </td>
                            </tr>
                            
                            <tr>
                                <td>
                                    Title:
                                </td>
                                <td>
                                    <input class="easyui-textbox" type="text" id="title" name="bbs.title" data-options="required:true">
                                    </input>
                                </td>
                            </tr>
                            <tr>
                                <td>
                                    Category:
                                
                                <td>
                                    <input class="easyui-textbox" type="text" id="category" name="category.name" data-options="required:true">
                                    </input>
                                </td>
                            </tr>
                        </table>
                    </form>
                    <div style="text-align:center;padding:5px">
                        <a id="submit" class="easyui-linkbutton" onclick="submitForm()">Submit</a>
                        <a href="javascript:void(0)" class="easyui-linkbutton" onclick="clearForm()">Clear</a>
                    </div>
                </div>
            </div>
        </div>
</body>
</html>