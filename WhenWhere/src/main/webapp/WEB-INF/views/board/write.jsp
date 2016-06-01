<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<title>행사게시판</title>
<meta name="description"
	content="This is a free Bootstrap landing page theme created for BootstrapZero. Feature video background and one page design." />
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<meta name="generator" content="Codeply">
<script src="//ajax.googleapis.com/ajax/libs/jquery/1.9.1/jquery.min.js"></script>
<link rel="stylesheet"
	href="//maxcdn.bootstrapcdn.com/bootstrap/3.3.4/css/bootstrap.min.css" />
<link rel="stylesheet" href="../css/board/boardwrite.css"
	type="text/css">

</head>
<body>

	<section class="bg-primary" id="one">
		
		<div id="main_bg" class="info_main_bg" >
					<div class="mainWrap">
<!-- 						<h1>WHEN?WHERE!</h1>
						<br>REVIEW<br>
						<h1>생생한 REVIEW를 통해 간접적 체험해 보세요!</h1>	 -->
					</div>
					</div>
	
		<div class="container">
			<div class="row">
				<div
					class="col-lg-6 col-lg-offset-3 col--8 col-md-offset-2 text-center">
					<div id="all" class="clearfix">


						<script type="text/javascript">
							var f = $("#inForm");
							function formSubmit() {
								if ($("#dataTitle").val() == '') {
									alert("제목을 입력하시기 바랍니다.");
									return;
								}

								oEditors.getById["dataContent"].exec(
										"UPDATE_IR_FIELD", []);
								if ($("#dataContent").val() == '') {
									alert("내용을 입력하시기 바랍니다.");
									oEditors.getById["dataContent"].exec(
											"FOCUS", []);
									return;
								}
								$("#inForm").submit();
							}
						</script>
						<script type="text/javascript"
							src="./전라북도 토탈관광 - 여행도우미_참여마당_여행후기_files/HuskyEZCreator.js"></script>
						<div id="content01">
							<!-- 2015.12.07 수정-->

							<!--//-->
							<form id="inForm" name="inForm" method="post"
								action="http://tour.jb.go.kr/board/writeAct.do"
								enctype="multipart/form-data">
								<input type="hidden" name="dataSid" value="0"> <input
									type="hidden" name="orderBy" value=""> <input
									type="hidden" name="skinId" value="SKIN_0000008"> <input
									type="hidden" name="boardId" value="BBS_0000008"> <input
									type="hidden" name="menuCd" value="DOM_000000104007001000">
								<input type="hidden" name="contentsSid" value="44"> <input
									type="hidden" name="startPage" value="1"> <input
									type="hidden" name="tType" value=""> <input
									type="hidden" name="tmpField2" value="">
								<div class="con_area">
									<div class="board_box">
										<div class="bbs_write">
											<table class="write_1">
												<h3>게시판 글 쓰기</h3>
												<tbody>
													<tr>
														<th scope="row"><label for="dataTitle">제 목</label></th>
														<td class="bbs_tit"><input type="text"
															name="dataTitle" id="dataTitle" value=""></td>
													</tr>
													<tr>
														<th scope="row"><label for="userNick">등록자</label></th>
														<td class="bbs_name"><input type="text"
															name="userNick" id="userNick" value="이동현"></td>
													</tr>



													<!-- 에디터영역 시작-->

													<tr>
														<td colspan="2" class="bbs_write">
															<div class="bbs_write_wrap">
																<!-- <textarea name="dataContent" id="dataContent"
																	style="width: 100%; height: 300px;" rows="10" cols="50"></textarea> -->
																<jsp:include page="smarteditor.jsp" />

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
												<a
													href="http://tour.jb.go.kr/board/write.do?skinId=SKIN_0000008&amp;boardId=BBS_0000008&amp;menuCd=DOM_000000104007001000&amp;startPage=1&amp;tType=#none"
													onclick="formSubmit();">등록</a> <a
													href="http://tour.jb.go.kr/board/list.do?skinId=SKIN_0000008&amp;boardId=BBS_0000008&amp;menuCd=DOM_000000104007001000&amp;startPage=1">취소</a>
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

	</section>


</body>
</html>