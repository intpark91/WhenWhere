<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<!DOCTYPE html>
<html>
<head>
<jsp:include page="../component/core_head.jsp" />
<title>WhenWhereTest</title>
<link rel="stylesheet" href="../css/dataTables.bootstrap.css">
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/ionicons/2.0.1/css/ionicons.min.css">
</head>
<body class="skin-blue sidebar-mini sidebar-collapse">
	<div class="wrapper">
		<jsp:include page="../component/header.jsp" />
		<jsp:include page="../component/linkSidebar.jsp" />
		<!-- Content Wrapper. Contains page content -->
		<div class="content-wrapper" style="min-height: 896px;">
			<!-- Content Header (Page header) -->
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
		</div>
		<!-- /.box -->
		</section>
		<!-- /.content -->
	</div>
	<div class="control-sidebar-bg" style="position: fixed; height: auto;"></div>
	<!-- scripts -->
	<jsp:include page="../component/footer.jsp" />
	<jsp:include page="../component/controlSidebar.jsp" />
	<jsp:include page="../component/core_js.jsp" />
	<script src="../js/dataTables.bootstrap.js"></script>
	<script src="../js/jquery.dataTables.min.js"></script>
	<script src="../js/jquery.slimscroll.min.js"></script>
	<script src="../js/fastclick.js"></script>
	<script>
		$(function() {
			$("#example1").DataTable();
			$('#example2').DataTable({
				"paging" : true,
				"lengthChange" : false,
				"searching" : false,
				"ordering" : true,
				"info" : true,
				"autoWidth" : false
			});
		});
	</script>
</body>
</html>
