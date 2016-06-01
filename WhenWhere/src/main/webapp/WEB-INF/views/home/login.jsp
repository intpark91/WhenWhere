<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
	<title>WhenWhereTest</title>
	<jsp:include page="../component/JS_CSS/login_css.jsp" />
	<script src="https://code.jquery.com/jquery-2.1.1.js"></script>
	<script type="text/javascript">
		
		function login(){
			alert("login try");
			var loginSer = $('form').serialize();
			alert(loginSer);
			$.ajax({
				url : '../user/login',
				type : 'POST',
				data : loginSer ,
				dataType : "json",
				success : function(check) {
					if(check.ok){
						alert('로그인 성공');
						location.href="../home/main";
					}else{
						alert('로그인 실패');
					}
				},
				error : function(xhr, data, error) {
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