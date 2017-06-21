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
<title>用户-列表</title>
<link type="text/css" rel="stylesheet" href="css/global.css?v=2017">
<link type="text/css" rel="stylesheet" href="css/bootstrap3/bootstrap.css">

</head>
<body>
<fmt:setLocale value="zh_CN"/>
<div id="mainDiv">
<BR/>
<p class="nowloaction">用户管理 &#187 列表</p>
<br/>



<div style="margin: auto;width: 1200px;" class="panel panel-default">
<div class="panel-body">
	<div class="col-lg-6" style="">
	
		<div class="input-group">
	     	 	
			<span class="input-group-addon" style=" ">ID</span>
	     	<input type="text" class="form-control"  placeholder="此处输入ID"  />     		
			<span class="input-group-addon" style=" ">名字</span>
			<input type="text" class="form-control"  placeholder="此处输入名字"  />
			<span class="input-group-btn">						
				<input type="button" class=" btn btn-primary"  value="查询"  />						
			</span>   
			<span class="input-group-btn">						
				<input type="button" class=" btn btn-primary btn-warning"  value="创建用户" onclick="createuser()"  />						
			</span>  
	    </div>
	</div>
<br/>
<hr/>
<form action="user/" method="POST">
<table class="edit  table-striped " border="0"  style="margin-left: 20px;" cellpadding="0" cellspacing="0" >
<%-- 	<caption>用户-列表</caption> --%>
	<thead  style="background-color: #CCCCCC;">	
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

<input type="hidden" id="hd1" value="aaa" />	
	
</table>
</form>
</div>
</div>

<br/>
<c:out value=""></c:out>
<hr/>

<br/>
</div>
<script type="text/javascript" src="jslib/jquery-1.10.2.js"></script>
<script type="text/javascript">
	function createuser(){
		window.top.location='edit';
	}

</script>
</body>

</html>

