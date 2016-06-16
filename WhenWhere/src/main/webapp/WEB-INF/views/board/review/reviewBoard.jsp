<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>	
<!DOCTYPE html>
<html>
<head>
	<link rel="stylesheet" href=../css/board/reviewCSS/board.css>
	<link rel="stylesheet" href=../css/board/reviewCSS/body.css>
	<link rel="stylesheet" href=../css/board/reviewCSS/common.css>
	<link rel="stylesheet" href=../css/board/reviewCSS/contents.css>
	<link rel="stylesheet" href=../css/board/reviewCSS/sub1.css>
	<jsp:include page="../../component/core_head.jsp" />
	<title>WhenWhereTest</title>
	
	<style type="text/css">
.bandi2 {
	max-height: 200px;
	overflow: auto;
}

.fesival_view .bandi a  {
	width: 150px;
	height: 45px;
	line-height: 33px;
	text-align: center;
	font-size: 22px;
	border: 1px solid #dadada;  
	margin: 30px 0 0 10px; 
	padding: 5px 5px;
}
</style>
<script type="text/javascript">
	$(function(){
		$('.reviewwrite').on('click',function(){
			location.href="reviewwrite?category=3"					
		});
		$('.img p:has(img)').css('display','none');
		
		$('.bandi p:has(img)').css('display','none');
		
	});
	
	
</script>

<style type="text/css">
	.ellip {
		white-space:nowrap;
		overflow:hidden;
		text-overflow:ellipsis;
	}
</style>

<style type="text/css">
	.commendtitle{
	color:#111;
	}
</style>

</head>
<body class="hold-transition skin-blue sidebar-mini sidebar-collapse">
	<div class="wrapper">
		<!-- include -->
		<jsp:include page="../../component/header.jsp" />
		<jsp:include page="../../component/linkSidebar.jsp" />
		<!-- Content Wrapper. Contains page content -->

		<div class="content-wrapper">

				<!-- <div class="col-lg-offset-3 col-lg-6 col-md-offset-2 col-md-8  text-center"> -->
				<div id="content01">
					<div class="con_area">
						<div class="festivalWrap">
							<div class="thisMonth">
								<h3>Focus</h3>
								<h4>Best 행사</h4>								
								<div class="thisMonth2" style="position: relative;">6월</div>								
								<div class="festival">
									<ul class="festival_list">
										<c:forEach var="item" items="${bestcommend}" varStatus="status" begin="0" end="2">
										<li class="festival_list_child">
											<ul class="bandi_list">
												<li class="bandi_img">
													<a href="reviewRead?no=${item.NO}&category=${bestcommend[0].category}">
														<img src="http://192.168.8.13:8088/img/${item.FILENAME}"alt="">
													</a>
												</li>
												<li>
												<a href="reviewRead?no=${item.NO}&category=${item.category}" class="atage">[${item.loc}] ${item.title}</a><br> <span class="bandi_list_date">${item.SDATE} ~ ${item.EDATE}</span></li>            
											</ul>
										</li>	
										</c:forEach>
									</ul>
								</div>
							</div>

							<div class="fesival_view">
								<div class="this_month_event_view" >
									<div class="bandi">
										<div class="bandi2">
											<h2>${bestcommend[0].title}</h2>										
											<p>${bestcommend[0].content}</p>
											<p>기간:${bestcommend[0].SDATE} ~ ${bestcommend[0].EDATE} </p>									
										</div>
										<a href="reviewRead?no=${bestcommend[0].NO}&category=${bestcommend[0].category}">상세보기</a>
									</div>
									<p class="bandi_img">
										<img src="http://192.168.8.13:8088/img/${bestcommend[0].FILENAME}" alt="한지문화축제.jpg">
									</p>
								</div>
							</div>
	
						</div>
						<div class="serchResult">
							<ul class="result">
								<li>검색결과</li>
								<li>|</li>
								<li>총<span class="result_on">${totalcount}</span>건
								</li>
								<li class="result_my"></li>
							</ul>
						</div>

						<div class="serchList">
							<c:forEach var="item" items="${ReviewboardList}" varStatus="status">	
							<div class="photoWrap">
								<a href="reviewRead?no=${item.NO}&category=3">
									<img src="http://192.168.8.13:8088/img/${item.FILENAME}" alt="" class="photo_img">
								</a>
								<h3>
									<a href="reviewRead?no=${item.NO}&category=3">
									
									<span id="boardtitle">${item.TITLE}</span>								
												
									</a>
								</h3>
								<ul class="stay_infobox">
									<li>기간: ${item.SDATE} ~ ${item.EDATE}</li>

									<li class="img"> ${item.CONTENT}</li>
								</ul>
								<span class="jb_area">추천수: ${item.RECOMMEND}</span>	
								<span class="jb_area">${item.LOC}</span> 
							</div>
							</c:forEach>
						</div>
						<div id="count">
									<ul>
						<c:choose>
							<c:when test="${searchpagenation eq null}">
									<c:choose>
										<c:when test="${pagenation.currPage>10}">
										<li><a href="review?page=1&category=${boardList[0].NO}">&lt;&lt;</a></li>
										<li><a href="review?page=${pagenation.linkBegin-1}&category=3">&lt;</a></li>
										</c:when>
									</c:choose>																						
								    <c:forEach var="i" begin="${pagenation.linkBegin}" end="${pagenation.linkEnd}" step="1">
            							<c:choose>
               						    	<c:when test="${i eq pagenation.currPage}">
               						    		<li class="page"><a href="review?page=${i}&category=3" class="choice"><strong>${i}</strong></a></li>
               						    	</c:when>
               						    <c:otherwise><li class="page"><a href="review?page=${i}&category=3">${i}</a></li></c:otherwise>
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
											<li><a href="search?page=${searchpagenation.linkEnd+1}&searchType=${searchVO.title}&keyword=${searchVO.content}&category=${searchboardList[0].CATEGORY}">&gt;</a></li>
											<li><a href="search?page=${searchpagenation.totalPage}&searchType=${searchVO.title}&keyword=${searchVO.content}&category=${searchboardList[0].CATEGORY}">&gt;&gt;</a></li>
										</c:when>
									</c:choose>						
							</c:otherwise>
						</c:choose>	
									</ul>

								</div>	
						
						<div id="btnWrap">
							<button class="reviewwrite" id="reviewwrite">글쓰기</button>
						</div>												
					</div>					
				</div>
			<!-- </div> -->
		</div>
		

		</div>

		<!-- /.content-wrapper -->
		<!-- include -->
		<jsp:include page="../../component/footer.jsp" />
		<jsp:include page="../../component/controlSidebar.jsp" />
	</div>
	<!-- scripts -->
	<jsp:include page="../../component/core_js.jsp" />
	<script src="../js/loadingSpinner.js"></script>
</body>
</html>
