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
					Messages
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
								<li><a href="../user/msgbox?page=1"><i class="fa fa-inbox"></i>
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
						<div class="box-body no-padding">
							<div class="mailbox-controls">
								<!-- Check all button -->
								<div class="btn-group">
									<button type="button"
										class="btn btn-default btn-sm checkbox-toggle">
										<i class="fa fa-square-o"></i>
									</button>
									<button type="button" class="btn btn-default btn-sm">
										<span class="glyphicon glyphicon-eye-open"></span>
									</button>
									<button type="button" class="btn btn-default btn-sm">
										<i class="fa fa-trash-o"></i>
									</button>
								</div>
								<!-- /.btn-group -->
								<div class="box-tools pull-right">
									<div class="has-feedback">
										<input type="text" class="form-control input-sm"
											placeholder="Search Mail"> <span
											class="glyphicon glyphicon-search form-control-feedback"></span>
									</div>
								</div>
							</div>
							<!-- box-messages -->
							<div class="table-responsive mailbox-messages">
								<table class="table table-hover table-striped">
									<tbody id="msgList">
										<c:forEach var="msg" items="${msgList}">
											<tr>
												<td><input type="checkbox"></td>
												<td class="mailbox-name">${msg.sender}</a></td>
												<td class="mailbox-subject"><a href="../user/readMsg?num=${msg.no}">${msg.title}</a></td>
												<td class="mailbox-date pull-right">${msg.wdate}</td>
											</tr>
										</c:forEach>
									</tbody>
								</table>
							</div>
						</div>
						<!-- box-footer -->
						<div class="box-footer no-padding">
							<div class="box-footer no-padding">
								<div class="row">
									<div style="text-align: center;">
										<ul class="pagination pagination-sm no-margin"></ul>
									</div>
								</div>
							</div>
						</div>
						<!-- /.box-footer-->
					</div>
				</div>
			</div>
		</div>
	</div>
	<jsp:include page="../component/core_js.jsp" />
	<script type="text/javascript">
		$(function() {
			var str = ""
			for (var i = "${pagination.getLinkBegin()}"; i <= "${pagination.getLinkEnd()}"; i++) {
				str += "<li><a href='../user/msgPopup?page="+i+"'>"+i+"</li>";
			}
			if ("${pagination.isPrev()}"=="true") {
				str = "<li><a href='../user/msgPopup?page="+${pagination.getLinkBegin()-1}+"'>PREV</a></li>" + str;
			}
			if ("${pagination.isNext()}"=="true") {
				str += "<li><a href='../user/msgPopup?page="+${pagination.getLinkEnd()+1}+"'>NEXT</a></li>"
			}
			$("ul.pagination").html(str);
		})
	</script>
</body>
</html>
