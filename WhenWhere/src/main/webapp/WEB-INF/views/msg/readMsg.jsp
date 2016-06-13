<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<div class="col-md-9">
	<div class="box box-primary">
		<div class="box-body no-padding">
			<div class="mailbox-read-info">
				<h3>
					<b>제목 :</b> ${message.getTitle() }
				</h3>
				<h5>
					<b>보낸이 :</b> ${message.getSender() } <span
						class="mailbox-read-time pull-right">${message.getWdate() }</span>
				</h5>
			</div>
			<div class="mailbox-read-message">${message.getContent() }</div>
		</div>
		<div class="box-footer">
		<c:if test="${type!='sentread'}">
			<div class="pull-right">
				<button id="moveToOutbox" type="button" class="btn btn-default">
					<i class="fa fa-hand-o-right"></i> 보관함으로
				</button>
				<button id="reply" type="button" class="btn btn-default">
					<i class="fa fa-reply"></i> 답장하기
				</button>
			</div>
			<button id="delete" type="button" class="btn btn-default">
				<i class="fa fa-trash-o"></i> 삭제하기
			</button>
		</c:if>
		</div>
	</div>
</div>
