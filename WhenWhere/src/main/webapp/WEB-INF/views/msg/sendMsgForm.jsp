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
								<li class="active"><a href="../user/msgbox?page=1"><i class="fa fa-inbox"></i>
										받은 쪽지함 <span class="label label-primary pull-right">3</span></a></li>
								<li><a href="#"><i class="fa fa-envelope-o"></i> 보낸 쪽지함</a></li>
								<li><a href="#"><i class="fa fa-envelope"></i> 보관함</a></li>
							</ul>
						</div>
						<!-- /.box-body -->
					</div>
					<!-- /. box -->
				</div>
				<!-- /.col -->
				<div class="col-md-9">
					<div class="box box-primary">
						<!-- /.box-header -->
						<div class="box-body">
						<form name="msgForm">
							<div class="form-group">
								<input type="hidden" name=sender value="${sessionScope.member.getNickname()}">
								<input name="receiver" class="form-control"  placeholder="To: ">
							</div>
							<div class="form-group">
								<input name="title" class="form-control" placeholder="Subject:">
							</div>
							<div class="form-group" style="margin-bottom: 0px;">
								<textarea name="content" class="form-control" style="height: 300px; margin-bottom: 0px;"></textarea>
							</div>
						</form>
						</div>
						<div class="box-footer" style="padding-top: 0px;">
							<div class="pull-right">
								<button type="button" onclick="javascript:sendMsg();" class="btn btn-primary">
									<i class="fa fa-envelope-o"></i> 보내기
								</button>
							</div>
							<button type="reset" class="btn btn-default">
								<i class="fa fa-times"></i> 취소
							</button>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
	<jsp:include page="../component/core_js.jsp" />
	<script type="text/javascript">
	function sendMsg(){
		$.ajax({
			type : "post",
			url: "../user/sendMsg",
			data: $("form[name=msgForm]").serialize(),
			dataType: "json",
			success: function(result){
				if(result.ok){
					location.href="../user/sendMsgForm";
				}else{
					alert("??");
				}
			},
			error: function(){
			}
		});
	}
	</script>
</body>
</html>
