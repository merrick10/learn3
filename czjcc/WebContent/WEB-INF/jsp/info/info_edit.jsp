<%@ page language="java" import="java.util.*"  contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"  %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="sf" uri="http://www.springframework.org/tags/form" %>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE html>
<html>
<head>
<base href="<%=basePath%>">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<title>信息-编辑</title>
<link type="text/css" rel="stylesheet" href="css/global.css?v=2017">
<link type="text/css" rel="stylesheet" href="css/bootstrap3/bootstrap.css">
<link type="text/css" rel="stylesheet" href="css/reditor/themes/default/default.css" />
</head>
<body>
<fmt:setLocale value="zh_CN"/>
<div id="mainDiv">
		<BR/>
		<p class="nowloaction">信息发布 &#187 编辑</p>
		<BR/>
		
<div style="margin: auto;width: 1000px;" class="panel panel-default" >
	<div class="panel-heading">
		    <h2  class="panel-title" style="color:blue;">信息-编辑</h2>
    </div>
	<div  class="panel-body">		
		
<!-- 		<form action="user/saveuser" method="POST"> -->
		<sf:form action="info/submit" method="post" modelAttribute="commoninfo"  >		
		
			<div class="input-group">
				<span class="input-group-addon"><div style="width:50px;">主题</div></span>
				<input type="text"  maxlength="100"  name="title" class="form-control" style="width:800px;"/>
				<br/>
				<sf:errors path="title" cssStyle="color:red;font-size:12px;"   cssClass="input-group-addon"/>
			</div>
			<br/>
			<div class="input-group">
				<span class="input-group-addon"><div style="width:50px;">内容</div></span>
<%-- 				<sf:textarea id="infotxa" path="content" cssClass="form-control" cols="40" rows="12" cssStyle="overflow:auto;width:700px;"/> --%>				
				<textarea  id="infotxa" rows="12" cols="40" name="content" class="form-control" style="overflow:auto;width:800px;height: 500px;"></textarea>
				
				<sf:errors path="content" cssStyle="color:red;font-size:12px;"    cssClass="input-group-addon"/>
			</div>
				

		</sf:form>
	</div>

	<ul class="list-group">
		<li class="list-group-item"><input type="button"  class="btn btn-primary  btn-sm " value="SUBMIT" onclick="save()"/></li>
	</ul>
</div>
<br/>
<hr/>
</div>

<script type="text/javascript" src="jslib/jquery-1.10.2.js"></script>
<script type="text/javascript" src="jslib/myrcedit.js?v=2017"></script>
<script type="text/javascript">
	function save(){
		document.getElementsByTagName('form').item(0).submit();
	}
	
	$(function(){
		initMyEditor1('infotxa','<%=basePath%>/info/uploadpic','css/reditor/themes/','jslib/reditor/plugins/');		
	});
	
</script>


</body>
</html>