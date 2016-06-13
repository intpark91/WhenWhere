<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<div class="col-md-9">
	<div class="box box-primary">
		<div class="box-body no-padding">
			<div class="mailbox-read-info">
				<h3>
					<b>${message.getTitle() }</b>
				</h3>
				<h4>
					보낸이 : ${message.getSender() } <span
						class="mailbox-read-time pull-right">${message.getWdate() }</span>
				</h4>
			</div>
			<div class="mailbox-read-message">${message.getContent() }</div>
		</div>
		<div class="box-footer">
			<div class="pull-right">
				<button id="reply" type="button" class="btn btn-default">
					<i class="fa fa-reply"></i> Reply
				</button>
			</div>
			<button id="delete" type="button" class="btn btn-default">
				<i class="fa fa-trash-o"></i> Delete
			</button>
		</div>
	</div>
</div>
