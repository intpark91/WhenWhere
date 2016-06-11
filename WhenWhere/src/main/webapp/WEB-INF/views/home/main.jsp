<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<!DOCTYPE html>
<html>
<head>
	<jsp:include page="../component/core_head.jsp" />
	<title>WhenWhereTest</title>
	<link rel="stylesheet" href="https://code.jquery.com/ui/1.10.4/themes/flick/jquery-ui.css">
	<link rel="stylesheet" href="../css/jquery-ui-slider-pips.css" />
	<link rel="stylesheet" href="../css/slider.css" />
	<style type="text/css">
	body {
		margin : 0;
		padding : 0;
		background : url (img.jpg) center center fixed no-repeat;
	}
	video {
		position: fixed;
		top: 0;
		left: 0;
		min-width: 100%;
		min-height: 100%;
		width: auto;
		height: auto;
		z-index: -1;
	}
	
	.titleDiv{
		text-align: center;
		font-size: 70px;
		margin-top:60px;
	}
	
	.sliderDiv{
		margin-top:10px;
		margin-bottom:150px;
	}
	
	
</style>
</head>
<!--
BODY TAG OPTIONS:
=================
Apply one or more of the following classes to get the
desired effect
|---------------------------------------------------------|
| SKINS         | skin-blue                               |
|               | skin-black                              |
|               | skin-purple                             |
|               | skin-yellow                             |
|               | skin-red                                |
|               | skin-green                              |
|---------------------------------------------------------|
|LAYOUT OPTIONS | fixed                                   |
|               | layout-boxed                            |
|               | layout-top-nav                          |
|               | sidebar-collapse                        |
|               | sidebar-mini                            |
|---------------------------------------------------------|
-->
<body class="hold-transition skin-blue sidebar-mini sidebar-collapse">
	<video autoplay loop poster="../resources/img/bg_img.jpg">
		<source src="../resources/video/test3.mp4" type="video/mp4">
	</video>
	<div class="wrapper">
		<!-- include -->
		<jsp:include page="../component/header.jsp" />
		<jsp:include page="../component/linkSidebar.jsp" />
		<!-- Content Wrapper. Contains page content -->

		<div class="content-wrapper">
			<!-- Content Header (Page header) -->
			<section class="content-header hidden-xs">
				<div class="row center ">
					<div class="col-sm-offset-3 col-sm-6 col-sx-3 col-sx-6 titleDiv">
						<span class="label">WhenWhere</span>
					</div>
				</div>
			</section>
			<!-- Main content -->
			<section class="content">
				<!-- Your Page Content Here -->
				<div class="row center">
					<div class="col-sm-offset-3 col-sm-6 col-sx-12 sliderDiv">
						<div id="flat-slider"></div>
					</div>
				</div>
				
			</section>
			<!-- /.content -->
			<section class="weather">
				
			</section>
		</div>

		<!-- /.content-wrapper -->
		<!-- include -->
		<jsp:include page="../component/footer.jsp" />
		<jsp:include page="../component/controlSidebar.jsp" />
	</div>
	<!-- scripts -->
	<jsp:include page="../component/core_js.jsp" />
	<script src="../js/jquery-ui-slider-pips.js"></script>
	<script src="../js/slider.js"></script>
	<script type="text/javascript">
	 $(function(){
		 
		 var apiKey = "d5813187-8e18-3a48-a348-ffb130e70d10";//skplanet 키
		 //5F5DBB7D-FFFF00AA9 //kweather 키
		 var foretxt = "Y";	//중기예보 기상개황 수신여부 (Y/N)
		 path = "http://apis.skplanetx.com/weather/allpoints/forecast6days?version=1&foretxt="+foretxt
		 	  + "&appKey=" + apiKey;
		 
		 $.ajax({
			 url : path,
			 type : "get",
			 dataType : "json",
			 success : function(){
				 alert("good");
			 },
			 error : function(){
				 alert("error");
			 }
		 })
	 })
	</script>
</body>
</html>
