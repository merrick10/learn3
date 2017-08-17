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
<title>散题库-列表</title>
<link type="text/css" rel="stylesheet" href="css/global.css?v=2017">
<link type="text/css" rel="stylesheet" href="css/bootstrap3/bootstrap.css"> 

</head>
<body>
<fmt:setLocale value="zh_CN"/>
<div id="mainDiv">
<BR/>
<p class="nowloaction"><c:out value="${gradeinfo}" />散题库 &#187 列表</p>

<br/>
<table style="margin:auto;width: 1000px;" cellpadding="0" cellspacing="0" >
	<tr>
		<td style="width:50%"></td>
		<td style="width:50%"><input type="button" class="btn btn-primary btn-info "  value="查询"   /></td>
	</tr>
</table>

<br/>

<form action="" method="POST">
<table class="edit" border="0"  style="margin:auto;width: 1200px;" cellpadding="0" cellspacing="0" >
	<caption><h3 style="color:menutext;margin-top: 0;  " contextmenu="" draggable="true"><c:out value="${gradeinfo}" />散题库-列表</h3></caption>
	<thead  style="background-color: #CCCCCC;">	

	<tr>
		<td style="width: 10%;font-weight: bold;text-align: center;">NUMBER</td>
		<td style="width: 10%;font-weight: bold;text-align: center;">入库日期</td>
		<td style="width: 10%;font-weight: bold;text-align: center;">题型</td>
		<td style="width: 10%;font-weight: bold;text-align: center;">难度</td>
		<td style="width: 10%;font-weight: bold;text-align: center;">适用阶段</td>
		<td style="width: 10%;font-weight: bold;text-align: center;">作者</td>
		<td style="width: 10%;font-weight: bold;text-align: center;">编写日期</td>
		<td style="width: 10%;font-weight: bold;text-align: center;">适用对象</td>
		<td style="width: 10%;font-weight: bold;text-align: center;">有效性</td>
		<td style="width: 10%;font-weight: bold;text-align: center;">备注</td>
	</tr>
	</thead>

	<tr>
		<td style="" colspan="10">To be continued...</td>
	</tr>	


	
</table>


</form>

<br/>
<c:out value=""></c:out>
<hr/>

<br/>
</div>
<script type="text/javascript" src="jslib/jquery-1.10.2.js"></script>

</body>

</html>

