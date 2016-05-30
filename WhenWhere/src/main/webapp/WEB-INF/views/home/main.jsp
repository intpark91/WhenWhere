<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<title>WhenWhereTest</title>
<meta name="description"
	content="This is a free Bootstrap landing page theme created for BootstrapZero. Feature video background and one page design." />
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<meta name="generator" content="Codeply">
<link rel="stylesheet" href="//maxcdn.bootstrapcdn.com/bootstrap/3.3.4/css/bootstrap.min.css" />
<link rel="stylesheet" href="//cdnjs.cloudflare.com/ajax/libs/animate.css/3.1.1/animate.min.css" />
<link rel="stylesheet" href="//code.ionicframework.com/ionicons/2.0.1/css/ionicons.min.css" />
<link rel="stylesheet" href="../css/styles.css" />
<link rel="stylesheet" href="../css/styles_login.css" />
<!-- plus a jQuery UI theme, here I use "flick" -->
<link rel="stylesheet" href="../css/slider.css" />
<link rel="stylesheet" href="https://code.jquery.com/ui/1.10.4/themes/flick/jquery-ui.css">
<link rel="stylesheet" href="../css/jquery-ui-slider-pips.css" />
<link href="https://gitcdn.github.io/bootstrap-toggle/2.2.2/css/bootstrap-toggle.min.css" rel="stylesheet">

</head>
<body>
	<jsp:include page="../component/topNav.jsp" />
	<header id="first">
		<div class="header-content">
			<div class="inner">
				<h1 class="cursive">
					When? <br>Where!
				</h1>
				<hr>
			</div>
			
		<div id="body-flat-fliter">
			<div id="flat-slider"></div>
		</div>
		
		</div>
		<video autoplay loop class="fillWidth fadeIn wow collapse in"
			data-wow-delay="0.5s"
			poster="https://s3-us-west-2.amazonaws.com/coverr/poster/Traffic-blurred2.jpg"
			id="video-background">
			<source src="../resources/video/test3.mp4" type="video/mp4">
			Your browser does not support the video tag. I suggest you upgrade
			your browser.
		</video>
	</header>
	<jsp:include page="../component/footer.jsp" />
	<script src="//ajax.googleapis.com/ajax/libs/jquery/1.9.1/jquery.min.js"></script>
	<script src="https://code.jquery.com/ui/1.11.1/jquery-ui.js"></script>
	<script	src="//maxcdn.bootstrapcdn.com/bootstrap/3.3.4/js/bootstrap.min.js"></script>
	<script	src="//cdnjs.cloudflare.com/ajax/libs/jquery-easing/1.3/jquery.easing.min.js"></script>
	<script src="//cdnjs.cloudflare.com/ajax/libs/wow/1.1.2/wow.js"></script>
	<script src="../js/scripts.js"></script>
	<script src="../js/jquery-ui-slider-pips.js"></script>
	<script src="../js/slider.js"></script>
	<script src="https://gitcdn.github.io/bootstrap-toggle/2.2.2/js/bootstrap-toggle.min.js"></script>
	
</body>
</html>