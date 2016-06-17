<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html> 
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<title>WhenWhere</title>
<jsp:include page="../../component/core_head.jsp" />
<style>
		.noticewrite { float: right; width: 100px;}
		
		.noticewrite{
		border:1px solid #275d8b; -webkit-border-radius: 3px; -moz-border-radius: 3px;border-radius: 3px;font-size:12px;font-family:arial, helvetica, sans-serif; padding: 10px 10px 10px 10px; text-decoration:none; display:inline-block;text-shadow: -1px -1px 0 rgba(0,0,0,0.3);font-weight:bold; color: #FFFFFF;
		background-color: #337AB7; background-image: -webkit-gradient(linear, left top, left bottom, from(#337AB7), to(#337AB7));
 		background-image: -webkit-linear-gradient(top, #337AB7, #337AB7);
 		background-image: -moz-linear-gradient(top, #337AB7, #337AB7);
 		background-image: -ms-linear-gradient(top, #337AB7, #337AB7);
 		background-image: -o-linear-gradient(top, #337AB7, #337AB7);
 		background-image: linear-gradient(to bottom, #337AB7, #337AB7);filter:progid:DXImageTransform.Microsoft.gradient(GradientType=0,startColorstr=#337AB7, endColorstr=#337AB7);
		}

		.noticewrite:hover{
		 border:1px solid #1d4567;
		 background-color: #285f8f; background-image: -webkit-gradient(linear, left top, left bottom, from(#285f8f), to(#285f8f));
		 background-image: -webkit-linear-gradient(top, #285f8f, #285f8f);
		 background-image: -moz-linear-gradient(top, #285f8f, #285f8f);
 		 background-image: -ms-linear-gradient(top, #285f8f, #285f8f);
		 background-image: -o-linear-gradient(top, #285f8f, #285f8f);
 		 background-image: linear-gradient(to bottom, #285f8f, #285f8f);filter:progid:DXImageTransform.Microsoft.gradient(GradientType=0,startColorstr=#285f8f, endColorstr=#285f8f);
		}
		
		.noticebox {
  		position: relative;
  		border-radius: 3px;
  		background: #ffffff;
  		border-top: 3px solid #d2d6de;
  		margin-bottom: 20px;
  		width: 75%;
  		box-shadow: 0 1px 1px rgba(0, 0, 0, 0.1);
  		margin: 0 auto;
		}
		
		@media (max-width: 767px) {
  		.noticebox {
  		position: relative;
  		border-radius: 3px;
  		background: #ffffff;
  		border-top: 3px solid #d2d6de;
  		margin-bottom: 20px;
  		width: 100%;
  		box-shadow: 0 1px 1px rgba(0, 0, 0, 0.1);
  		margin: 0 auto;
		}
  }
  		@media (max-width: 1160px) {
  		.noticebox {
  		position: relative;
  		border-radius: 3px;
  		background: #ffffff;
  		border-top: 3px solid #d2d6de;
  		margin-bottom: 20px;
  		width: 100%;
  		box-shadow: 0 1px 1px rgba(0, 0, 0, 0.1);
  		margin: 0 auto;
		}
  }
}
</style>

<script type="text/javascript">
	$(function() {
		$('#noticewrite').on('click', function() {
			var category = ""+${category}+"";
			
			 location.href = "noticewriteform?category=" + category+""; 
		});
	});
</script>

</head>
<body class="hold-transition skin-blue sidebar-mini sidebar-collapse">
	<div class="wrapper">
		<jsp:include page="../../component/header.jsp" />
		<jsp:include page="../../component/linkSidebar.jsp" />
		<div class="content-wrapper">
			<section class="content">
				<!-- /.row -->
				<div class="row">
					<div class="col-xs-12">
						<div class="box_wrapper">
						<div class="noticebox">
							<div class="box-header">
								<c:choose>
									<c:when test="${searchboardList eq null}">
										<h3 class="box-title">${boardList[0].boardName }</h3>
									</c:when>
									<c:otherwise>
										<h3 class="box-title">${searchboardList[0].boardName }</h3>
									</c:otherwise>
								</c:choose>


								<div class="box-tools">
									<form action="search" id="searchForm" name="rfc_bbs_searchForm" class="rfc_bbs_searchForm" method="GET">									
									<div class="input-group input-group-sm" style="width: 150px;">
										<c:choose>
													<c:when test="${searchboardList eq null}">
														<input type="hidden" name="category"
															value="${boardList[0].category}">
													</c:when>
													<c:otherwise>
														<input type="hidden" name="category"
															value="${searchboardList[0].category}">
													</c:otherwise>
										</c:choose>
										<input type="hidden" name="searchType" value="B_TITLE">
										<input type="hidden" name="page" value="1">										
										<input type="text" name="keyword" class="form-control pull-right" placeholder="Search">
										<div class="input-group-btn">
											<button type="submit" class="btn btn-default">
												<i class="fa fa-search"></i>
											</button>
										</div>
									</div>
									</form>
								</div>
							</div>
							<!-- /.box-header -->
							<div class="box-body table-responsive no-padding">
								<table class="table table-hover">
									<colgroup>
										<col width="10%">
										<col width="*">
										<col width="8%">
										<col width="6%">
										<col width="10%">
										<col width="25%">
									</colgroup>

									<tr>
										<th scope="col">글번호</th>
										<th scope="col">제목</th>
										<th scope="col">조회수</th>
										<th scope="col">작성자</th>
										<th scope="col">작성일</th>
									</tr>
									<c:choose>
										<c:when test="${searchboardList eq null}">
											<c:forEach var="item" items="${boardList}" varStatus="status">
												<tr>
													<%-- <input type="hidden" name="num" value="${item.num}"> --%>
													<td>${item.no}</td>
													<td><a
														href="noticeRead?no=${item.no}&category=${item.category}">${item.title}</a></td>
													<td>${item.hit}</td>
													<td>${item.auth}</td>
													<td>${item.wdate}</td>
												</tr>
											</c:forEach>
										</c:when>
										<c:otherwise>
											<c:forEach var="item" items="${searchboardList}"
												varStatus="status">
												<tr>
													<%-- <input type="hidden" name="num" value="${item.num}"> --%>
													<td>${item.no}</td>
													<td><a
														href="noticeRead?no=${item.no}&category=${item.category}">${item.title}</a></td>
													<td>${item.hit}</td>
													<td>${item.auth}</td>
													<td>${item.wdate}</td>
												</tr>
											</c:forEach>
										</c:otherwise>
									</c:choose>
								</table>
							</div>
							<!-- /.box-body -->

							<div class="box-footer clearfix">
								<ul class="pagination pagination-sm no-margin pull-right">
									<c:choose>
										<c:when test="${searchpagenation eq null}">
											<c:choose>
												<c:when test="${pagenation.currPage>3}">
													<li><a
														href="notice?page=1&category=${boardList[0].category}"><<</a></li>
													<li><a
														href="notice?page=${pagenation.linkBegin-1}&category=${boardList[0].category}"><</a></li>
												</c:when>
											</c:choose>
											<c:forEach var="i" begin="${pagenation.linkBegin}"
												end="${pagenation.linkEnd}" step="1">
												<c:choose>
													<c:when test="${i eq pagenation.currPage}">
														<li class="page"><a
															href="notice?page=${i}&category=${boardList[0].category}"
															class="choice"><strong>${i}</strong></a></li>
													</c:when>
													<c:otherwise>
														<li class="page"><a
															href="notice?page=${i}&category=${boardList[0].category}">${i}</a></li>
													</c:otherwise>
												</c:choose>
											</c:forEach>
											<c:choose>
												<c:when test="${pagenation.linkEnd ne pagenation.totalPage}">
													<li><a
														href="notice?page=${pagenation.linkEnd+1}&category=${boardList[0].category}">></a></li>
													<li><a
														href="notice?page=${pagenation.totalPage}&category=${boardList[0].category}">>></a></li>
												</c:when>
											</c:choose>
										</c:when>
										<c:otherwise>
											<c:choose>
												<c:when test="${searchpagenation.currPage>10}">
													<li><a
														href="search?page=1&searchType=${searchVO.title}&keyword=${searchVO.content}&category=${searchboardList[0].category}">&lt;&lt;</a></li>
													<li><a
														href="search?page=${pagenation.linkBegin-1}&searchType=${searchVO.title}&keyword=${searchVO.content}&category=${searchboardList[0].category}">&lt;</a></li>
												</c:when>
											</c:choose>
											<c:forEach var="i" begin="${searchpagenation.linkBegin}"
												end="${searchpagenation.linkEnd}" step="1">
												<c:choose>
													<c:when
														test="${i eq searchpagenation.currPage}&searchType=${searchVO.title}&keyword=${searchVO.content}">
														<li class="page"><a
															href="search?page=${i}&category=${searchboardList[0].category}"
															class="choice"><strong>${i}</strong></a></li>
													</c:when>
													<c:otherwise>
														<li class="page"><a
															href="search?page=${i}&searchType=${searchVO.title}&keyword=${searchVO.content}&category=${searchboardList[0].category}">${i}</a></li>
													</c:otherwise>
												</c:choose>
											</c:forEach>
											<c:choose>
												<c:when
													test="${searchpagenation.linkEnd ne searchpagenation.totalPage}">
													<li><a
														href="search?page=${searchpagenation.linkEnd+1}&searchType=${searchVO.title}&keyword=${searchVO.content}&category=${searchboardList[0].category}">&gt;</a></li>
													<li><a
														href="search?page=${searchpagenation.totalPage}&searchType=${searchVO.title}&keyword=${searchVO.content}&category=${searchboardList[0].category}">&gt;&gt;</a></li>
												</c:when>
											</c:choose>
										</c:otherwise>
									</c:choose>
								</ul>
							</div>
							<c:set value="${boardList[0].category}" var="boardCode" />
							<c:if test="${boardCode == 1}">
								<c:if test="${sessionScope.member.authority eq 'admin'}">							
							<div id="btnWrap">							
								<button class="btn btn-info btn-right" id="noticewrite" style="float: right;">글쓰기</button>
							</div>	
								</c:if>					
							</c:if>
							
							<c:if test="${boardCode == 2}">
								<button class="btn btn-info btn-right" id="noticewrite" style="float: right;">글쓰기</button>	
							</c:if>
							
							
							
						</div>
						<!-- /.box -->
					</div>
					</div>
				</div>
			</section>
		</div>
		<jsp:include page="../../component/footer.jsp" />
		<jsp:include page="../../component/controlSidebar.jsp" />
	</div>

	<jsp:include page="../../component/core_js.jsp" />
	<script src="../../js/jquery-ui-slider-pips.js"></script>
	<script src="../../js/slider.js"></script>
</body>
</html>