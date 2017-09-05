<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>god论坛后台管理系统</title>
<script
	src="${pageContext.request.contextPath }/statics/js/jquery-2.1.1.min.js"></script>
<script
	src="${pageContext.request.contextPath }/statics/js/jquery.easyui.min.js"></script>
	<script
	src="${pageContext.request.contextPath }/statics2/js/common.js"></script>
	
<link href="${pageContext.request.contextPath }/statics/css/easyui.css"
	rel="stylesheet">
<link href="${pageContext.request.contextPath }/statics/css/icon.css"
	rel="stylesheet">
<style type="text/css">
	.content {
		padding: 10px 10px 10px 10px;
	}
	.northTitle {
	font-family:'微软雅黑';
	font-size:24px;
	font-weight:bold;
	height:60px;
	line-height:40px;
}
.loginInfo {
	border:0px solid red;
	display:block;
	position:absolute;
	bottom:5px;
	right:10px;
}
</style>
</head>
<body class="easyui-layout">
    <!-- 头部标题 -->
	<div data-options="region:'north',border:false" style="height:60px; padding:5px; background:#F3F3F3"> 
		<span class="northTitle">god论坛后台管理系统</span>
	    <span class="loginInfo">登录用户：admin&nbsp;&nbsp;姓名：管理员&nbsp;&nbsp;角色：系统管理员</span>
	</div>
    <div data-options="region:'west',title:'菜单',split:true" style="width:180px;">
    	<ul id="menu" class="easyui-tree" style="margin-top: 10px;margin-left: 5px;">
         	<li>
         		<span>论坛管理</span>
         		<ul>
	         		<li data-options="attributes:{'url':'category-list'}">板块管理</li>
	         		<li data-options="attributes:{'url':'bbs-list.action'}">帖子管理</li>
	         	</ul>
         	</li>
         	<li>
         		<span>网站内容管理</span>
         		<ul>
	         		<li data-options="attributes:{'url':'content-category'}">内容分类管理</li>
	         		<li data-options="attributes:{'url':'content'}">内容管理</li>
	         	</ul>
         	</li>
         	
         </ul>
    </div>
    <div data-options="region:'center',title:''">
    	<div id="tabs" class="easyui-tabs">
		    <div title="首页" style="padding:20px;">
		        	
		    </div>
		</div>
    </div>
    <!-- 页脚信息 -->
	<div data-options="region:'south',border:false" style="height:20px; background:#F3F3F3; padding:2px; vertical-align:middle;">
		<span id="sysVersion">系统版本：V1.0</span>
	    <span id="nowTime"></span>
	</div>
<script type="text/javascript">
$(function(){
	$('#menu').tree({
		onClick: function(node){
			if($('#menu').tree("isLeaf",node.target)){
				var tabs = $("#tabs");
				var tab = tabs.tabs("getTab",node.text);
				if(tab){
					tabs.tabs("select",node.text);
				}else{
					tabs.tabs('add',{
					    title:node.text,
					    href: node.attributes.url,
					    closable:true,
					    bodyCls:"content"
					});
				}
			}
		}
	});
});
setInterval("document.getElementById('nowTime').innerHTML=new Date().toLocaleString()+' 星期'+'日一二三四五六'.charAt(new Date().getDay());",1000);
</script>
</body>
</html>