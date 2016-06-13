<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>
<html>
<head>
<jsp:include page="../../component/core_head.jsp" />
<title>WhenWhereTest</title>
<link rel="stylesheet" href="../css/board/board.css" type="text/css">

<style>
h1, h2, h3, h4 {
	color: #ffffff;
}

.banner {
	background-color: black;
}

.page {
	margin-bottom: 45px;
	color: #ffffff;
}
</style>

<script type="text/javascript">
	$(function() {
		$('.noticewrite').on('click', function() {

			location.href = "noticewriteform?category=" + $
			{
				boardList[0].category
			}
			+"";
		});
	});
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
			<section class="content-header">
				<c:choose>
					<c:when test="${searchboardList eq null}">
						<h2>${boardList[0].boardName }리스트</h2>
					</c:when>
					<c:otherwise>
						<h2>${searchboardList[0].boardName }리스트</h2>
					</c:otherwise>
				</c:choose>
			</section>

			<div class="container">
				<div class="row">
					<div
						class="col-lg-6 col-lg-offset-3 col--8 col-md-offset-2 text-center">

						<div id="all" class="clearfix">
							<!--2015.12.07 수정-->
							<div class="con_area">
								<div class="board_box">
									<div class="bbs_info">
										<div class="page">
											<c:choose>
												<c:when test="${searchboardList eq null}">
												Total : ${totalcount}개 / Page : <em>${pagenation.currPage}</em> / ${pagenation.totalPage}
											</c:when>
												<c:otherwise>				
												Total : ${searchVO.no}개 / Page : <em>${searchpagenation.currPage}</em> / ${searchpagenation.totalPage}							
											</c:otherwise>
											</c:choose>

										</div>
										<div class="search">


											<form action="search" id="searchForm"
												name="rfc_bbs_searchForm" class="rfc_bbs_searchForm"
												method="GET">
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
												<select name="searchType" id="searchType" class="TypeSelect">
													<option value="B_TITLE">제목</option>
													<option value="B_CONTENT">내용</option>
												</select> <input type="text" title="검색값입력" id="keyword"
													name="keyword" class="b_search_input" value=""> <input
													type="hidden" name="page" value="1">
												<button type="submit" class="searchBtn">검색</button>
											</form>


										</div>
									</div>

									<div class="bbs_list">
										<table class="list_1"
											summary="글번호,제목,첨부파일,조회수,작성자,작성일를 표시하고 있다.">
											<colgroup>
												<col width="10%">
												<col width="*">
												<col width="8%">
												<col width="6%">
												<col width="10%">
												<col width="12%">
											</colgroup>
											<thead>
												<tr>
													<th scope="col">글번호</th>
													<th scope="col">제목</th>
													<th scope="col">조회수</th>
													<th scope="col">작성자</th>
													<th scope="col">작성일</th>
												</tr>
											</thead>
											<tbody>
												<c:choose>
													<c:when test="${searchboardList eq null}">
														<c:forEach var="item" items="${boardList}"
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


											</tbody>
										</table>

									</div>

									<div id="count">
										<ul>
											<c:choose>
												<c:when test="${searchpagenation eq null}">
													<c:choose>
														<c:when test="${pagenation.currPage>10}">
															<li><a
																href="notice?page=1&category=${boardList[0].no}">&lt;&lt;</a></li>
															<li><a
																href="notice?page=${pagenation.linkBegin-1}&category=${boardList[0].category}">&lt;</a></li>
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
														<c:when
															test="${pagenation.linkEnd ne pagenation.totalPage}">
															<li><a
																href="notice?page=${pagenation.linkEnd+1}&category=${boardList[0].category}">[>]</a></li>
															<li><a
																href="notice?page=${pagenation.totalPage}&category=${boardList[0].category}">[>>]</a></li>
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
									<div id="btnWrap">
										<button class="noticewrite" id="noticewrite">글쓰기</button>
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
	</div>
	<!-- scripts -->
	<jsp:include page="../../component/core_js.jsp" />

</body>
</html>
