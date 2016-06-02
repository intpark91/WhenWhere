<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<!DOCTYPE html>
<html>
<head>
	<jsp:include page="../component/core_head.jsp" />
	<title>쪽지함</title>
	<link rel="stylesheet" href="https://code.jquery.com/ui/1.10.4/themes/flick/jquery-ui.css">
	<link rel="stylesheet" href="../css/jquery-ui-slider-pips.css" />
	<link rel="stylesheet" href="../css/slider.css" />
	<style type="text/css">
	.content-wrapper {
		padding : 10px;
	}
	.content-header{
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
				<ol class="breadcrumb">
					<li><a href="#"><i class="fa fa-dashboard"></i> Home</a></li>
					<li class="active">Mailbox</li>
				</ol>
			</section>
			<div class="row">
				<div class="col-md-3">
					<a href="compose.html" class="btn btn-primary btn-block margin-bottom">Write new message</a>

					<div class="box box-solid">
						<div class="box-header with-border">
							<h3 class="box-title">Folders</h3>

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
										Inbox <span class="label label-primary pull-right">1</span></a></li>
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
						<div class="box-header with-border">
							<h3 class="box-title">Inbox</h3>

							<div class="box-tools pull-right">
								<div class="has-feedback">
									<input type="text" class="form-control input-sm"
										placeholder="Search Mail"> <span
										class="glyphicon glyphicon-search form-control-feedback"></span>
								</div>
							</div>
							<!-- /.box-tools -->
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
										<i class="fa fa-trash-o"></i>
									</button>
									<button type="button" class="btn btn-default btn-sm">
										<i class="fa fa-reply"></i>
									</button>
									<button type="button" class="btn btn-default btn-sm">
										<i class="fa fa-share"></i>
									</button>
								</div>
								<!-- /.btn-group -->
								<button type="button" class="btn btn-default btn-sm">
									<i class="fa fa-refresh"></i>
								</button>
								<div class="pull-right">
									1-50/200
									<div class="btn-group">
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
							<div class="table-responsive mailbox-messages">
								<table class="table table-hover table-striped">
									<tbody>
										<tr>
											<td><input type="checkbox"></td>
											<td class="mailbox-star"><a href="#"><i
													class="fa fa-star text-yellow"></i></a></td>
											<td class="mailbox-name"><a href="read-mail.html">Alexander
													Pierce</a></td>
											<td class="mailbox-subject"><b>AdminLTE 2.0 Issue</b> -
												Trying to find a solution to this problem...</td>
											<td class="mailbox-attachment"></td>
											<td class="mailbox-date">5 mins ago</td>
										</tr>
									</tbody>
								</table>
								<!-- /.table -->
							</div>
							<!-- /.mail-box-messages -->
						</div>
						<!-- /.box-body -->
						<div class="box-footer no-padding">
							<div class="mailbox-controls">
								<!-- Check all button -->
								<button type="button"
									class="btn btn-default btn-sm checkbox-toggle">
									<i class="fa fa-square-o"></i>
								</button>
								<div class="btn-group">
									<button type="button" class="btn btn-default btn-sm">
										<i class="fa fa-trash-o"></i>
									</button>
									<button type="button" class="btn btn-default btn-sm">
										<i class="fa fa-reply"></i>
									</button>
									<button type="button" class="btn btn-default btn-sm">
										<i class="fa fa-share"></i>
									</button>
								</div>
								<!-- /.btn-group -->
								<button type="button" class="btn btn-default btn-sm">
									<i class="fa fa-refresh"></i>
								</button>
								<div class="pull-right">
									1-50/200
									<div class="btn-group">
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
				<!-- /.col -->
			</div>
			<section class="content"></section>
		</div>

	</div>
	<jsp:include page="../component/core_js.jsp" />
</body>
</html>
