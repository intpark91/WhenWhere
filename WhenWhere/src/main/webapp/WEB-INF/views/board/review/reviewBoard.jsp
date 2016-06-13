<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>	
<!DOCTYPE html>
<html>
<head>
	<jsp:include page="../../component/core_head.jsp" />
	<title>WhenWhereTest</title>
	<link rel="stylesheet" href=../css/board/reviewBoard.css>
	<style type="text/css">
</style>
<script type="text/javascript">
	$(function(){
		$('.reviewwrite').on('click',function(){
			location.href="reviewwrite"	
		});
	});
</script>

<style type="text/css">
	.ellip {
		white-space:nowrap;
		overflow:hidden;
		text-overflow:ellipsis;
	}
</style>

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
					<div class="con_area">
						<div class="festivalWrap">
							<div class="thisMonth">
								<h3>Focus</h3>
								<h4>이달의 행사</h4>
								<div class="thisMonth2" style="position: relative;">5월</div>
								<div class="festival">
									<ul class="festival_list">
										<li class="festival_list_child">
											<ul class="bandi_list">
												<li class="bandi_img">
													<a href="#">
														<img src="../images/reviewimg/reviewDemo.JPG"alt="">
													</a>
												</li>
												<li>
												<a href="noticeRead">[전주] 전주한지문화축제</a><br> <span class="bandi_list_date">2016.05.05~05.08</span></li>
											</ul>
										</li>
										
										<li class="festival_list_child">
											<ul class="bandi_list">
												<li class="bandi_img">
													<a href="#">
														<img src="../images/reviewimg/reviewDemo.JPG" alt="">
													</a>
												</li>
												<li>
													<a href="#">[전주] 전주국제영화제</a><br> 
													<span class="bandi_list_date">2016.04.28~05.07</span>
												</li>
											</ul>
										</li>

										<li class="festival_list_child">
											<ul class="bandi_list">
												<li class="bandi_img">
													<a href="#">
														<img src="../images/reviewimg/reviewDemo.JPG" alt="#">
													</a>
												</li>
												<li>
													<a href="#">[남원] 바래봉 철쭉제</a> 
													<br> <span class="bandi_list_date">2016.04.23~05.22</span>
												</li>
											</ul>
										</li>
									</ul>
									<ul class="festival_page">
										<li><a
											onclick="fnAjaxThisMonthTravelInfomationEventList(1); ">&lt;&lt;</a></li>
										<li><a
											onclick="fnAjaxThisMonthTravelInfomationEventList(1); ">&lt;</a></li>
										<li class="page"><strong>1</strong></li>
										<li class="page"><a
											onclick="fnAjaxThisMonthTravelInfomationEventList(2); ">2</a></li>
										<li class="page"><a
											onclick="fnAjaxThisMonthTravelInfomationEventList(3); ">3</a></li>
										<li><a
											onclick="fnAjaxThisMonthTravelInfomationEventList(4); ">&gt;</a></li>
										<li><a
											onclick="fnAjaxThisMonthTravelInfomationEventList(6); ">&gt;&gt;</a></li>

									</ul>
								</div>
							</div>

							<div class="fesival_view">

								<div class="this_month_event_view" style="display: block;">
									<div class="bandi">
										<h2>dxsadas</h2>
				
										<p>장소 : 전라북도 전주시 덕진구 덕진동 1가 1220</p>
										<p>주최/주관 : 전주시/전주한지문화축제 조직위원회</p>
										<p>연락처 : 063-271-2503</p>
										<a href="#">상세보기</a>
									</div>
									<p class="bandi_img">
										<img src="../images/reviewimg/reviewDemo.JPG" alt="한지문화축제.jpg">
									</p>
								</div>

								<div class="this_month_event_view" style="display: none;">
									<div class="bandi">
										<h2>전주국제영화제</h2>
										<p class="term">
											<img src="../images/reviewimg/reviewDemo.JPG"
												alt="달력이모티">&nbsp;&nbsp;2016.04.28~05.07(10일간)
										</p>
										<p>장소 : 전라북도 전주시 완산구 고사동 155-1</p>
										<p>주최/주관 : 전주국제영화제조직위원회/전주국제영화제집행위원회</p>
										<p>연락처 : 063-288-5433</p>
										<a href="#">상세보기</a>
									</div>
									<p class="bandi_img">

										<img src="../images/reviewimg/reviewDemo.JPG" alt="festival_img.jpg">
									</p>
								</div>

								<div class="this_month_event_view" style="display: none;">
									<div class="bandi">
										<h2>바래봉 철쭉제</h2>
										<p class="term">
											<img src="../images/reviewimg/reviewDemo.JPG" alt="달력이모티">&nbsp;&nbsp;2016.04.23~05.22(30일간)
										</p>
										<p>장소 :</p>
										<p>주최/주관 : 남원시/운봉읍</p>
										<p>연락처 : 063-634-0024</p>
										<a href="#">상세보기</a>
									</div>
									<p class="bandi_img">

										<img
											src="../images/reviewimg/reviewDemo.JPG" alt="1.jpg">
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
								<a href="#">
									<img src="../images/reviewimg/reviewDemo.JPG" alt="" class="photo_img">
								</a>
								<h3>
									<a href="#">
										<span class="jb_area">군산</span> ${item.title}
									</a>
								</h3>
								<ul class="stay_infobox">
									<li>기간: ${item.wdate} ~ ${item.wdate2}</li> 
									<li> ${item.content}</li>
								</ul>
							</div>
							</c:forEach>
						</div>
						<div id="count">
									<ul>
						<c:choose>
							<c:when test="${searchpagenation eq null}">
									<c:choose>
										<c:when test="${pagenation.currPage>10}">
										<li><a href="notice?page=1&category=${boardList[0].no}">&lt;&lt;</a></li>
										<li><a href="notice?page=${pagenation.linkBegin-1}&category=${boardList[0].category}">&lt;</a></li>
										</c:when>
									</c:choose>																						
								    <c:forEach var="i" begin="${pagenation.linkBegin}" end="${pagenation.linkEnd}" step="1">
            							<c:choose>
               						    	<c:when test="${i eq pagenation.currPage}">
               						    		<li class="page"><a href="notice?page=${i}&category=${boardList[0].category}" class="choice"><strong>${i}</strong></a></li>
               						    	</c:when>
               						    <c:otherwise><li class="page"><a href="notice?page=${i}&category=${boardList[0].category}">${i}</a></li></c:otherwise>
            							</c:choose>
       							   </c:forEach>	
									<c:choose>
								 		<c:when test="${pagenation.linkEnd ne pagenation.totalPage}">
											<li><a href="notice?page=${pagenation.linkEnd+1}&category=${boardList[0].category}">[>]</a></li>
											<li><a href="notice?page=${pagenation.totalPage}&category=${boardList[0].category}">[>>]</a></li>
										</c:when>
									</c:choose>
							</c:when>
						
						
							<c:otherwise>
									<c:choose>
										<c:when test="${searchpagenation.currPage>10}">
										<li><a href="search?page=1&searchType=${searchVO.title}&keyword=${searchVO.content}&category=${searchboardList[0].category}">&lt;&lt;</a></li>
										<li><a href="search?page=${pagenation.linkBegin-1}&searchType=${searchVO.title}&keyword=${searchVO.content}&category=${searchboardList[0].category}">&lt;</a></li>
										</c:when>
									</c:choose>																						
								    <c:forEach var="i" begin="${searchpagenation.linkBegin}" end="${searchpagenation.linkEnd}" step="1">
            							<c:choose>
               						    	<c:when test="${i eq searchpagenation.currPage}&searchType=${searchVO.title}&keyword=${searchVO.content}">
               						    		<li class="page"><a href="search?page=${i}&category=${searchboardList[0].category}" class="choice"><strong>${i}</strong></a></li>
               						    	</c:when>
               						    <c:otherwise><li class="page"><a href="search?page=${i}&searchType=${searchVO.title}&keyword=${searchVO.content}&category=${searchboardList[0].category}">${i}</a></li></c:otherwise>
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
							<button class="reviewwrite" id="reviewwrite">글쓰기</button>
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
	<script src="../../js/jquery-ui-slider-pips.js"></script>
	<script src="../../js/slider.js"></script>
</body>
</html>
