<%@ page language="java" import="java.util.*"  contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"  %>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";

String redirectionpath = basePath+ request.getAttribute("turnpath");
//4秒后跳转，以meta标签实现
%>

<!DOCTYPE html>
<html>
<head>
<base href="<%=basePath%>">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">

<meta http-equiv="refresh" content="10; url=<%=redirectionpath%>">
<title>INFO</title>
<link type="text/css" rel="stylesheet" href="css/global.css">
<link type="text/css" rel="stylesheet" href="css/bootstrap3/bootstrap.css"> 
<script type="text/javascript">
	var n = 10;
	setInterval(function(){//倒计时，提示消息
		n--;
		document.getElementById('sec').innerHTML= '<h2>Redirect in <span style="color: red;">'+ n +'</span> second(s)...</h2>';
	}, 1000);
	
</script>
</head>
<body>
<br/>
<h1 style="color: blue;font-size: 20px;	"><c:out value="${info}"/></h1>
<br/>

<p id="sec"></p>

<br/>
<hr/>

</body>
</html>