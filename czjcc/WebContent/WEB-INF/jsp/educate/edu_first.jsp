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
<title>EDUCATE FIRST PAGE</title>
<link type="text/css" rel="stylesheet" href="css/bootstrap3/bootstrap.css"> 
<style type="text/css">

</style>
</head>
<body style="">
<div class="container-fluid">


<h1 draggable="true">EDUCATE FIRST</h1>


<hr/>
A
<hr/>
B
<hr/>
<span style="color:blue;font-size:22px;">总注册人数：<c:out value="${usercount}" /></span>

</div>


<script type="text/javascript" src="jslib/jquery-1.10.2.js"></script>
<script type="text/javascript" src="jslib/bootstrap3/bootstrap.js"></script>
<script type="text/javascript">
</script>
</body>
</html>