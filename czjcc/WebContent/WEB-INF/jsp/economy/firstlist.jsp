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
<title>财务管理</title>
<link type="text/css" rel="stylesheet" href="css/global.css?v=2017">


</head>
<body>
<fmt:setLocale value="zh_CN"/>
<div id="mainDiv">
<BR/>
<p class="nowloaction">财务管理 &#187 消费列表</p>

<form action="" method="POST">
<table class="edit" border="0"  style="margin:auto;" cellpadding="0" cellspacing="0" >
	<caption><h2 style="color: blue;" contextmenu="" draggable="true">财务管理-消费列表</h2></caption>
	<thead  style="background-color: #CCCCCC;">	
	<tr>
		<td style="width: 15%;font-weight: bold;text-align: center;">NUMBER</td>
		<td style="width: 20%;font-weight: bold;text-align: center;">日期</td>
		<td style="width: 30%;font-weight: bold;text-align: center;">事项</td>
		<td style="width: 35%;font-weight: bold;text-align: center;">金额</td>
	</tr>
	</thead>

	<tr>
		<td style="" colspan="4">To be continued...</td>
	</tr>

	
</table>


</form>

<br/>

<hr/>

<br/>
</div>
<script type="text/javascript" src="jslib/jquery-1.10.2.js"></script>

</body>

</html>

