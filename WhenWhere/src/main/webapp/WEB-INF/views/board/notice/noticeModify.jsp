<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<!DOCTYPE html>
<html>
<head>
<jsp:include page="../../component/core_head.jsp" />
<title>WhenWhereTest</title>
<script src="//ajax.googleapis.com/ajax/libs/jquery/1.9.1/jquery.min.js"></script>
<link rel="stylesheet" href="../css/board/boardwrite.css"
	type="text/css">
<script src="../ckEditor/ckeditor.js"></script>
<script type="text/javascript">
	

</script>

<script type="text/javascript">
var no = '${sessionScope.no}';
var category='${sessionScope.category}';
	var result = '${modify}';
	if (result == 'true') {
		location.href = "noticeRead?no="+no+"&category="+category+"";
	}
	else if(result =='false'){
		alert('글 수정 실패');
	}
</script>

<script type="text/javascript">
	var f = $("#inForm");
	function modify() {
		if ($("#dataTitle").val() == '') {
			$.bootstrapGrowl("제목을 입력하세요!", {
				type: 'danger',
				align: 'center',
				width: 'auto',
				allow_dismiss: false
			});
			return;
		}
		if ($("#dataContent").val() == '') {
			$.bootstrapGrowl("내용을 입력하세요!", {
				type: 'danger',
				align: 'center',
				width: 'auto',
				allow_dismiss: false
			});
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
			<section class="content-header"></section>
			<div class="container">
				<div class="row">
					<div
						class="col-lg-6 col-lg-offset-3 col--8 col-md-offset-2 text-center">
						<div id="all" class="clearfix">



							<div id="content01">
								<!-- 2015.12.07 수정-->

								<!--//-->
								<form id="inForm" name="inForm" method="post"
									action="noticemodify" enctype="multipart/form-data">
									<input type="hidden" name="no" id="no" value="${updateBoard.no}">
									<div class="con_area">
										<div class="board_box">
											<div class="bbs_write">
												<table class="write_1">
													<h3>게시판 글 수정</h3>
													<tbody>
														<tr>
															<th scope="row"><label for="dataTitle">제 목</label></th>
															<td class="bbs_tit"><input type="text" name="title"
																id="dataTitle" value="${updateBoard.title}"></td>
														</tr>
														<tr>
															<th scope="row"><label for="userNick">등록자</label></th>
															<td class="bbs_name"><input type="text" name="auth"
																id="userNick" value="${updateBoard.auth}"></td>
														</tr>



														<!-- 에디터영역 시작-->

														<tr>
															<td colspan="2" class="bbs_write">
																<div class="bbs_write_wrap">																
																	<textarea name="content" id="editor"
																		style="width: 100%; height: 800px;" rows="10"
																		cols="20">
																		${updateBoard.content}
																		</textarea>
																	<script>
																		CKEDITOR
																				.replace(
																						'editor',
																						{
																							toolbar : 'witetoolbar',
																							height : '800px'
																						});
																	</script>
																</div>
															</td>
														</tr>
														<!-- 에디터영역 끝.-->
													</tbody>
												</table>
											</div>
											<div class="bbs_btn">
												<p class="fl">&nbsp;</p>
												<p class="fr">
													<a href="#" onclick="modify();">수정</a> 
													<a href="../board/noticeRead?category=1&no=${sessionScope.no}">취소</a>
												</p>
											</div>
										</div>
									</div>
								</form>
							</div>

						</div>


					</div>
				</div>
			</div>

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
