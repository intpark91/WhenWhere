<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>	
<!DOCTYPE html>
<html>
<head>
	<jsp:include page="../../component/core_head.jsp" />
	<title>WhenWhereTest</title>
	<script src="//ajax.googleapis.com/ajax/libs/jquery/1.9.1/jquery.min.js"></script>
	<link rel="stylesheet" href="../css/board/boardwrite.css" type="text/css">
	<link rel="stylesheet" href="../css/datepicker/jquery-ui.css" type="text/css" />
	<script src="../ckEditor/ckeditor.js"></script>
<script src="http://code.jquery.com/ui/1.8.18/jquery-ui.min.js"></script>	

<script type="text/javascript">
	var result = '${insert}';
	if (result == 'true') {				
		$.bootstrapGrowl("글 쓰기 성공!", {
			type: 'success',
			align: 'center',
			width: 'auto',
			allow_dismiss: false
		});
		location.href = "eventRead?no=0";
	}
	else if(result =='false'){
		alert('글 쓰기 실패');
	}
</script>


<script type="text/javascript">
jQuery.browser = {};
(function () {
    jQuery.browser.msie = false;
    jQuery.browser.version = 0;
    if (navigator.userAgent.match(/MSIE ([0-9]+)\./)) {
        jQuery.browser.msie = true;
        jQuery.browser.version = RegExp.$1;
    }
})();
</script>


<script>
	$(function() {
		$("#Datepicker").datepicker({
			 dateFormat: 'yy-mm-dd', // 데이터는 yyyy-MM-dd로 나옴
	            closeText: '닫기',
	            prevText: '이전달',
	            nextText: '다음달',
	            currentText: '오늘',
	            monthNames: ['1월', '2월', '3월', '4월', '5월', '6월', '7월', '8월', '9월', '10월', '11월', '12월'],
	            monthNamesShort: ['1월', '2월', '3월', '4월', '5월', '6월', '7월', '8월', '9월', '10월', '11월', '12월'],
	            dayNames: ['일', '월', '화', '수', '목', '금', '토'],
	            dayNamesShort: ['일', '월', '화', '수', '목', '금', '토'],
	            dayNamesMin: ['일', '월', '화', '수', '목', '금', '토'],
	            weekHeader: 'Wk',
	            firstDay: 0,
	            isRTL: false,
	            duration: 200,
	            showAnim: 'show',	      
	            showMonthAfterYear: true,
	            yearSuffix: '년',
	            showOtherMonths: true,
	            selectOtherMonths: true
	            
			
		});
	});
	
	$(function() {
		$("#Datepicker2").datepicker({
			 dateFormat: 'yy-mm-dd', // 데이터는 yyyy-MM-dd로 나옴
	            closeText: '닫기',
	            prevText: '이전달',
	            nextText: '다음달',
	            currentText: '오늘',
	            monthNames: ['1월', '2월', '3월', '4월', '5월', '6월', '7월', '8월', '9월', '10월', '11월', '12월'],
	            monthNamesShort: ['1월', '2월', '3월', '4월', '5월', '6월', '7월', '8월', '9월', '10월', '11월', '12월'],
	            dayNames: ['일', '월', '화', '수', '목', '금', '토'],
	            dayNamesShort: ['일', '월', '화', '수', '목', '금', '토'],
	            dayNamesMin: ['일', '월', '화', '수', '목', '금', '토'],
	            weekHeader: 'Wk',
	            firstDay: 0,
	            isRTL: false,
	            duration: 200,
	            showAnim: 'show',	      
	            showMonthAfterYear: true,
	            yearSuffix: '년',
	            showOtherMonths: true,
	            selectOtherMonths: true
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


						<script type="text/javascript">
							var f = $("#inForm");
							function formSubmit() {
								if ($("#dataTitle").val() == '') {
									$.bootstrapGrowl("제목을 입력하세요.", {
										type: 'danger',
										align: 'center',
										width: 'auto',
										allow_dismiss: false
									});

									return;
								}
								if ($("#dataContent").val() == '') {
									$.bootstrapGrowl("내용을 입력하세요.", {
										type: 'danger',
										align: 'center',
										width: 'auto',
										allow_dismiss: false
									});
									oEditors.getById["dataContent"].exec(
											"FOCUS", []);
									return;
								}
								if ($("#Datepicker").val() == '' || $("#Datepicker2").val() == '') {
									$.bootstrapGrowl("기간을 선택하세요.", {
										type: 'danger',
										align: 'center',
										width: 'auto',
										allow_dismiss: false
									});
									oEditors.getById["dataContent"].exec(
											"FOCUS", []);
									return;
								}
								if ($("#Datepicker").val() > $("#Datepicker2").val()) {
									$.bootstrapGrowl("행사 종료일이 행사 시작일보다 빠를 수 없습니다.", {
										type: 'danger',
										align: 'center',
										width: 'auto',
										allow_dismiss: false
									});
									oEditors.getById["dataContent"].exec(
											"FOCUS", []);
									return;
								} 
								 
								$("#inForm").submit();
							}
						</script>
						
					
							<!-- 2015.12.07 수정-->

							<!--//-->
							<form id="inForm" name="inForm" method="post"
								action="eventInsert"
								enctype="multipart/form-data">
								<input type="hidden" name="category" value="${category}">	
								<!-- <input type="hidden" name="eno" value="3">	 -->											
								<div class="con_area">
									<div class="board_box">
										<div class="bbs_write">
											<table class="write_1">
												<h3>게시판 글 쓰기</h3>
												<tbody>
													<tr>
														<th scope="row"><label for="dataTitle">제 목</label></th>
														<td class="bbs_tit"><input type="text"
															name="title" id="dataTitle" value=""></td>
													</tr>
													<tr>
														<th scope="row"><label for="userNick">등록자</label></th>
														<td class="bbs_name"><input type="text"
															readonly="readonly" name="auth" id="userNick" value="${sessionScope.member.nickname}"></td>
													</tr>																										<tr>
													<th scope="row"><label for="location">지역</label></th>
														<td class="bbs_location">
														<select name="location" id="location" class="location">
															<c:forEach var="item" items="${location}" varStatus="status">
																<option value="${item.FIRSTLOC}">${item.loc_subject}</option>
															</c:forEach>		
														</select>  
														</td>
													</tr>
													<tr>
														<th scope="row"><label for="dataTitle">기간 선택</label></th>
														<td><input type="text" name="sDate" id="Datepicker">
														<input type="text" name="eDate"  id="Datepicker2"></td>
													</tr>
													<tr>
														<td colspan="2" class="bbs_write">
															<div class="bbs_write_wrap">
																							
															    <textarea id="content" name="content" rows="10" cols="80" placeholder="내용을 입력하세요.">
                                                                </textarea>
																<script>	
   																 CKEDITOR.replace('content',{
    															 toolbar : 'MyToolbar',
    															 filebrowserImageUploadUrl : '${pageContext.request.contextPath}/board/ckeditorImageUpload',   	
    															 height : '800px'
   																 });  
																</script>	
															</div>
														</td>
													</tr>
												</tbody>
											</table>
										</div>

									</div>
										<div class="bbs_btn">
											<p class="fl">&nbsp;</p>
											<p class="fr">
												<a href="#" onclick="formSubmit();">등록</a> 
												<a href="#">취소</a>
											</p>
										</div>
								</div>
							</form>
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
	<script src="../../js/slider.js"></script>
</body>
</html>
