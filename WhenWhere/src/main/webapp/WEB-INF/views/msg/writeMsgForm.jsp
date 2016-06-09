<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<div class="col-md-9">
	<div class="box box-primary">
		<!-- /.box-header -->
		<div class="box-body">
			<form name="msgForm">
				<div class="form-group">
					<input type="hidden" name=sender
						value="${sessionScope.member.getNickname()}"> <input
						name="receiver" class="form-control" placeholder="To: "
						value="${receiver }">
				</div>
				<div class="form-group">
					<input name="title" class="form-control" placeholder="Subject:">
				</div>
				<div class="form-group" style="margin-bottom: 0px;">
					<textarea name="content" class="form-control"
						style="height: 300px; margin-bottom: 0px;"></textarea>
				</div>
			</form>
		</div>
		<div class="box-footer" style="padding-top: 0px;">
			<div class="pull-right">
				<button type="button" onclick="javascript:sendMsg();"
					class="btn btn-primary">
					<i class="fa fa-envelope-o"></i> 보내기
				</button>
			</div>
			<button type="reset" class="btn btn-default">
				<i class="fa fa-times"></i> 취소
			</button>
		</div>
	</div>
</div>
