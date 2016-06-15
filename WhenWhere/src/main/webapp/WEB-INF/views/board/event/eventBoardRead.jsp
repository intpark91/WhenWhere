<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>	
<!DOCTYPE html>
<html>
<head>
	<jsp:include page="../../component/core_head.jsp" />
	<title>WhenWhereTest</title>
	<link rel="stylesheet" href="../css/slider.css" />
	<link rel="stylesheet" href="../css/board/noticeBoardRead.css" type="text/css">  
	<link rel="stylesheet" href="../css/board/comment.css" />
	<style>
h2 {
	padding-top: 10px;
}

.banner {
	background-color: black;
}
</style>

<script type="text/javascript">
function delectAjax(no){
	var category = '${ReadBoard.category}';
	jQuery.ajax({
		type: "post", 
		url:"noticedelete",
		data : {"no":no,"category":category},
		dataType : "json",
		success : function(delect){
			console.log(delect);
			 if(delect.delect==true){			 	
					alert('글 삭제 성공');
					location.href="event?category="+${ReadBoard.category}+"";
			     }
			 else {
				 alert('삭제 실패');
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

function recommend(no){
	var NickName = '${sessionScope.member.nickname}';
	var category = '${ReadBoard.category}';
	if(NickName=='null'){
		$.bootstrapGrowl("로그인이 필요한 서비스 입니다.", {
			type: 'danger',
			align: 'center',
			width: 'auto',
			allow_dismiss: false
		});
	}
	else
	jQuery.ajax({
		
		type: "post", 
		url:"recommend",
		data : {"no":no,"nickName":NickName,"category":category},
		dataType : "json",
		success : function(recommend){
			 if(recommend.recommend==true){			 	
				 $.bootstrapGrowl("추천 되었습니다!", {
						type: 'success',
						align: 'center',
						width: 'auto',
						allow_dismiss: false
				});
					location.href="event?category="+${ReadBoard.category}+"";
			  }
			 else{
				 $.bootstrapGrowl("이미 추천한 행사입니다!", {
						type: 'info',
						align: 'center',
						width: 'auto',
						allow_dismiss: false
				});
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





	$(function(){		
		$('#submit').on('click',function(){
			var serData = $('#commentform').serialize();
			jQuery.ajax({
				type: "post", 
				url:"comment",
				data : serData,
				dataType : "json",
				success : function(insert){
					 if(insert.insert==true){			 	
						 	$.bootstrapGrowl("댓글 작성 완료!", {
								type: 'success',
								align: 'center',
								width: 'auto',
								allow_dismiss: false
							});
							location.href="eventRead?no="+${ReadBoard.no}+"&category="+${ReadBoard.category}+"";
					     }
				},
				complete : function(res){					
				}, 
				error : function(xhr,status,error){
						alert("에러 발생");
						alert(status);
				}  
			});	
			
		});
	});



	function modifyForm(no){	
		location.href="eventRead?no="+no+"&cmd=updateForm&category="+${ReadBoard.category}+"&eno="+${EventDate.no}+"";
	}

	$(function(){
	var nickname = '${sessionScope.member.nickname}'
	   if(nickname=='')
	   $('#author').val('none');
	   else{
	   $('#author').val(nickname);
	   }
	});
	
	function commentmodify(no){
			$('#'+no+' .comm_comment').html('');			
			$('<p><form><textarea id="comment2" name="comment_rp" cols="45" rows="8"></textarea </form></p>').appendTo('#'+no+'');
			$('#'+no+' #commentdelete').html('수정 취소');
			$('#'+no+' #commentdelete').attr('onclick','read();');
			$('#'+no+' #commentmodify').html('수정 확인');
			$('#'+no+' #commentmodify').attr('onclick','updatecomment('+no+');');
	}
	
	function read(){
		location.href="eventRead?no="+${ReadBoard.no}+"";
	}
	
	function updatecomment(no){
		var serData = $('#comment2').val();
		jQuery.ajax({
			type: "post", 
			url:"updatecomment",
			data : {"no":no,"comment":serData},
			dataType : "json",
			success : function(update){
				 if(update.update==true){			 	
					 $.bootstrapGrowl("댓글 수정 완료!", {
							type: 'success',
							align: 'center',
							width: 'auto',
							allow_dismiss: false
					});
						location.href="eventRead?no="+${ReadBoard.no}+"&category="+${ReadBoard.category}+"";
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
	
	function commentdelete(no){
		bootbox.dialog({
			message : "댓글을 삭제 하시겠습니까?",
			buttons : {
				success : {
					label : "네",
					className : "btn-success",
					callback : function() {
						jQuery.ajax({
							type: "post", 
							url:"commentdelect",
							data : {"no":no},
							dataType : "json",
							success : function(cdelete){
								 if(cdelete.cdelete==true){			 	
									 $.bootstrapGrowl("댓글 삭제 완료!", {
											type: 'success',
											align: 'center',
											width: 'auto',
											allow_dismiss: false
									});
										location.href="eventRead?no="+${ReadBoard.no}+"&category="+${ReadBoard.category}+"";
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
				},
				danger : {
					label : "아니요",
					className : "btn-danger",
				}
			}
		});
		
		

	}
	
	
	
</script>

</head>
<body class="hold-transition skin-blue sidebar-mini sidebar-collapse">
	<div id="main_bg" class="info_main_bg" >
			<div class="mainWrap">
			</div>
	</div>
	<div class="wrapper">
		<!-- include -->
		<jsp:include page="../../component/header.jsp" />
		<jsp:include page="../../component/linkSidebar.jsp" />
		<!-- Content Wrapper. Contains page content -->

		<div class="content-wrapper">
			<!-- Content Header (Page header) -->
			<section class="content-header">
			</section>
			<div class="container">
			<div class="row">
				<div
					class="col-lg-6 col-lg-offset-3 col--8 col-md-offset-2 text-center">
					<div id="all" class="clearfix">
						
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
												<h2>${ReadBoard.boardName} 상세 보기</h2>
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
														<th>시작 날짜</th>
														<td>${EventDate.sDate}</td>
														<th>마감 날짜</th>
														<td>${EventDate.eDate}</td>
														<th>추&nbsp;&nbsp;&nbsp;천</th>
														<td>${ReadBoard.recommend}</td>
													</tr>
	
													<tr>
														<td colspan="6" class="bbs_detail">

															<div align="center" class="body_div"
																style="line-height: 160%; font-family: NanumG; font-size: 14px;">
																${ReadBoard.content}
																<br>
															</div>															
														</td>
													</tr>
												</tbody>
											</table>
										<!-- 	</form> -->
											<div class="bbs_btn">
												<p class="fl">													
													<a href="event?category=${ReadBoard.category}"><h4>목록</h4></a>
												</p>
											</div>		
										</div>

									</div>									
											<div id="btnWrap">												
												<button class="noticeboard" id="reviewwrite" type="button" onclick="delectAjax(${ReadBoard.no});">삭제하기</button>
												<button class="noticeboard" id="reviewwrite" type="button" onclick="modifyForm(${ReadBoard.no});">수정하기</button>
												<button class="noticeboard" id="reviewwrite" type="button" onclick="recommend(${ReadBoard.no});">추천하기</button>
											</div>
										</div>
									</div>
									<div class="comment_wrap">
										<div class="con_area">
											<div class="board_box">
												<div class="bbs_view">


													<div class="singlewrap pushpull">
														전체 댓글
														<ol class="commentlist">
															<li class="comment odd alt thread-odd thread-alt depth-1"
																id="li-comment-27">
																<div id="comment-27">
																
																<c:forEach var="item" items="${Noticecomment}" varStatus="status">																
																	<div class="post-wrap rel" id="${item.no}">
																		<div class="reply_text"></div>
																		<div class="postcontentreply">
																			<div class="comment-guts">
																				<div class="avatar-comments">
																					<img src="../images/eventimg/user.JPG">
																				</div>
																				<div class="comment-guts-pads">																					
																					<div class="says">${item.auth}</div>
																					<p class="comm_comment">${item.content}</p>
																				</div>																																				
																			</div>
																		</div>	
<!-- 																	<div class="reply">
																		<lable for="reply" >reply</lable>
																		<input type="checkbox" name="reply">		
																		</div>	 -->
																		<!-- END postcontentreply -->	
																		<button class="commentdelete" id="commentdelete" onclick="commentdelete(${item.no});">댓글 삭제</button>
																		<button class="commentdelete" id="commentmodify" onclick="commentmodify(${item.no});">댓글 수정</button>
																																																				
																	</div>
																</c:forEach>	
																	
																	
																	
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
														
														
														<form action="reviewcommend" method="post" id="commentform" class="comment-form">
															<p class="comment-notes">
																<input type="hidden" name="boardNo" value="${ReadBoard.no}">
																<input type="hidden" name="category" value="${ReadBoard.category}">
															
																<span id="email-notes">여러분의 생각을 댓글을 남겨 주세요! <span
																	class="required">*</span>
																</span>
															</p>
															<p class="comment-form-author">
																<label for="author">이름<span class="required"></span></label>
																<input id="author" name="auth" type="text"
																	readonly="true" value="${sessionScope.member.nickname}" size="30"
																	aria-required="true" required="required">
															</p>
															<p class="comment-form-comment">
																<label for="comment">내용</label>
																<textarea id="comment" name="content" cols="45" rows="8"
																	aria-required="true" required="required" placeholder="댓글을 입력해 주세요"></textarea>
															</p>
															<p class="form-submit">
																
																<input name="submit" type="button" id="submit"
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

			

		<!-- /.content-wrapper -->
		<!-- include -->
		<jsp:include page="../../component/footer.jsp" />
		<jsp:include page="../../component/controlSidebar.jsp" />

	<!-- scripts -->
	<jsp:include page="../../component/core_js.jsp" />
</body>
</html>
