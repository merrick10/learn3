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
<link type="text/css" rel="stylesheet" href="css/global.css">
<style type="text/css">

</style>
<script type="text/javascript">

</script>
</head>
<body>
<div id="mainDiv">
<fmt:setLocale value="zh_CN"/>

	<table border="0" class="toppage" style="margin:auto;" cellpadding="0" cellspacing="0" >
		<tr style="">
			<td style="line-height: 25px;text-align: right; padding-right: 5px;">
					
					
				<c:choose>
					<c:when test="${empty sessionScope.user }">
						<h3 style="color: blue;" >
							<fmt:message  key="vistor"/>,<a href="user/signinpage"><fmt:message key="gologin" /></a>
						</h3>	
					</c:when>
					<c:otherwise>
						<h3 style="color: pink;" >
						<fmt:message key="welmsg">
							<fmt:param value="${sessionScope.user.name}"></fmt:param>
						</fmt:message>	
						&nbsp;<a href="user/signout">[<fmt:message key="signout"/>]</a>
						</h3>				
					</c:otherwise>
				</c:choose>
				
								
			</td>			
		</tr>
		<tr>
			<td ><div style="width:1280px;height:135px;;background-image: url('img/changzhou_overview1_m2.jpg'); background-repeat: no-repeat;background-position: left;"></div></td>
		</tr>

		<tr>
			<td style="line-height: 20px;">				
					<ul  style="" class="toppage" >
						<li style="width:auto;"><a href="user/edit">用户信息编辑</a></li>						
						<li>|</li>
						<li style="width:auto"><a href="info/edit">内容发布编辑</a></li>
						<li>|</li>
						<li style="width:auto"><a href="pmail/setting">E-mail设定</a></li>
						<li>|</li>
						<li style="width:auto"><a href="fileop/upload">文件上传</a></li>

					</ul>
			</td>						
		</tr>
		<tr>
			<td style="line-height: 20px;">				
					<ul  style="" class="toppage" >
						<li  style="width:auto"><a href="user/listall">用户信息列表</a></li>
						<li>|</li>
						<li style="width:auto"><a href="info/list">内容发布列表</a></li>
						<li>|</li>						
						<li style="width:auto"><a href="fileop/download">文件下载</a></li>
						<li>|</li>
						<li style="width:auto"><a href="pmail/list">个人邮箱</a></li>
						<li>|</li>
						<li style="width:auto"><a href="forum/catalog">论坛</a></li>
					</ul>
			</td>						
		</tr>
		
	</table>
</div>
</body>
</html>