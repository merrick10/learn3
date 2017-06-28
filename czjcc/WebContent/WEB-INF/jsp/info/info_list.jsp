<%@ page language="java" import="java.util.*"  contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"  %>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE html>
<html>
<head>
<base href="<%=basePath%>">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<title>INFOLIST</title>
<link type="text/css" rel="stylesheet" href="css/global.css">
<link type="text/css" rel="stylesheet" href="css/bootstrap3/bootstrap.css">
</head>
<body>
<div id="mainDiv">
<BR/>
<p class="nowloaction">消息发布 &#187 列表</p>
<hr/>

<div style="margin: auto;width: 1200px;" class="panel panel-default" >
	<div  class="panel-body">
		<div class="col-lg-6" style="">
		
			<div class="input-group">
	     	 	
			<span class="input-group-addon" style=" ">date</span>
	     	<input type="text" class="form-control"  placeholder="此处输入ID"  />     		
			<span class="input-group-addon" style=" ">title</span>
			<input type="text" class="form-control"  placeholder="此处输入名字"  />
			<span class="input-group-btn">						
				<input type="button" class=" btn btn-primary"  value="查询"  />						
			</span>   
			<span class="input-group-btn">						
				<input type="button" class=" btn btn-primary btn-warning"  value="发布新信息" onclick="pubnew()"  />						
			</span>  
	    </div>
		</div>
		<span>发布总数(通过JdbcTemplate查询)：<c:out value="${totalcnt}" /></span>
		<table class="edit table-bordered table-striped " border="0" style="margin-left:20px;" cellpadding="0" cellspacing="0" id="datatable">
			<caption><h2 style="color: blue;font-size: 13px;" contextmenu="" draggable="true" >消息发布-列表</h2></caption>
			<thead style="background-color: #CCCCCC;">	
			<tr>
				<td style="width:10%;font-weight: bold;text-align: center;">NUM</td>
				<td style="width: 40%;font-weight: bold;text-align: center;">TITLE</td>
				<td style="width: 25%;font-weight: bold;text-align: center;">DATE</td>
				<td style="width: 25%;font-weight: bold;text-align: center;">USER</td>
			</tr>
			</thead>	
		</table>
	
	</div>
</div>




</div>
<br/>




<script type="text/javascript" src="jslib/jquery-1.10.2.js"></script>
<script type="text/javascript">
	function pubnew(){
		window.top.location='<%=basePath%>/info/edit';
	}

</script>
<script type="text/javascript">
	

	$(function(){
		
		
		
		$.ajax({
			url:"info/getlistjson",
			dataType:"json",
			type:"post",
			cache:false,
			data:{'optime':new Date().toUTCString()}, 
			success:function(data){
				
				var html = '';
				$.each(data.listdata,function(index,elem){
					html += '<tr>';
					html +='<td style="width:10%;font-weight: bold;text-align: center;">'+ (index+1) +'</td>';
					html += '<td style="width: 40%;text-align: center;">'+ elem.title +'</td>';
					html += '<td style="width: 25%;text-align: center;">'+ elem.pubday+'</td>';
					html += '<td style="width: 25%;text-align: center;">'+ elem.pubername +'</td>';
					html += '</tr>';
				});
				$('#datatable').append(html);
				
			},
			error: function(XMLHttpRequest) {
				alert(XMLHttpRequest.responseText);
			}
			
		});
		
		
	});

</script>

</body>
</html>