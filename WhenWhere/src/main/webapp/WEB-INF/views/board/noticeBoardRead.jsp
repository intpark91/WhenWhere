<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<jsp:include page="../component/core_head.jsp" />
<title>WhenWhereTest</title>
<link rel="stylesheet" href="../css/slider.css" />
<link rel="stylesheet" href="../css/board/noticeBoardRead.css"
	type="text/css">
<link rel="stylesheet" href="../css/board/comment.css" type="text/css">
<style>
h2 {
	padding-top: 10px;
}

.banner {
	background-color: black;
}

.input-group {
	width: 100%;
}
</style>

<script type="text/javascript">
function delectAjax(no){
	
	jQuery.ajax({
		type: "post", 
		url:"noticedelete",
		data : {"no":no},
		dataType : "json",
		success : function(delect){
			console.log(delect);
			 if(delect.delect==true){			 	
					alert('글 삭제 성공');
					location.href="notice";
			     }
		},
		complete : function(res){					
		}, 
		error : function(xhr,status,error){
				alert("에러 발생");
				alert(status);
		}  
	});	
}	
	function modifyForm(no){	
		location.href="noticeRead?no="+no+"&cmd=updateForm";
	}

	$(function(){
	    $(".noticeboardcomment").on('click',function(){	    	
	    	$(".comment_wrap").css('visibility','visible');
	    	$(".comment_wrap").attr('class','comment_wrap_visible');
	    	
	    });
	    
 	    $('.commentbtn').on('click',function(){
	    	$(".comment_wrap_visible").css('visibility','hidden');
	    	$(".comment_wrap_visible").attr('class','comment_wrap');
	    
	    }); 
	    
	});
	$(function(){
	var nickname = '${sessionScope.member.nickname}'
	   if(nickname=='')
	   $('#author').val('none');
	   else{
	   $('#author').val(nickname);
	   }
	});
</script>

</head>
<body class="hold-transition skin-blue sidebar-mini sidebar-collapse">
	<div id="main_bg" class="info_main_bg">
		<div class="mainWrap"></div>
	</div>
	<div class="wrapper">
		<!-- include -->
		<jsp:include page="../component/header.jsp" />
		<jsp:include page="../component/linkSidebar.jsp" />
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
								<!--2015.12.07 수정-->

								<!--//-->
								<div id="printArea">
									<div class="con_area">
										<div class="board_box">

											<div class="bbs_view">
												<!--RFC 일반게시판 내가쓴글 시작-->
												<%-- <form name="readform">
											<input type="hidden" name="no" value="${ReadBoard.no}"> --%>
												<table class="view_1"
													summary="토론마당 제목, 토론기간, 진행상태와 조회를 표시하고 있다.">
													<h2>공지사항 상세 보기</h2>
													<colgroup>
														<col width="15%">
														<col width="20%">
														<col width="15%">
														<col width="20%">
														<col width="10%">
														<col width="20%">
													</colgroup>
													<tbody>
														<tr>
															<th scope="row">제 목</th>
															<td scope="col" colspan="6" class="bbs_tit">
																<div>${ReadBoard.title}</div>
															</td>
														</tr>
														<tr>

															<th scope="row">작 성 자</th>
															<td>${ReadBoard.auth}</td>
															<th scope="row">등록일</th>
															<td>${ReadBoard.wdate}</td>
															<th scope="row">조&nbsp;&nbsp;&nbsp;회</th>
															<td>${ReadBoard.hit}</td>
														</tr>


														<tr>
															<td colspan="6" class="bbs_detail">

																<div align="center" class="body_div"
																	style="line-height: 160%; font-family: NanumG; font-size: 14px;">
																	${ReadBoard.content} <br>
																</div>
															</td>
														</tr>
													</tbody>
												</table>
												<!-- 	</form> -->
												<div class="bbs_btn">
													<p class="fl">
														<a href="notice"><h4>목록</h4></a>
													</p>
												</div>
											</div>

										</div>
										<div id="btnWrap">
											<button class="noticeboard" id="reviewwrite" type="button"
												onclick="delectAjax(${ReadBoard.no});">삭제하기</button>
											<button class="noticeboard" id="reviewwrite" type="button"
												onclick="modifyForm(${ReadBoard.no});">수정하기</button>
										</div>
										<div>
											<button class="noticeboardcomment" id="reviewwrite"
												type="button">댓글보기</button>
										</div>
									</div>
									<div class="comment_wrap" style="visibility:hidden;">
										<div class="con_area">
											<div class="board_box">
												<div class="bbs_view">


													<div class="singlewrap pushpull">
														전체 댓글
														<ol class="commentlist">
															<li class="comment odd alt thread-odd thread-alt depth-1"
																id="li-comment-27">
																<div id="comment-27">
																	<div class="post-wrap rel">
																		<div class="reply_text"></div>
																		<div class="postcontentreply">
																			<div class="comment-guts">
																				<div class="avatar-comments">
																					<img src="../images/eventimg/user.JPG">
																				</div>
																				<div class="comment-guts-pads">
																					<!--  <div class="carrot-comment"></div> -->
																					<div class="says">none</div>
																					<div class="says">
																						<span class="says_date">06 09, 2016</span>
																					</div>
																					<p>ddsadasd</p>
																				</div>
																			</div>
																		</div>
																		<!-- END postcontentreply -->
																	</div>
																	<!-- END comment -->
																</div> <!--end entire post wrap-->
															</li>
															<!-- #comment-## -->

														</ol>
													</div>

													<div id="respond" class="comment-respond">
														<h3 id="reply-title" class="comment-reply-title">
															댓글 쓰기 <small> <a rel="nofollow"
																id="cancel-comment-reply-link"
																href="http://myforum.dothome.co.kr/my-favorite-model/#respond"
																style="display: none;">댓글 취소</a>
															</small>
														</h3>
														<form action="comment" method="post" id="commentform" class="comment-form">
															<p class="comment-notes">
																<span id="email-notes">여러분의 생각을 댓글을 남겨 주세요! <span
																	class="required">*</span>
																</span>
															</p>
															<p class="comment-form-author">
																<label for="author">이름<span class="required"></span></label>
																<input id="author" name="auth" type="text"
																	readonly="true" value="none" size="30"
																	aria-required="true" required="required">
															</p>


															<p class="comment-form-comment">
																<label for="comment">내용</label>
																<textarea id="comment" name="comment" cols="45" rows="8"
																	aria-required="true" required="required"></textarea>
															</p>
															<p class="form-submit">
																<button type="button" class="commentbtn" id="submit">댓글 감추기</button>
																<input name="submit" type="submit" id="submit"
																	class="submit" value="댓글 쓰기"> 															
															</p>
															
														</form>
													</div>
													<!-- #respond -->
												</div>
											</div>
											<!--end col8-->


										</div>
									</div>
								</div>

							</div>
						</div>
					</div>
				</div>
			</div>
		</div>


		<!-- /.content-wrapper -->
		<!-- include -->
		<jsp:include page="../component/footer.jsp" />
		<jsp:include page="../component/controlSidebar.jsp" />
	</div>
	<!-- scripts -->
	<jsp:include page="../component/core_js.jsp" />
</body>
</html>
