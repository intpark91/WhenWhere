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
<link rel="stylesheet"  href="../css/lightslider.css"/>
 
</head>
<body>
	<jsp:include page="../component/topNav.jsp" />
	<section class="bg-primary" id="one">
		<div class="container" align="center">
			<div class="row center">
				<div class="hero-unit">
					<h1 class="page-scroll">
					기간을 선택하세요
					</h1>
					<div class="input-daterange" id="datepicker">
						<input type="text" class="input-small" name="start" /> <span
							class="add-on" style="vertical-align: top; height: 27px">to</span>
						<input type="text" class="input-small" name="end" />
						<button class="btn btn-orange">SEARCH</button>
					</div>
				</div>
			</div>
		</div>
	</section>
	<div id="scrollDiv demo">
		<div class="item">
		<h1><span class="label label-info">행사</span></h1>
			<ul id="content-slider1" class="content-slider1">
				<li>
					<a href="#"><img class="img-thumbnail" src="../resources/img/bg_img.jpg"/></a>
				</li>
				<li>
					<a href="#"><img class="img-thumbnail" src="../resources/img/test.JPG"/></a>
				</li>
				<li>
					<a href="#" >3_event</a>
				</li>
				<li>
					<a href="#">4_event</a>
				</li>
				<li>
					<a href="#">5_event</a>
				</li>
				<li>
					<a href="#">6_event</a>
				</li>
			</ul>
		</div>
		
		<div class="item">
		<h1><span class="label label-info">특산물</span></h1>
			<ul id="content-slider2" class="content-slider2">
				<li>
					<a href="#"><img src="../resources/img/cd-icon-email.svg" /></a>
				</li>
				<li>
					<a href="#">2_region</a>
				</li>
				<li>
					<a href="#">3_region</a>
				</li>
				<li>
					<a href="#">4_region</a>
				</li>
				<li>
					<a href="#">5_region</a>
				</li>
				<li>
					<a href="#">6_region</a>
				</li>
			</ul>
		</div>
		
		<div class="item">
		<h1><span class="label label-info">숙박</span></h1>
			<ul id="content-slider3" class="content-slider3">
				<li>
					<a href="#"><img src="../resources/img/cd-icon-email.svg" /></a>
				</li>
				<li>
					<a href="#">2_food</a>
				</li>
				<li>
					<a href="#">3_food</a>
				</li>
				<li>
					<a href="#">4_food</a>
				</li>
				<li>
					<a href="#">5_food</a>
				</li>
			</ul>
		</div>

	</div>
	<jsp:include page="../component/footer.jsp" />

	<!-- Load jQuery and bootstrap datepicker scripts -->
	<script src="../js/jquery-1.9.1.min.js"></script>
	<script src="../js/bootstrap-datepicker.js"></script>
	<script src="../js/lightslider.js"></script> 
	<script type="text/javascript">
            // When the document is ready
            $(document).ready(function () {
                
            	$('.item').css('display','none');
            	
                $('.input-daterange').datepicker({
                    todayBtn: "linked"
                });
                
                
                $('.btn').on('click', function() {
					if($('.item').css('visibility') == 'hidden'){
						$('.item').slideUp();
						$('.item').slideDown();
						
						setTimeout(function () {
							$('.item').css('visibility','visible');
						}, 1000);
						
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