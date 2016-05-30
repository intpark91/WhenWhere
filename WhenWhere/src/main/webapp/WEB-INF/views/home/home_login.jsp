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
<link rel="stylesheet" href="../css/home/login.css" />
<!-- 
<script src="//ajax.googleapis.com/ajax/libs/jquery/1.9.1/jquery.min.js"></script>
<script src="//maxcdn.bootstrapcdn.com/bootstrap/3.3.4/js/bootstrap.min.js"></script> -->
<link rel="stylesheet" href="//maxcdn.bootstrapcdn.com/font-awesome/4.3.0/css/font-awesome.min.css">
<link href='http://fonts.googleapis.com/css?family=Varela+Round' rel='stylesheet' type='text/css'>

<script src="https://cdnjs.cloudflare.com/ajax/libs/jquery-validate/1.13.1/jquery.validate.min.js"></script>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.7.2/jquery.min.js"></script>
<script src="../js/jqBootstrapValidation.js"></script>
<script type="text/javascript">
	
	function checkEmail(){
	
		var emailObj = new Object();
		emailObj.email = $('#inputEmail').val();
		
		$.ajax({
			url : '../user/sendEmail',
			type : 'POST',
			data : emailObj ,
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
			<h1 class="class_h1">
				로그인 <small>로그인 페이지 </small>
			</h1>
		</div>
		<form class="form-horizontal">
			<!-- LOGIN FORM -->
<div class="container">
	<div class="row login_box">
	    <div class="col-md-12 col-xs-12" align="center">
            <div class="line"><h3>12 : 30 AM</h3></div>
            <div class="outter"><img src="http://cfile1.uf.tistory.com/image/220ACD49543246531DCC3C" class="image-circle"/></div>   
            <h1>환영합니다</h1>
            <span> When & Where</span>
	    </div>
        <div class="col-md-6 col-xs-6 follow line" align="center">
            <h3>
                 125651 <br/> <span>FOLLOWERS</span>
            </h3>
        </div>
        <div class="col-md-6 col-xs-6 follow line" align="center">
            <h3>
                 125651 <br/> <span>FOLLOWERS</span>
            </h3>
        </div>
        
        <div class="col-md-12 col-xs-12 login_control">
                
                <div class="control">
                    <div class="label">Email Address</div>
                    <input type="text" class="form-control" value="admin@gmail.com"/>
                </div>
                
                <div class="control">
                     <div class="label">Password</div>
                    <input type="password" class="form-control" value="123456"/>
                </div>
                <div align="center">
                     <button class="btn btn-orange">LOGIN</button>
                </div>
                
        </div>
    
            
    </div>
</div>
		</form>
	</div>
	<!-- end:Main Form -->
</div>
</body>
</html>