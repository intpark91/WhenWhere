<%@ page contentType="text/html; charset=EUC-KR" pageEncoding="EUC-KR"%>
<nav id="topNav" class="navbar navbar-default navbar-fixed-top">
	<div class="container-fluid">
		<div class="navbar-header">
			<button type="button" class="navbar-toggle collapsed"
				data-toggle="collapse" data-target="#bs-navbar">
				<span class="sr-only">Toggle navigation</span> <span
					class="icon-bar"></span> <span class="icon-bar"></span> <span
					class="icon-bar"></span>
			</button>
			<a class="navbar-brand page-scroll" href="#first"><i
				class="ion-ios-analytics-outline"></i> WhenWhere</a>
		</div>
		<div class="navbar-collapse collapse" id="bs-navbar">
			<ul class="nav navbar-nav">
				<li><a class="page-scroll" href="#">WHEN?</a></li>
				<li><a class="page-scroll" href="#">한글</a></li>
				<li><a class="page-scroll" href="#">TOGETHER</a></li>
				<li><a class="page-scroll" href="#">REVIEW</a></li>
				<li><a class="page-scroll" href="#">WITH ME</a></li>
			</ul>
			<ul class="nav navbar-nav navbar-right">
				<li>
				<input type="checkbox" checked data-toggle="toggle" data-on="<i class='fa fa-play'></i> Play" data-off="<i class='fa fa-pause'></i> Pause">
				</li>
				<li><a href="#video-background" id="toggleVideo"
					data-toggle="collapse">stop</a></li>
				<li><a class="page-scroll" data-toggle="modal"
					title="A free Bootstrap video landing theme" href="#aboutModal">로그인</a>
				</li>
			</ul>
		</div>
	</div>
</nav>


<div id="aboutModal" class="modal fade" tabindex="-1" role="dialog"
	aria-hidden="true">
	<div class="modal-dialog">
		<div class="modal-content">
			<div class="modal-body">
				<h2 class="text-center">로그인</h2>
				<h5 class="text-center">로그인창이야</h5>
				<p class="text-justify"></p>
				<div class="cd-login">
					<form class="cd-form text-center">
						<p class="fieldset">
							<label class="image-replace cd-email" for="signin-email">E-mail</label>
							<input class="full-width has-padding has-border"
								id="signin-email" type="email" placeholder="E-mail">
						</p>

						<p class="fieldset">
							<label class="image-replace cd-password" for="signin-password">Password</label>
							<input class="full-width has-padding has-border"
								id="signin-password" type="password" placeholder="Password">
						</p>

						<p class="fieldset">
							<input type="checkbox" id="remember-me" checked> <label
								for="remember-me">Remember me</label> <a href="#0">Forgot
								your password?</a>

						</p>

						<p class="fieldset top_fieldset">
							<button class="btn btn-primary btn-lg center-block" type="submit"
								data-dismiss="modal" aria-hidden="true" data-dismiss="modal">login</button>
							<br/>
							<a href="#joinModal" data-toggle="modal"><button class="btn btn-primary btn-lg center-block" type="submit"
								data-toggle="modal" aria-hidden="true" data-dismiss="modal">join us</button></a>
						</p>
					</form>
				</div>
				<br />
			</div>
		</div>
	</div>
</div>

<div id="joinModal" class="modal" tabindex="-1" role="dialog" aria-hidden="true">
	<div class="modal-dialog">
		<div class="modal-content">
			<div class="modal-join cd-form-join">
				<h2 class="text-center"> 회원가입 </h2>
				<h5 class="text-center"> 회원가입을 위한 페이지 입니다.</h5>
				<p class="text-justify"></p>
				<div class="contentwrap">
				    <form class="form-horizontal">
					    <div class="form-group">
					    	<label for="inputEmail" class="col-sm-3 control-label">이메일</label>
						    <div class="col-sm-5">
						    	<input type="email" class="full-width has-padding has-border" id="inputEmail" placeholder="이메일">
						    </div>
						    <div class="col-sm-1">
					      		<a class="btn btn-default" href="#" role="button">이메일 인증</a>
					      	</div>
					    </div>
					    <div class="form-group">
					    	<label for="inputNumberCheck" class="col-sm-3 control-label">인증번호 확인</label>
					    	<div class="col-sm-6">
					    		<input type="text" class="full-width has-padding has-border" id="inputNumberCheck" placeholder="인증번호입력">
					    		<p class="join-help-block">전송된 인증번호를 입력해주세요.</p>
					    	</div>
					    </div>
					    <div class="form-group">
						    <label for="inputPassword" class="col-sm-3 control-label">비밀번호</label>
						    <div class="col-sm-6">
						    	<input type="password" class="full-width has-padding has-border" id="inputPassword" placeholder="비밀번호">
						    </div>
					    </div>
					    <div class="form-group">
					    	<label for="inputPasswordCheck" class="col-sm-3 control-label">비밀번호 확인</label>
					   		<div class="col-sm-6">
					    		<input type="password" class="full-width has-padding has-border" id="inputPasswordCheck" placeholder="비밀번호 확인">
					    		<p class="join-help-block">숫자, 특수문자 포함 8자 이상</p>
					    	</div>
					    </div>
					    <div class="form-group join-group">
					    	<label for="inputName" class="col-sm-3 control-label"></label>
					    	<div class="col-sm-6">
					      		<button type="submit" class="btn btn-primary">회원가입</button> 
					      		<button type="reset" data-dismiss="modal" class="btn btn-primary">취소</button>
					    	</div>
					    </div>
				    </form>
				</div>
				<br />
			</div>
		</div>
	</div>
</div>