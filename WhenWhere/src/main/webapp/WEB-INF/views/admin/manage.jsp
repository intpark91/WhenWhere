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

				<div class="row">

					<div class="col-lg-3 col-xs-6">
						<!-- small box -->
						<div class="small-box bg-yellow">
							<div class="inner">
								<p>전체 회원 수</p>
								<h3>44</h3>
							</div>
							<div class="icon">
								<i class="ion ion-person-add"></i>
							</div>
							<a href="../home/" class="small-box-footer"> 회원관리 페이지로 이동 <i
								class="fa fa-arrow-circle-right"></i>
							</a>
						</div>
					</div>

					<div class="col-lg-3 col-xs-6">
						<!-- small box -->
						<div class="small-box bg-aqua">
							<div class="inner">
								<p>총 게시글 수</p>
								<h3>150</h3>
							</div>
							<div class="icon">
								<i class="ion ion-chatbubble-working"></i>
							</div>
							<a href="#" class="small-box-footer"> 게시판관리 페이지로 이동 <i
								class="fa fa-arrow-circle-right"></i>
							</a>
						</div>
					</div>
					<!-- ./col -->
					<div class="col-lg-3 col-xs-6">
						<!-- small box -->
						<div class="small-box bg-green">
							<div class="inner">
								<p>특산물 &amp; 지역</p>
								<h3>
									53<sup style="font-size: 20px">%</sup>
								</h3>
							</div>
							<div class="icon">
								<i class="ion ion-leaf"></i>
							</div>
							<a href="#" class="small-box-footer"> 특산물 &amp; 지역 관리 페이지로 이동
								<i class="fa fa-arrow-circle-right"></i>
							</a>
						</div>
					</div>
					<!-- ./col -->
					<div class="col-lg-3 col-xs-6">
						<!-- small box -->
						<div class="small-box bg-red">
							<div class="inner">
								<h3>65</h3>

								<p>Unique Visitors</p>
							</div>
							<div class="icon">
								<i class="ion ion-pie-graph"></i>
							</div>
							<a href="#" class="small-box-footer"> More info <i
								class="fa fa-arrow-circle-right"></i>
							</a>
						</div>
					</div>
					<!-- ./col -->
				</div>
				<!-- /.row -->
				<div class="box">
					<div class="box-header">
						<h3 class="box-title">Data Table With Full Features</h3>
					</div>
					<!-- /.box-header -->
					<div class="box-body">
						<table id="example1" class="table table-bordered table-striped">
							<thead>
								<tr role="row">
									<th>유저 닉네임</th>
									<th>유저 이메일</th>
									<th>핸드폰 번호</th>
									<th>유저 권한</th>
									<th>회원 삭제</th>
								</tr>
							</thead>
							<tbody>
								<tr role="row" class="odd">
									<td class="">Misc</td>
									<td>IE Mobile</td>
									<td class="sorting_1">Windows Mobile 6</td>
									<td>-</td>
									<td>C</td>
								</tr>
								<tr role="row" class="even">
									<td class="">Gecko</td>
									<td>Seamonkey 1.1</td>
									<td class="sorting_1">Win 98+ / OSX.2+</td>
									<td>1.8</td>
									<td>A</td>
								</tr>
								<tr role="row" class="odd">
									<td class="">Gecko</td>
									<td>Mozilla 1.7</td>
									<td class="sorting_1">Win 98+ / OSX.1+</td>
									<td>1.7</td>
									<td>A</td>
								</tr>
								<tr role="row" class="even">
									<td class="">Gecko</td>
									<td>Mozilla 1.8</td>
									<td class="sorting_1">Win 98+ / OSX.1+</td>
									<td>1.8</td>
									<td>A</td>
								</tr>
								<tr role="row" class="odd">
									<td class="">Presto</td>
									<td>Opera 9.0</td>
									<td class="sorting_1">Win 95+ / OSX.3+</td>
									<td>-</td>
									<td>A</td>
								</tr>
								<tr role="row" class="even">
									<td class="">Presto</td>
									<td>Opera 7.5</td>
									<td class="sorting_1">Win 95+ / OSX.2+</td>
									<td>-</td>
									<td>A</td>
								</tr>
								<tr role="row" class="odd">
									<td class="">Presto</td>
									<td>Opera 8.0</td>
									<td class="sorting_1">Win 95+ / OSX.2+</td>
									<td>-</td>
									<td>A</td>
								</tr>
								<tr role="row" class="even">
									<td class="">Presto</td>
									<td>Opera 8.5</td>
									<td class="sorting_1">Win 95+ / OSX.2+</td>
									<td>-</td>
									<td>A</td>
								</tr>
								<tr role="row" class="odd">
									<td class="">Gecko</td>
									<td>Mozilla 1.1</td>
									<td class="sorting_1">Win 95+ / OSX.1+</td>
									<td>1.1</td>
									<td>A</td>
								</tr>
								<tr role="row" class="even">
									<td class="">Gecko</td>
									<td>Mozilla 1.2</td>
									<td class="sorting_1">Win 95+ / OSX.1+</td>
									<td>1.2</td>
									<td>A</td>
								</tr>
							</tbody>
							<!-- <tfoot>
								<tr>
									<th>Rendering engine</th>
									<th>Browser</th>
									<th>Platform(s)</th>
									<th>Engine version</th>
									<th>CSS grade</th>
								</tr>
							</tfoot> -->
						</table>
					</div>
				</div>
				<!-- /.box-body -->
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
