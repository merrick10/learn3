<%@ page language="java" import="java.util.*"  contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"  %>
<%@ taglib prefix="tiles" uri="http://tiles.apache.org/tags-tiles" %>
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
<title>用户-编辑</title>
<link type="text/css" rel="stylesheet" href="css/global.css?v=2017">
<link type="text/css" rel="stylesheet" href="css/bootstrap3/bootstrap.css"> 

</head>
<body>
<%-- <tiles:insertDefinition name="base"> --%>
<%-- 	<tiles:putAttribute name="body"> --%>
<!-- 	此种情况需注意body的样式和页面的title -->
	
<%-- 	</tiles:putAttribute> --%>
<%-- </tiles:insertDefinition> --%>
		<div id="mainDiv">
		<BR/>
		<p class="nowloaction">用户管理 &#187 编辑</p>
		<BR/>
<!-- 		<form action="user/saveuser" method="POST"> -->
		
		<sf:form  action="user/saveuser" method="post" modelAttribute="userinfo">
		
		<div style="margin: auto;width: 800px;" class="panel panel-default">
			<div class="panel-heading">
		      	<h2  class="panel-title" style="color:blue;">用户-编辑</h2>
		    </div>
		    <div class="panel-body">		    
				<div class="input-group">				
					<span class="input-group-addon" >
						<div style="width:50px;">ID</div>
					</span>
					<input type="text" class="form-control" placeholder="请输入ID"  maxlength="20"  name="id"  />
					<sf:errors path="id"  cssStyle="color:red;font-size:12px;background-color:white;" cssClass="input-group-addon"/>
				</div>
				<br/>
				<div class="input-group">
					<span class="input-group-addon"><div style="width:50px;">名字</div></span>
					<input type="text" class="form-control" placeholder="请输入姓名"  maxlength="50"  name="name" />
					<sf:errors path="name"  cssStyle="color:red;font-size:12px;background-color:white;"  cssClass="input-group-addon"/>
				</div>
				<br/>
				<div class="input-group">
					<span class="input-group-addon"><div style="width:50px;">Remark</div></span>
					<input type="text" class="form-control" placeholder=""  maxlength="20" name="intro" />
				</div>
			</div>
			<ul class="list-group">
		        <li class="list-group-item"><input type="button"  class="btn btn-primary  btn-sm " value="SUBMIT" onclick="save()"/></li>
		    </ul>
		</div>
		
		
<!-- 			<table class="edit" border="0"  style="margin:auto;" cellpadding="0" cellspacing="0" > -->
<%-- 				<caption><h2 style="color: blue;" contextmenu="" draggable="true">用户-编辑</h2></caption> --%>
<!-- 				<tr> -->
<!-- 					<td style="width: 20%;font-weight: bold;text-align: right;">ID</td> -->
<!-- 					<td style="width: 80%;text-align: left;"><input type="text"  maxlength="20"  name="id" class="edittxt"/></td> -->
<!-- 				</tr> -->
<!-- 				<tr> -->
<!-- 					<td style="width: 20%;font-weight: bold;text-align: right;">名字</td> -->
<!-- 					<td style="text-align: left;"><input type="text" maxlength="50"  name="name" class="edittxt"/></td> -->
<!-- 				</tr> -->
<!-- 				<tr> -->
<!-- 					<td style="width: 20%;font-weight: bold;text-align: right;">Remark</td> -->
<!-- 					<td style="text-align: left;"><input type="text" maxlength="20" name="intro" class="edittxt"/></td> -->
<!-- 				</tr> -->
				
<!-- 				<tr> -->
					
<!-- 					<td colspan="2" style="text-align: right;padding-right: 10PX;"><input type="button"  class="operatebtn" value="SUBMIT" onclick="save()"/></td> -->
<!-- 				</tr> -->
<!-- 			</table> -->			
<!-- 		</form> -->
		
		</sf:form>
		<br/>
		<hr/>
		</div>

<script type="text/javascript" src="jslib/jquery-1.10.2.js"></script>
<script type="text/javascript">
	window.onload = function(){
		
	//	alert('onload'); //此种jsp运行时tiles改变页面布局情况下未执行，why？
	}
	
	window.addEventListener("load", fxxx, false);
	function fxxx(){
	//	alert('onload');//可以执行
	}
	//window.attachEvent//ie9以下	
	
	$(function(){
//		alert('$$$');//相当于$(document).ready()
	});
	
	$(document).ready(function(){
//		alert('ready');
	});

	function save(){
		document.getElementsByTagName('form').item(0).submit();
	}
</script>


</body>
</html>