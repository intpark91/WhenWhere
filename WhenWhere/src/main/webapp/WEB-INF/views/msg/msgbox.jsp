<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<<<<<<< HEAD
	<jsp:include page="../component/core_head.jsp" />
	<title>쪽지함</title>
	<link rel="stylesheet" href="../css/jquery-ui-slider-pips.css" />
	<link rel="stylesheet" href="../css/slider.css" />
	<link rel="stylesheet" href="../css/iCheck/flat/blue.css">
	<link rel="stylesheet" href="../css/datepicker/jquery-ui.css">
	<style type="text/css">
	.wrapper {
		padding-left: 10px;
		padding-right: 10px;
	}
	
	.content-header {
		padding-top: 0px;
		margin-bottom: 10px;
	}
	</style>
</head>
<body class="hold-transition skin-blue sidebar-collapse">
	<div class="wrapper">
		<div class="content-wrapper">
			<section class="content-header">
				<h1>쪽지함</h1>
			</section>
			
			<div class="row">
				<div class="col-md-3">
					<a href="../user/msgbox?type=write"
						class="btn btn-primary btn-block margin-bottom"> 새 메시지 쓰기 </a>
					<div class="box box-solid">
						<div class="box-body no-padding">
							<ul class="nav nav-pills nav-stacked">
								<li class="inbox"><a href="../user/msgbox?type=inbox&page=1"><i class="fa fa-inbox"></i> 받은 쪽지함
									<span class="label label-primary pull-right">3</span></a></li>
								<li class="sent"><a href="../user/msgbox?type=sent&page=1"><i class="fa fa-envelope-o"></i> 보낸 쪽지함</a></li>
								<li class="outbox"><a href="../user/msgbox?type=outbox&page=1"><i class="fa fa-envelope"></i> 보관함</a></li>
							</ul>
						</div>
					</div>
				</div>
				<c:choose>
					<c:when test="${type=='inbox' or type=='sent' or type == 'outbox'}">
						<jsp:include page="../msg/showMsgList.jsp" />
					</c:when>
					
					<c:when test="${type=='read' or type=='sentread'}">
						<jsp:include page="../msg/readMsg.jsp" />
					</c:when>
					<c:when test="${type=='write'}">
						<jsp:include page="../msg/writeMsgForm.jsp" />
					</c:when>
				</c:choose>
			</div>
		</div>
		
	</div>
	<jsp:include page="../component/core_js.jsp" />
	<script src="../css/iCheck/icheck.js"></script>
	<script type="text/javascript">
		$(function() {
			var str = ""
			for (var i = "${pagination.getLinkBegin()}"; i <= "${pagination.getLinkEnd()}"; i++) {
				str += "<li><a href='../user/msgbox?type=${type}&page=" + i + "'>" + i
						+ "</li>";
			}
			if ("${pagination.isPrev()}" == "true") {
				str = "<li><a href='../user/msgbox?type=${type}&page=" 
					+ ${pagination.getLinkBegin() - 1} +"'>PREV</a></li>" + str;
			}
			if ("${pagination.isNext()}" == "true") {
				str += "<li><a href='../user/msgbox?type={type}&page=" 
					 + ${pagination.getLinkEnd() + 1} +"'>NEXT</a></li>"
			}
			$("ul.pagination").html(str);
			$("li.${type}").attr("class", "active");
		})
		
		$(function() {
			$("#reply").on("click", function() {
				location.href = "../user/msgbox?type=write&receiver=${message.getSender()}";
			});
			
			$("#moveToOutbox").on("click", moveToOutbox);
			
			$("#delete").on("click", function(){
				bootbox.dialog({
					message : "삭제하시겠습니까?",
					buttons : {
						success : {
							label : "네",
							className : "btn-success",
							callback : function() {
								deleteMsg();
							}
						},
						danger : {
							label : "아니요",
							className : "btn-danger",
						}
					}
				});
			});
		});
		
		function sendMsg(){
			$.ajax({
				type : "post",
				url : "../user/sendMsg",
				data : $("form[name=msgForm]").serialize(),
				dataType : "json",
				success : function(result) {
					if (result.ok) {
						location.href = "../user/msgbox?type=write";
					} else if(result.receiver!=""){
						$.bootstrapGrowl(result.receiver+"님은 없습니다.", {
				            type: 'danger',
				            align: 'center',
				            width: 'auto',
				            allow_dismiss: false
				        });
					}
				},
				error : function() {
				}
			});
		}
		
		
		$(function() {
			//Enable iCheck plugin for checkboxes
			//iCheck for checkbox and radio inputs
			$('.mailbox-messages input[type="checkbox"]').iCheck({
				checkboxClass : 'icheckbox_flat-blue',
				radioClass : 'iradio_flat-blue'
			});

			//Enable check and uncheck all functionality
			$(".checkbox-toggle").click(function() {
				var clicks = $(this).data('clicks');
				if (clicks) {
					//Uncheck all checkboxes
					$(".mailbox-messages input[type='checkbox']")
							.iCheck("uncheck");
					$(".fa", this).removeClass("fa-check-square-o")
							.addClass('fa-square-o');
				} else {
					//Check all checkboxes
					$(".mailbox-messages input[type='checkbox']")
							.iCheck("check");
					$(".fa", this).removeClass("fa-square-o").addClass(
							'fa-check-square-o');
				}
				$(this).data("clicks", !clicks);
			});

			//Handle starring for glyphicon and font awesome
			$(".mailbox-star").click(function(e) {
				e.preventDefault();
				//detect type
				var $this = $(this).find("a > i");
				var glyph = $this.hasClass("glyphicon");
				var fa = $this.hasClass("fa");

				//Switch states
				if (glyph) {
					$this.toggleClass("glyphicon-star");
					$this.toggleClass("glyphicon-star-empty");
				}

				if (fa) {
					$this.toggleClass("fa-star");
					$this.toggleClass("fa-star-o");
				}
			});
		});
		
		function moveToOutbox(){
			var jobj = {}
			jobj.num = "${message.getNo()}";
			jobj.type = "move";
			$.ajax({
				url : "../user/moveToOutbox",
				type : "post",
				data : jobj,
				dataType : "json",
				success : function(result) {
					if(result.ok){
						$.bootstrapGrowl("이 메시지를 보관함으로 이동했습니다.", {
				            type: 'success',
				            align: 'center',
				            width: 'auto',
				        });
					}else{
						$.bootstrapGrowl("SERVER ERROR, 잠시 후 다시 시도해주세요.", {
				            type: 'danger',
				            align: 'center',
				            width: 'auto',
				            allow_dismiss: false
				        });
					}
				},
				error : function(xhr, status, error) {
					alert("bad : " + xhr.responseText +",\n " + error);
				}
			})
		}
		
		function deleteMsg(){
			var jobj = {}
			jobj.num = "${message.getNo()}";
			$.ajax({
				url : "../user/deleteMsg",
				type : "post",
				data : jobj,
				dataType : "json",
				success : function(result) {
					if(result.ok){
						location.href="../user/msgbox?type=inbox&page=1";
					}else{
						$.bootstrapGrowl("SERVER ERROR, 잠시 후 다시 시도해주세요.", {
				            type: 'danger',
				            align: 'center',
				            width: 'auto',
				            allow_dismiss: false
				        });
					}
				},
				error : function() {
					alert("bad");
=======
<jsp:include page="../component/core_head.jsp" />
<title>쪽지함</title>
<link rel="stylesheet"
	href="https://code.jquery.com/ui/1.10.4/themes/flick/jquery-ui.css">
<link rel="stylesheet" href="../css/jquery-ui-slider-pips.css" />
<link rel="stylesheet" href="../css/slider.css" />
<style type="text/css">
.wrapper {
	padding-left: 10px;
	padding-right: 10px;
}

.content-header {
	padding-top: 0px;
	margin-bottom: 10px;
}
</style>
</head>
<body class="hold-transition skin-blue sidebar-collapse">
	<div class="wrapper">
		<div class="content-wrapper">
			<section class="content-header">
				<h1>쪽지함</h1>
			</section>
			<div class="row">
				<div class="col-md-3">
					<a href="../user/msgbox?type=write"
						class="btn btn-primary btn-block margin-bottom"> 새 메시지 쓰기 </a>
					<div class="box box-solid">
						<div class="box-body no-padding">
							<ul class="nav nav-pills nav-stacked">
								<li><a href="../user/msgbox?type=list&page=1">
									<i class="fa fa-inbox"></i> 받은 쪽지함 
									<span class="label label-primary pull-right">3</span></a></li>
								<li><a href="#"><i class="fa fa-envelope-o"></i> 보낸 쪽지함</a></li>
								<li><a href="#"><i class="fa fa-envelope"></i> 보관함</a></li>
							</ul>
						</div>
					</div>
				</div>
				<c:choose>
					<c:when test="${type=='list'}">
						<jsp:include page="../msg/showMsgList.jsp" />
					</c:when>
					<c:when test="${type=='read'}">
						<jsp:include page="../msg/readMsg.jsp" />
					</c:when>
					<c:when test="${type=='write'}">
						<jsp:include page="../msg/writeMsgForm.jsp" />
					</c:when>
				</c:choose>
			</div>
		</div>
	</div>
	<jsp:include page="../component/core_js.jsp" />
	<script type="text/javascript">
		$(function() {
			var str = ""
			for (var i = "${pagination.getLinkBegin()}"; i <= "${pagination.getLinkEnd()}"; i++) {
				str += "<li><a href='../user/msgbox?page=" + i + "'>" + i
						+ "</li>";
			}
			if ("${pagination.isPrev()}" == "true") {
				str = "<li><a href='../user/msgbox?page=" + $
				{
					pagination.getLinkBegin() - 1
				}
				+"'>PREV</a></li>" + str;
			}
			if ("${pagination.isNext()}" == "true") {
				str += "<li><a href='../user/msgbox?page=" + $
				{
					pagination.getLinkEnd() + 1
				}
				+"'>NEXT</a></li>"
			}
			$("ul.pagination").html(str);
		})
		$(function() {
			$("#reply").on("click", function() {
				location.href = "../user/msgbox?type=write&receiver=${message.getSender()}";
			});
			
			$("#delete").on("click", function(){
				bootbox.dialog({
					message : "삭제하시겠습니까?",
					buttons : {
						success : {
							label : "네",
							className : "btn-success",
							callback : function() {
								deleteMsg();
							}
						},
						danger : {
							label : "아니요",
							className : "btn-danger",
						}
					}
				});
			});
		});
		
		function deleteMsg(){
			console.log("aaa");
			var jobj = {}
			jobj.num = "${message.getNo()}";
			$.ajax({
				url : "../user/deleteMsg",
				type : "post",
				data : jobj,
				dataType : "json",
				success : function(result) {
					if(result.ok){
						$.bootstrapGrowl("삭제되었습니다.", {
				            type: 'danger',
				            align: 'center',
				            width: 'auto',
				            allow_dismiss: false
				        });
						location.href="../user/msgbox?type=list&page=1";
					}
				},
				error : function() {
					alert("bad");
				}
			});
		}
		
		function sendMsg(){
			$.ajax({
				type : "post",
				url : "../user/sendMsg",
				data : $("form[name=msgForm]").serialize(),
				dataType : "json",
				success : function(result) {
					if (result.ok) {
						location.href = "../user/msgbox?type=write";
					} else {
						alert("server err msgbox.jsp");
					}
				},
				error : function() {
>>>>>>> refs/heads/main_js
				}
			});
		}
	</script>
</body>
</html>
