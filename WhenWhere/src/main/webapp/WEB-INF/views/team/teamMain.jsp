<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
	<jsp:include page="../component/core_head.jsp" />
	<title>WhenWhereTest</title>
	<link href='http://fonts.googleapis.com/css?family=Varela+Round' rel='stylesheet' type='text/css'>
	<!-- Select2 -->
    <link rel="stylesheet" href="../css/daterangepicker-bs3.css">
  	<link rel="stylesheet" href="../css/datepicker3.css">
  	<link rel="stylesheet" href="../css/bootstrap-timepicker.min.css">
	<style type="text/css">
		.row.chatTable {
			margin: 1px;
		}
		
		.box-footer {
			border-top: 0px solid #f4f4f4; 
			padding: 10px;
			background-color: #ffffff;
		}
		
		table{
			text-align: center;
		}
		
		table th{
			text-align: center;
		}
		
		input.form-control.pull-right {
   			 width: 150px;
		}
		
		.chat .item > .message {
		    margin-left: 15px;
		    margin-top: 0px; */
		}
		
		input#reservation {
		    width: 95%;
    		margin-right: 5%;
		}
		
		.label-col-sm-2 {
		    text-align: right;
		    padding-top: 7px;
		}
		
		.input-group[class*=col-] {
		    margin-left: 4%;
		}
		
	</style>
	<script type="text/javascript">
	
		function makeTeam() {
			alert($('form').serialize());
			$.ajax({
				type : "POST",
				url : "../team/makeTeam",
				dataType : "JSON", // 옵션이므로 JSON으로 받을게 아니면 안써도 됨
				data : $('form').serialize(),
				success : function(data) {
					console.log(data);

					if (data.ok) {
						$('input[name=title]').val('');
						$('#roomMakeDiv').addClass('collapsed-box');
						/* $('#roomMakeDiv .box-body').css('display','none'); */
						$('#roomListDiv').addClass('collapsed-box');
						$('#chattingRoom').removeClass('collapsed-box');

						title = data.title;
						user = data.name; 

						$('#roomTitle').text('방제목:');
						$('.room-title').text(title);

						websocket(); //websocket연결
						sendMsg(); //msg 출력
					}
				},
				complete : function(data) {

				},
				error : function(xhr, status, error) {
					console.log(error);
				}
			});
		}
	</script>
</head>

<!-- user/join -->
<body class="hold-transition skin-blue sidebar-mini sidebar-collapse">
		<div class="wrapper">
		<!-- include -->
		<jsp:include page="../component/header.jsp" />
		<jsp:include page="../component/linkSidebar.jsp" />
		<!-- Content Wrapper. Contains page content -->

			<div class="content-wrapper">
				<section class="content-header"></section>
				<!-- Content Header (Page header) -->
	
				<!-- --------------------------------------- Main content ------------------------------------------------------- -->
				<!-- /.row -->
				<div class="row chatTable">
					 <div class="col-sx-12">
			         	<div id="roomMakeDiv"class="box box-default collapsed-box">
			            <div class="box-header with-border">
			            	<h3 class="box-title ">팀 만들기</h3>
			
			            	<div class="box-tools pull-right">
			                	<button type="button" class="btn btn-box-tool" data-widget="collapse">
			                		<i class="fa fa-plus"></i>
			                	</button>
			              </div>
			            </div>
			            <div class="box-body">
			             	<!-- 방만들기 폼 -->
			             	<form class="form-horizontal">
					         	<div class="box-body">
					                <div class="form-group">
					                  	<label for="inputEmail3" class="col-sm-2 control-label">팀이름</label>
					                 	 <div class="col-sm-4">
					                    	<input name="title" type="text" class="form-control" id="inputEmail3" placeholder="방 제목을 입력해주세요">
					                  	</div>
										<label class="col-sm-2 label-col-sm-2">여행 기간</label>
										<div class="input-group col-sm-4">
											<div class="input-group-addon">
												<i class="fa fa-calendar"></i>
											</div>
											<input name="date" type="text" class="form-control pull-right col-sm-10" id="reservation">
										</div>
									</div>
									<div class="form-group">
										<label class="col-sm-1 control-label ">주제</label>
										<div class="col-sm-3">
											<select name="type" class="form-control select2" style="width: 100%;">
												<option value="0" selected="selected">동행</option>
												<option value="1">숙박</option>
												<option value="2">예약</option>
												<option value="3">단체</option>
												<option value="4">기타</option>
											</select>
										</div>
										<label class="col-sm-1 control-label">인원수</label>
										<div class="col-sm-3">
											<select name="userNum" class="form-control select2" style="width: 100%;">
												<option value="2" selected="selected">2</option>
												<option value="4">4</option>
												<option value="6">6</option>
												<option value="8">8</option>
												<option value="10">10</option>
											</select>
										</div>
										<label class="col-sm-1 control-label">지역선택</label>
										<div class="col-sm-3">
											<select name="locName" class="form-control select2" style="width: 100%;">
												<c:forEach items="${locationSubList }" var="list">
													<option value="${list }">${list }</option>
												</c:forEach>
											</select>
										</div>
									</div>
									</div>
					              <!-- /.box-body -->
					              <div class="box-footer">
					                <button type="submit" class="btn btn-default">취소</button>
					                <button type="button" onclick="makeTeam();" class="btn btn-info pull-right">팀만들기</button>
					              </div>
					              <!-- /.box-footer -->
					            </form>
			            </div>
			            <!-- /.box-body -->
			          </div>
				
					<div class="col-sx-12 " >
						<div id="roomListDiv" class="box box-default">
							<div class="box-header">
								<h3 class="box-title"><span class="hidden-xs"> 팀 리스트 </span></h3>
								<div class="box-tools">
									<div class="input-group input-group-sm " style="width: 150px;">
										<input type="text" name="table_search" class="form-control pull-right" placeholder="Search">
										<div class="input-group-btn ">
											<button type="submit" class="btn btn-default">
												<i class="fa fa-search"></i>
											</button>
											<button type="button" class="btn btn-box-tool " data-widget="collapse">
												<i class="fa fa-minus"></i>
			               					</button>
										</div>
									</div>
								</div>
							</div>
							<!-- /.box-header -->
							<div class="box-body table-responsive no-padding">
								<table class="table table-hover mainTr">
									<tr>
										<th style="width: 10px;">#</th>
										<th style="width: 80px;" class="hidden-xs">개설</th>
										<th style="max-width: 20px;">
						                    <select>
							                    <option>전체</option>
							                    <option>동행</option>
							                    <option>숙박</option>
							                    <option>예약</option>
							                    <option>단체</option>
							                    <option>기타</option>
						                    </select>
	                					</th>
	                					<th style="width: 80px;" class="hidden-xs">방정보</th>
										<th>방제목</th>
									</tr>
								</table>
								<div class="box-footer clearfix">
									<ul class="pagination pagination-sm no-margin pull-right">
										<li><a href="#">&laquo;</a></li>
										<li><a href="#">1</a></li>
										<li><a href="#">2</a></li>
										<li><a href="#">3</a></li>
										<li><a href="#">4</a></li>
										<li><a href="#">5</a></li>
										<li><a href="#">&raquo;</a></li>
									</ul>
								</div>
							</div>
							<!-- /.box-body -->
						</div>
						<!-- /.box -->
					</div>
				</div>
	
				<!-- 채팅방 관련-->
				<div id="chattingRoom" class="box box-success collapsed-box">
					<div class="box-header">
						<i class="fa fa-comments-o"></i>
						<span id="roomTitle">선택된 팀이 없습니다.</span>
						<h3 class="box-title room-title"> </h3>
					</div>
					<div class="box-body chat" id="chat-box">
						<!-- chat item -->
						<div class="item chat_main_body">
							*
						</div>
						<!-- /.item -->
						<div class="box-footer">
				              <div class="input-group">
				                <input class="form-control" placeholder="Type message..." name="chatInput">
				
				                <div class="input-group-btn">
				                  <button type="button" onclick="sendMsg();" class="btn btn-success"><i class="fa fa-plus"></i></button>
				                </div>
				              </div>
				            </div>
						</div>
					</div>
				</div>
				<!-- include -->
			</div>
		</div>
		<jsp:include page="../component/footer.jsp" />
		<jsp:include page="../component/controlSidebar.jsp" />
		<!-- scripts -->
	<jsp:include page="../component/core_js.jsp" />
	<script src="https://cdnjs.cloudflare.com/ajax/libs/jquery-validate/1.13.1/jquery.validate.min.js"></script>
	<script src="https://cdnjs.cloudflare.com/ajax/libs/moment.js/2.11.2/moment.min.js"></script>
	<script src="../js/daterangepicker.js"></script>
	<script src="../js/bootstrap-datepicker.js"></script>
	<script src="../js/bootstrap-timepicker.js"></script>
	<script src="../js/moment.min.js"></script>
	<script type="text/javascript">
	$(function(){
	    //Date range picker
	    $('#reservation').daterangepicker();
	    //Date range picker with time picker
	    $('#reservationtime').daterangepicker({timePicker: true, timePickerIncrement: 30, format: 'MM/DD/YYYY h:mm A'});
	    //Date picker
	    $('#datepicker').datepicker({
	      autoclose: true
	    });
	});
	</script>
</body>
</html>