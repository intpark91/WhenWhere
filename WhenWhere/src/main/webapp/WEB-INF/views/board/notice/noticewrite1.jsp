<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<!DOCTYPE html>
<html>
<head>
<jsp:include page="../../component/core_head.jsp" />
<title>WhenWhereTest</title>
<script src="//ajax.googleapis.com/ajax/libs/jquery/1.9.1/jquery.min.js"></script>
<script src="../ckEditor/ckeditor.js"></script>


<script type="text/javascript">
	var result = '${insert}';
	if (result == 'true') {
		alert('글 쓰기 성공');
		location.href = "noticeRead?no=0";
	}

	else if (result == 'false') {
		alert('글 쓰기 실패');
	}
</script>
<script type="text/javascript">
	var f = $("#inForm");
	function formSubmit() {
		if ($("#dataTitle").val() == '') {
			alert("제목을 입력하시기 바랍니다.");
			return;
		}
		if ($("#dataContent").val() == '') {
			alert("내용을 입력하시기 바랍니다.");
			oEditors.getById["dataContent"].exec("FOCUS", []);
			return;
		}
		$("#inForm").submit();

	}
</script>
</head>

<body class="hold-transition skin-blue sidebar-mini sidebar-collapse">
	<div id="main_bg" class="info_main_bg">
		<div class="mainWrap"></div>
	</div>
	<div class="wrapper">
		<!-- include -->
		<jsp:include page="../../component/header.jsp" />
		<jsp:include page="../../component/linkSidebar.jsp" />
		<!-- Content Wrapper. Contains page content -->

		<div class="content-wrapper">
			<!-- Content Header (Page header) -->

			<section class="content">
				<div class="row">
					<div class="col-md-12">
						<div class="box box-info">
							<div class="box-header">
								<h3 class="box-title">
									게시판 글 쓰기
								</h3>
								<!-- tools box -->

								<!-- /. tools -->
							</div>
							<!-- /.box-header -->
							<div class="box-body pad">
								<form>
										<table class="write_1">													
													<tbody>
														<tr>
															<th scope="row"><label for="dataTitle">제 목</label></th>
															<td class="bbs_tit"><input type="text" name="title"
																id="dataTitle" value=""></td>
														</tr>
														<tr>
															<th scope="row"><label for="userNick">등록자</label></th>
															<td class="bbs_name"><input type="text" name="auth"
															 readonly="readonly" id="userNick" value="${sessionScope.member.nickname}"></td>
														</tr>
													</tbody>
										 </table>
									<textarea name="content" id="editor" rows="10" cols="80"></textarea>
									<script>
										CKEDITOR.replace('editor', {
											toolbar : 'witetoolbar',
											height : '800px'
										});
									</script>


								</form>
							</div>
						</div>
						<!-- /.box -->
						<!-- /.col-->
					</div>
					<!-- ./row -->
			</section>
		</div>

		<!-- /.content-wrapper -->
		<!-- include -->
		<jsp:include page="../../component/footer.jsp" />
		<jsp:include page="../../component/controlSidebar.jsp" />
	</div>
	<!-- scripts -->
	<jsp:include page="../../component/core_js.jsp" />

</body>
</html>
