<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<title>WhenWhereTest</title>
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<meta name="generator" content="Codeply">

<link rel="stylesheet" href="//maxcdn.bootstrapcdn.com/bootstrap/3.3.4/css/bootstrap.min.css" />
<link rel="stylesheet" href="//cdnjs.cloudflare.com/ajax/libs/animate.css/3.1.1/animate.min.css" />
<link rel="stylesheet" href="//code.ionicframework.com/ionicons/2.0.1/css/ionicons.min.css" />
<link rel="stylesheet" href="../css/home/join.css" />
<!-- 
<script src="//ajax.googleapis.com/ajax/libs/jquery/1.9.1/jquery.min.js"></script>
<script src="//maxcdn.bootstrapcdn.com/bootstrap/3.3.4/js/bootstrap.min.js"></script> -->
<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.7.2/jquery.min.js"></script>
<script src="../js/jqBootstrapValidation.js"></script>
<script type="text/javascript">
var error = "${error}"
var status = "${status}";
	$(function(){
		if(status=="true"){
			$(".disabled-form").attr("readonly", "false");
			$("input#inputEmail").text("${email}");
		}
		if(error=="true"){
			alert("잘못된 접근입니다.");
		}
	})
	
	function checkEmail(){
	
		var email = new Object();
		email.receiver= $('#inputEmail').val();
		
		$.ajax({
			url : '../user/sendEmail',
			type : 'POST',
			data : email ,
			success : function(check) {
				if(check.ok){
					alert('이메일 인증을 위한 메일보내기 성공');
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
<body>
	<div class="contentwrap">
		<article class="container">
		<div class="page-header">
			<h1>
				회원가입 <small>일반회원가입</small>
			</h1>
		</div>
		<form class="form-horizontal">
			<div class="form-group">
				<label for="inputNumber" class="col-sm-2 control-label">이메일</label>
				<div class="col-sm-4">
					<input type="text" class="form-control" id="inputEmail" placeholder="id @ ~.com">
					<p class="help-block">@ 포함 적어주세요.</p>
				</div>
				<div class="col-sm-2">
					<a class="btn btn-default" onclick="checkEmail();" role="button">이메일인증</a>
				</div>
			</div>
			<div class="form-group">
				<label for="inputPassword" class="col-sm-2 control-label">비밀번호</label>
				<div class="col-sm-6">
					<input type="password" class="form-control disabled-form" id="inputPassword" placeholder="비밀번호" readonly>
					<p class="help-block">숫자, 특수문자 포함 8자 이상</p>
				</div>
			</div>
			<div class="form-group">
				<label for="inputPasswordCheck" class="col-sm-2 control-label">비밀번호
					확인</label>
				<div class="col-sm-6">
					<input type="password" class="form-control disabled-form" id="inputPasswordCheck" placeholder="비밀번호 확인" readonly>
					<p class="help-block">비밀번호를 한번 더 입력해주세요.</p>
				</div>
			</div>
			<div class="form-group">
				<label for="inputName" class="col-sm-2 control-label">닉네임</label>
				<div class="col-sm-6">
					<input type="text" class="form-control disabled-form" id="inputName" placeholder="닉네임" readonly>
				</div>
			</div>
			<div class="form-group">
				<label for="inputAgree" class="col-sm-2 control-label">약관 동의</label>
				<div class="col-sm-6 checkbox">
					<label> <input id="agree" type="checkbox"> <a
						href="/agreement"> 이용약관</a>에 동의합니다.
					</label>
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