<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<!DOCTYPE html>
<html>
<head>
	<jsp:include page="../component/core_head.jsp" />
	<title>WhenWhereTest</title>
	<link rel="stylesheet" href="../css/board/eventboard.css" type="text/css">
	<style>
h1,h2,h3,h4 {
	
	color:#ffffff;
}

.banner {
	background-color: black;
}

.page{
margin-bottom : -35px;
color:#ffffff;
}
</style>

<script type="text/javascript">
	$(function(){
		$('.eventwrite').on('click',function(){
			location.href="eventWrite"	
		});
	});
</script>
</head>

<body class="hold-transition skin-blue sidebar-mini sidebar-collapse">
	<div id="main_bg" class="info_main_bg" >
		<div class="mainWrap">
		</div>
	</div>
	<div class="wrapper">
		<!-- include -->
		<jsp:include page="../component/header.jsp" />
		<jsp:include page="../component/linkSidebar.jsp" />
		<!-- Content Wrapper. Contains page content -->

		<div class="content-wrapper">
			<!-- Content Header (Page header) -->
			<section class="content-header">
			</section>
			<!-- Main content -->
			<!-- /.content -->
			<div class="container">
			<div class="row">
				<div
					class="col-lg-6 col-lg-offset-3 col--8 col-md-offset-2 text-center">
					<div class="con_area">
						<div class="board_box">
							<div class="bbs_info">
								<div class="page">
									Total : 23개 / Page : <em>1</em> / 2
								</div>
								<div class="search">
									<form action="http://tour.jb.go.kr/board/list.do"
										id="searchForm" name="rfc_bbs_searchForm"
										class="rfc_bbs_searchForm" method="get">
										<input type="hidden" name="orderBy" value=""> <input
											type="hidden" name="boardId" value="BBS_0000010"> <input
											type="hidden" name="startPage" value="1"> <input
											type="hidden" name="menuCd" value="DOM_000000104003007000">
										<input type="hidden" name="contentsSid" value="67"> <input
											type="hidden" name="skinId" value="SKIN_0000010"> <select
											name="searchType" id="searchType" class="TypeSelect">
											<option value="DATA_TITLE">제목</option>
											<option value="DATA_CONTENT">내용</option>
										</select> <input type="text" title="검색값입력" id="keyword" name="keyword"
											class="b_search_input" value="">
										<button type="submit" class="searchBtn">검색</button>
									</form>
								</div>
							</div>
							<div class="bbs_list">
								<h2>행사 게시판 리스트</h2>
								<section class="board_photo">
									<ul class="board_ebook">
										<li>
											<figure>
												<a href="noticeRead" alt="" class="thum_photo"> 
													<img src="../images/eventimg/eventDemo.JPG" alt="null">
												</a>
												<figcaption>
													<h3>
														<a href="noticeRead">2016년05월</a>
													</h3>
													<h4>
														떠나세요 봄이 있는 이 땅으로
														
													</h4>
													<p class="ebook_btn">
														<a href="noticeRead" >자세히보기</a>
													</p>
												</figcaption>
											</figure>
										</li>

										<li>
											<figure>
												<a href="#" target="_blank" alt="" class="thum_photo"> <!--	<a href="2016" alt="" class="thum_photo"> -->

													<img src="../images/eventimg/eventDemo.JPG" alt="null">

												</a>
												<figcaption>
													<h3>
														<a href="#">2016년 04월</a>
													</h3>
													<h4>
														꽃향기가 가득한 봄! 사랑하는 사람과 함께 전라북도에서 봄의 향기를 느껴보세요
													</h4>
													<p class="ebook_btn">
														<a href="#"
															target="_blank">자세히보기</a>
													</p>
												</figcaption>
											</figure>
										</li>

										<li>
											<figure>
												<a href="#" alt="" target="_blank" class="thum_photo"> <!--	<a href="http://tour.jb.go.kr/mailing/201603/2016_03.html" alt="" class="thum_photo"> -->

													<img src="../images/eventimg/eventDemo.JPG" alt="null">

												</a>
												<figcaption>
													<h3>
														<a href="#">2016년 3월</a>
													</h3>
													<h4>흩날리는 바람따라 봄꽃따라 설레임이 가득한 초록빛 세상속으로~</h4>
													<p class="ebook_btn">
														<a href="#" target="_blank">자세히보기</a>
													</p>
												</figcaption>
											</figure>
										</li>

										<li>
											<figure>
												<a href="#" alt="" target="_blank" class="thum_photo"> <!--	<a href="http://tour.jb.go.kr/mailing/201602/2016_02.html" alt="" class="thum_photo"> -->

													<img src="../images/eventimg/eventDemo.JPG" alt="null">

												</a>
												<figcaption>
													<h3>
														<a href="#">2016년 2월</a>
													</h3>
													<h4>고향 방문을 진심으로 환영합니다. 맛과 멋과 흥의 고장 전라북도에서 소중한 추억
														만들어가세요~</h4>
													<p class="ebook_btn">
														<a href="#" target="_blank">자세히보기</a>
													</p>
												</figcaption>
											</figure>
										</li>

										<li>
											<figure>
												<a href="#" alt="" target="_blank" class="thum_photo"> <!--	<a href="http://tour.jb.go.kr/mailing/201512/2015_12.html" alt="" class="thum_photo"> -->
													<img src="../images/eventimg/eventDemo.JPG" alt="null">
												</a>
												<figcaption>
													<h3>
														<a href="#">2015년 12월</a>
													</h3>
													<h4>그 겨울을 걷는다. 눈부신 설경과 함께 아름다운 전북의 자연을 만나세요.</h4>
													<p class="ebook_btn">
														<a href="#" target="_blank">자세히보기</a>
													</p>
												</figcaption>
											</figure>
										</li>

										<li>
											<figure>
												<a href="#" alt="" target="_blank" class="thum_photo"> <!--	<a href="http://tour.jb.go.kr/mailing/201511/2015_11.html" alt="" class="thum_photo"> -->

													<img src="../images/eventimg/eventDemo.JPG" alt="null">
												</a>
												<figcaption>
													<h3>
														<a href="#">2015년 11월</a>
													</h3>
													<h4>맛과 멋, 흥의 고장인지라 맛있는 음식과 볼 것도 많은 정읍. 역사와 문화를 한눈에 볼 수
														있는 곳, 함께 가보실까요?</h4>
													<p class="ebook_btn">
														<a href="#" target="_blank">자세히보기</a>
													</p>
												</figcaption>
											</figure>
										</li>

										<li>
											<figure>
												<a href="#" target="_blank" alt="" class="thum_photo"> <!--	<a href="2016" alt="" class="thum_photo"> -->

													<img src="../images/eventimg/eventDemo.JPG" alt="null">

												</a>
												<figcaption>
													<h3>
														<a href="#">2015년
															10월</a>
													</h3>
													<h4>2015 관광주간(10.19-11.1) 떠나세요. 가을은 짧지만 가을의 추억은 깁니다.</h4>
													<p class="ebook_btn">
														<a href="#" target="_blank">자세히보기</a>
													</p>


												</figcaption>
											</figure>
										</li>

										<li>
											<figure>
												<a href="#" alt="" target="_blank" class="thum_photo"> <!--	<a href="http://tour.jb.go.kr/mailing/201509/2015_09.html" alt="" class="thum_photo"> -->
													<img src="../images/eventimg/eventDemo.JPG" alt="null">
												</a>
												<figcaption>
													<h3>
														<a href="#">2015년 9월</a>
													</h3>
													<h4>9월 전라북도 여행지 추천!! 무더운 더위가 물러간 여름의 끝자락과 가을 문턱에 서 있는
														9월은.. 전라북도에서 낭만의 가을 빛과 함께 추억여행에 동행하실래요?</h4>
													<p class="ebook_btn">
														<a href="#" target="_blank">자세히보기</a>
													</p>
												</figcaption>
											</figure>
										</li>

										<li>
											<figure>
												<a href="#" target="_blank" alt="" class="thum_photo"> <!--	<a href="2016" alt="" class="thum_photo"> -->

													<img src="../images/eventimg/eventDemo.JPG" alt="null">

												</a>
												<figcaption>
													<h3>
														<a href="#">2015년 8월</a>
													</h3>
													<h4>여름휴가 가고 싶은 도시 전라북도! 후회 없는 여행! 딱 좋은 선택! 추억 더하기를 위해
														전라북도가 함께합니다.</h4>
													<p class="ebook_btn">
														<a href="#" target="_blank">자세히보기</a>
													</p>


												</figcaption>
											</figure>
										</li>

										<li>
											<figure>
												<a href="#" alt="" target="_blank" class="thum_photo"> <!--	<a href="http://tour.jb.go.kr/mailing/201507/2015_07.html" alt="" class="thum_photo"> -->

													<img src="../images/eventimg/eventDemo.JPG"alt="null">

												</a>
												<figcaption>
													<h3>
														<a href="#">2015년 7월</a>
													</h3>
													<h4>시군대표관광지로 떠나는 여행, 무주! 전라북도 무주에서 무더운 여름 휴가철 즐기기!</h4>
													<p class="ebook_btn">
														<a href="#" target="_blank">자세히보기</a>
													</p>
												</figcaption>
											</figure>
										</li>

										<li>
											<figure>
												<a href="#" alt="" target="_blank" class="thum_photo"> <!--	<a href="http://tour.jb.go.kr/mailing/201506/2015_06.html" alt="" class="thum_photo"> -->

													<img src="../images/eventimg/eventDemo.JPG" alt="null">

												</a>
												<figcaption>
													<h3>
														<a href="#">2015년 6월</a>
													</h3>
													<h4>자연속 동물과 함께하는 친환경 테마여행!</h4>
													<p class="ebook_btn">
														<a href="#" target="_blank">자세히보기</a>
													</p>
												</figcaption>
											</figure>
										</li>
										<li>
											<figure>
												<a href="#" alt="" target="_blank" class="thum_photo"> <!--	<a href="http://tour.jb.go.kr/mailing/201505/2015_05.html" alt="" class="thum_photo"> -->
													<img src="../images/eventimg/eventDemo.JPG" alt="null">
												</a>
												<figcaption>
													<h3>
														<a href="#">2015년 5월</a>
													</h3>
													<h4>놓치면 후회하리! 이 봄 가장 빛나는 관광주간도 즐기고~ 축제도 즐기고~</h4>
													<p class="ebook_btn">
														<a href="#" target="_blank">자세히보기</a>
													</p>
												</figcaption>
											</figure>
										</li>

									</ul>
								</section>
							</div>
						</div>
								<div id="count">
									<ul>
										<li><a onclick="linkPage(1); ">&lt;&lt;</a></li>
										<li><a onclick="linkPage(1); ">&lt;</a></li>
										<li class="page"><strong>1</strong></li>
										<li class="page"><a onclick="linkPage(2); ">2</a></li>
										<li class="page"><a onclick="linkPage(3); ">3</a></li>
										<li class="page"><a onclick="linkPage(4); ">4</a></li>
										<li class="page"><a onclick="linkPage(5); ">5</a></li>
										<li class="page"><a onclick="linkPage(6); ">6</a></li>
										<li class="page"><a onclick="linkPage(7); ">7</a></li>
										<li class="page"><a onclick="linkPage(8); ">8</a></li>
										<li class="page"><a onclick="linkPage(9); ">9</a></li>
										<li class="page"><a onclick="linkPage(10); ">10</a></li>
										<li><a onclick="linkPage(11); ">&gt;</a></li>
										<li><a onclick="linkPage(35); ">&gt;&gt;</a></li>

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
		<jsp:include page="../component/footer.jsp" />
		<jsp:include page="../component/controlSidebar.jsp" />
	</div>
	<!-- scripts -->
	<jsp:include page="../component/core_js.jsp" />

</body>
</html>
