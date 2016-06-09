<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<!-- Main Header -->
<header class="main-header">

	<!-- Logo -->
	<a href="../home/main" class="logo"> <!-- mini logo for sidebar mini 50x50 pixels -->
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
				<li class="dropdown messages-menu logined"><a href="#"
					class="dropdown-toggle" data-toggle="dropdown"> <i
						class="fa fa-envelope-o"></i> <span
						class="label label-warning notifyCnt"></span>
				</a>
					<ul class="dropdown-menu">
						<li class="header"><span id="newMsgCnt"></span></li>
						<li id="newMsgs"></li>
						<li class="footer"><a href="javascript:msgPopup('msgbox?page=1');">전체 메시지 보기</a></li>
					</ul></li>
				<!-- /.messages-menu -->

				<!-- Notifications Menu -->
				<!--<li class="dropdown notifications-menu logined">
					<a href="#" class="dropdown-toggle"	data-toggle="dropdown">
						<i class="fa fa-bell-o"></i>
						<span class="label label-warning">10</span>
					</a>
					<ul class="dropdown-menu">
						<li class="header">You have 10 notifications</li>
						<li>
							Inner Menu: contains the notifications
							<ul class="menu">
								<li>
									start notification <a href="#"> <i
										class="fa fa-users text-aqua"></i> 5 new members joined today
								</a>
								</li>
								end notification
							</ul>
						</li>
						<li class="footer"><a href="#">View all</a></li>
					</ul>
				</li> -->

				<!-- login -->
				<li class="login" style="display: none"><a
					href="../home/loginForm"> <i class="fa fa-sign-in"
						aria-hidden="true" style="font-size: 20px;"></i> <span
						class="hidden-xs" style="font-size: 20px;">&nbsp;LOGIN</span>
				</a></li>

				<!-- User Account Menu -->
				<li class="dropdown user user-menu logined" style="display: none">
					<!-- Menu Toggle Button  --> <a href="#" class="dropdown-toggle"
					data-toggle="dropdown"> <!-- The user image in the navbar  -->
						<img src='../resources/img/user.png' class="user-image" alt="User Image"> <!-- hidden-xs hides the username on small devices so only the image appears. -->
						<span class="hidden-xs" id="member_nickname"></span>
				</a>
					<ul class="dropdown-menu">
						<!-- The user image in the menu -->
						<li class="user-header"><img src="../resources/img/user.png" class="img-circle"
							alt="User Image">
							<p>
								<span id="member_nickname"></span><small id="member_email"></small>
							</p></li>
						<!-- Menu Footer -->
						<li class="user-footer">
							<div class="pull-left">
								<a href="#" class="btn btn-default btn-flat">My Page</a>
							</div>
							<div class="pull-right">
								<a href="#" id="logout" class="btn btn-default btn-flat">Log out</a>
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
			loginCk();
			if("${sessionScope.member}"!=""){
				msgCk();
			}
		});
		
		function loginCk(){
			if ("${sessionScope.member.email}"=="") {
				$(".logined").css("display", "none");
				$(".login").css("display", "block");
			} else {
				$(".login").css("display", "none");
				$(".logined").css("display", "block");
				$("span#member_nickname").each(function(k, v){
					$(this).append("${sessionScope.member.nickname}");
				});
				$("#member_email").append("${sessionScope.member.email}");
			}
				
			$("#logout").on("click", function() {
				bootbox.dialog({
					message : "로그아웃 하시겠습니까?",
					buttons : {
						success : {
							label : "네",
							className : "btn-success",
							callback : function() {
								logout();
							}
						},
						danger : {
							label : "아니요",
							className : "btn-danger",
						}
					}
				});
			});
		}
		
		function msgCk(){
			$.ajax({
				url : "../user/newMsgCk",
				type : "post",
				dataType : "json",
				success : function(result){
					if(result.ok){
						if(result.cnt <= 0){
							$("#newMsgCnt").text("새로운 메시지가 없습니다.");	
						}else{
							$("#newMsgCnt").text("새로운 메시지가 "+result.cnt+"개 있습니다.");
							$(".notifyCnt").text(result.cnt);
							var arr = result.newMsgs;
							var str = "";
							for(var i=0;i<arr.length;i++){
								str += 	"<li><ul class='menu'><li><a href=javascript:msgPopup('readMsg?num="+arr[i].no+"')>"+
										"<div class='pull-left'>"+
								    	"<img src='../resources/img/newIcon.png' class='img-circle' alt='User Image'>"+
									    "</div>"+
									    "<h4>"+arr[i].sender+"<small><i class='fa fa-clock-o'></i>"+arr[i].wdate+"</small></h4>"+
									    "<p>"+arr[i].title+"</p>"+
									    "</a></li></ul></li>";
							}
							$("#newMsgs").append(str);
						}
					}else{
						alert("Server error (ajax is returned 'false', header.jsp)");
					}
				},
				error : function(){
					alert("error");
				}
			});
		} 
		
		function msgPopup(path) {
			var popup = "../user/"+path;
			var popOption = "width=992, height=525, top=200, left=200";
			window.open(popup, "", popOption);
		}
		
		function logout() {
			$.ajax({
				url : "../user/logout",
				type : "post",
				dataType : "json",
				success : function(result) {
					if (result.ok) {
						location.href = "main";
					} else {
						alert("server error");
					}
				},
				error : function() {
					alert("error")
				}
			});
		}
	</script>
</header>
