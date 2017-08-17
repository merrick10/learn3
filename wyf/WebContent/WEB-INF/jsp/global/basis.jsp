<%@ page language="java" import="java.util.*"  contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"  %>
<%@ taglib uri="http://tiles.apache.org/tags-tiles" prefix="tiles" %>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE html >
<html>
<head>
<base href="<%=basePath%>">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1, user-scalable=no">
<title><tiles:getAsString name="thetitle"></tiles:getAsString></title>  

<link type="text/css" rel="stylesheet" href="css/global.css">

<style type="text/css">
@-ms-viewport       { width: device-width; }
@-o-viewport        { width: device-width; }
@viewport           { width: device-width; }
</style>

</head>
<body style="">
<div id="mainDiv" >
	<table border="0" class="" style="margin:0 auto;" cellpadding="0" cellspacing="0">
		<tr style="">
			<td style="line-height: 185px;">
				<tiles:insertAttribute name="toper"></tiles:insertAttribute>
			</td>			
		</tr>

		<tr>
			<td style="height: auto;min-height: 490px; height:500px;padding-top: 0;padding-left: 0; text-align: left;" valign="top">				
				<tiles:insertAttribute name="body" />
			</td>
		</tr>
		<tr>
			<td>				
				<tiles:insertAttribute name="footer"></tiles:insertAttribute>
			</td>
		</tr>		
	</table>

</div>

</body>
</html>