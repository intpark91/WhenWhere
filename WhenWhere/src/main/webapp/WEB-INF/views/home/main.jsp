<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<!DOCTYPE html>
<html>
<head>
<jsp:include page="../component/core_head.jsp" />
<title>WhenWhereTest</title>
<link rel="stylesheet"
	href="https://code.jquery.com/ui/1.10.4/themes/flick/jquery-ui.css">
<link rel="stylesheet" href="../css/jquery-ui-slider-pips.css" />
<link rel="stylesheet" href="../css/slider.css" />
<style type="text/css">
body {
	margin: 0;
	padding: 0;
	background: url(../resources/img/bg_img.jpg) center center fixed no-repeat;
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

.titleDiv {
	text-align: center;
	font-size: 70px;
	margin-top: 60px;
}

.sliderDiv {
	margin-top: 10px;
	margin-bottom: 150px;
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
			<section class="weather"></section>
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
	<!-- <script type="text/javascript" src="../js/jquery.xdomainajax.js"></script>
	<script type="text/javascript">
		$(function() {
			var apiKey = "vi8iWq3OX1jmnigHbNdOdSLn6Ssh6un2Zc0w%2BXE8reflwUgpNkCBna0JvGZ%2B6Lyb0295n8AdOR9k8nWPrqRQKg%3D%3D";
			var loc_code = "11B00000";
			var path = "http://newsky2.kma.go.kr/service/MiddleFrcstInfoService/getMiddleLandWeather?ServiceKey=" + apiKey
					+ "&regId=11B00000"
					+ "&tmFc=201606110600" 
					+ "&numOfRows=1"
					+ "&pageNo=1&_type=json";
				
			$.ajax({
				url : path,
				type : "get",
				dataType : "jsonp",
				success : function(data) {
					console.log("data : " + data);
					console.log("data.responseText : " + data.responseText);
					// var myXML = rplLine(data.responseText);
					//console.log(myXML);
					//var indexS = myXML.indexOf('"body":{"items":{'), indexE = myXML.indexOf("}]}"), result = myXML;
					//var jsonObj = $.parseJSON('[' + result + ']'), rainsnow = jsonObj[0].response.body.items.item[0].obsrValue, sky = jsonObj[0].response.body.items.item[4].obsrValue, temp = jsonObj[0].response.body.items.item[5].obsrValue;
					//console.log(jsonObj); 
				},
				error : function(xhr, status, error) {
				}
			})
		})

		function rplLine(value) {
			if (value != null && value != "") {
				return value.replace(/\n/g, "\\n");
			} else {
				return value;
			}
		}
	</script> -->
</body>
</html>
