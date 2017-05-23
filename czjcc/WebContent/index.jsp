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
<title>首页</title>
<link type="text/css" rel="stylesheet" href="css/global.css">
<script type="text/javascript">

	window.onload = function(){
		
		
		//alert('welcome!');
		var tt2 = document.createElement('h2');
		tt2.innerHTML = new Date();
		document.body.appendChild(tt2);
		
	}
</script>
</head>
<body>
<h1 draggable="true">Hello</h1>

<a href="img/cat1.png">test_image</a>
<hr/>

<a href="test1/f1">F1</a><hr/>
<a href="test1/footer">Footer</a><hr/>
<a href="test1/top">TOP</a>
</body>
</html>