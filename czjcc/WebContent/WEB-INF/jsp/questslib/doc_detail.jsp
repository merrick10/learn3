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
<title><c:out value="${gradeinfo}" />文档题库-详细</title>
<link type="text/css" rel="stylesheet" href="css/global.css?v=2017">
<link type="text/css" rel="stylesheet" href="css/bootstrap3/bootstrap.css"> 

</head>
<body>
<fmt:setLocale value="zh_CN"/>
<div id="mainDiv">
<BR/>
<p class="nowloaction"><c:out value="${gradeinfo}" />文档题库 &#187 详细  &#187 [<c:out value="${docfilename}" />]</p>
<br/>
<div style="margin: auto;width: 1200px;" class="panel panel-default" >
<div  class="panel-body">
<iframe id="fm1" name="fm1" style="height: auto;min-height: 490px; height:500px;width:1100px"  frameborder=0 framespacing=0  scrolling=auto src=""></iframe>

<br/>

</div>
</div>
<hr/>

<br/>
</div>
<script type="text/javascript" src="jslib/jquery-1.10.2.js"></script>
<script type="text/javascript">
	$(function(){
		var bpath = '<%=basePath%>';
		var fpath = '<c:out value="${docfilepath}" />'; 
		var realpath = bpath + "" + fpath;
		$('#fm1').attr("src",realpath);//仅适用于文本文档及html文档

		
	});

</script>
</body>

</html>

