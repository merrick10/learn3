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
	<tr>
		<td style="width: 20%;font-weight: bold;text-align: center;">ID</td>
		<td style="width: 80%;font-weight: bold;text-align: center;">名字</td>
	</tr>

</table>


</form>

<br/>
<c:out value=""></c:out>
<hr/>


</div>
</body>
</html>