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
<link type="text/css" rel="stylesheet" href="css/jquery-ui-1.10.4.custom.min.css">
<link type="text/css" rel="stylesheet" href="css/jquery.ui.datepicker.css">
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
	<div  class="panel-body" style="width: 1200px;">
		<sf:form action="examquest/upfile?gradelevel=${gradelevel}" method="POST"  id="fileform" enctype="multipart/form-data"  >
			<div class="form-group panel" style=" width: 410px;margin-left: 10px;float:left;">
				<div class="input-group"> 
					<span  class="input-group-addon label-info" >文件1</span>
					<input type="file" name="file1" id="file1" class="form-control" />	
				</div>
				<div class="input-group"> 
					<span class="input-group-addon">难度</span> 
					<select name="difficulty" class="form-control" >
						<option value="1">普通</option>
						<option value="2">低</option>
						<option value="3">较难</option>
						<option value="4">高</option>
					</select>					
				</div>
				<div class="input-group"> 
					<span class="input-group-addon">适用阶段</span> 
					<select name="stage" class="form-control" >	
						<option value="0">所有阶段</option	>
						<option value="1">预习题</option>
						<option value="2">课堂习题</option>
						<option value="3">课后习题</option>
						<option value="4">复习题</option	>
					</select>					
				</div>
				<div class="input-group"> 
					<span class="input-group-addon">作者</span> 
					<select name="author" class="form-control" >
							<option value="1">本人</option>
							<option value="2">他人</option>
					</select>					
				</div>
				<div class="input-group" style=""> 
					<span class="input-group-addon">编写日期</span> 
					<input type="text" class="form-control" name="createtime" readonly="readonly" placeholder="点击选择日期" />				
				</div>
				<div class="input-group"> 
					<span class="input-group-addon">适用对象</span> 
					<select name="foruser" class="form-control" >
						<option value="0">所有学生</option	>
						<option value="1">在校学生</option>
						<option value="2">校外补习生</option>
						<option value="3">竞赛生</option	>
					</select>					
				</div>
				<div class="input-group"> 
					<span class="input-group-addon">备注</span> 
					<input type="text" class="form-control" name="remark"/>				
				</div>							
			</div>
		
		
		</sf:form>
		
	</div>
</div>
<br/>
<div style="display: block;margin: auto;width: 1200px;">
<input type="button" value="上传" class="btn btn-primary  btn-sm " onclick="save()"/>
<input type="button" value="更多文件..." class="btn btn-default btn-sm " onclick="addmore()"/>
</div>
</div>
<input type="hidden" id="fcnt"/>
<script type="text/javascript" src="jslib/jquery-1.10.2.js"></script>
<script type="text/javascript" src="jslib/bootstrap3/bootstrap.js"></script>
<script type="text/javascript" src="jslib/jquery-ui-1.10.4.custom.min.js"></script>
<script type="text/javascript" src="jslib/jquery.ui.datepicker.js"></script>
<script type="text/javascript" src="jslib/jquery.ui.datepicker-zh-CN.js"></script>
<script type="text/javascript">

	function addmore(){
		
		var html = '';
		html += '<div class="form-group panel" style=" width: 410px;margin-left: 10px;float:left;"> \
					<div class="input-group"> 	\
						<span  class="input-group-addon label-info" >文件1</span>	\
						<input type="file" name="file1" id="file1" class="form-control" />	\
					</div>\
					<div class="input-group"> \
						<span class="input-group-addon">难度</span> \
						<select name="difficulty" class="form-control" >\
							<option>普通</option>\
							<option>低</option>\
							<option>较难</option>\
							<option>高</option>\
						</select>					\
					</div>\
					<div class="input-group"> \
						<span class="input-group-addon">适用阶段</span> \
						<select name="stage" class="form-control" >			\
						<option value="0">所有阶段</option	>\
						<option value="1">预习题</option>\
						<option value="2">课堂习题</option>\
						<option value="3">课后习题</option>\
						<option value="4">复习题</option	>\
						</select>			\
					</div>\
					<div class="input-group"> \
						<span class="input-group-addon">作者</span> \
						<select name="author" class="form-control" >\
						<option value="1">本人</option>\
						<option value="2">他人</option>\
						</select>					\
					</div>\
					<div class="input-group"> \
						<span class="input-group-addon">编写日期</span> \
						<input type="text" class="form-control"  name="createtime" readonly="readonly" placeholder="点击选择日期" />				\
					</div>\
					<div class="input-group"> \
						<span class="input-group-addon">适用对象</span> \
						<select name="foruser" class="form-control" >	\
						<option value="0">所有学生</option	>\
						<option value="1">在校学生</option>\
						<option value="2">校外补习生</option>\
						<option value="3">竞赛生</option	>\
						</select>					\
					</div>\
					<div class="input-group"> \
						<span class="input-group-addon">备注</span> \
						<input type="text" class="form-control"  name="remark"/>	\
					</div>				\
						<input type="button" class="btn btn-info btn-xs" onclick="delfile(this)" value="删除该文件输入"/>\
				</div>\
					';		
		
		$('#fileform').append(html);
		$('#fcnt').data('fcnt',$('#fcnt').data('fcnt') +1);
		renamelabels();
	}
	
	function delfile(e){
		$(e).parent().children('file').off();
		$(e).parent().remove();
		$('#fcnt').data('fcnt',$('#fcnt').data('fcnt') -1);
		renamelabels();
	}
	
	function renamelabels(){
		$('.label-info').each(function(index,elem){
			$(elem).text('文件'+(index+1));
		});		
		$('.label-info').last().siblings('input[name=file1]').focus();
		binddatepicker();	
	}
	
	function save(){
		document.getElementsByTagName('form').item(0).submit();
	}
		
	function binddatepicker(){
		$( "[name=createtime]" ).datepicker({
			 changeMonth: true,
			 changeYear: true,
			 showButtonPanel: true,
			 dateFormat: "yy-mm-dd",
//			 showOn: "both",
//			 buttonText:"点击选择日期",
			 defaultDate: "0D",
			 minDate: "-10Y", 
			 maxDate: "-0D",
//			 buttonImage: "css/images/calendar.gif",//与其他控件url一样，基于base 				
			 buttonImageOnly: true	,
			 onSelect:function(){
			 	$(this).blur();//解决验证css需要两次blur问题
						 }	    			 
		});
	}
	
	$(function(){
		$('#fcnt').data('fcnt',1);	
		binddatepicker();		
		
	});
	
</script>
</body>
</html>