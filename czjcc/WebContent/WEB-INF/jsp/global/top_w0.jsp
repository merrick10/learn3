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
<style type="text/css">

</style>
<script type="text/javascript">

</script>
</head>
<body style="">
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
			<td >
				<div style="width:1280px;height:135px;;background-image: url('img/chemistry_m1.png'); background-color:#EEEEEE;background-repeat: no-repeat;background-position:19.1%;">
					<div style="color:#AA11EE;width: 800px;;height:130px;text-align:left;margin-top: 0;margin-left:400px;">
						<h1 style="line-height: 120px;">Chemistry Education and Research</h1></div>
				</div>
			</td>
		</tr>

		<tr>
			<td style="line-height: 20px;">				
					<ul  style="" class="toppage" >
						<li style="width:auto;"><a href=".">首页</a></li>						
						<li>|</li>					
						<li style="width:auto;"><a href="">初中散题库</a></li>						
						<li>|</li>
						<li style="width:auto"><a href="">初中文档题库</a></li>	
						<li>|</li>
						<li style="width:auto"><a href="">初中教学记事</a></li>	
						<li>|</li>
						<li style="width:auto"><a href="">高中散题库</a></li>
						<li>|</li>
						<li style="width:auto"><a href="">高中文档题库</a></li>
						<li>|</li>
						<li style="width:auto"><a href="">高中教学记事</a></li>
					</ul>
			</td>						
		</tr>

		
	</table>
</div>
</body>
</html>