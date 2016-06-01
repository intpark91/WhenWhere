<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
	<title>WhenWhereTest</title>
	<jsp:include page="../component/JS_CSS/login_css.jsp" />
	<script type="text/javascript">
		
		function checkLogin(){
			var loginSer = $('form').serialize();
			$.ajax({
				url : '../user/login',
				type : 'POST',
				data : loginSer ,
				success : function(check) {
					if(check.ok){
						alert('이메일 인증을 위한 메일보내기 성공');
						location.href = "";
					}else{
						alert('이메일 인증을 위한 메일보내기 실패');
					}
				},
				error : function(hxr, data, error) {
					console.log(error);
				},
				complete : function() {
					//alert('요청처리 완료');
				}
			});
		}
	</script>
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
							<div class="col-md-6 col-xs-6 follow line" align="center">
								<h3>
									125651 <br /> <span>FOLLOWERS</span>
								</h3>
							</div>
							<div class="col-md-6 col-xs-6 follow line" align="center">
								<h3>
									125651 <br /> <span>FOLLOWERS</span>
								</h3>
							</div>
							<div class="col-md-12 col-xs-12 login_control">
								<div class="control">
									<div class="label">Email Address</div>
									<input type="text" class="form-control" value="admin@gmail.com" />
								</div>

								<div class="control">
									<div class="label">Password</div>
									<input type="password" class="form-control" value="123456" />
								</div>
								<div align="center">
									<button class="btn btn-orange" onclick="checkLogin();">LOGIN</button>
								</div>
							</div>
						</div>
					</div>
				</form>
			<!-- end:Main Form --> </section>
			<!-- /.content -->
		</div>

		<!-- /.content-wrapper -->
		<!-- include -->
		<jsp:include page="../component/footer.jsp" />
		<jsp:include page="../component/controlSidebar.jsp" />
	</div>
	<!-- scripts -->
	<jsp:include page="../component/JS_CSS/login_js.jsp" />
</body>
</html>