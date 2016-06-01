<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!-- Main Header -->
<header class="main-header">

	<!-- Logo -->
	<a href="main" class="logo"> <!-- mini logo for sidebar mini 50x50 pixels -->
		<span class="logo-mini"><b>WW</b></span> <!-- logo for regular state and mobile devices -->
		<span class="logo-lg"><b>W</b>hen<b>W</b>here</span>

	</a>

	<!-- Header Navbar -->
	<nav class="navbar navbar-static-top" role="navigation">
		<!-- Sidebar toggle button-->
		<a href="#" class="sidebar-toggle" data-toggle="offcanvas"
			role="button"> <span class="sr-only">Toggle navigation</span>
		</a>
		<!-- Navbar Right Menu -->
		<div class="navbar-custom-menu">
			<ul class="nav navbar-nav">
				<!-- Messages: style can be found in dropdown.less-->
				<li class="dropdown messages-menu">
					<!-- Menu toggle button --> <a href="#" class="dropdown-toggle"
					data-toggle="dropdown"> <i class="fa fa-envelope-o"></i> <span
						class="label label-success">4</span>
				</a>
					<ul class="dropdown-menu">
						<li class="header">You have 2 new messages</li>
						<li>
							<!-- inner menu: contains the messages -->
							<ul class="menu">
								<li>
									<!-- start message --> <a href="#">
										<div class="pull-left">
											<!-- User Image -->
											<img
												src="https://live.namuwikiusercontent.com/81/8141a5ed37a563c4142f1a65aca1c5ff7e213ea9e429ecc2cae2ac9c11bb1d63.jpg"
												class="img-circle" alt="User Image">
										</div> <!-- Message title and timestamp -->
										<h4>
											WhenWhereTeam <small><i class="fa fa-clock-o"></i> 5
												mins</small>
										</h4> <!-- The message -->
										<p>�������몄�� WhenWhereTeam������.</p>
								</a>
								</li>
								<!-- end message -->
								<li>
									<!-- start message --> <a href="#">
										<div class="pull-left">
											<!-- User Image -->
											<img
												src="https://live.namuwikiusercontent.com/81/8141a5ed37a563c4142f1a65aca1c5ff7e213ea9e429ecc2cae2ac9c11bb1d63.jpg"
												class="img-circle" alt="User Image">
										</div> <!-- Message title and timestamp -->
										<h4>
											WhenWhereTeam <small><i class="fa fa-clock-o"></i> 6
												mins</small>
										</h4> <!-- The message -->
										<p>�������몄�� WhenWhereTeam������.2</p>
								</a>
								</li>
								<!-- end message -->
							</ul> <!-- /.menu -->
						</li>
						<li class="footer"><a href="#">See All Messages</a></li>
					</ul>
				</li>
				<!-- /.messages-menu -->

				<!-- Notifications Menu -->
				<li class="dropdown notifications-menu">
					<!-- Menu toggle button --> <a href="#" class="dropdown-toggle"
					data-toggle="dropdown"> <i class="fa fa-bell-o"></i> <span
						class="label label-warning">10</span>
				</a>
					<ul class="dropdown-menu">
						<li class="header">You have 10 notifications</li>
						<li>
							<!-- Inner Menu: contains the notifications -->
							<ul class="menu">
								<li>
									<!-- start notification --> <a href="#"> <i
										class="fa fa-users text-aqua"></i> 5 new members joined today
								</a>
								</li>
								<!-- end notification -->
							</ul>
						</li>
						<li class="footer"><a href="#">View all</a></li>
					</ul>
				</li>
				
				<!-- login -->
				<li class="login" display="none">
				<a href="login">
					<i class="fa fa-sign-in" aria-hidden="true" style="font-size: 20px;"></i>
					<span class="hidden-xs" style="font-size: 20px;">&nbsp;LOGIN</span>
				</a>
				</li>
				
				<!-- User Account Menu -->
				<li class="dropdown user user-menu logined" display="none">
					<!-- Menu Toggle Button  -->
				<a href="#" class="dropdown-toggle" data-toggle="dropdown"> 
						<!-- The user image in the navbar  -->
						<img src="https://www.dog-zzang.co.kr/dog_sale/photo/201603/1457282732_13629600.jpg"
						class="user-image" alt="User Image"> <!-- hidden-xs hides the username on small devices so only the image appears. -->
						<span class="hidden-xs">NICKNAME</span>
				</a>
					<ul class="dropdown-menu">
						<!-- The user image in the menu -->
						<li class="user-header"><img
							src="https://www.dog-zzang.co.kr/dog_sale/photo/201603/1457282732_13629600.jpg"
							class="img-circle" alt="User Image">
							<p>
								NICKNAME <small>WhenWhereTeam@gmail.com</small>
							</p></li>
						<!-- Menu Footer -->
						<li class="user-footer">
							<div class="pull-left">
								<a href="#" class="btn btn-default btn-flat">My Page</a>
							</div>
							<div class="pull-right">
								<a href="#" class="btn btn-default btn-flat">Log out</a>
							</div>
						</li>
					</ul>
				</li>
				
				<!-- Control Sidebar Toggle Button -->
				<li><a href="#" data-toggle="control-sidebar"><i
						class="fa fa-gears"></i></a></li>
			</ul>
		</div>
	</nav>
	<script type="text/javascript">
		$(function() {
			if ("${userid}" == "username") {
				$(".logined").css("display", "none");
				$(".login").css("display", "block");
			} else {
				$(".login").css("display", "none");
				$(".logined").css("display", "block");
			}
		});
		function msgPopup() {
			var popup = "../user/msgPopup";
			var popOption = "width=700, height=400, top=200, left=200";
			window.open(popup, "", popOption);
		}
	</script>
</header>
