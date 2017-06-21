<%@ page language="java" import="java.util.*"  contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"  %>
<%@ taglib uri="http://tiles.apache.org/tags-tiles" prefix="tiles" %>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE html>
<html>
<head>
<base href="<%=basePath%>">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<title>首页</title>
<link type="text/css" rel="stylesheet" href="css/global.css?v=2017">
<link type="text/css" rel="stylesheet" href="css/bootstrap3/bootstrap.css?v=2017">

</head>
<body>

<table style="margin-top: 5px;">
	<tr>
		<td>
			<div style=";width: 380px;height: auto;" class="panel panel-default">
			    <div class="panel-body">
			    	<div id="myCarousel" class="carousel slide" style="width: 256px;height: 256px;">
			    		<!-- 轮播（Carousel）指标 -->
					    <ol class="carousel-indicators">
					        <li data-target="#myCarousel" data-slide-to="0" class="active"></li>
					        <li data-target="#myCarousel" data-slide-to="1"></li>
					        <li data-target="#myCarousel" data-slide-to="2"></li>
					    </ol> 
					     <!-- 轮播（Carousel）项目 -->
					    <div class="carousel-inner" style="">
					        <div class="item active" >
					            <img src="img/cat1.png"   alt="First slide" style="width: 131px;height: 178px;margin: auto;" >
					        </div>
					        <div class="item" style="">
					            <img src="img/cat2.png"  alt="Second slide"style="width: 64px;height: 64px;margin: auto;">
					        </div>
					        <div class="item" >
					            <img src="img/cat3.png"   alt="Third slide" style="width: 256px;height: 256px;">
					        </div>
					    </div>
					    <!-- 轮播（Carousel）导航 -->
					    <a class="carousel-control left" href="#myCarousel" 
					        data-slide="prev">&lsaquo;
					    </a>
					    <a class="carousel-control right" href="#myCarousel" 
					        data-slide="next">&rsaquo;
					    </a>      	
			    	</div>    
			    </div>
			</div>		
		
		</td>
		<td style="padding-left: 10px;padding-top: 0;vertical-align: top">
			<ul class="list-group" style="width: 300px;">
			       <li class="list-group-item">1</li>
			       <li class="list-group-item">2</li>
			       <li class="list-group-item">3</li>
			       <li class="list-group-item">4</li>
			       <li class="list-group-item">5</li>
			       <li class="list-group-item">6</li>
			</ul>
		</td>
		<td style="padding-left: 10px;padding-top: 0;vertical-align: top">
			<ul class="list-group" style="width: 500px;">
			       <li class="list-group-item">1</li>
			       <li class="list-group-item"><h1 draggable="true">Hello</h1></li>
			       <li class="list-group-item"><a href="img/cat1.png">test_image</a></li>
			       <li class="list-group-item"><a href="test1/f1">F1</a></li>
			       <li class="list-group-item"><a href="test1/footer">Footer</a></li>
			       <li class="list-group-item">6</li>
			</ul>
		</td>		
	</tr>

	<tr>
		<td style="padding-left: 10px;padding-top: 0;vertical-align: top" colspan="3">
			<div class="row" style="">
				<div  class="col-sm-6 col-md-3" style="">
					<div class="thumbnail" style="width: 200px;">
						<img src="img/cat1.png" alt="占位文字"/>
						<div class="caption">
							<h3>CAT 1 title</h3>
							<p>Detail introduce</p>
							<p>
								<a class="btn btn-primary">按钮1</a>	<a class="btn btn-default">按钮2</a>
							</p>
						</div>
					</div>				
				</div>				

				<div  class="col-sm-6 col-md-3" style="">
						<div class="thumbnail" style="width: 200px;">
							<img src="img/cat2.png" alt="占位文字"/>
							<div class="caption">
								<h3>CAT TWO title</h3>
								<p>Detail introduce</p>
								<p>
									<a class="btn btn-primary">按钮1</a>
									<a class="btn btn-default">按钮2</a>
								</p>
							</div>
						</div>				
				</div>

				<div  class="col-sm-6 col-md-3" style="">
						<div class="thumbnail" style="width: 200px;">
							<img src="img/cat3.png" alt="占位文字"/>
							<div class="caption">
								<h3>CAT 3 title</h3>
								<p>Detail introduce</p>
								<p>
									<a class="btn btn-primary">按钮1</a>
									<a class="btn btn-default">按钮2</a>
								</p>
							</div>
						</div>				
				</div>
			</div>
		</td>
	</tr>
</table>


<hr/>
<hr/>
<a href="test1/top">INDEX</a>
<hr/>

<ul class="list-group" style="">
       
<c:forEach items="${lst}" var="infos" varStatus="num">
	<li class="list-group-item">${num.index+1},${infos.title},${infos.pubday},${infos.puber },<br/>${infos.content }</li>
</c:forEach>
</ul>


<hr/>

<script type="text/javascript" src="jslib/jquery-1.10.2.js"></script>
<script type="text/javascript" src="jslib/bootstrap3/bootstrap.js"></script>

<script type="text/javascript">
// $('#myCarousel').on('slide.bs.carousel', function () {
//     alert("当调用 slide 实例方法时立即触发该事件。");
// });
</script>
</body>
</html>