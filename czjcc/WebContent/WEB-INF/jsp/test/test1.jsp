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
<title>test</title>
<link type="text/css" rel="stylesheet" href="css/global.css">
<script type="text/javascript">

	window.onload = function(){
		
		
	}
</script>
</head>
<body>
<h1 style="color: pink;">Runnging well Thanks for Testing</h1>

<br/>
<fmt:formatDate value="${obj_datetime}" type="both"/> 
<br/>
<br/>
<c:out value="${str_datetime}" />

<br/>

<c:if test="${sessionScope.user.name == 'admin' }">
	<h2>name is ${sessionScope.user.name }</h2>
</c:if>
<br/>
<c:choose>
	<c:when test="${sessionScope.user.name == 'admin' }">
		<h2>name is ${sessionScope.user.name }</h2>
	</c:when>
	<c:otherwise>
		<h2>name is not admin, it is ${sessionScope.user.name } </h2>
	</c:otherwise>
</c:choose>

<br/>

<c:out value="${requestScope.str_datetime}"></c:out>

<hr/>

<c:choose>
	<c:when test="${!empty sessionScope.login }">
		<h1>no object in session as: login</h1>
	</c:when>
	<c:otherwise>
		<h2>empty judge</h2>
	</c:otherwise>
</c:choose>
<hr/>

<fmt:setLocale value="zh_CN"/>

<fmt:message key="uname"></fmt:message>
<br/>
<fmt:message key="curtime">	
	<fmt:param value="${obj_datetime}" ></fmt:param>	
</fmt:message>

</body>
</html>