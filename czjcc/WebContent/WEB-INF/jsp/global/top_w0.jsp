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
<title>TOP2</title>
<link type="text/css" rel="stylesheet" href="css/global.css?v=2017">

<style type="text/css">

</style>

</head>
<body style="">
<div id="mainDiv">
<fmt:setLocale value="zh_CN"/>

	<table border="0" class="toppage" style="margin:auto;" cellpadding="0" cellspacing="0" >
<!-- 		<tr style=""> -->
<!-- 			<td style="line-height: 25px;text-align: right; padding-right: 5px;">								 -->
<!-- 			</td>			 -->
<!-- 		</tr> -->
		<tr>
			<td >
				<div style="width:1280px;height:135px;display:table-cell;text-align:right; vertical-align:text-top  ; line-height:25px;  ;padding:0;vertical-align:top;background-image: url('img/chemistry_m1.png'); background-color:#EEEEEE;background-repeat: no-repeat;background-position:19.1%;">

													
							
							<c:choose>
								<c:when test="${empty sessionScope.user }">
									<span style="color: blue;font-size:13px;font-weight:bold;margin-right:10px;" >
										<fmt:message  key="vistor"/>,<a href="user/signinpage"><fmt:message key="gologin" /></a>
									</span>	
								</c:when>
								<c:otherwise>
									<span style="color: pink;font-size:13px;font-weight:bold;margin-right:10px;" >
										<fmt:message key="welmsg">
											<fmt:param value="${sessionScope.user.name}"></fmt:param>
										</fmt:message>	
										&nbsp;<a href="user/signout">[<fmt:message key="signout"/>]</a>
									</span>				
								</c:otherwise>
							</c:choose>	
							<br/>		<br/>				
							<br/>
						<span style="color:#AA11EE;font-size: 34px;margin-right: 350px;font-weight: bold;">Chemistry Education and Research</span>	
				</div>
			</td>
		</tr>

		<tr>
			<td style="line-height: 20px;background-color: rgba(247, 247, 247, 1);">				
<!-- 					<ul  style="" class="toppage" > -->
<!-- 						<li style="width:auto;"><a href=".">首页</a></li>						 -->
<!-- 						<li>|</li>					 -->
<!-- 						<li style="width:auto;"><a href="examquest/san/j"><span style="color:green;">初中散题库</span></a></li>						 -->
<!-- 						<li>|</li> -->
<!-- 						<li style="width:auto"><a href="examquest/doc/j"><span style="color:green;">初中文档题库</span></a></li>	 -->
<!-- 						<li>|</li> -->
<!-- 						<li style="width:auto"><a href="examquest/edunote/j"><span style="color:green;">初中教学记事</span></a></li>	 -->
<!-- 						<li>|</li> -->
<!-- 						<li style="width:auto"><a href="examquest/san/s"><span style="color:navy;">高中散题库</span></a></li> -->
<!-- 						<li>|</li> -->
<!-- 						<li style="width:auto"><a href="examquest/doc/s"><span style="color:navy;">高中文档题库</span></a></li> -->
<!-- 						<li>|</li> -->
<!-- 						<li style="width:auto"><a href="examquest/edunote/s"><span style="color:navy;">高中教学记事</span></a></li> -->
<!-- 					</ul> -->
					
			    	<ul class="nav nav-justified nav-tabs navbar-default" style="">
				    	
						<li ><a href=".">首页</a></li>						
			
						<li ><a href="examquest/san/j"><span style="color:green;">初中散题库</span></a></li>						
			
						<li ><a href="examquest/doc/j"><span style="color:green;">初中文档题库</span></a></li>	
					
						<li ><a href="examquest/edunote/j"><span style="color:green;">初中教学记事</span></a></li>	
					
						<li ><a href="examquest/san/s"><span style="color:navy;">高中散题库</span></a></li>
					
						<li ><a href="examquest/doc/s"><span style="color:navy;">高中文档题库</span></a></li>
						
						<li ><a href="examquest/edunote/s"><span style="color:navy;">高中教学记事</span></a></li>
				    		
			    	</ul>
			</td>						
		</tr>

		
	</table>
</div>

<script type="text/javascript">


</script>
</body>
</html>