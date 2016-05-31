<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<title>WhenWhere</title>
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<meta name="generator" content="Codeply">

<link rel="stylesheet"
	href="//maxcdn.bootstrapcdn.com/bootstrap/3.3.4/css/bootstrap.min.css" />
<link rel="stylesheet"
	href="//cdnjs.cloudflare.com/ajax/libs/animate.css/3.1.1/animate.min.css" />
<link rel="stylesheet"
	href="//code.ionicframework.com/ionicons/2.0.1/css/ionicons.min.css" />
<link rel="stylesheet" href="../css/home/join.css" />

<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/1.7.2/jquery.min.js"></script>
<script src="../js/jqBootstrapValidation.js"></script>
<script type="text/javascript">
	var error = "${error}";
	var status = "${status}";
	var checkAjaxSetTimeout;
	
	$(function() {
		$("input,select,textarea").not("[type=submit]").jqBootstrapValidation();
		if(status=="true"){
			$(".disabled-form").removeAttr("readonly");
			$("input#inputEmail").val("${email}");
		}else{
			$(".disabled-form").attr("placeholder", "이메일 인증을 먼저 받으세요");
		}
		if (error == "true") {
			alert("잘못된 접근입니다.");
		}
		
		$("#email").keyup(function() {
			clearTimeout(checkAjaxSetTimeout);
			checkAjaxSetTimeout = setTimeout(function() {
				if ($("#email").val() != "") {
					emailDupCk();
				}
			}, 500);
		});
		
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
		var email = new Object();
		email.receiver = $('#email').val();
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
	}
	
	function emailDupCk() {
		jobj = {};
		jobj.email = $("#email").val();
		$.ajax({
			type : "post",
			url : "../user/emailDupCk",
			data : jobj,
			dataType : "json",
			success : function(data) {
				if (data.ok) {
					$("#emailCk").html($("#email").val() + '는 이미 가입 된 이메일 입니다.');
					$("#emailCk").css("color", "red");
					$("#email").css("border", "red 1px solid");
					$("#email").css("color", "red");
				} else {
					$("#emailCk").html($("#email").val() + '는 사용가능한 이메일 입니다.');
					$("#emailCk").css("color", "green");
					$("#email").css("border", "green 1px solid");
					$("#email").css("color", "green");
				}
			}
		})
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
					$("#nicknameCk").html($("input[name=nickname]").val() + '는 사용중인 닉네임 입니다.');
					$("#nicknameCk").css("color", "red");
					$("#nickname").css("border", "red 1px solid");
					$("#nickname").css("color", "red");
				} else {
					$("#nicknameCk").html($("input[name=nickname]").val() + '는 사용가능한 닉네임 입니다.');
					$("#nicknameCk").css("color", "green");
					$("#nickname").css("border", "green 1px solid");
					$("#nickname").css("color", "green");
				}
			}
		})
	}
</script>

</head>

<!-- user/join -->
<body>
	<div class="contentwrap">
		<article class="container">
		<div class="page-header">
			<h1>
				회원가입 <small>일반회원가입</small>
			</h1>
		</div>

		<form class="form-horizontal">
			<div class="form-group control-group">
				<label for="inputNumber" class="col-sm-2 control-label">이메일</label>
				<div class="col-sm-4 controls">
					<input type="email" class="form-control" id="email" name="email"
						placeholder="id @ ~.com"
						data-validation-email-message="이메일 형식이 아닙니다.">
					<p class="help-block"><span id="emailCk"></span></p>
				</div>
				<div class="col-sm-2">
					<a class="btn btn-default" onclick="checkEmail();" role="button">이메일인증</a>
				</div>
			</div>
			<div class="form-group control-group">
				<label for="inputPassword" class="col-sm-2 control-label">비밀번호</label>
				<div class="col-sm-6 controls">
					<input type="password" class="form-control disabled-form"
						placeholder="숫자, 특수문자 포함 8자 이상 20자 이하"
						name="password"  readonly
						data-validation-password-regex="(^.(?=.*[0-9])(?=.*[a-zA-Z]).*$)"
						data-validation-password-message="알파벳과 숫자를 포함하여야 합니다."
						minlength="8" data-validation-minlength-message="8자 이상 이어야합니다."
						maxlength="20">
					<p class="help-block"></p>
				</div>
			</div>
			<div class="form-group control-group">
				<label for="inputPasswordCheck" class="col-sm-2 control-label">비밀번호	확인</label>
				<div class="col-sm-6 controls">
					<input type="password" class="form-control disabled-form"
						placeholder="비밀번호를 한번더 입력 하세요."
						data-validation-matches-match="password"
						data-validation-matches-message="두 비밀번호가 일치하지 않습니다." readonly>
					<p class="help-block"></p>
				</div>
			</div>
			<div class="form-group control-group">
				<label for="inputName" class="col-sm-2 control-label">닉네임</label>
				<div class="col-sm-6 controls">
					<input type="text" class="form-control disabled-form" id="nickname"
							name="nickname" placeholder="닉네임 10자 이내" readonly
							minlength="2" data-validation-minlength-message="2자 이상 이어야합니다."
							maxlength="10" data-validation-maxlength-message="10자 이하 이어야합니다."
							data-validation-spaceCK-regex="(\S*)"
							data-validation-spaceCK-message="공백은 없어야 합니다.">
					<p class="help-block"><span id="nicknameCk"></span></p>
				</div>
			</div>
			<div class="form-group control-group">
				<label for="inputName" class="col-sm-2 control-label">전화번호</label>
				<div class="col-sm-6 controls">
					<input type="text" class="form-control disabled-form"
						name="phoneNumber" placeholder="010-1234-5678" readonly>
					<p class="help-block"></p>
				</div>
			</div>
			<div class="form-group">
				<label for="inputName" class="col-sm-2 control-label"></label>
				<div class="col-sm-6">
					<button type="submit" class="btn btn-primary">회 원 가 입</button>
				</div>
			</div>
		</form>
		</article>
	</div>
	<jsp:include page="../component/footer.jsp" />
</body>
</html>