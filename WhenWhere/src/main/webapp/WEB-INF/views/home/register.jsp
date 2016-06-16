<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<jsp:include page="../component/core_head.jsp" />
<title>WhenWhere</title>
</head>

<!-- user/join -->
<body class="hold-transition skin-blue sidebar-mini sidebar-collapse">
	<div class="wrapper">
		<!-- include -->
		<jsp:include page="../component/header.jsp" />
		<jsp:include page="../component/linkSidebar.jsp" />
		<!-- Content Wrapper. Contains page content -->

		<div class="content-wrapper">
			<div class="register-box">
				<div class="register-logo">
					<a href="../../index2.html" class="hidden-xs"><b>WhenWhere</b></a>
				</div>

				<div class="register-box-body">
					<p class="login-box-msg">
						<b>가입하기</b>
					</p>
					<form data-toggle="validator" role="form">

						<div class="form-group has-feedback">
							<div class="input-group">
								<span class="input-group-addon"><span
									class="glyphicon glyphicon-envelope"></span></span> 
									<input type="email" name="email" pattern="^[_A-z0-9]+[@].+[.].+$" maxlength="50"
									class="form-control" id="inputEmail" data-remote="../user/emailValidator"
									placeholder="you@example.com" required>
							</div>
							<span class="glyphicon form-control-feedback" aria-hidden="true"></span>
							<div class="help-block with-errors"></div>
							<a href="javascript:checkEmail();" class="btn btn-primary">이메일 인증</a>
						</div>

						<div class="form-group has-feedback">
							<div class="input-group">
								<span class="input-group-addon"><span
									class="glyphicon glyphicon-user"></span></span> 
									<input type="text" data-minlength="2" maxlength="10" class="form-control"
									id="inputNickname" placeholder="별명 2~10 글자" readonly="readonly" required>
							</div>
							<span class="glyphicon form-control-feedback" aria-hidden="true"></span>
							<div class="help-block with-errors"></div>
						</div>

						<div class="form-group has-feedback">
							<div class="input-group">
								<span class="input-group-addon"><span
									class="glyphicon glyphicon-lock"></span></span> 
									<input type="password" data-minlength="8" maxlength="20" class="form-control"
									id="inputPassword" placeholder="비밀번호 영문, 숫자 포함  8에서 20자"
									readonly="readonly" required>
							</div>
							<span class="glyphicon form-control-feedback" aria-hidden="true"></span>
							<div class="help-block with-errors"></div>
						</div>

						<div class="form-group has-feedback">
							<div class="input-group">
								<span class="input-group-addon"><span
									class="glyphicon glyphicon-log-in"></span></span> <input
									type="password" maxlength="20" class="form-control"
									id="inputPasswordConfirm" data-match="#inputPassword"
									data-match-error="입력하신 비밀번호와 일치하지 않습니다." placeholder="비밀번호 확인"
									readonly="readonly" required>
							</div>
							<span class="glyphicon form-control-feedback" aria-hidden="true"></span>
							<div class="help-block with-errors"></div>
						</div>

						<div class="form-group">
							<div class="input-group">
								<span class="input-group-addon"><span
									class="glyphicon glyphicon-phone"></span></span> <input
									type="password" data-minlength="10" class="form-control"
									id="inputPasswordConfirm" placeholder="핸드폰 번호(필수X)"  readonly="readonly">
							</div>
							<span class="glyphicon form-control-feedback" aria-hidden="true"></span>
							<div class="help-block with-errors"></div>
						</div>


						<div class="row">
							<button type="submit" class="btn btn-primary btn-block btn-flat">가입하기</button>
						</div>
					</form>
					<div class="row">
						<p class="text-center">- OR -</p>
						<a href="../home/loginForm"
							class="btn btn-block btn-success btn-flat">이미 계정이 있습니다.</a>
					</div>
				</div>
			</div>
		</div>
		<!-- /.content-wrapper -->

		<jsp:include page="../component/footer.jsp" />
		<jsp:include page="../component/controlSidebar.jsp" />
	</div>
	<!-- scripts -->
	<jsp:include page="../component/core_js.jsp" />
	<script src="../js/validator.js"></script>
	<script type="text/javascript">
		var error = "${error}";
		var status = "${status}";
		var checkAjaxSetTimeout;

		$(function() {
			if (status == "true") {
				$(".input-group input").removeAttr("readonly");
				$("input#inputEmail").val("${email}");
			} else {
				$(".input-group input:gt(0)").attr("placeholder", "이메일 인증을 먼저 받으세요");
			}
			if (error == "true") {
				alert("잘못된 접근입니다.");
			}

		/* 	$("#inputEmail").keyup(function() {
				clearTimeout(checkAjaxSetTimeout);
				checkAjaxSetTimeout = setTimeout(function() {
					if ($("#inputEmail").val() != "") {
						emailDupCk($("#inputEmail").val());
					}
				}, 500);
			}); */

			$("#nickname").keyup(function() {
				clearTimeout(checkAjaxSetTimeout);
				checkAjaxSetTimeout = setTimeout(function() {
					if ($("#nickname").val() != "") {
						nicknameDupCk();
					}
				}, 500);
			});
		})

		function checkEmail() {
			var dup;
			function emailDupCk() {
				jobj = {};
				jobj.email = $("#inputEmail").val();
				$.ajax({
					type : "post",
					url : "../user/emailDupCk",
					data : jobj,
					dataType : "json",
					success : function(data) {
						dup = data.ok;	
					}
				})
			}
			if(dup){
				var email = new Object();
				email.receiver = $('#inputEmail').val();
				$.ajax({
					url : '../user/sendEmail',
					type : 'POST',
					data : email,
					success : function(check) {
						if (check.ok) {
							alert('이메일 인증을 위한 메일보내기 성공');
						} else {
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
			}else{
				alert("already signed up");
			}
		}
		
		function nicknameDupCk() {
			jobj = {};
			jobj.nickname = $("#nickname").val();
			$.ajax({
				type : "post",
				url : "../user/nicknameDupCk",
				data : jobj,
				dataType : "json",
				success : function(data) {
					if (data.ok) {
						$("#nicknameCk").html(
								$("input[name=nickname]").val()
										+ '는 사용중인 닉네임 입니다.');
						$("#nicknameCk").css("color", "red");
						$("#nickname").css("border", "red 1px solid");
						$("#nickname").css("color", "red");
					} else {
						$("#nicknameCk").html(
								$("input[name=nickname]").val()
										+ '는 사용가능한 닉네임 입니다.');
						$("#nicknameCk").css("color", "green");
						$("#nickname").css("border", "green 1px solid");
						$("#nickname").css("color", "green");
					}
				}
			})
		}
	</script>
</body>
</html>