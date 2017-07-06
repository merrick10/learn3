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
<title>quest doc upload</title>
<link type="text/css" rel="stylesheet" href="css/bootstrap3/bootstrap.css"> 
<style type="text/css">

</style>
</head>
<body style="">
<div id="mainDiv">
<fmt:setLocale value="zh_CN"/>

		<BR/>
		<p class="nowloaction">试题文档提交 &#187 编辑(<c:out value="${gradeinfo}" />)</p>
		<BR/>
<div style="margin: auto;width: 1200px;" class="panel panel-default" >
	<div class="panel-heading">
		    <h2  class="panel-title" style="color:blue;">试题文件-选择(<c:out value="${gradeinfo}" />)</h2>
    </div>
	<div  class="panel-body">
		<sf:form action="examquest/upfile?gradelevel=${gradelevel}" method="POST"  id="fileform"  enctype="multipart/form-data" >
			<div class="form-group">
				<label  for="file1" class="label label-info" >文件1</label>
				<input type="file" name="file1" id="file1" class="" style="width: 500px;" />	
			</div>
		
		
		</sf:form>
		<hr/>
		<input type="button" value="上传" class="btn btn-primary  btn-sm " onclick="save()"/>
		<input type="button" value="更多文件..." class="btn btn-default btn-sm " onclick="addmore()"/>
	</div>
</div>

</div>
<input type="hidden" id="fcnt"/>
<script type="text/javascript" src="jslib/jquery-1.10.2.js"></script>
<script type="text/javascript" src="jslib/bootstrap3/bootstrap.js"></script>
<script type="text/javascript">

	function addmore(){
		
		var html = '<div class="form-group"><hr/>';
		html += '<label   class="label label-info" >文件</label>';
		html += '<input type="file"  class="" style="width: 500px;" />	';
		html += '<input type="button" value="删除此文件" class="btn btn-default  btn-sm"  onclick="delfile(this)"/>';
		html += '</div>';
		
		$('#fileform').append(html);
		$('#fcnt').data('fcnt',$('#fcnt').data('fcnt') +1);
		renamelabels();
	}
	
	function delfile(e){
		$(e).siblings('file').off();
		$(e).parent().remove();
		$('#fcnt').data('fcnt',$('#fcnt').data('fcnt') -1);
		renamelabels();
	}
	
	function renamelabels(){
		$('.form-group > label').each(function(index,elem){
			$(elem).text('文件'+(index+1));
		});		
		
		$('.form-group > input[type=file]').each(function(index,elem){
			$(elem).attr('name','file'+(index+1));
		});	
	}
	
	function save(){

		document.getElementsByTagName('form').item(0).submit();

	}
		
	
	$(function(){
		$('#fcnt').data('fcnt',1);
		
	});
	
</script>
</body>
</html>