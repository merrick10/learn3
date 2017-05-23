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
<title>用户-编辑</title>
<link type="text/css" rel="stylesheet" href="css/global.css">

<script type="text/javascript">

	window.onload = function(){
		
		
	}
</script>
</head>
<body>
<h1 style="color: blue;" contextmenu="" draggable="true">用户-编辑</h1>

<br/>
<c:out value=""></c:out>
<hr/>

</body>
</html>