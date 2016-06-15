<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>	
<!DOCTYPE html>
<html>
<head>
	<jsp:include page="../../component/core_head.jsp" />
	<title>WhenWhereTest</title>
	<link rel="stylesheet" href="../css/board/eventboard.css" type="text/css">
	<style>
h1,h2,h3,h4 {
	
	color:#111;
}

.eventtitle{
	margin-top: 10px;
}

.banner {
	background-color: black;
}

.page{
margin-bottom : -35px;

}
</style>

<script type="text/javascript">
	$(function(){
		$('.eventwrite').on('click',function(){
			location.href="eventWrite?category=4";
		});
	});
</script>
</head>

<body class="hold-transition skin-blue sidebar-mini sidebar-collapse">

	<div class="wrapper">
		<!-- include -->
		<jsp:include page="../../component/header.jsp" />
		<jsp:include page="../../component/linkSidebar.jsp" />
		<!-- Content Wrapper. Contains page content -->

		<div class="content-wrapper">
			<!-- Content Header (Page header) -->

			<!-- Main content -->
			<!-- /.content -->
			<div class="container">
			<div class="row">
				<div
					class="col-lg-6 col-lg-offset-3 col--8 col-md-offset-2 text-center">
					<div class="con_area">
						<div class="board_box">
							<div class="bbs_info">
							<h2 class="eventtitle">행사 리스트</h2>
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


										<form action="eventSearch"
											id="searchForm" name="rfc_bbs_searchForm"
											class="rfc_bbs_searchForm" method="GET">
											<c:choose>
											<c:when test="${searchboardList eq null}">
											<input type="hidden" name="category" value="${ReviewboardList[0].CATEGORY}">
											</c:when>
											<c:otherwise>
											<input type="hidden" name="category" value="${searchboardList[0].CATEGORY}">
											</c:otherwise>
											</c:choose>											
											<select name="searchType" id="searchType" class="TypeSelect">
												<option value="B_TITLE">제목</option>
												<option value="B_CONTENT">내용</option>
											</select> 
											<input type="text" title="검색값입력" id="keyword" name="keyword" class="b_search_input" value="">
											<input type="hidden" name="page" value="1">
											<button type="submit" class="searchBtn">검색</button>
										</form>
									</div>
							</div>
							<div class="bbs_list">
							
								<section class="board_photo">
									<ul class="board_ebook">
								<c:choose>
								<c:when test="${searchboardList eq null}">
									<c:forEach var="item" items="${ReviewboardList}" varStatus="status">	
										<li>
											<figure>
												<a href="eventRead?no=${item.NO}&category=4" alt="" class="thum_photo"> 
													<img src="http://localhost:8088/img/${item.FILENAME}" alt="null">
												</a>
												<figcaption>
													<h3>													
														<a href="eventRead?no=${item.NO}&category=4" >${item.TITLE}</a>
													</h3>
													<h4>
														${item.CONTENT}												
													</h4>
													<p>
													${item.SDATE} ~ ${item.EDATE}
													</p>
													<p>
													<span class="jb_area">[${item.LOC}]</span>
													<span class="jb_area">추천 : ${item.RECOMMEND}</span>
													</p>
													<div>
													<p class="ebook_btn">
														<a href="eventRead?no=${item.NO}&category=4" class="aLink">자세히보기</a>
													</p>
													</div>
												</figcaption>
											</figure>
										</li>
										</c:forEach>
								</c:when>
								<c:otherwise>
									<c:forEach var="item" items="${searchboardList}" varStatus="status">
										<li>
											<figure>
												<a href="eventRead?no=${item.NO}&category=4" alt="" class="thum_photo"> 
													<img src="http://localhost:8088/img/${item.FILENAME}" alt="null">
												</a>
												<figcaption>
													<h3>													
														<a href="eventRead?no=${item.NO}&category=4">${item.TITLE}</a>
													</h3>
													<h4>
														${item.CONTENT}												
													</h4>
													<p>
													${item.SDATE} ~ ${item.EDATE}
													</p>
													<p>
													<span class="jb_area">[${item.LOC}]</span>
													<span class="jb_area">추천 : ${item.RECOMMEND}</span>
													</p>
													<p class="ebook_btn">
														<a href="noticeRead" >자세히보기</a>
													</p>
												</figcaption>
											</figure>
										</li>
									</c:forEach>
								</c:otherwise>
								</c:choose>	
									</ul>
								</section>
							</div>
						</div>
								<div id="count">
									<ul>
										<c:choose>
							<c:when test="${searchpagenation eq null}">
									<c:choose>
										<c:when test="${pagenation.currPage>10}">
										<li><a href="review?page=1&category=${ReviewboardList[0].NO}">&lt;&lt;</a></li>
										<li><a href="review?page=${pagenation.linkBegin-1}&category=4">&lt;</a></li>
										</c:when>
									</c:choose>																						
								    <c:forEach var="i" begin="${pagenation.linkBegin}" end="${pagenation.linkEnd}" step="1">
            							<c:choose>
               						    	<c:when test="${i eq pagenation.currPage}">
               						    		<li class="page"><a href="event?page=${i}&category=4" class="choice"><strong>${i}</strong></a></li>
               						    	</c:when>
               						    <c:otherwise><li class="page"><a href="event?page=${i}&category=4">${i}</a></li></c:otherwise>
            							</c:choose>
       							   </c:forEach>	
									<c:choose>
								 		<c:when test="${pagenation.linkEnd ne pagenation.totalPage}">
											<li><a href="review?page=${pagenation.linkEnd+1}&category=3">[>]</a></li>
											<li><a href="review?page=${pagenation.totalPage}&category=3">[>>]</a></li>
										</c:when>
									</c:choose>
							</c:when>
						
						
							<c:otherwise>
									<c:choose>
										<c:when test="${searchpagenation.currPage>10}">
										<li><a href="search?page=1&searchType=${searchVO.title}&keyword=${searchVO.content}&category=${searchboardList[0].CATEGORY}">&lt;&lt;</a></li>
										<li><a href="search?page=${pagenation.linkBegin-1}&searchType=${searchVO.title}&keyword=${searchVO.content}&category=${searchboardList[0].CATEGORY}">&lt;</a></li>
										</c:when>
									</c:choose>																						
								    <c:forEach var="i" begin="${searchpagenation.linkBegin}" end="${searchpagenation.linkEnd}" step="1">
            							<c:choose>
               						    	<c:when test="${i eq searchpagenation.currPage}&searchType=${searchVO.title}&keyword=${searchVO.content}">
               						    		<li class="page"><a href="search?page=${i}&category=${searchboardList[0].CATEGORY}" class="choice"><strong>${i}</strong></a></li>
               						    	</c:when>
               						    <c:otherwise><li class="page"><a href="search?page=${i}&searchType=${searchVO.title}&keyword=${searchVO.content}&category=${searchboardList[0].CATEGORY}">${i}</a></li></c:otherwise>
            							</c:choose>
       							   </c:forEach>	
									<c:choose>
								 		<c:when test="${searchpagenation.linkEnd ne searchpagenation.totalPage}">
											<li><a href="search?page=${searchpagenation.linkEnd+1}&searchType=${searchVO.title}&keyword=${searchVO.content}&category=${searchboardList[0].category}">&gt;</a></li>
											<li><a href="search?page=${searchpagenation.totalPage}&searchType=${searchVO.title}&keyword=${searchVO.content}&category=${searchboardList[0].category}">&gt;&gt;</a></li>
										</c:when>
									</c:choose>						
							</c:otherwise>
						</c:choose>	
									</ul>
								</div>
								
							<div id="btnWrap">
							<button class="eventwrite" id="eventwrite">글쓰기</button>
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
