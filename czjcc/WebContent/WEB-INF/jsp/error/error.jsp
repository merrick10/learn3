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
<title>ERROR</title>
<link type="text/css" rel="stylesheet" href="css/global.css">
<script type="text/javascript">

	window.onload = function(){
		
		
	}
</script>
</head>
<body>
<br/>
<h1 style="color: red;font-size: 20px;	">访问错误，请尝试其他路径。错误信息：<span style="color:grey;"><c:out value="${errinfo}"></c:out></span></h1>

<br/>
<hr/>

</body>
</html>