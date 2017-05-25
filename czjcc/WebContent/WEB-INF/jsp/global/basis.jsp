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
<title><tiles:getAsString name="thetitle"></tiles:getAsString></title>   
<link type="text/css" rel="stylesheet" href="css/global.css">
<style type="text/css">

</style>
<script type="text/javascript">

</script>
</head>
<body style="width: 100%;height: 100%;">
<div id="mainDiv" >
	<table border="0" class="" style="margin:auto;" cellpadding="0" cellspacing="0">
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