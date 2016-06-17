<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<!DOCTYPE html>
<html>
<head>
	<jsp:include page="../component/core_head.jsp" />
	<title>WhenWhere</title>
	<!-- <link rel="stylesheet" href="../css/home/login.css" />  -->
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
					<!-- 로그인 폼 바꿔봄봄봄봄봄보몹몹모 -->
					<div class="login-box">
						<div class="login-logo">
							<a href="../home/main" class="hidden-xs"><b>WhenWhere</b></a>
						</div>
						<!-- /.login-logo -->
						<div class="login-box-body">
							<p class="login-box-msg">
								<b>로그인</b>
							</p>
							<form action="../../index2.html" method="post">
								<div class="form-group has-feedback">
									<input type="email" class="form-control" placeholder="Email" name="email" value="whenwhere@gmail.com" >
									<span
										class="glyphicon glyphicon-envelope form-control-feedback"></span>
								</div>
								<div class="form-group has-feedback">
									<input type="password" class="form-control"
										placeholder="Password" name="password" value="whenwhere"> <span
										class="glyphicon glyphicon-lock form-control-feedback"></span>
								</div>
								<div class="row">
									<button type="button" onclick="login();"
										class="btn btn-success btn-block btn-flat">로그인</button>
								</div>
							</form>

							<div class="row">
								<p class="text-center">- OR -</p>
								<a href="../home/register" class="btn btn-primary btn-block btn-flat">회원
									가입</a>
								<a href="#" class="btn btn-warning btn-block btn-flat">아이디/비밀번호
									찾기</a>
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