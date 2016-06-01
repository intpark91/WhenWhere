<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<title>test section</title>
<meta name="description"
	content="This is a free Bootstrap landing page theme created for BootstrapZero. Feature video background and one page design." />
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<meta name="generator" content="Codeply">
<link rel="stylesheet"
	href="//maxcdn.bootstrapcdn.com/bootstrap/3.3.4/css/bootstrap.min.css" />
<link
	href="//cdnjs.cloudflare.com/ajax/libs/animate.css/3.1.1/animate.min.css"
	rel="stylesheet" />
<link rel="stylesheet"
	href="//code.ionicframework.com/ionicons/2.0.1/css/ionicons.min.css" />
<link rel="stylesheet" href="../css/styles.css" />

<link rel="stylesheet" href="../css/search.css">
<link rel="stylesheet" href="../css/lightslider.css" />
<link rel="stylesheet" href="../css/locationTab.css" />

</head>
<body>
	<jsp:include page="../component/topNav.jsp" />

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
				<div class="tabs col-sm-offset-1 col-sm-10 col-xs-offset-1 col-xs-10">
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
									<li>
										<input type="checkbox" id="가평" class="checkbox" /> <label
											for="가평">가평</label>
									</li>
									<li>
										<input type="checkbox" id="강화" class="checkbox" /> <label
											for="강화">강화</label>
									</li>
									<li>
										<input type="checkbox" id="고양" class="checkbox" /> <label
											for="고양">고양</label>
									</li>
									<li>
										<input type="checkbox" id="과천" class="checkbox" /> <label
											for="과천">과천</label>
									</li>
							
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


	<div id="scrollDiv demo">
		<div class="item">
			<h1>
				<span class="label label-info">행사</span>
			</h1>
			<ul id="content-slider1" class="content-slider1">
				<li><a href="#"><img class="img-thumbnail"
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
						src="../resources/img/cd-icon-email.svg" /></a></li>
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
				<li><a href="#"><img src="../resources/img/cd-icon-email.svg" /></a></li>
				<li><a href="#">2_food</a></li>
				<li><a href="#">3_food</a></li>
				<li><a href="#">4_food</a></li>
				<li><a href="#">5_food</a></li>
			</ul>
		</div>

	</div>
	<jsp:include page="../component/footer.jsp" />

	<!-- Load jQuery and bootstrap datepicker scripts -->
	<script src="../js/jquery-1.9.1.min.js"></script>
	<script src="../js/bootstrap-datepicker.js"></script>
	<script src="../js/lightslider.js"></script>
	<script src="../js/locationTab.js"></script>
	<script type="text/javascript">
            // When the document is ready
            $(document).ready(function () {
                
            	$('.item').css('display','none');
            	
                $('.input-daterange').datepicker({
                    todayBtn: "linked"
                });
                
                $('.locationSearchBtn').on('click', function() {
                	if($('.tabs').css('display') == 'none'){
                		$(this).text('상세검색∧');
                		$('.tabs').slideDown();
                	}else{
                		$('.tabs').slideUp();
                		$(this).text('상세검색∨');
                	}
				});
                
                $('.searchBtn').on('click', function() {
					if($('.item').css('visibility') == 'hidden'){
						$('.item').slideDown();
						
						setTimeout(function () {
							$('.item').css('visibility','visible');
						}, 500);
						
						$('#content-slider1').lightSlider({
							loop:true,
					        keyPress:true
						});
						
						$('#content-slider2').lightSlider({
							loop:true,
					        keyPress:true
						});
						
						$('#content-slider3').lightSlider({
							loop:true,
					        keyPress:true
						});
						
						
					}else{
						$('.item').slideUp();
						$('.item').slideDown();
						
						$(".content-slider1").empty();
						$(".content-slider2").empty();
						$(".content-slider3").empty();
						
						$(".item").each(function(k, v) {
							var ul = $('<ul/>').attr('id','content-slider'+(k+1)).attr('class','content-slider'+(k+1));
							ul.append("<li><a href='#'><img src='../resources/img/cd-icon-email.svg' /></a></li><li><a href='#'>2</a></li><li><a href='#'>3</a></li><li><a href='#'>4</a></li><li><a href='#'>5</a></li><li><a href='#'>6</a></li><li><a href='#'>7</a></li>");
							$(this).html(ul);
						});
						
						$("#content-slider1").lightSlider({
			                loop:true,
			                keyPress:true
			            });
						
						$("#content-slider2").lightSlider({
			                loop:true,
			                keyPress:true
			            });
						
						$("#content-slider3").lightSlider({
			                loop:true,
			                keyPress:true
			            });
						
					}
				});
				
				
            
            });
    </script>
</body>
</html>