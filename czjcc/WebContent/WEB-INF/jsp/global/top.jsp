<%@ page language="java" import="java.util.*"  contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"  %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE html>
<html>
<head>
<base href="<%=basePath%>">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<title>TOP</title>
<link type="text/css" rel="stylesheet" href="css/global.css?v=2017">
<link type="text/css" rel="stylesheet" href="css/bootstrap3/bootstrap.css"> 
 
<style type="text/css">

</style>

</head>
<body>
<div id="mainDiv">
<fmt:setLocale value="zh_CN"/>

	<table border="0" class="toppage" style="margin:auto;" cellpadding="0" cellspacing="0" >
<!-- 		<tr style=""> -->
<!-- 			<td style="line-height: 25px;text-align: right; padding-right: 5px;"> -->								
<!-- 			</td>			 -->
<!-- 		</tr> -->
		<tr>
			<td ><div style="width:1280px;height:135px;text-align:right;background-image: url('img/changzhou_overview1_m2.jpg'); background-repeat: no-repeat;background-position: left;">
					<div style="width: 800px;margin-right: 10px;text-align: right;float: right;">
						<c:choose>
							<c:when test="${empty sessionScope.user }">
								<h3 style="color: blue;margin: 0;font-size: 13px;" >
									<fmt:message  key="vistor"/>,<a href="user/signinpage"><fmt:message key="gologin" /></a>
								</h3>	
							</c:when>
							<c:otherwise>
								<h3 style="color: pink;margin: 0;font-size: 13px;" >
								<fmt:message key="welmsg">
									<fmt:param value="${sessionScope.user.name}"></fmt:param>
								</fmt:message>	
								&nbsp;<a href="user/signout">[<fmt:message key="signout"/>]</a>
								</h3>				
							</c:otherwise>
						</c:choose>
					</div>
				</div>
			</td>
		</tr>

		<tr>
			<td style="padding: 0;">	
			
<!-- 				<nav class="navbars navbar-default" role="navigation" style="margin-bottom: 0;border:none;"> -->
<!-- 					<div class="container-fluid" style=""> -->
<!-- 					<div class="navbar-header" style=""> -->
<!-- 						<div class="navbar-header "> -->
<!-- 					        <a class="navbar-brand " href=".">首页</a> -->
<!-- 					    </div>					     -->
<!-- 					    <div style="margin: 0 auto;text-align: center;"> -->


					    	<ul class="nav nav-justified nav-tabs navbar-default" style="">
					    	
					    		<li class=""><a  href=".">首页</a></li>
					    		<li class=""><a href="education/new">教学整理</a></li>					    		
					 
					    		<li><a href="finance/firstpage">财务整理</a></li>					    		
					    		
					    		<li><a href="info/list">信息备忘发布</a></li>	
					    		<li><a href="bbs/block">留言板</a></li>	
					    		<li><a href="fileop/download">文件管理</a></li>	
					    		<li><a href="pmail/list">邮箱</a></li>	
					    		<li><a href="user/listall">用户管理</a></li>	
					    		
					    	</ul>	
					    		
<!-- 			    		   		<li class="dropdown"> -->
<!-- 					    			<a href="#" class="dropdown-toggle" data-toggle="dropdown">发布管理<b class="caret"></b></a> -->
<!-- 					                <ul class="dropdown-menu"> -->
<!-- 					                    <li><a href="info/edit">发布编辑</a></li>					                     -->
<!-- 					                    <li class="divider"></li> -->
<!-- 					                    <li><a href="info/list">发布列表</a></li>	 -->
<!-- 					                    <li class="divider"></li> -->
<!-- 					                    <li><a href="bbs/block">论坛</a></li>				            				                     -->
<!-- 					                </ul>										                 -->
<!-- 					    		</li>	 -->
					    					    		
<!-- 					    		<li class="dropdown"> -->
<!-- 					    			<a href="#" class="dropdown-toggle" data-toggle="dropdown">文件管理<b class="caret"></b></a> -->
<!-- 					                <ul class="dropdown-menu"> -->
<!-- 					                    <li><a href="fileop/upload"">文件上传</a></li>					                     -->
<!-- 					                    <li class="divider"></li> -->
<!-- 					                    <li><a href="fileop/download">文件下载</a></li>					            				                     -->
<!-- 					                </ul>										                 -->
<!-- 					    		</li> -->
					    		
<!-- 					    		<li class="dropdown"> -->
<!-- 					    			<a href="#" class="dropdown-toggle" data-toggle="dropdown">邮箱<b class="caret"></b></a> -->
<!-- 					                <ul class="dropdown-menu"> -->
<!-- 					                    <li><a href="pmail/list">个人邮箱</a></li>					                     -->
<!-- 					                    <li class="divider"></li> -->
<!-- 					                    <li><a href="pmail/editmail">发邮件</a></li>	 -->
<!-- 					                    <li class="divider"></li> -->
<!-- 					                    <li><a href="pmail/mailsetting">邮箱设定</a></li>				            				                     -->
<!-- 					                </ul>										                 -->
<!-- 					    		</li> -->
					    		
<!-- 					    		<li class="dropdown"> -->
<!-- 					    			<a href="#" class="dropdown-toggle" data-toggle="dropdown">用户管理<b class="caret"></b></a> -->
<!-- 					                <ul class="dropdown-menu"> -->
<!-- 					                    <li><a href="user/edit">用户编辑</a></li>					                     -->
<!-- 					                    <li class="divider"></li> -->
<!-- 					                    <li><a href="user/listall">用户列表</a></li>					                  				            				                     -->
<!-- 					                </ul>										                 -->
<!-- 					    		</li>					    		 -->
<!-- 					    	</ul>				    	 -->
					    	
<!-- 					    	tiles整合多页面时，top页的bootstrap下拉菜单访问body页，并且body页中也有bootstrap特效时，之后会导致top页的下拉菜单不弹出的问题，所以在公共页不采用bootstrap下拉菜单 -->
					    	
					    	
					    	
					    	
<!-- 					    </div>					 -->
<!-- 					</div> -->
<!-- 					</div> -->
<!-- 				</nav> -->
			
						
<!-- 					<ul  style="" class="toppage" > -->
<!-- 						<li style="width:auto;"><a href=".">首页</a></li>						 -->
<!-- 						<li>|</li>					 -->
<!-- 						<li style="width:auto;"><a href="user/edit">用户编辑</a></li>						 -->
<!-- 						<li>|</li> -->
<!-- 						<li style="width:auto"><a href="info/edit">发布编辑</a></li> -->
<!-- 						<li>|</li> -->
<!-- 						<li style="width:auto"><a href="pmail/setting">E-mail设定</a></li> -->
<!-- 						<li>|</li> -->
<!-- 						<li style="width:auto"><a href="fileop/upload">文件上传</a></li> -->
<!-- 						<li>|</li> -->
<!-- 						<li  style="width:auto"><a href="user/listall">用户列表</a></li> -->
<!-- 						<li>|</li> -->
<!-- 						<li style="width:auto"><a href="info/list">发布列表</a></li> -->
<!-- 						<li>|</li>						 -->
<!-- 						<li style="width:auto"><a href="fileop/download">文件下载</a></li> -->
<!-- 						<li>|</li> -->
<!-- 						<li style="width:auto"><a href="pmail/list">个人邮箱</a></li> -->
<!-- 						<li>|</li> -->
<!-- 						<li style="width:auto"><a href="forum/catalog">论坛</a></li> -->
<!-- 						<li>|</li> -->
<!-- 						<li style="width:auto"><a href="education/new">教学整理</a></li> -->
<!-- 						<li>|</li> -->
<!-- 						<li style="width:auto"><a href="">财务整理</a></li> -->
<!-- 					</ul> -->
			</td>						
		</tr>

		
	</table>
</div>

<script type="text/javascript" src="jslib/jquery-1.10.2.js"></script>

</body>
</html>