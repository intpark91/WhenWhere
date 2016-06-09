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
				<h1>쪽지함</h1>
			</section>
			<div class="row">
				<div class="col-md-3">
					<a href="../user/sendMsgForm"
						class="btn btn-primary btn-block margin-bottom"> 새 메시지 쓰기 </a>
					<div class="box box-solid">
						<div class="box-body no-padding">
							<ul class="nav nav-pills nav-stacked">
								<li><a href="../user/msgbox?page=1"><i
										class="fa fa-inbox"></i> 받은 쪽지함 <span
										class="label label-primary pull-right">3</span></a></li>
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
				str += "<li><a href='../user/msgbox?page="+i+"'>"+i+"</li>";
			}
			if ("${pagination.isPrev()}"=="true") {
				str = "<li><a href='../user/msgbox?page="+${pagination.getLinkBegin()-1}+"'>PREV</a></li>" + str;
			}
			if ("${pagination.isNext()}"=="true") {
				str += "<li><a href='../user/msgbox?page="+${pagination.getLinkEnd()+1}+"'>NEXT</a></li>"
			}
			$("ul.pagination").html(str);
		})
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
