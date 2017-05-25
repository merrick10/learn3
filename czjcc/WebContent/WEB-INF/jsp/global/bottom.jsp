<%@ page language="java" import="java.util.*"  contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"  %>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE html >
<html>
<head>
<base href="<%=basePath%>">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<title>FOOTER</title>
<link type="text/css" rel="stylesheet" href="css/global.css">
<style type="text/css">

</style>
<script type="text/javascript">

	window.onload = function(){

	}
</script>
</head>
<body style="width: 100%;height: 100%;">
<div id="mainDiv" >
	<table border="0" class="footer" style="margin:auto;"  cellpadding="0" cellspacing="0">
		<tr style="">
			<td style="line-height: 25px;">
				Copyright © 1999-2017, Merrick, All Rights Reserved
			</td>			
		</tr>

		<tr>
			<td style="line-height: 25px;">				
					<ul  style="" class="ulfooter" >
						<li style="">联系方式</li>
						<li>|</li>
						<li>法律顾问</li>
						<li>|</li>
						<li>版权声明</li>
						<li>|</li>
						<li>合作伙伴</li>
					</ul>
			</td>
		</tr>		
	</table>

</div>


</body>
</html>