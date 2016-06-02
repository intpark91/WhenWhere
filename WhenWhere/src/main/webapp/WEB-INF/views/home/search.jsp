<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<!DOCTYPE html>
<html>
<head>
	<jsp:include page="../component/core_head.jsp" />
	<title>searchTest</title>
	<link rel="stylesheet" href="../css/search.css">
	<link rel="stylesheet" href="../css/lightslider.css" />
	<link rel="stylesheet" href="../css/locationTab.css" />
	<link rel="stylesheet" href="../css/modal.css">
</head>
<body class="hold-transition skin-blue sidebar-mini sidebar-collapse">

	<div class="wrapper">
		<!-- include -->
		<jsp:include page="../component/header.jsp" />
		<jsp:include page="../component/linkSidebar.jsp" />

		<section class="bg-primary section1">
			<div class="container" align="center">
				<div class="row center">
					<div class="hero-unit">
						<div class="input-daterange" id="datepicker">
							<div class="col-sm-offset-3 col-sm-2">
								<h1>
									<span class="label label-info">시작일</span>
								</h1>
								<input type="text" class="input-small" name="start" />
							</div>

							<div class="col-sm-offset-2 col-sm-2">
								<h1>
									<span class="label label-info">종료일</span>
								</h1>
								<input type="text" class="input-small" name="end" />
							</div>
						</div>
					</div>
				</div>
			</div>

		</section>


		<section class="section2">
			<div class="container" align="center">
				<div class="row center locationSearchDiv">
					<div
						class="tabs col-sm-offset-1 col-sm-10 col-xs-offset-1 col-xs-10">
						<div class="cd-tabs">

							<nav>
								<ul class="cd-tabs-navigation">
									<li><a data-content="서울·경기" class="selected" href="#0">서울·경기</a></li>
									<li><a data-content="영서" href="#0">영서</a></li>
									<li><a data-content="영동" href="#0">영동</a></li>
									<li><a data-content="충복" href="#0">충복</a></li>
									<li><a data-content="충남" href="#0">충남</a></li>
									<li><a data-content="경북" href="#0">경북</a></li>
									<li><a data-content="경남" href="#0">경남</a></li>
									<li><a data-content="전북" href="#0">전북</a></li>
									<li><a data-content="전남" href="#0">전남</a></li>
									<li><a data-content="제주" href="#0">제주</a></li>

								</ul>
								<!-- cd-tabs-navigation -->
							</nav>

							<ul class="cd-tabs-content">
								<li data-content="서울·경기" class="selected">
									<ul class="locationUL">
										<li><input type="checkbox" id="가평" class="checkbox" /> <label
											for="가평">가평</label></li>
										<li><input type="checkbox" id="강화" class="checkbox" /> <label
											for="강화">강화</label></li>
										<li><input type="checkbox" id="고양" class="checkbox" /> <label
											for="고양">고양</label></li>
										<li><input type="checkbox" id="과천" class="checkbox" /> <label
											for="과천">과천</label></li>

									</ul>


								</li>
								<li data-content="영서"></li>
								<li data-content="영동"></li>
								<li data-content="충복"></li>
								<li data-content="충남"></li>
							</ul>
							<!-- cd-tabs-content -->
						</div>
						<!-- cd-tabs -->


					</div>
					<div class="row">
						<div class="col-sm-offset-3 col-sm-6 col-xs-offset-3 col-xs-6">
							<button type="button" class="locationSearchBtn btn">상세검색∨</button>
						</div>
					</div>
				</div>
			</div>
		</section>

		<section class="section3">
			<div class="container" align="center">
				<div class="row">
					<div class="col-sm-offset-3 col-sm-6">
						<button class="searchBtn btn btn-orange">SEARCH</button>
					</div>
				</div>
			</div>
		</section>
		
		<ul class="cd-items cd-container">
				<li class="cd-item"><img src="img/item-1.jpg"
					alt="Item Preview"> <a href="#0" class="cd-trigger">Quick
						View</a></li>
				<!-- cd-item -->
		</ul>


		<div id="scrollDiv demo" class="scrollDiv">
			<div class="item">
				<h1>
					<span class="label label-info">행사</span>
				</h1>
				<ul id="content-slider1" class="content-slider1 ">
					<li><a href="#" class="cd-trigger"><img class="img-thumbnail"
							src="../resources/img/bg_img.jpg" /></a></li>
					<li><a href="#"><img class="img-thumbnail"
							src="../resources/img/test.JPG" /></a></li>
					<li><a href="#">3_event</a></li>
					<li><a href="#">4_event</a></li>
					<li><a href="#">5_event</a></li>
					<li><a href="#">6_event</a></li>
				</ul>
			</div>

			<div class="item">
				<h1>
					<span class="label label-info">특산물</span>
				</h1>
				<ul id="content-slider2" class="content-slider2">
					<li><a href="#"><img
							src="../resources/img/cd-icon-email.svg" class="img-thumbnail" /></a></li>
					<li><a href="#">2_region</a></li>
					<li><a href="#">3_region</a></li>
					<li><a href="#">4_region</a></li>
					<li><a href="#">5_region</a></li>
					<li><a href="#">6_region</a></li>
				</ul>
			</div>

			<div class="item">
				<h1>
					<span class="label label-info">숙박</span>
				</h1>
				<ul id="content-slider3" class="content-slider3">
					<li><a href="#"><img
							src="../resources/img/cd-icon-email.svg" class="img-thumbnail" /></a></li>
					<li><a href="#">2_food</a></li>
					<li><a href="#">3_food</a></li>
					<li><a href="#">4_food</a></li>
					<li><a href="#">5_food</a></li>
				</ul>
			</div>

		</div>
		<!-- /.content-wrapper -->

		<div class="cd-quick-view">
			<div class="cd-slider-wrapper">
				<ul class="cd-slider">
					<li class="selected"><img src="img/item-1.jpg" alt="Product 1"></li>
					<li><img src="img/item-2.jpg" alt="Product 2"></li>
					<li><img src="img/item-3.jpg" alt="Product 3"></li>
				</ul>
				<!-- cd-slider -->

				<ul class="cd-slider-navigation">
					<li><a class="cd-next" href="#0">Prev</a></li>
					<li><a class="cd-prev" href="#0">Next</a></li>
				</ul>
				<!-- cd-slider-navigation -->
			</div>
			<!-- cd-slider-wrapper -->

			<div class="cd-item-info">
				<h2>Produt Title</h2>
				<p>Lorem ipsum dolor sit amet, consectetur adipisicing elit.
					Officia, omnis illo iste ratione. Numquam eveniet quo, ullam itaque
					expedita impedit. Eveniet, asperiores amet iste repellendus
					similique reiciendis, maxime laborum praesentium.</p>

				<ul class="cd-item-action">
					<li><button class="add-to-cart">Add to cart</button></li>
					<li><a href="#0">Learn more</a></li>
				</ul>
				<!-- cd-item-action -->
			</div>
			<!-- cd-item-info -->
			<a href="#0" class="cd-close">Close</a>
		</div>
		<!-- cd-quick-view -->






		<!-- include -->
		<jsp:include page="../component/footer.jsp" />
		<jsp:include page="../component/controlSidebar.jsp" />
	</div>
	<!-- scripts -->
	<jsp:include page="../component/core_js.jsp" />
	
	<script src="../js/bootstrap-datepicker.js"></script>
	<script src="../js/lightslider.js"></script>
	<script src="../js/locationTab.js"></script>
	
	<script src="../js/velocity.min.js"></script>
	<script src="../js/modal.js"></script>
	
	<script type="text/javascript">
            // When the document is ready
            $(document).ready(function () {
                
                $('.input-daterange').datepicker({
                    todayBtn: "linked"
                });
            
            });
    </script>
</body>
</html>
