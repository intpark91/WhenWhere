<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<title>WhenWhereTest</title>
<meta name="description"
	content="This is a free Bootstrap landing page theme created for BootstrapZero. Feature video background and one page design." />
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<meta name="generator" content="Codeply">
  <link rel="stylesheet" href="../css/bootstrap.min.css">
  <!-- Font Awesome -->
  <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.5.0/css/font-awesome.min.css">
  <!-- Ionicons -->
  <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/ionicons/2.0.1/css/ionicons.min.css">
  <!-- Theme style -->
  <link rel="stylesheet" href="../css/AdminLTE.css">
  <!-- AdminLTE Skins. We have chosen the skin-blue for this starter
        page. However, you can choose any other skin. Make sure you
        apply the skin class to the body tag so the changes take effect.
  -->
  <link rel="stylesheet" href="../css/skin-blue.css">
  <link rel="stylesheet" href="//code.ionicframework.com/ionicons/2.0.1/css/ionicons.min.css" />	

  <!-- HTML5 Shim and Respond.js IE8 support of HTML5 elements and media queries -->
  <!-- WARNING: Respond.js doesn't work if you view the page via file:// -->
  <!--[if lt IE 9]>
  <script src="https://oss.maxcdn.com/html5shiv/3.7.3/html5shiv.min.js"></script>
  <script src="https://oss.maxcdn.com/respond/1.4.2/respond.min.js"></script>
  <![endif]-->
<style type="text/css">
  body {
  margin : 0;
  padding : 0;
  background : url (img.jpg) center center fixed no-repeat;
}
video{
		 position : fixed;
		 top : 0; 
		 left : 0;
		 min-width : 100%;
		 min-height : 100%;
		 width : auto;
		 height : auto;	
		 z-index : -1;
		 }
		
</style>

</head>
<body class="hold-transition skin-blue sidebar-mini sidebar-collapse">
	<div class="wrapper">
		<video autoplay loop poster = "img.jpg" id="video-background">
		<source src = "../resources/video/test3.mp4" type = "video/mp4">
		</video>
	<jsp:include page="../component/topNav.jsp" />

	<div class="content-wrapper">
		<!-- Content Header (Page header) -->
		<section class="content-header">
		
		</section>

		<!-- Main content -->
		<section class="content">

			<!-- Your Page Content Here -->

		</section>
		<!-- /.content -->
	</div>

	<jsp:include page="../component/footer.jsp" />

	<aside class="control-sidebar control-sidebar-dark">
		<!-- Create the tabs -->
		<ul class="nav nav-tabs nav-justified control-sidebar-tabs">
			<li class="active"><a href="#control-sidebar-home-tab"
				data-toggle="tab"><i class="fa fa-home"></i></a></li>
			<li><a href="#control-sidebar-settings-tab" data-toggle="tab"><i
					class="fa fa-gears"></i></a></li>
		</ul>
		<!-- Tab panes -->
		<div class="tab-content">
			<!-- Home tab content -->
			<div class="tab-pane active" id="control-sidebar-home-tab">
				<h3 class="control-sidebar-heading">Recent EVENT</h3>
				<ul class="control-sidebar-menu">
					<li><a href="javascript::;"> <i
							class="menu-icon fa fa-birthday-cake bg-red"></i>

							<div class="menu-info">
								<h4 class="control-sidebar-subheading">WhenWhereTeam will
									make a brand new web site</h4>

								<p>5월 23일 ~ 6월 17일</p>
							</div>
					</a></li>
				</ul>

			</div>
			<div class="tab-pane" id="control-sidebar-stats-tab">Stats Tab
				Content</div>
			<div class="tab-pane" id="control-sidebar-settings-tab">
				<form method="post">
					<h3 class="control-sidebar-heading">설정</h3>
					<div class="form-group">
						<label class="control-sidebar-subheading"> 배경 화면 정지 
						
						<a href="#video-background" id="toggleVideo" data-toggle="collapse"> 
						<span id="span"> 
						<input type="checkbox" id="toggleVideo" checked data-toggle="toggle"
							data-on="<i class='fa fa-play' aria-expanded='true'></i> Play"
							data-off="<i class='collapsed' aria-expanded='false'></i> Pause">
						</span>
						</a>
						</label>
						
						<p>배경화면을 멈춥니다.</p>
					</div>
				</form>
			</div>
		</div>
	</aside>
	<div class="control-sidebar-bg"></div>
	</div>
	<script src="../js/jQuery-2.2.0.min.js"></script>
	<script src="../js/bootstrap.min.js"></script>
	<script src="../js/app.min.js"></script>
</body>
</html>