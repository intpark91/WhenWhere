<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<!DOCTYPE html>
<html>
<head>
	<jsp:include page="../component/core_head.jsp" />
	<title>WhenWhereTest</title>
	<link rel="stylesheet" href=../css/board/reviewBoard.css>
	<style type="text/css">
</style>
<script type="text/javascript">
	$(function(){
		$('.reviewwrite').on('click',function(){
			location.href="eventWrite"	
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
		<jsp:include page="../component/header.jsp" />
		<jsp:include page="../component/linkSidebar.jsp" />
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
										<h2>전주한지문화축제</h2>
				
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
								<li>총<span class="result_on">70</span>건
								</li>
								<li class="result_my"></li>
							</ul>

						</div>

						<div class="serchList">
							

							<div class="photoWrap">
								<a href="#">
									<img src="../images/reviewimg/reviewDemo.JPG" alt="20160114004001393.JPG" class="photo_img">
								</a>
								<h3>
									<a href="#">
										<span class="jb_area">군산</span> 군산세계철새축제
									</a>
								</h3>
								<ul class="stay_infobox">
									<li>기간: 2015.05.30~06.01</li> 
									<li>대한민국을 대표하는 철새들의 휴식지 금강호 일원및 철새조망대에서 "군산세계철새축제"가 매년
										11월에 개최됩니다. 국내 최대 규모의 철새 전문시설인 철새조망대는 ...ㅁㄴㅇㅁㄴㅁㄴㅇㄴㅁㅇㅁㄴㅇㅁㄴㅇㅁㄴㅇㅁㄴㅇㅁㄴㅇㅇ </li>
								</ul>
							</div>

							<div class="photoWrap">
								<a href="#">
									<img src="../images/reviewimg/reviewDemo.JPG" alt="197518_image2_1.jpg" class="photo_img">
								</a>
								<h3>
									<a href="#">
										<span class="jb_area">부안</span> 곰소젓갈수산물축제
									</a>
								</h3>
								<ul class="stay_infobox">
									<li>기간: 2015.10.23~10.25</li>
									<li>전북 부안지역 특산품인 곰소젓갈과 청정 수산물을 즐길 수 있는 &lt;곰소젓갈수산물축제&gt;가
										10월 23일부터 25일까지 진서면 곰소젓갈마을 일원에서 열린다. 곰소젓갈은 서해...</li>
								</ul>
							</div>

							<div class="photoWrap">
								<a href="#">
									<img src="../images/reviewimg/reviewDemo.JPG"
									alt="대한아놀자2.jpg" class="photo_img">
								</a>
								<h3>
									<a href="#">
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
								<a href="#">
									<img src="../images/reviewimg/reviewDemo.JPG" alt="1771479_image2_1.png" class="photo_img">
								</a>
								<h3>
									<a href="#">
										<span class="jb_area">남원</span> 지리산 바래봉 눈꽃축제
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
									href="#">
									<img src="../images/reviewimg/reviewDemo.JPG" alt="2028703_image2_1.jpg" class="photo_img">
								</a>
								<h3>
									<a href="#">
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
								<a href="#">
									<img src="../images/reviewimg/reviewDemo.JPG"
									alt="마이산배경꽃잔디.jpg" class="photo_img">
								</a>
								<h3>
									<a href="#">
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
									href="#">

									<img src="../images/reviewimg/reviewDemo.JPG" alt="139408010009584.jpg" class="photo_img">
								</a>
								<h3>
									<a href="#">
										<span class="jb_area">고창</span> 고창 모양성제
									</a>
								</h3>
								<ul class="stay_infobox">
									<li>기간: 2016.10.05~10.09</li>
									<li>고창읍성(모양성)은 조선 단종 원년(1453년) 외침을 막기 위해 당시 전라도와 제주도 21개현의
										백성들이 힘을 합쳐 축성한 성곽으로 우리나라에서 가장 원형이 잘 보존된 자연석 ...</li>
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
		<jsp:include page="../component/footer.jsp" />
		<jsp:include page="../component/controlSidebar.jsp" />
	</div>
	<!-- scripts -->
	<jsp:include page="../component/core_js.jsp" />
	<script src="../js/jquery-ui-slider-pips.js"></script>
	<script src="../js/slider.js"></script>
</body>
</html>
