<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
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
				<h1>
					Messages <small>13 new messages</small>
				</h1>
			</section>
			<div class="row">
				<div class="col-md-3">
					<!--메시지 작성 -->
					<a href="../user/sendMsgForm"
						class="btn btn-primary btn-block margin-bottom">Write new
						message</a>
					<div class="box box-solid">
						<div class="box-body no-padding">
							<ul class="nav nav-pills nav-stacked">
								<li class="active"><a href="../user/msgbox?page=1"><i
										class="fa fa-inbox"></i> 받은 쪽지함 <span
										class="label label-primary pull-right">3</span></a></li>
								<li><a href="#"><i class="fa fa-envelope-o"></i> 보낸 쪽지함</a></li>
								<li><a href="#"><i class="fa fa-envelope"></i> 보관함</a></li>
							</ul>
						</div>
					</div>
				</div>
				<!-- /.col -->
				<div class="col-md-9">
					<div class="box box-primary">
						<div class="box-body no-padding">
							<div class="mailbox-read-info">
								<h3><b>${message.getTitle() }</b></h3>
								<h4>보낸이 : ${message.getSender() }
									<span class="mailbox-read-time pull-right">${message.getWdate() }</span>
								</h4>
							</div>
							<div class="mailbox-read-message">${message.getContent() }</div>
						</div>

						<!-- /.box-footer -->
						<div class="box-footer">
							<div class="pull-right">
								<button id="reply" type="button" class="btn btn-default">
									<i class="fa fa-reply"></i> Reply
								</button>
							</div>
							<button  id="delete" type="button" class="btn btn-default">
								<i class="fa fa-trash-o"></i> Delete
							</button>
						</div>
						<!-- /.box-footer -->
					</div>
				</div>
				<!--  /.col -->
			</div>
		</div>
	</div>
	<jsp:include page="../component/core_js.jsp" />
	<script type="text/javascript">
	$(function(){
		$("#reply").on("click", function(){
			alert("??");
			location.href="../user/sendMsgForm?receiver=${message.getSender()}";
		});
		$("#delete").on("click", function(){
			var num = ${message.getNo()};
			$.ajax({
				url : "../user/deleteMsg",
				type : "post",
				data : num,
				dataType : "json",
				success : function(){
					alert("okok");
				},
				error : function(){
					alert("bad");
				}
			});
		});
	});
	
	</script>
</body>
</html>
