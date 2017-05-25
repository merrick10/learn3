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
<title>TOP</title>
<link type="text/css" rel="stylesheet" href="css/global.css">
<style type="text/css">

</style>
<script type="text/javascript">

	window.onload = function(){
		
		
	}
</script>
</head>
<body>
<div id="mainDiv">
	<table border="0" class="toppage" style="margin:auto;" cellpadding="0" cellspacing="0" >
		<tr style="">
			<td style="line-height: 25px;">
				<h1 style="color: pink;" >TOP Page</h1>
			</td>			
		</tr>
		<tr>
			<td ><div style="width:1280px;height:135px;;background-image: url('img/changzhou_overview1_m2.jpg'); background-repeat: no-repeat;background-position: left;"></div></td>
		</tr>

		<tr>
			<td style="line-height: 25px;">				
					<ul  style="" class="toppage" >
						<li style=""><a href="user/edit">用户信息</a></li>
						<li>|</li>
						<li><a href="">活动登记</a></li>
						<li>|</li>
						<li><a href="">内容发布</a></li>
						<li>|</li>
						<li><a href="">文件上传</a></li>
						<li>|</li>
						<li><a href="">文件下载</a></li>
					</ul>
			</td>
		</tr>		
	</table>
</div>
</body>
</html>