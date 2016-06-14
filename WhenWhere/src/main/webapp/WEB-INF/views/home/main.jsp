<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
	
<!DOCTYPE html>
<html>
<head>
<jsp:include page="../component/core_head.jsp" />
<title>WhenWhereTest</title>
<link rel="stylesheet"
	href="https://code.jquery.com/ui/1.10.4/themes/flick/jquery-ui.css">
<link rel="stylesheet" href="../css/jquery-ui-slider-pips.css" />
<link rel="stylesheet" href="../css/slider.css" />
<link rel="stylesheet" href="../css/eventSlider.css" />
<link rel="stylesheet" href="../css/loadingSpinner.css">
<link rel="stylesheet" href="../css/main.css">
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
				<div class="col-sm-offset-3 col-sm-6 col-sx-12 sliderDiv">
					<div id="flat-slider"></div>
					<div class="locSelect">
						<select class="locSel btn" id="locSel">
							<c:forEach items="${locationSubList }" var="list">
								<option>${list }</option>
							</c:forEach>
						</select>
					</div>
				</div>
			</section>
			<!-- /.content -->

			<!-- modal contents -->
			<div class="modal fade" id="basicModal" tabindex="-1" role="dialog"
				aria-labelledby="basicModal" aria-hidden="true">
				<div class="modal-dialog">
					<div class="modal-content">
						<div class="modal-header">
							<button type="button" class="close" data-dismiss="modal"
								aria-hidden="true">&times;</button>
							<h4 class="modal-title label" id="myModalLabel">제목</h4>
						</div>
						<div class="modal-body">

							<div id="detailCarousel" class="carousel slide"
								data-ride="carousel">
								<!-- Indicators -->
								<ol class="carousel-indicators">
									<li data-target="#detailCarousel" data-slide-to="0"
										class="active"></li>
								</ol>
 
								<!-- Wrapper for slides -->

								<div class="carousel-inner modalContent" role="listbox">
									<div class="item active row">
										<img src="../resources/img/item-1.jpg"
											class="detailImg1 col-sm-offset-1 col-sm-10 col-xs-offset-1 col-xs-10">
									</div>


								</div>

								<!-- Left and right controls -->
								<a class="left carousel-control" href="#detailCarousel"
									role="button" data-slide="prev"> <span
									class="glyphicon glyphicon-chevron-left" aria-hidden="true"></span>
									<span class="sr-only">Previous</span>

								</a> <a class="right carousel-control" href="#detailCarousel"
									role="button" data-slide="next"> <span
									class="glyphicon glyphicon-chevron-right" aria-hidden="true"></span>
									<span class="sr-only">Next</span>
								</a>
							</div>


						</div>
						<div class="modal-footer">
							<p>
								<a class="btn btn-mini readMore" href="#">» Read More</a>
							</p>
						</div>
					</div>
				</div>
			</div>

			<!-- /modal contents -->


			<div class="container">
				<!-- #myCarousel -->
				<div class="carousel slide" id="myCarousel1">
					<h1 class="slideLabel">
						<span class="label">※ 행사지</span>
					</h1>
					<div class="carousel-inner"></div>

				</div>
				<!-- /#myCarousel -->
			</div>



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
	<script src='../js/loadingSpinner.js'></script>
	
</body>
</html>
