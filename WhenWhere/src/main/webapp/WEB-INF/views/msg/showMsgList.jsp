<%@ page contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<div class="col-md-9">
	<div class="box box-primary">
<<<<<<< HEAD
		<div class="box-body no-padding">
			<div class="mailbox-controls">
				<!-- Check all button -->
				<div class="btn-group">
					<button type="button"
						class="btn btn-default btn-sm checkbox-toggle"
						data-toggle="tooltip" data-container="body" title="전체선택">
						<i class="fa fa-square-o"></i>
					</button>
					<button type="button" class="btn btn-default btn-sm"
						data-toggle="tooltip" data-container="body" title="선택된 쪽지 읽음">
						<span class="glyphicon glyphicon-eye-open"></span>
					</button>
					<c:if test="${type == 'list' }">
						<button type="button" class="btn btn-default btn-sm"
							data-toggle="tooltip" data-container="body" title="보관함으로 보내기">
							<i class="fa fa-archive"></i>
						</button>
					</c:if>
					<button type="button" class="btn btn-default btn-sm"
						data-toggle="tooltip" data-container="body" title="삭제">
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
			<div class="table-responsive mailbox-messages">
				<table class="table table-hover table-striped">
					<tbody id="msgList">
						<tr>
							<td class="msg_checkbox"></td>
							<c:choose>
								<c:when test="${type == 'sent' }">
									<td class="msg_sender">받는이</td>
								</c:when>
								<c:otherwise>
									<td class="msg_sender">보낸이</td>
								</c:otherwise>
							</c:choose>

							<td class="msg_title">제목</td>
							<c:if test="${type == 'sent' }">
								<td class="msg_status pull-right">수신여부</td>
							</c:if>
							<td class="msg_checkbox pull-right">날짜</td>
						</tr>
						<c:forEach var="msg" items="${msgList}">
							<tr>
								<td class="msg_checkbox"><input type="checkbox"></td>
								<c:choose>
									<c:when test="${type == 'sent' }">
										<td class="msg_sender">${msg.receiver}</td>
									</c:when>
									<c:otherwise>
										<td class="msg_sender">${msg.sender}</td>
									</c:otherwise>
								</c:choose>
								<td class="msg_title"><c:choose>
										<c:when test="${type == 'sent' }">
											<a href="../user/msgbox?type=sentread&num=${msg.no}">
										</c:when>
										<c:otherwise>
											<a href="../user/msgbox?type=read&num=${msg.no}">
										</c:otherwise>
									</c:choose> <c:choose>
										<c:when test="${msg.status == 0 }">
											<b>${msg.title}</b>
										</c:when>
										<c:otherwise>
												${msg.title}
											</c:otherwise>
									</c:choose> </a></td>
								<c:if test="${type == 'sent' }">
									<td class="msg_status pull-right"><c:choose>
											<c:when test="${msg.status == 0 }">
												<span class="label label-danger">안읽음</span>
											</c:when>
											<c:otherwise>
												<span class="label label-success">읽음</span>
											</c:otherwise>
										</c:choose></td>
								</c:if>
								<td class="msg_checkbox pull-right">${msg.wdate}</td>
							</tr>
						</c:forEach>
					</tbody>
				</table>
			</div>
		</div>
		<div class="box-footer no-padding">
			<div class="box-footer no-padding">
				<div class="row">
					<div style="text-align: center;">
						<ul class="pagination pagination-sm no-margin"></ul>
					</div>
				</div>
			</div>
		</div>
=======
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
								<td class="mailbox-name">${msg.sender}</td>
								<td class="mailbox-subject">
									<a href="../user/msgbox?type=read&num=${msg.no}">
										<c:choose>
											<c:when test="${msg.status == 0 }">
												<b>${msg.title}</b>
											</c:when>
											<c:otherwise>
												${msg.title}
											</c:otherwise>
										</c:choose>
									</a>
								</td>
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
>>>>>>> refs/heads/main_js
	</div>
</div>
