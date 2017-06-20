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


<h1 draggable="true">Hello</h1>

<a href="img/cat1.png">test_image</a>
<HR/>

<div style="margin: auto;width: 320px;height: 320px;" class="panel panel-default">
    <div class="panel-body">
    	<div id="myCarousel" class="carousel slide">
    		<!-- 轮播（Carousel）指标 -->
		    <ol class="carousel-indicators">
		        <li data-target="#myCarousel" data-slide-to="0" class="active"></li>
		        <li data-target="#myCarousel" data-slide-to="1"></li>
		        <li data-target="#myCarousel" data-slide-to="2"></li>
		    </ol> 
		     <!-- 轮播（Carousel）项目 -->
		    <div class="carousel-inner">
		        <div class="item active" style="width: 320px;height: 300px;text-align: center;vertical-align: middle;">
		            <img src="img/cat1.png"   alt="First slide">
		        </div>
		        <div class="item" style="width: 300px;height: 300px;">
		            <img src="img/cat2.png"  alt="Second slide">
		        </div>
		        <div class="item" style="width: 300px;height: 300px;">
		            <img src="img/cat3.png"   alt="Third slide">
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

<hr/>
<a href="test1/f1">F1</a><hr/>
<a href="test1/footer">Footer</a><hr/>
<a href="test1/top">INDEX</a>

<script type="text/javascript" src="jslib/jquery-1.10.2.js"></script>
<script type="text/javascript" src="jslib/bootstrap3/bootstrap.js"></script>

<script type="text/javascript">
// $('#myCarousel').on('slide.bs.carousel', function () {
//     alert("当调用 slide 实例方法时立即触发该事件。");
// });
</script>
</body>
</html>