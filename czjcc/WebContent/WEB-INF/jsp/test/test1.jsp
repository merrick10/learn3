<%@ page language="java" import="java.util.*"  contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"  %>
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

<script type="text/javascript">

	window.onload = function(){
		
		
	}
</script>
</head>
<body>
<h1 style="color: pink;">Runnging well Thanks for Testing</h1>

<br/>
<c:out value="${str_datetime}"></c:out>
<hr/>

</body>
</html>