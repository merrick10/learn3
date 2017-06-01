<%@ page language="java" import="java.util.*"  contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"  %>
<%@ taglib uri="http://tiles.apache.org/tags-tiles" prefix="tiles" %>
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
<title>用户-登录</title>
<link type="text/css" rel="stylesheet" href="css/global.css?v=2017">


</head>
<body>
<fmt:setLocale value="zh_CN"/>
		<div id="mainDiv">
		<BR/>
		<p class="nowloaction">用户登录</p>
		<BR/>
		<form action="user/signinverify" method="POST">
			<table class="edit" border="0"  style="margin:auto;" cellpadding="0" cellspacing="0" >
				<caption><h2 style="color: blue;" contextmenu="" draggable="true">用户-登录</h2></caption>
				<tr>
					<td style="width: 20%;font-weight: bold;text-align: right;" valign="bottom"><fmt:message key="uname"/></td>
					<td style="width: 80%;text-align: left;" valign="bottom"><input type="text"  maxlength="20"  name="uid" class="edittxt"/></td>
				</tr>
				<tr>
					<td style="width: 20%;font-weight: bold;text-align: right;" valign="bottom"><fmt:message key="psw"/></td>
					<td style="text-align: left;" valign="bottom"><input type="password" maxlength="50"  name="upsw" class="edittxt"/></td>
				</tr>
				<tr>
					<td style="width: 20%;font-weight: bold;text-align: right;" valign="bottom"><fmt:message key="randomcode"/></td>
					<td style="text-align: left;">						
						<input type="text" maxlength="20" name="rancode" class="edittxt" />						
					</td>
				</tr>
				<tr>
					<td>&nbsp;</td>
					<td  style="text-align: left;"><img alt="NONE" src="user/rcode" style="height: 30px;width: 100px;" onclick="reloadpic(this)"></td>
				</tr>
				
				<tr>
					
					<td colspan="2" style="text-align: right;padding-right: 10PX;"><input type="button"  class="operatebtn" value='<fmt:message key="signin" />' onclick="save()"/></td>
				</tr>
			</table>
		</form>
		<br/>
		<hr/>
		</div>

<script type="text/javascript" src="jslib/jquery-1.10.2.js"></script>
<script type="text/javascript">


	function save(){
		document.getElementsByTagName('form').item(0).submit();
	}
	function reloadpic(obj){
		var stimestr = new Date().getTime();
		obj.src='user/rcode?p='+stimestr;//
	}

	


</script>


</body>
</html>