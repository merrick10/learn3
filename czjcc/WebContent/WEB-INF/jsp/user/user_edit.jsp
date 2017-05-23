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
<link type="text/css" rel="stylesheet" href="css/global.css?v=2017">

<script type="text/javascript">

	window.onload = function(){
		
		
	}
	
	function save(){
		
		document.getElementsByTagName('form').item(0).submit();
	}
</script>
</head>
<body>
<div id="mainDiv">
<BR/>
<p class="nowloaction">用户管理 &#187 编辑</p>
<BR/>
<form action="user/saveuser" method="POST">
<table class="edit" border="0"  style="margin:auto;" cellpadding="0" cellspacing="0" >
	<caption><h2 style="color: blue;" contextmenu="" draggable="true">用户-编辑</h2></caption>
	<tr>
		<td style="width: 20%;font-weight: bold;text-align: right;">ID</td>
		<td style="width: 80%;text-align: left;"><input type="text"  maxlength="20"  name="id" class="edittxt"/></td>
	</tr>
	<tr>
		<td style="width: 20%;font-weight: bold;text-align: right;">名字</td>
		<td style="text-align: left;"><input type="text" maxlength="50"  name="name" class="edittxt"/></td>
	</tr>
	<tr>
		<td style="width: 20%;font-weight: bold;text-align: right;">Remark</td>
		<td style="text-align: left;"><input type="text" maxlength="20" name="intro" class="edittxt"/></td>
	</tr>
	
	<tr>
		
		<td colspan="2" style="text-align: right;padding-right: 10PX;"><input type="button"  class="operatebtn" value="SUBMIT" onclick="save()"/></td>
	</tr>
</table>


</form>

<br/>
<c:out value=""></c:out>
<hr/>


</div>
</body>
</html>