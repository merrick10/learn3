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
<title><c:out value="${gradeinfo}" />文档题库-列表</title>
<link type="text/css" rel="stylesheet" href="css/global.css?v=2017">
<link type="text/css" rel="stylesheet" href="css/bootstrap3/bootstrap.css"> 

</head>
<body>
<fmt:setLocale value="zh_CN"/>
<div id="mainDiv">
<BR/>
<p class="nowloaction"><c:out value="${gradeinfo}" />文档题库 &#187 列表</p>
<br/>
<div style="margin: auto;width: 1200px;" class="panel panel-default" >
<div  class="panel-body">
<form action="user/" method="POST">
<table class="edit" border="0"  style="margin:auto;" cellpadding="0" cellspacing="0" >
	<caption><h2 style="color: menutext;" contextmenu="" draggable="true"><c:out value="${gradeinfo}" />文档题库-列表</h2></caption>
	<thead  style="background-color: #CCCCCC;">	
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
<input type="button" value="上传新文档" onclick="upnew()" class="btn btn-primary  btn-sm "/>
</div>
</div>
<hr/>
<input type="hidden" id="gradeflag" value="${gradelevel}" />
<br/>
</div>
<script type="text/javascript" src="jslib/jquery-1.10.2.js"></script>
<script type="text/javascript">
	function upnew(){
		window.top.location='<%=basePath%>/examquest/newupload/'+ $('#gradeflag').val();
	}

</script>
</body>

</html>

