<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<title>후기게시판</title>
<meta name="description"
	content="This is a free Bootstrap landing page theme created for BootstrapZero. Feature video background and one page design." />
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<meta name="generator" content="Codeply">
<link rel="stylesheet"
	href="//maxcdn.bootstrapcdn.com/bootstrap/3.3.4/css/bootstrap.min.css" />
<link
	href="//cdnjs.cloudflare.com/ajax/libs/animate.css/3.1.1/animate.min.css"
	rel="stylesheet" />
<link rel="stylesheet"
	href="//code.ionicframework.com/ionicons/2.0.1/css/ionicons.min.css" />
<link rel="stylesheet" href="../css/styles.css" />
<link rel="stylesheet" href="../css/reviewBoard.css" type="text/css">


</head>
<body>
	<jsp:include page="../component/topNav.jsp" />
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
						<div class="festivalWrap">
							<div class="thisMonth">
								<h3>Focus</h3>
								<h4>이달의 행사</h4>

								<div class="thisMonth2" style="position: relative;">5월</div>
								<div class="festival">
									<ul class="festival_list">

										<li class="festival_list_child">
											<ul class="bandi_list">
												<li class="bandi_img"><a
													href="http://tour.jb.go.kr/travel/info/view.do?category_top_id=c&amp;menuCd=DOM_000000103001000000&amp;contentsSid=22&amp;ctnt_id=20746">

														<img
														src="./전라북도 토탈관광 - 여행정보_문화•축제_files/20160426153420145.jpg"
														alt="">
												</a></li>
												<li><a
													href="http://tour.jb.go.kr/travel/info/view.do?category_top_id=c&amp;menuCd=DOM_000000103001000000&amp;contentsSid=22&amp;ctnt_id=20746">[전주]
														전주한지문화축제</a><br> <span class="bandi_list_date">2016.05.05~05.08</span></li>
											</ul>
										</li>

										<li class="festival_list_child">
											<ul class="bandi_list">
												<li class="bandi_img"><a
													href="http://tour.jb.go.kr/travel/info/view.do?category_top_id=c&amp;menuCd=DOM_000000103001000000&amp;contentsSid=22&amp;ctnt_id=20743">

														<img
														src="./전라북도 토탈관광 - 여행정보_문화•축제_files/20160113234214131.jpg"
														alt="">
												</a></li>
												<li><a
													href="http://tour.jb.go.kr/travel/info/view.do?category_top_id=c&amp;menuCd=DOM_000000103001000000&amp;contentsSid=22&amp;ctnt_id=20743">[전주]
														전주국제영화제</a><br> <span class="bandi_list_date">2016.04.28~05.07</span></li>
											</ul>
										</li>

										<li class="festival_list_child">
											<ul class="bandi_list">
												<li class="bandi_img"><a
													href="http://tour.jb.go.kr/travel/info/view.do?category_top_id=c&amp;menuCd=DOM_000000103001000000&amp;contentsSid=22&amp;ctnt_id=23903">

														<img
														src="./전라북도 토탈관광 - 여행정보_문화•축제_files/6c46c754-f4aa-4289-8efa-c41bc32ee4df.jpg.png"
														alt="#">
												</a></li>
												<li><a
													href="http://tour.jb.go.kr/travel/info/view.do?category_top_id=c&amp;menuCd=DOM_000000103001000000&amp;contentsSid=22&amp;ctnt_id=23903">[남원]
														바래봉 철쭉제</a><br> <span class="bandi_list_date">2016.04.23~05.22</span></li>
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
										<h2>전주한지문화축제</h2>
										<p class="term">
											<img src="./전라북도 토탈관광 - 여행정보_문화•축제_files/calendar_small.png"
												alt="달력이모티">&nbsp;&nbsp;2016.05.05~05.08(4일간)
										</p>
										<p>장소 : 전라북도 전주시 덕진구 덕진동 1가 1220</p>
										<p>주최/주관 : 전주시/전주한지문화축제 조직위원회</p>
										<p>연락처 : 063-271-2503</p>
										<a
											href="http://tour.jb.go.kr/travel/info/view.do?category_top_id=c&amp;menuCd=DOM_000000103001000000&amp;contentsSid=22&amp;ctnt_id=20746">상세보기</a>
									</div>
									<p class="bandi_img">

										<img
											src="./전라북도 토탈관광 - 여행정보_문화•축제_files/20160426153420145.jpg"
											alt="한지문화축제.jpg">
									</p>
								</div>

								<div class="this_month_event_view" style="display: none;">
									<div class="bandi">
										<h2>전주국제영화제</h2>
										<p class="term">
											<img src="./전라북도 토탈관광 - 여행정보_문화•축제_files/calendar_small.png"
												alt="달력이모티">&nbsp;&nbsp;2016.04.28~05.07(10일간)
										</p>
										<p>장소 : 전라북도 전주시 완산구 고사동 155-1</p>
										<p>주최/주관 : 전주국제영화제조직위원회/전주국제영화제집행위원회</p>
										<p>연락처 : 063-288-5433</p>
										<a
											href="http://tour.jb.go.kr/travel/info/view.do?category_top_id=c&amp;menuCd=DOM_000000103001000000&amp;contentsSid=22&amp;ctnt_id=20743">상세보기</a>
									</div>
									<p class="bandi_img">

										<img
											src="./전라북도 토탈관광 - 여행정보_문화•축제_files/20160113234214131.jpg"
											alt="festival_img.jpg">
									</p>
								</div>

								<div class="this_month_event_view" style="display: none;">
									<div class="bandi">
										<h2>바래봉 철쭉제</h2>
										<p class="term">
											<img src="./전라북도 토탈관광 - 여행정보_문화•축제_files/calendar_small.png"
												alt="달력이모티">&nbsp;&nbsp;2016.04.23~05.22(30일간)
										</p>
										<p>장소 :</p>
										<p>주최/주관 : 남원시/운봉읍</p>
										<p>연락처 : 063-634-0024</p>
										<a
											href="http://tour.jb.go.kr/travel/info/view.do?category_top_id=c&amp;menuCd=DOM_000000103001000000&amp;contentsSid=22&amp;ctnt_id=23903">상세보기</a>
									</div>
									<p class="bandi_img">

										<img
											src="./전라북도 토탈관광 - 여행정보_문화•축제_files/6c46c754-f4aa-4289-8efa-c41bc32ee4df.jpg.png"
											alt="1.jpg">
									</p>
								</div>

							</div>

							<script type="text/javascript">
								var date = new Date();
								/* MonthPicker 옵션 */
								var options = {
									pattern : 'yyyy.mm',
									selectedYear : date.getFullYear(),
									startYear : date.getFullYear(),
									finalYear : date.getFullYear() + 1,
									monthNames : [ '1월', '2월', '3월', '4월',
											'5월', '6월', '7월', '8월', '9월',
											'10월', '11월', '12월' ]
								};
								$('#thisMonthBtn').monthpicker(options);
								$('#thisMonthBtn')
										.monthpicker()
										.bind(
												'monthpicker-click-month',
												function(e, month) {
													var year = $(
															'.mtz-monthpicker.mtz-monthpicker-year')
															.val();
													if (month <= 9) {
														month = '0' + month
													}
													$('input[name=this_month]')
															.val(
																	year
																			+ '.'
																			+ month);
													fnAjaxThisMonthTravelInfomationEventList(1);
												});
							</script>
						</div>



						<div class="banner">
							<p class="banner_img">
								<img src="./전라북도 토탈관광 - 여행정보_문화•축제_files/info_banner.png"
									alt="후기">
							</p>
							<a href="http://www.myjb.kr/" target="_blank" title="새창에서 열림">바로가기</a>
						</div>





						<div class="serchResult">
							<ul class="result">
								<li>검색결과</li>
								<li>|</li>
								<li>총<span class="result_on">70</span>건
								</li>
								<li class="result_my"></li>
							</ul>
							<ul class="order">
								<li><a
									href="http://tour.jb.go.kr/travel/info/list.do?category_top_id=c&amp;menuCd=DOM_000000103001000000&amp;contentsSid=22#none"
									class="on">인기순</a></li>
								<li><a
									href="http://tour.jb.go.kr/travel/info/list.do?category_top_id=c&amp;menuCd=DOM_000000103001000000&amp;contentsSid=22#none">가나다순</a>
								</li>
							</ul>
						</div>

						<div class="serchList">
							<div class="photoWrap">
								<a
									href="http://tour.jb.go.kr/travel/info/view.do?category_top_id=c&amp;menuCd=DOM_000000103001000000&amp;contentsSid=22&amp;ctnt_id=150">

									<img src="./전라북도 토탈관광 - 여행정보_문화•축제_files/20160114003450588.jpg"
									alt="576742363_632913ee_z29.jpg" class="photo_img">


								</a>
								<h3>
									<a
										href="http://tour.jb.go.kr/travel/info/view.do?category_top_id=c&amp;menuCd=DOM_000000103001000000&amp;contentsSid=22&amp;ctnt_id=150">
										<span class="jb_area">전주</span> 전주대사습놀이 전국대회
									</a>
								</h3>
								<ul class="stay_infobox">


									<li>기간: 2015.05.30~06.01</li> 조선조 숙종대의 마상궁술대회 및 영조대의 물놀이와 판소리,
									백일장 등 민속무예놀이를 종합 대사습이라 합니다.











								</ul>
							</div>

							<div class="photoWrap">
								<a
									href="http://tour.jb.go.kr/travel/info/view.do?category_top_id=c&amp;menuCd=DOM_000000103001000000&amp;contentsSid=22&amp;ctnt_id=9547">

									<img src="./전라북도 토탈관광 - 여행정보_문화•축제_files/20160115113208230.JPG"
									alt="20160114004001393.JPG" class="photo_img">


								</a>
								<h3>
									<a
										href="http://tour.jb.go.kr/travel/info/view.do?category_top_id=c&amp;menuCd=DOM_000000103001000000&amp;contentsSid=22&amp;ctnt_id=9547">
										<span class="jb_area">군산</span> 군산세계철새축제
									</a>
								</h3>
								<ul class="stay_infobox">




									<li>대한민국을 대표하는 철새들의 휴식지 금강호 일원및 철새조망대에서 "군산세계철새축제"가 매년
										11월에 개최됩니다. 국내 최대 규모의 철새 전문시설인 철새조망대는 ...</li>













								</ul>
							</div>

							<div class="photoWrap">
								<a
									href="http://tour.jb.go.kr/travel/info/view.do?category_top_id=c&amp;menuCd=DOM_000000103001000000&amp;contentsSid=22&amp;ctnt_id=24021">

									<img src="./전라북도 토탈관광 - 여행정보_문화•축제_files/20160118160814204.jpg"
									alt="197518_image2_1.jpg" class="photo_img">


								</a>
								<h3>
									<a
										href="http://tour.jb.go.kr/travel/info/view.do?category_top_id=c&amp;menuCd=DOM_000000103001000000&amp;contentsSid=22&amp;ctnt_id=24021">
										<span class="jb_area">부안</span> 곰소젓갈수산물축제
									</a>
								</h3>
								<ul class="stay_infobox">


									<li>기간: 2015.10.23~10.25</li>



									<li>전북 부안지역 특산품인 곰소젓갈과 청정 수산물을 즐길 수 있는 &lt;곰소젓갈수산물축제&gt;가
										10월 23일부터 25일까지 진서면 곰소젓갈마을 일원에서 열린다. 곰소젓갈은 서해 ...</li>













								</ul>
							</div>

							<div class="photoWrap">
								<a
									href="http://tour.jb.go.kr/travel/info/view.do?category_top_id=c&amp;menuCd=DOM_000000103001000000&amp;contentsSid=22&amp;ctnt_id=9546">

									<img src="./전라북도 토탈관광 - 여행정보_문화•축제_files/140082530082063.jpg"
									alt="대한아놀자2.jpg" class="photo_img">


								</a>
								<h3>
									<a
										href="http://tour.jb.go.kr/travel/info/view.do?category_top_id=c&amp;menuCd=DOM_000000103001000000&amp;contentsSid=22&amp;ctnt_id=9546">
										<span class="jb_area">군산</span> 군산시간여행축제
									</a>
								</h3>
								<ul class="stay_infobox">


									<li>기간: 2016.09.30~10.02</li>



									<li>즐거운 체험거리, 공연, 먹을거리가 가득한 군산의 대표축제로써 일제강점기 수탈의 역사 속 군산
										사람들의 항거와 저항을 기억하고 현재 우리모습을 돌아보는 장으로 당시를 살았던 사람 ...</li>













								</ul>
							</div>

							<div class="photoWrap">
								<a
									href="http://tour.jb.go.kr/travel/info/view.do?category_top_id=c&amp;menuCd=DOM_000000103001000000&amp;contentsSid=22&amp;ctnt_id=164">

									<img src="./전라북도 토탈관광 - 여행정보_문화•축제_files/20160106044727979.png"
									alt="1771479_image2_1.png" class="photo_img">


								</a>
								<h3>
									<a
										href="http://tour.jb.go.kr/travel/info/view.do?category_top_id=c&amp;menuCd=DOM_000000103001000000&amp;contentsSid=22&amp;ctnt_id=164">
										<span class="jb_area">남원</span> 제 5회 지리산 바래봉 눈꽃축제
									</a>
								</h3>
								<ul class="stay_infobox">


									<li>기간: 2016.01.01~02.14</li>



									<li><span style="font-size: 14px;">제5회 지리산남원 바래봉
											눈꽃축제&gt;가 2016년 1월 1일(금)부터 2월 14일(일)까지 남원시 운봉읍 지리산 바래봉 ... </span></li>













								</ul>
							</div>

							<div class="photoWrap">
								<a
									href="http://tour.jb.go.kr/travel/info/view.do?category_top_id=c&amp;menuCd=DOM_000000103001000000&amp;contentsSid=22&amp;ctnt_id=165">

									<img src="./전라북도 토탈관광 - 여행정보_문화•축제_files/20160106055630188.jpg"
									alt="2028703_image2_1.jpg" class="photo_img">


								</a>
								<h3>
									<a
										href="http://tour.jb.go.kr/travel/info/view.do?category_top_id=c&amp;menuCd=DOM_000000103001000000&amp;contentsSid=22&amp;ctnt_id=165">
										<span class="jb_area">완주</span> 산속여우빛축제
									</a>
								</h3>
								<ul class="stay_infobox">


									<li>기간: 2015.08.22~12.31</li>



									<li><span style="font-size: 14px;">"산속여우빛" 축제는 1만여
											평의 허브가 있는 정원에 &lt;어린 왕자&gt; 이야기를 테마로, 정원 곳곳 ... </span></li>













								</ul>
							</div>

							<div class="photoWrap">
								<a
									href="http://tour.jb.go.kr/travel/info/view.do?category_top_id=c&amp;menuCd=DOM_000000103001000000&amp;contentsSid=22&amp;ctnt_id=24057">

									<img src="./전라북도 토탈관광 - 여행정보_문화•축제_files/20160415174801821.jpg"
									alt="마이산배경꽃잔디.jpg" class="photo_img">


								</a>
								<h3>
									<a
										href="http://tour.jb.go.kr/travel/info/view.do?category_top_id=c&amp;menuCd=DOM_000000103001000000&amp;contentsSid=22&amp;ctnt_id=24057">
										<span class="jb_area">진안</span> 원연장 꽃잔디 축제
									</a>
								</h3>
								<ul class="stay_infobox">


									<li>기간: 2016.04.29~05.01</li>



									<li>진안 연장리의 독특한 꽃잔디를 테마로 체험형 축제로 승화시켜 연장리의 브랜드 가치를 극대화
										시키며, 지역축제를 전국적인 자연 관광 축제로 발전시켜 나아감으로써 관광자원 개발과 대 ...</li>













								</ul>
							</div>

							<div class="photoWrap">
								<a
									href="http://tour.jb.go.kr/travel/info/view.do?category_top_id=c&amp;menuCd=DOM_000000103001000000&amp;contentsSid=22&amp;ctnt_id=13429">

									<img src="./전라북도 토탈관광 - 여행정보_문화•축제_files/20160113232544821.jpg"
									alt="139408010009584.jpg" class="photo_img">


								</a>
								<h3>
									<a
										href="http://tour.jb.go.kr/travel/info/view.do?category_top_id=c&amp;menuCd=DOM_000000103001000000&amp;contentsSid=22&amp;ctnt_id=13429">
										<span class="jb_area">고창</span> 고창 모양성제
									</a>
								</h3>
								<ul class="stay_infobox">


									<li>기간: 2016.10.05~10.09</li>



									<li>고창읍성(모양성)은 조선 단종 원년(1453년) 외침을 막기 위해 당시 전라도와 제주도 21개현의
										백성들이 힘을 합쳐 축성한 성곽으로 우리나라에서 가장 원형이 잘 보존된 자연석 ...</li>













								</ul>
							</div>

							<div class="photoWrap">
								<a
									href="http://tour.jb.go.kr/travel/info/view.do?category_top_id=c&amp;menuCd=DOM_000000103001000000&amp;contentsSid=22&amp;ctnt_id=13433">

									<img src="./전라북도 토탈관광 - 여행정보_문화•축제_files/20160113231700831.jpg"
									alt="139407885641689.jpg" class="photo_img">


								</a>
								<h3>
									<a
										href="http://tour.jb.go.kr/travel/info/view.do?category_top_id=c&amp;menuCd=DOM_000000103001000000&amp;contentsSid=22&amp;ctnt_id=13433">
										<span class="jb_area">고창</span> 해풍고추 축제
									</a>
								</h3>
								<ul class="stay_infobox">


									<li>기간: 2016.08.27~08.28</li> 제19회 고창 해풍 고추 축제
									<br> 청정 해풍 고추
									<br> 그 참맛과 참빛 체험
									<br>












								</ul>
							</div>


						</div>

						<div id="count">
							<ul>
								<li><a onclick="fnCtntSearchForm(1); ">&lt;&lt;</a></li>
								<li><a onclick="fnCtntSearchForm(1); ">&lt;</a></li>
								<li class="page"><strong>1</strong></li>
								<li class="page"><a onclick="fnCtntSearchForm(2); ">2</a></li>
								<li class="page"><a onclick="fnCtntSearchForm(3); ">3</a></li>
								<li class="page"><a onclick="fnCtntSearchForm(4); ">4</a></li>
								<li class="page"><a onclick="fnCtntSearchForm(5); ">5</a></li>
								<li><a onclick="fnCtntSearchForm(6); ">&gt;</a></li>
								<li><a onclick="fnCtntSearchForm(8); ">&gt;&gt;</a></li>

							</ul>
						</div>
					</div>					
				</div>
			</div>
		</div>
		
	</section>
	<jsp:include page="../component/footer.jsp" />
	<script
		src="//ajax.googleapis.com/ajax/libs/jquery/1.9.1/jquery.min.js"></script>
	<script
		src="//maxcdn.bootstrapcdn.com/bootstrap/3.3.4/js/bootstrap.min.js"></script>
	<script
		src="//cdnjs.cloudflare.com/ajax/libs/jquery-easing/1.3/jquery.easing.min.js"></script>
	<script src="//cdnjs.cloudflare.com/ajax/libs/wow/1.1.2/wow.js"></script>
	<script src="../js/scripts.js"></script>
</body>
</html>