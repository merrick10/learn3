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
<title>用户-列表</title>
<link type="text/css" rel="stylesheet" href="css/global.css?v=2017">

<script type="text/javascript">

	window.onload = function(){
		
		
	}
</script>
</head>
<body>

<div id="mainDiv">
<BR/>
<p class="nowloaction">用户管理 &#187 列表</p>
<BR/>
<form action="user/" method="POST">
<table class="edit" border="0"  style="margin:auto;" cellpadding="0" cellspacing="0" >
	<caption><h2 style="color: blue;" contextmenu="" draggable="true">用户-列表</h2></caption>
	<thead >	
	<tr>
		<td style="width:15%;font-weight: bold;text-align: center;">NUMBER</td>
		<td style="width: 20%;font-weight: bold;text-align: center;">ID</td>
		<td style="width: 65%;font-weight: bold;text-align: center;">名字</td>
	</tr>
	</thead>
<c:forEach items="${user}" var="u" varStatus="num">
<!-- 	<tr>	 -->
<%-- 		<td style="width:15%;">${num.index+1}</td> --%>
<%-- 		<td style="width:20%;">${u[0]}</td> --%>
<%-- 		<td style="width:65%;">${u[1]}</td> --%>
<!-- 	</tr> -->
	
		<tr>	
		<td style="width:15%;text-align: right;">${num.index+1}</td>
		<td style="width:20%;text-align: center;">${u.id}</td>
		<td style="width:65%;text-align: center;">${u.name}</td>
	</tr>

</c:forEach>	

	
	
	
</table>


</form>

<br/>
<c:out value=""></c:out>
<hr/>

<br/>
</div>
</body>
</html>