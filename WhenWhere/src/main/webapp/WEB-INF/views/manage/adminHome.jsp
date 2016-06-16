<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<!DOCTYPE html>
<html>
<head>
	<jsp:include page="../component/core_head.jsp" />
	<title>WhenWhereTest</title>
	<link rel="stylesheet" href="../css/dataTables.bootstrap.css">
	<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/ionicons/2.0.1/css/ionicons.min.css">
	<style>
		td {
		    text-overflow: ellipsis;
		    overflow: hidden;
		}
		.btn {
   	 		padding: 5px 5px;
   	 	}
	</style>
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
							<a href="javascript:eventFunc(0);" class="small-box-footer"> 회원관리 페이지로 이동 
								<i class="fa fa-arrow-circle-right"></i>
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
							<a href="javascript:eventFunc(1);" class="small-box-footer"> 게시판관리 페이지로 이동 
								<i class="fa fa-arrow-circle-right"></i>
							</a>
						</div>
					</div>
					<!-- ./col -->
			<!-- 		<div class="col-lg-3 col-xs-6">
						small box
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
							<a href="javascript:eventFunc(2);" class="small-box-footer"> 특산물 &amp; 지역 관리 페이지로 이동
								<i class="fa fa-arrow-circle-right"></i>
							</a>
						</div>
					</div>
					./col
					<div class="col-lg-3 col-xs-6">
						small box
						<div class="small-box bg-red">
							<div class="inner">
								<h3>65</h3>

								<p>Unique Visitors</p>
							</div>
							<div class="icon">
								<i class="ion ion-pie-graph"></i>
							</div>
							<a href="javascript:eventFunc(3);" class="small-box-footer"> More info <i
								class="fa fa-arrow-circle-right"></i>
							</a>
						</div>
					</div>
					./col -->
				</div>
				
				<!-- /.row -->
				<div class="row">
					<div class="col-xs-12">
						<div class="box">
							<div class="box-header ">
								<h3 class="box-title"></h3>

								<div class="box-tools">
								</div>
							</div>
							<div class="box-body table-responsive no-padding ">
								<table class="table table-hover">
									<thead>
									</thead>
									<tbody>
									</tbody>
								</table>
								<div class="box-footer clearfix">
									<ul class="pagination pagination-sm no-margin pull-right">
										<li></li>
										<li><a href="#">&laquo;</a></li>
										<li><a href="#">1</a></li>
										<li><a href="#">2</a></li>
										<li><a href="#">3</a></li>
										<li><a href="#">4</a></li>
										<li><a href="#">5</a></li>
										<li><a href="#">&raquo;</a></li>
									</ul>
								</div>
							</div>
						</div>
					</div>
				</div>
			</section>
		<!-- /.content -->
		</div>
	</div>
	<div class="control-sidebar-bg" style="position: fixed; height: auto;"></div>
	<!-- scripts -->
	<jsp:include page="../component/footer.jsp" />
	<jsp:include page="../component/controlSidebar.jsp" />
	<jsp:include page="../component/core_js.jsp" />
	<script src="../js/Construct_JS/manage.js"></script>
	<script>
	var beforeChangeValue = '';
	var boardType = '1';
	$(function(){
		/* ************디폴트로 회원정보 관련리스트를 뿌려줌******************/
		eventFunc(0);		
		
		$('.form-group.auth-class').click(function(){
			var beforeChangeValue = $('.auth-class').val();
		});
	});
	
	function eventFunc(eventType){
		$('thead').html('');
		$('tbody').html('');
		$('.box-title').text('');
		
		if(eventType == 0){
			userFunc();
		}else if( eventType == 1 ){
			boardFunc();
		}else if( eventType == 2 ){
			localProductFunc();
		}
	}
	</script>
</body>
</html>
