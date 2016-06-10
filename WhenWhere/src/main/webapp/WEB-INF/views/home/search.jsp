<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<jsp:include page="../component/core_head.jsp" />
<title>searchTest</title>
<link rel="stylesheet" href="../css/search.css">
<link rel="stylesheet" href="../css/locationTab.css" />
<link rel="stylesheet" href="../css/eventSlider.css" />
<link rel="stylesheet" href="../css/loadingSpinner.css">
</head>
<body class="hold-transition skin-blue sidebar-mini sidebar-collapse">
	<div class="wrapper">
		<!-- include -->
		<jsp:include page="../component/header.jsp" />
		<jsp:include page="../component/linkSidebar.jsp" />
		<!-- include -->
		<section class="section1">
			<div class="row">
				<div class="input-daterange" id="datepicker" align="center">
					<div class="col-xs-offset-2 col-xs-8 col-sm-offset-3 col-sm-2">
						<h2><span class="label">시작일</span></h2> <input
							type="text" class="form-control" name="start" id="start" />
					</div>
					<div class="col-xs-offset-2 col-xs-8 col-sm-offset-2 col-sm-2">
						<h2><span class="label">종료일</span></h2> <input
							type="text" class="form-control" name="end" id="end" />
					</div>
				</div>
			</div>
		</section>

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
								<li data-target="#detailCarousel" data-slide-to="1"></li>
								<li data-target="#detailCarousel" data-slide-to="2"></li>
							</ol>

							<!-- Wrapper for slides -->

							<div class="carousel-inner" role="listbox">
								<div class="item active row">
									<img src="../resources/img/item-1.jpg"
										class="detailImg1 col-sm-offset-1 col-sm-10 col-xs-offset-1 col-xs-10">
									<!-- <div class="carousel-caption">
										<h3>Test</h3>
      									<p>Test Contents</p>
      								</div> -->
								</div>
 
								<div class="item row">
									<img src="../resources/img/item-2.jpg"
										class="detailImg2 col-sm-offset-1 col-sm-10 col-xs-offset-1 col-xs-10">
								</div>

								<div class="item row">
									<h3 class="col-sm-offset-1 col-sm-10 col-xs-offset-1 col-xs-10">하이</h3>
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

		<!-- 지역 탭목록 -->
		<section class="section2">
				<div class="row">
					<div class="tabs col-sm-offset-1 col-sm-10 col-xs-offset-1 col-xs-10">
						<div class="cd-tabs">

							<nav>
								<ul class="cd-tabs-navigation">
									<c:forEach items="${locationSubList }" var="subList">
										<li><a data-content="${subList }" href="#0">${subList }</a></li>
									</c:forEach>
								</ul>
								<!-- cd-tabs-navigation -->
							</nav>

							<ul class="cd-tabs-content">
								<c:forEach items="${locationSubList }" var="sublist"
									varStatus="status">
									<li data-content="${sublist }">
										<ul class="locationUL">
											<c:set var="cnt" value="${status.index}" />
											<c:forEach items="${locationList.get(cnt) }" var="list">
												<li><input type="checkbox" id="${list }"
													class="checkbox" /> <label for="${list }">${list }</label>
												</li>
											</c:forEach>
										</ul>
									</li>
								</c:forEach>

							</ul>
							<!-- cd-tabs-content -->
						</div>
						<!-- cd-tabs -->
					</div>

					<div class="row">
						<div class="col-xs-offset-3 col-xs-6 col-sm-offset-4 col-sm-4">
							<button type="button" class="locationSearchBtn btn">상세검색∨</button>
						</div>
					</div>
				</div>
		</section>

		<!-- search 버튼  -->
		<section class="section3">
			<div class="row">
				<div class="col-xs-offset-2 col-xs-8 col-sm-offset-4 col-sm-4 loadingBtn">
					<a href="#" onclick="return false;" class="searchBtn btn btn-info">SEARCH</a>
				</div>
			</div>
		</section>



		<div id="scrollDiv demo" class="scrollDiv">
			<div class="container scrollDown">

				<div class="carousel slide" id="myCarousel1">
					<h1 class="slideLabel">
						<span class="label label-info">행사지</span>
					</h1>
					<div class="carousel-inner"></div>

				</div>
				<!-- /#myCarousel -->

				<!-- #myCarousel2 -->
				<div class="carousel slide" id="myCarousel2">
					<h1 class="slideLabel">
						<span class="label label-info">먹거리</span>
					</h1>
					<div class="carousel-inner"></div>

				</div>
				<!-- /#myCarousel2 -->

				<!-- 
				#myCarousel3
				<div class="carousel slide" id="myCarousel3">
					<h1 class="slideLabel">
						<span class="label label-info">숙박</span>
					</h1>
					<div class="carousel-inner">
						<div class="item active">
							<ul class="thumbnails">
								<li class="col-sm-3">
									<div class="fff">
										<div class="thumbnail">
											<a href="#"><img src="http://placehold.it/360x240" alt=""></a>
										</div>
										<div class="caption">
											<h4>Praesent commodo</h4>
											<p>Nullam Condimentum Nibh Etiam Sem</p>
											<a class="btn btn-mini" href="#">» Read More</a>
										</div>
									</div>
								</li>
								<li class="col-sm-3">
									<div class="fff">
										<div class="thumbnail">
											<a href="#"><img src="http://placehold.it/360x240" alt=""></a>
										</div>
										<div class="caption">
											<h4>Praesent commodo</h4>
											<p>Nullam Condimentum Nibh Etiam Sem</p>
											<a class="btn btn-mini" href="#">» Read More</a>
										</div>
									</div>
								</li>
								<li class="col-sm-3">
									<div class="fff">
										<div class="thumbnail">
											<a href="#"><img src="http://placehold.it/360x240" alt=""></a>
										</div>
										<div class="caption">
											<h4>Praesent commodo</h4>
											<p>Nullam Condimentum Nibh Etiam Sem</p>
											<a class="btn btn-mini" href="#">» Read More</a>
										</div>
									</div>
								</li>
								<li class="col-sm-3">
									<div class="fff">
										<div class="thumbnail">
											<a href="#"><img src="http://placehold.it/360x240" alt=""></a>
										</div>
										<div class="caption">
											<h4>Praesent commodo</h4>
											<p>Nullam Condimentum Nibh Etiam Sem</p>
											<a class="btn btn-mini" href="#">» Read More</a>
										</div>
									</div>
								</li>
							</ul>
						</div>
						/Slide1

						<div class="item">
							<ul class="thumbnails">
								<li class="col-sm-3">
									<div class="fff">
										<div class="thumbnail">
											<a href="#"><img src="http://placehold.it/360x240" alt=""></a>
										</div>
										<div class="caption">
											<h4>Praesent commodo</h4>
											<p>Nullam Condimentum Nibh Etiam Sem</p>
											<a class="btn btn-mini" href="#">» Read More</a>
										</div>
									</div>
								</li>
								<li class="col-sm-3">
									<div class="fff">
										<div class="thumbnail">
											<a href="#"><img src="http://placehold.it/360x240" alt=""></a>
										</div>
										<div class="caption">
											<h4>Praesent commodo</h4>
											<p>Nullam Condimentum Nibh Etiam Sem</p>
											<a class="btn btn-mini" href="#">» Read More</a>
										</div>
									</div>
								</li>
								<li class="col-sm-3">
									<div class="fff">
										<div class="thumbnail">
											<a href="#"><img src="http://placehold.it/360x240" alt=""></a>
										</div>
										<div class="caption">
											<h4>Praesent commodo</h4>
											<p>Nullam Condimentum Nibh Etiam Sem</p>
											<a class="btn btn-mini" href="#">» Read More</a>
										</div>
									</div>
								</li>
							</ul>
						</div>
						/Slide2
					</div>
					<nav>
						<ul class="control-box pager">
							<li><a data-slide="prev" href="#myCarousel3" class=""><i
									class="glyphicon glyphicon-chevron-left"></i></a></li>
							<li><a data-slide="next" href="#myCarousel3" class=""><i
									class="glyphicon glyphicon-chevron-right"></i></a></li>
						</ul>
					</nav>
					/.control-box
				</div>
				/#myCarousel3
 -->

			</div>
		</div>
		<!-- /.content-wrapper -->


		<!-- include -->
		<jsp:include page="../component/footer.jsp" />
		<jsp:include page="../component/controlSidebar.jsp" />
	</div>
	<!-- scripts -->
	<jsp:include page="../component/core_js.jsp" />

	<script src="../js/bootstrap-datepicker.js"></script>
	<script src="../js/search.js"></script>
	<script src="../js/locationTab.js"></script>

	<script src="../js/loadingSpinner.js"></script>

	<script type="text/javascript">
            // When the document is ready
            $(document).ready(function () {
                
                $('.input-daterange').datepicker({
                    todayBtn: "linked"
                });
                
                $('.carousel').carousel({
                    interval : 10000
                });
                
            });
    </script>
</body>
</html>