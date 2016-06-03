<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
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
	padding: 10px;
}

.content-header {
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
					<a href="compose.html"
						class="btn btn-primary btn-block margin-bottom">Write new
						message</a>
					<div class="box box-solid">
						<!--매뉴 -->
						<div class="box-header with-border">
							<h3 class="box-title">Menu</h3>
							<div class="box-tools">
								<button type="button" class="btn btn-box-tool"
									data-widget="collapse">
									<i class="fa fa-minus"></i>
								</button>
							</div>
						</div>
						<div class="box-body no-padding">
							<ul class="nav nav-pills nav-stacked">
								<li class="active"><a href="#"><i class="fa fa-inbox"></i>
										Inbox <span class="label label-primary pull-right">3</span></a></li>
								<li><a href="#"><i class="fa fa-envelope-o"></i> Sent</a></li>
								<li><a href="#"><i class="fa fa-envelope"></i> Save</a></li>
							</ul>
						</div>
						<!-- /.box-body -->
					</div>
					<!-- /. box -->
				</div>
				<!-- /.col -->
				<div class="col-md-9">
					<div class="box box-primary">
						<!--inbox -->
						<div class="box-header with-border">
							<h3 class="box-title">Inbox</h3>
							<div class="box-tools pull-right">
								<div class="has-feedback">
									<input type="text" class="form-control input-sm"
										placeholder="Search Mail"> <span
										class="glyphicon glyphicon-search form-control-feedback"></span>
								</div>
							</div>
						</div>

						<!-- /.box-header -->
						<div class="box-body no-padding">
							<div class="mailbox-controls">
								<!-- Check all button -->
								<button type="button"
									class="btn btn-default btn-sm checkbox-toggle">
									<i class="fa fa-square-o"></i>
								</button>
								<div class="btn-group">
									<button type="button" class="btn btn-default btn-sm">
										<span class="glyphicon glyphicon-eye-open"></span>
									</button>
									<button type="button" class="btn btn-default btn-sm">
										<i class="fa fa-trash-o"></i>
									</button>
								</div>
								<!-- /.btn-group -->
							</div>
							<!-- message list -->
							<div class="table-responsive mailbox-messages">
								<table class="table table-hover table-striped">
									<tbody id="msgList">
										<c:forEach var="msg" items="${msgList}">
											<tr>
												<td><input type="checkbox"></td>
												<td class="mailbox-name"><a href="read-mail.html">${msg.sender}</a></td>
												<td class="mailbox-subject">${msg.title}</td>
												<td class="mailbox-date">${msg.wdate}</td>
											</tr>
										</c:forEach>
									</tbody>
								</table>
								<!-- /.table -->
							</div>
							<!-- /.mail-box-messages -->
						</div>
						<!-- /.box-body -->
						<div class="box-footer no-padding">
							<div class="mailbox-controls">
								<div class="pull-right">
									1-10/50
									<div class="btn-group" style="margin-bottom: 5px;">
										<button type="button" class="btn btn-default btn-sm">
											<i class="fa fa-chevron-left"></i>
										</button>
										<button type="button" class="btn btn-default btn-sm">
											<i class="fa fa-chevron-right"></i>
										</button>
									</div>
									<!-- /.btn-group -->
								</div>
								<!-- /.pull-right -->
							</div>
						</div>
					</div>
					<!-- /. box -->
				</div>
			</div>
			<section class="content"></section>
		</div>
	</div>
	<jsp:include page="../component/core_js.jsp" />
</body>
</html>
