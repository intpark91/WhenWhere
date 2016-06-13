<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<!DOCTYPE html>
<html>
<head>
	<jsp:include page="../component/core_head.jsp" />
	<title>WhenWhereTest</title>
	<link rel="stylesheet" href="../css/home/login.css" /> 
	<link href='http://fonts.googleapis.com/css?family=Varela+Round' rel='stylesheet' type='text/css'>
</head>

<!-- user/join -->
<body class="hold-transition skin-blue sidebar-mini sidebar-collapse">
		<div class="wrapper">
		<!-- include -->
		<jsp:include page="../component/header.jsp" />
		<jsp:include page="../component/linkSidebar.jsp" />
		<!-- Content Wrapper. Contains page content -->

		<div class="content-wrapper">
			<section class="content-header">
			</section>
			<!-- Content Header (Page header) -->
			<!-- Main content -->
			<section class="content">
				<form class="form-horizontal">
					<!-- LOGIN FORM -->
					<div class="container">
						<div class="row login_box">
							<div class="col-md-12 col-xs-12" align="center">
								<div class="line">
									<h3>12 : 30 AM</h3>
								</div>
								<div class="outter">
									<img
										src="http://cfile1.uf.tistory.com/image/220ACD49543246531DCC3C"
										class="image-circle" />
								</div>
								<span> When & Where</span>
							</div>
							<div class="col-md-12 col-xs-12 login_control">
								<div class="control">
									<div class="label">Email Address</div>
									<input type="text" class="form-control"  name="email" value="whenwhere@gmail.com" />
								</div>

								<div class="control">
									<div class="label">Password</div>
									<input type="password" class="form-control" name="password" value="whenwhere" />
								</div>
								<div align="center">
									<button type="button" class="btn btn-orange" onclick="login();">LOGIN</button>
								</div>
							</div>
						</div>
					</div>
				</form>
			</section>
		</div>

		<!-- /.content-wrapper -->
		<!-- include -->
		<jsp:include page="../component/footer.jsp" />
		<jsp:include page="../component/controlSidebar.jsp" />
	</div>
	<!-- scripts -->
	<jsp:include page="../component/core_js.jsp" />
	<script src="https://cdnjs.cloudflare.com/ajax/libs/jquery-validate/1.13.1/jquery.validate.min.js"></script>
	<script type="text/javascript">
		function login(){
			var loginSer = $('form').serialize();
			$.ajax({
				url : '../user/login',
				type : 'POST',
				data : loginSer ,
				dataType : "json",
				success : function(check) {
					if(check.ok){
						location.href="../home/main";
					}else{
						$.bootstrapGrowl("아이디 또는 비밀번호를 다시 확인하세요.", {
				            type: 'danger',
				            align: 'center',
				            width: 'auto',
				            allow_dismiss: false
				        });
					}
				},
				error : function(xhr, data, error) {
					console.log(error);
				}
			});
		}
	</script>
</body>
</html>