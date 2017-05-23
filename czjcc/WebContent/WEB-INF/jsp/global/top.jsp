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
<script type="text/javascript">

	window.onload = function(){
		
		
	}
</script>
</head>
<body>
<div id="mainDiv">
	<table border="0" class="toppage" style="margin:auto;" >
		<tr style="">
			<td style="">
				<h1 style="color: pink;" >TOP Page</h1>
			</td>			
		</tr>
		<tr>
			<td>&nbsp;</td>
		</tr>
		<tr>
			<td style=" 	">				
					<ul  style="" class="toppage" >
						<li style=""><a href="">用户信息</a></li>
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