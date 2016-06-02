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
<link rel="stylesheet"
	href="//maxcdn.bootstrapcdn.com/bootstrap/3.3.4/css/bootstrap.min.css" />
<link rel="stylesheet" href="../css/board/eventboard.css" type="text/css">

<style>
	h2{
		padding-top : 10px;
	}
	.banner{
	  background-color:black;
	}
</style>

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
								<!-- 게시판리스트 -->
								<h2>행사 게시판 리스트</h2>
								<section class="board_photo">
									<!-- 게시판리스트 -->
									<ul class="board_ebook">
										<li>
											<figure>
												<a href="http://tour.jb.go.kr/mailing/201605/2016_05.html"
													target="_blank" alt="" class="thum_photo"> <!--	<a href="2016" alt="" class="thum_photo"> -->

													<img
													src="./전라북도 토탈관광 - 여행도우미_여행가이드_뉴스레터_files/146216632866079.jpg"
													alt="null">

												</a>
												<figcaption>
													<h3>
														<a
															href="http://tour.jb.go.kr/board/view.do?skinId=SKIN_0000010&amp;boardId=BBS_0000010&amp;menuCd=DOM_000000104003007000&amp;dataSid=333">2016년
															05월</a>
													</h3>
													<h4>
														<p>떠나세요</p>
														<p>
															봄이 있는 이 땅으로<br>
														</p>
													</h4>
													<p class="ebook_btn">
														<a href="http://tour.jb.go.kr/mailing/201605/2016_05.html"
															target="_blank">자세히보기</a>
													</p>
												</figcaption>
											</figure>
										</li>

										<li>
											<figure>
												<a href="http://tour.jb.go.kr/mailing/201604/2016_04.html"
													target="_blank" alt="" class="thum_photo"> <!--	<a href="2016" alt="" class="thum_photo"> -->

													<img
													src="./전라북도 토탈관광 - 여행도우미_여행가이드_뉴스레터_files/146191912793868.jpg"
													alt="null">

												</a>
												<figcaption>
													<h3>
														<a
															href="http://tour.jb.go.kr/board/view.do?skinId=SKIN_0000010&amp;boardId=BBS_0000010&amp;menuCd=DOM_000000104003007000&amp;dataSid=271">2016년
															04월</a>
													</h3>
													<h4>
														<p>꽃향기가 가득한 봄!</p>
														<p>사랑하는 사람과 함께 전라북도에서 봄의 향기를 느껴보세요</p>
													</h4>
													<p class="ebook_btn">
														<a href="http://tour.jb.go.kr/mailing/201604/2016_04.html"
															target="_blank">자세히보기</a>
													</p>
												</figcaption>
											</figure>
										</li>

										<li>
											<figure>
												<a href="http://tour.jb.go.kr/mailing/201603/2016_03.html"
													alt="" target="_blank" class="thum_photo"> <!--	<a href="http://tour.jb.go.kr/mailing/201603/2016_03.html" alt="" class="thum_photo"> -->

													<img
													src="./전라북도 토탈관광 - 여행도우미_여행가이드_뉴스레터_files/145827470525939.jpg"
													alt="null">

												</a>
												<figcaption>
													<h3>
														<a
															href="http://tour.jb.go.kr/board/view.do?skinId=SKIN_0000010&amp;boardId=BBS_0000010&amp;menuCd=DOM_000000104003007000&amp;dataSid=222">2016년
															3월</a>
													</h3>
													<h4>흩날리는 바람따라 봄꽃따라 설레임이 가득한 초록빛 세상속으로~</h4>
													<p class="ebook_btn">
														<a href="http://tour.jb.go.kr/mailing/201603/2016_03.html"
															target="_blank">자세히보기</a>
													</p>
												</figcaption>
											</figure>
										</li>

										<li>
											<figure>
												<a href="http://tour.jb.go.kr/mailing/201602/2016_02.html"
													alt="" target="_blank" class="thum_photo"> <!--	<a href="http://tour.jb.go.kr/mailing/201602/2016_02.html" alt="" class="thum_photo"> -->

													<img
													src="./전라북도 토탈관광 - 여행도우미_여행가이드_뉴스레터_files/145827436341474.jpg"
													alt="null">

												</a>
												<figcaption>
													<h3>
														<a
															href="http://tour.jb.go.kr/board/view.do?skinId=SKIN_0000010&amp;boardId=BBS_0000010&amp;menuCd=DOM_000000104003007000&amp;dataSid=221">2016년
															2월</a>
													</h3>
													<h4>고향 방문을 진심으로 환영합니다. 맛과 멋과 흥의 고장 전라북도에서 소중한 추억
														만들어가세요~</h4>
													<p class="ebook_btn">
														<a href="http://tour.jb.go.kr/mailing/201602/2016_02.html"
															target="_blank">자세히보기</a>
													</p>


												</figcaption>
											</figure>
										</li>

										<li>
											<figure>
												<a href="http://tour.jb.go.kr/mailing/201512/2015_12.html"
													alt="" target="_blank" class="thum_photo"> <!--	<a href="http://tour.jb.go.kr/mailing/201512/2015_12.html" alt="" class="thum_photo"> -->

													<img
													src="./전라북도 토탈관광 - 여행도우미_여행가이드_뉴스레터_files/p1449045829940-1.jpg"
													alt="null">

												</a>
												<figcaption>
													<h3>
														<a
															href="http://tour.jb.go.kr/board/view.do?skinId=SKIN_0000010&amp;boardId=BBS_0000010&amp;menuCd=DOM_000000104003007000&amp;dataSid=51437">2015년
															12월</a>
													</h3>
													<h4>그 겨울을 걷는다. 눈부신 설경과 함께 아름다운 전북의 자연을 만나세요.</h4>
													<p class="ebook_btn">
														<a href="http://tour.jb.go.kr/mailing/201512/2015_12.html"
															target="_blank">자세히보기</a>
													</p>
												</figcaption>
											</figure>
										</li>

										<li>
											<figure>
												<a href="http://tour.jb.go.kr/mailing/201511/2015_11.html"
													alt="" target="_blank" class="thum_photo"> <!--	<a href="http://tour.jb.go.kr/mailing/201511/2015_11.html" alt="" class="thum_photo"> -->

													<img
													src="./전라북도 토탈관광 - 여행도우미_여행가이드_뉴스레터_files/p1446617585975-1.jpg"
													alt="null">

												</a>
												<figcaption>
													<h3>
														<a
															href="http://tour.jb.go.kr/board/view.do?skinId=SKIN_0000010&amp;boardId=BBS_0000010&amp;menuCd=DOM_000000104003007000&amp;dataSid=50919">2015년
															11월</a>
													</h3>
													<h4>맛과 멋, 흥의 고장인지라 맛있는 음식과 볼 것도 많은 정읍. 역사와 문화를 한눈에 볼 수
														있는 곳, 함께 가보실까요?</h4>
													<p class="ebook_btn">
														<a href="http://tour.jb.go.kr/mailing/201511/2015_11.html"
															target="_blank">자세히보기</a>
													</p>
												</figcaption>
											</figure>
										</li>

										<li>
											<figure>
												<a href="http://tour.jb.go.kr/mailing/201510/2015_10.html"
													target="_blank" alt="" class="thum_photo"> <!--	<a href="2016" alt="" class="thum_photo"> -->

													<img
													src="./전라북도 토탈관광 - 여행도우미_여행가이드_뉴스레터_files/p1443693014100-1.jpg"
													alt="null">

												</a>
												<figcaption>
													<h3>
														<a
															href="http://tour.jb.go.kr/board/view.do?skinId=SKIN_0000010&amp;boardId=BBS_0000010&amp;menuCd=DOM_000000104003007000&amp;dataSid=50122">2015년
															10월</a>
													</h3>
													<h4>2015 관광주간(10.19-11.1) 떠나세요. 가을은 짧지만 가을의 추억은 깁니다.</h4>
													<p class="ebook_btn">
														<a href="http://tour.jb.go.kr/mailing/201510/2015_10.html"
															target="_blank">자세히보기</a>
													</p>


												</figcaption>
											</figure>
										</li>

										<li>
											<figure>
												<a href="http://tour.jb.go.kr/mailing/201509/2015_09.html"
													alt="" target="_blank" class="thum_photo"> <!--	<a href="http://tour.jb.go.kr/mailing/201509/2015_09.html" alt="" class="thum_photo"> -->

													<img
													src="./전라북도 토탈관광 - 여행도우미_여행가이드_뉴스레터_files/p1443693259209-1.jpg"
													alt="null">

												</a>
												<figcaption>
													<h3>
														<a
															href="http://tour.jb.go.kr/board/view.do?skinId=SKIN_0000010&amp;boardId=BBS_0000010&amp;menuCd=DOM_000000104003007000&amp;dataSid=49526">2015년
															9월</a>
													</h3>
													<h4>9월 전라북도 여행지 추천!! 무더운 더위가 물러간 여름의 끝자락과 가을 문턱에 서 있는
														9월은.. 전라북도에서 낭만의 가을 빛과 함께 추억여행에 동행하실래요?</h4>
													<p class="ebook_btn">
														<a href="http://tour.jb.go.kr/mailing/201509/2015_09.html"
															target="_blank">자세히보기</a>
													</p>
												</figcaption>
											</figure>
										</li>

										<li>
											<figure>
												<a href="http://tour.jb.go.kr/mailing/20158/2015_8.html"
													target="_blank" alt="" class="thum_photo"> <!--	<a href="2016" alt="" class="thum_photo"> -->

													<img
													src="./전라북도 토탈관광 - 여행도우미_여행가이드_뉴스레터_files/p1438335418823-1.jpg"
													alt="null">

												</a>
												<figcaption>
													<h3>
														<a
															href="http://tour.jb.go.kr/board/view.do?skinId=SKIN_0000010&amp;boardId=BBS_0000010&amp;menuCd=DOM_000000104003007000&amp;dataSid=48801">2015년
															8월</a>
													</h3>
													<h4>여름휴가 가고 싶은 도시 전라북도! 후회 없는 여행! 딱 좋은 선택! 추억 더하기를 위해
														전라북도가 함께합니다.</h4>
													<p class="ebook_btn">
														<a href="http://tour.jb.go.kr/mailing/20158/2015_8.html"
															target="_blank">자세히보기</a>
													</p>


												</figcaption>
											</figure>
										</li>

										<li>
											<figure>
												<a href="http://tour.jb.go.kr/mailing/201507/2015_07.html"
													alt="" target="_blank" class="thum_photo"> <!--	<a href="http://tour.jb.go.kr/mailing/201507/2015_07.html" alt="" class="thum_photo"> -->

													<img
													src="./전라북도 토탈관광 - 여행도우미_여행가이드_뉴스레터_files/p1435822569468-1.jpg"
													alt="null">

												</a>
												<figcaption>
													<h3>
														<a
															href="http://tour.jb.go.kr/board/view.do?skinId=SKIN_0000010&amp;boardId=BBS_0000010&amp;menuCd=DOM_000000104003007000&amp;dataSid=47714">2015년
															7월</a>
													</h3>
													<h4>시군대표관광지로 떠나는 여행, 무주! 전라북도 무주에서 무더운 여름 휴가철 즐기기!</h4>
													<p class="ebook_btn">
														<a href="http://tour.jb.go.kr/mailing/201507/2015_07.html"
															target="_blank">자세히보기</a>
													</p>


												</figcaption>
											</figure>
										</li>

										<li>
											<figure>
												<a href="http://tour.jb.go.kr/mailing/201506/2015_06.html"
													alt="" target="_blank" class="thum_photo"> <!--	<a href="http://tour.jb.go.kr/mailing/201506/2015_06.html" alt="" class="thum_photo"> -->

													<img
													src="./전라북도 토탈관광 - 여행도우미_여행가이드_뉴스레터_files/p1433746733162-1.jpg"
													alt="null">

												</a>
												<figcaption>
													<h3>
														<a
															href="http://tour.jb.go.kr/board/view.do?skinId=SKIN_0000010&amp;boardId=BBS_0000010&amp;menuCd=DOM_000000104003007000&amp;dataSid=46956">2015년
															6월</a>
													</h3>
													<h4>자연속 동물과 함께하는 친환경 테마여행!</h4>
													<p class="ebook_btn">
														<a href="http://tour.jb.go.kr/mailing/201506/2015_06.html"
															target="_blank">자세히보기</a>
													</p>
												</figcaption>
											</figure>
										</li>
										<li>
											<figure>
												<a href="http://tour.jb.go.kr/mailing/201505/2015_05.html"
													alt="" target="_blank" class="thum_photo"> <!--	<a href="http://tour.jb.go.kr/mailing/201505/2015_05.html" alt="" class="thum_photo"> -->
													<img
													src="./전라북도 토탈관광 - 여행도우미_여행가이드_뉴스레터_files/p1430903016666-1.jpg"
													alt="null">
												</a>
												<figcaption>
													<h3>
														<a
															href="http://tour.jb.go.kr/board/view.do?skinId=SKIN_0000010&amp;boardId=BBS_0000010&amp;menuCd=DOM_000000104003007000&amp;dataSid=46216">2015년
															5월</a>
													</h3>
													<h4>놓치면 후회하리! 이 봄 가장 빛나는 관광주간도 즐기고~ 축제도 즐기고~</h4>
													<p class="ebook_btn">
														<a href="http://tour.jb.go.kr/mailing/201505/2015_05.html"
															target="_blank">자세히보기</a>
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
					</div>
				</div>
			</div>
		</div>
	</section>

</body>
</html>