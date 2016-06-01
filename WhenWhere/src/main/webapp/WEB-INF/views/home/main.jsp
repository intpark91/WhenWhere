<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<!DOCTYPE html>
<html>
<head>
	<title>WhenWhereTest</title>
	<jsp:include page="../component/JS_CSS/main_css.jsp" />
	<script src="https://code.jquery.com/jquery-2.1.1.js"></script>
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
			<section class="content-header">
			</section>
			<!-- Main content -->
			<section class="content">
				<!-- Your Page Content Here -->
				<div id="flat-slider"></div>
			</section>
			<!-- /.content -->
		</div>

		<!-- /.content-wrapper -->
		<!-- include -->
		<jsp:include page="../component/footer.jsp" />
		<jsp:include page="../component/controlSidebar.jsp" />
	</div>
	<!-- scripts -->
	<jsp:include page="../component/JS_CSS/main_js.jsp" />
</body>
</html>
