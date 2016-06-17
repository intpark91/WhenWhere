<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>
<html>
<head>
	<jsp:include page="../component/core_head.jsp" />
	<title>WhenWhere</title>
	<link href='http://fonts.googleapis.com/css?family=Varela+Round' rel='stylesheet' type='text/css'>
	<!-- Select2 -->
    <link rel="stylesheet" href="../css/daterangepicker-bs3.css">
  	<link rel="stylesheet" href="../css/datepicker3.css">
  	<link rel="stylesheet" href="../css/bootstrap-timepicker.min.css">
  	<link rel="stylesheet" href="../css/iCheck/flat/blue.css">
<style type="text/css">
.row.chatTable {
	margin: 1px;
}

.box-footer {
	border-top: 0px solid #f4f4f4;
	padding: 10px;
	background-color: #ffffff;
}

table {
	text-align: center;
}

table th {
	text-align: center;
}

input.form-control.pull-right {
	width: 150px;
}

.chat .item>.message {
	margin-left: 15px;
	margin-top: 0px;
	*/
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

.list-group-unbordered>.list-group-item {
	text-overflow: ellipsis;
	overflow: hidden;
	word-break: break-word;
}

b#a_url {
	color: #E91E63;
}

.box.box-primary {
	padding: 5%;
}

.list-group {
	padding: 5px 30px;
}

.col-sm-6.join-btn {
	margin-bottom: 10px;
}

.direct-chat-img {
	border-radius: 0%;
}

div#chat-box {
	height: 600px;
}

span#roomTitle {
	font-size: 20px;
	color: darkblue;
}

.non-applyBtn {
	display: none;
}

.table>tbody>tr>td, .table>tbody>tr>th, .table>tfoot>tr>td, .table>tfoot>tr>th, .table>thead>tr>td, .table>thead>tr>th {
    padding: 8px;
    /* line-height: 1.42857143; */
    vertical-align: top;
    /* border-top: 1px solid #ddd; */
    /* border-bottom: 1px solid #ddd; */
}

.userApplyBtn{
	padding-top: 0px;
    position: relative;
    bottom: 1px;
    animation: recommend 0.6s infinite alternate;
}

/* Chrome, Safari, Opera */
@-webkit-keyframes recommend { 
	0% {
	/* background-color: rgb(54, 127, 169); */
	color: rgba(255, 255, 255, 0.41);
	}

}

/* Standard syntax */
@-keyframes myfirst recommend { 0% {
	/* background-color: rgb(54, 127, 169); */
	color: rgba(255, 255, 255, 0.41);
}
}

</style>
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
				<div class="col-sm-12">
					<div id="roomMakeDiv" class="box box-default collapsed-box">
						<div class="box-header with-border">
							<h3 class="box-title ">팀 만들기</h3>

							<div class="box-tools pull-right">
								<button type="button" class="btn btn-box-tool"
									data-widget="collapse">
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
											<input name="teamname" type="text" class="form-control"
												id="inputEmail3" placeholder="방 제목을 입력해주세요">
										</div>
										<label class="col-sm-2 label-col-sm-2">여행 기간</label>
										<div class="input-group col-sm-4">
											<div class="input-group-addon">
												<i class="fa fa-calendar"></i>
											</div>
											<input type="text" name="text"
												class="form-control pull-right col-sm-10" id="reservation">
										</div>
									</div>
									<div class="form-group">
										<label class="col-sm-1 control-label ">주제</label>
										<div class="col-sm-3">
											<select name="subject" class="form-control select2"
												style="width: 100%;">
												<option value="0" selected="selected">동행</option>
												<option value="1">숙박</option>
												<option value="2">예약</option>
												<option value="3">단체</option>
												<option value="4">기타</option>
											</select>
										</div>
										<label class="col-sm-1 control-label">인원수</label>
										<div class="col-sm-3">
											<select name="userNum" class="form-control select2"
												style="width: 100%;">
												<option value="2" selected="selected">2</option>
												<option value="4">4</option>
												<option value="6">6</option>
												<option value="8">8</option>
												<option value="10">10</option>
											</select>
										</div>
										<label class="col-sm-1 control-label">지역선택</label>
										<div class="col-sm-3">
											<select name="loc_code" class="form-control select2"
												style="width: 100%;">
												<c:forEach items="${locationSubList }" var="list">
													<option value='${list.get("locCode") }'>${list.get("locSubName") }</option>
												</c:forEach>
											</select>
										</div>
									</div>
								</div>
								<!-- /.box-body -->
								<div class="box-footer">
									<button type="submit" class="btn btn-default">취소</button>
									<button type="button" onclick="makeTeam();"
										class="btn btn-info pull-right">팀만들기</button>
								</div>
								<!-- /.box-footer -->
							</form>
						</div>
						<!-- /.box-body -->
					</div>
				</div>
				<div class="col-sm-6">
					<div class="col-sm-12 teamList">
						<div id="roomListDiv" class="box box-default">
							<div class="box-header">
								<h3 class="box-title">
									<span> 팀 목록을 선택하면 <b style="color : red;">상세보기</b>를 할 수 있어요 </span>
								</h3>
							</div>
							<!-- /.box-header -->
							<div class="box-body table-responsive no-padding">
								<table class="table table-hover mainTr">
									<thead>	
										<tr>
											<th style="width: 80px;" >팀 이름</th>
											<th style="max-width: 20px;">시작 일</th>
											<th style="max-width: 20px;">종료 일</th>
											<th style="width: 80px;" class="hidden-xs">팀 상태</th>
											<th style="width: 80px;" class="hidden-xs">팀 유형</th>
										</tr>
									</thead>
									<tbody>
									</tbody>
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
					<div class="col-sm-12 ">
					<!-- Profile Image -->
					<div class="box box-primary">
						<div class="box-body box-profile">
							<img class="profile-user-img img-responsive img-circle"
								src="../images/team/profile.png"
								alt="User profile picture">

							<h3 class="profile-username text-center team-no-${teamInfo.no}"> 초대받은 팀 : ${teamInfo.teamname} </h3>

							<p class="text-muted text-center">[ ${teamInfo.teamname} ]</p>

							<ul class="list-group list-group-unbordered">
								<!-- <li class="list-group-item"><b>팀 인원</b> 
									<a id="a_no" class="pull-right"> 알수없음 </a>
								</li> -->
								<li class="list-group-item">
									<b>팀 URL</b> 
									<a>
										<b class="pull-right" id="a_url">
											http://192.168.8.31:8088/WhenWhere/home/team?teamNum=${teamInfo.no}&teamname=${teamInfo.teamname}
										</b>
									</a>
								</li>
								<li class="list-group-item"><b>팀 상태</b>
								 	<a id="a_sts" class="pull-right">
								 		<c:choose>
												<c:when	test="${teamInfo.status == 0 }">
													가입가능
												</c:when>

												<c:when test="${teamInfo.status == 1 }">
													승낙대기
												</c:when>
												
												<c:when test="${teamInfo.status == 2 }">
													팀장
												</c:when>
												
												<c:when test="${teamInfo.status == 3 }">
													팀원
												</c:when>
										</c:choose>
									</a>
								</li>
								<li class="list-group-item"><b>팀원 목록</b>
								 	<a id="a_list" class="pull-right">  
								 		<c:forEach items="${teamList}" var="currentName" 
												varStatus="status" begin="0" end="3" step="2">
									        <c:out value="${currentName}" /> ,
										</c:forEach>
									</a>
								</li>
								<li class="list-group-item"><b>팀 유형</b>
								 	<a id="a_type" class="pull-right">  
								 		<c:choose>
											<c:when	test="${teamInfo.subject == 0 }">
												<span class="label label-danger">전체</span>
											</c:when>

											<c:when test="${teamInfo.subject == 1 }">
												<span class="label label-danger">동행</span>
											</c:when>
											
											<c:when test="${teamInfo.subject == 2 }">
												<span class="label label-danger">숙박</span>
											</c:when>
											
											<c:when test="${teamInfo.subject == 3 }">
												<span class="label label-danger">예약</span>
											</c:when>
											
											<c:when test="${teamInfo.subject == 3 }">
												<span class="label label-danger">기타</span>
											</c:when>
										</c:choose>
								 	</a>
								</li>
							</ul>
							
							<div class="col-sm-12 ">
								<div class="col-sm-6 join-btn">
									<a href="#" class="btn btn-primary btn-block btn-type"><b> 선택된 팀 없음 </b></a>
								</div>
								<div class="col-sm-6">
									<a href="#" class="btn btn-primary btn-block applyUserListBtn" data-toggle="modal" data-target="#basicModal"><b>팀원 관리하기</b></a>
								</div>
							</div>
						</div>
						<!-- /.box-body -->
					</div>
				</div>
				</div>
				<div class="col-sm-6">
					<div id="chattingRoom">
						<div class="ddo-chat box box-primary direct-chat direct-chat-primary collapsed-box">
							<div class="box-header with-border">
								<i class="fa fa-comments-o"></i> 
									<span id="roomTitle">선택된 팀이 없습니다.</span>
									<h3 class="box-title room-title">g</h3>
									<div class="box-tools pull-right">
										<span data-toggle="tooltip" title="3 New Messages"
											class="badge bg-light-blue">3</span>
										<button type="button" class="btn btn-box-tool"
											data-widget="collapse">
											<i class="fa fa-minus"></i>
										</button>
										<button type="button" class="btn btn-box-tool" data-widget="remove">
											<i class="fa fa-times"></i>
										</button>
									</div>
							</div>
							<div class="box-body chat direct-chat-messages" id="chat-box">
								<!-- chat item -->
								<div class="item chat_main_body">
									
								<!-- 	<div class="direct-chat-msg">
										<div class="direct-chat-info clearfix">
											<span class="direct-chat-name pull-left">
												Alexander Pierce
											</span> 
											<span class="direct-chat-timestamp pull-right">
												23 Jan 2:00 pm
											</span>
										</div>
										<img class="direct-chat-img" src="../images/team/team2.PNG" alt="Message User Image">
										<div class="direct-chat-text">
											Is this template really
											for free? That's unbelievable!
										</div>
									</div>

									Message to the right
									<div class="direct-chat-msg right">
										<div class="direct-chat-info clearfix">
											<span class="direct-chat-name pull-right">
												Sarah
												Bullock
											</span> 
											<span class="direct-chat-timestamp pull-left">
												23 Jan 2:05 pm
											</span>
										</div>
										<img class="direct-chat-img" src="../images/team/team1.PNG" alt="Message User Image">
										<div class="direct-chat-text">You better believe it!</div>
									</div>
									 -->
								</div>
							</div>
							<!-- /.item -->
							<div class="box-footer">
								<div class="input-group">
									<input id="sendMsg" type="text" name="message" placeholder="Type Message ..." class="form-control">
									<span class="input-group-btn">
										<button type="button" onclick="sendMsg();" class="btn btn-primary btn-flat">메세지 보내기</button>
									</span>
								</div>
							</div>
						</div>
					</div>
				</div>
			</div>
			<!-- include -->
		</div>
		
		<!-- modal contents -->
		<div class="modal fade" id="basicModal" tabindex="-1" role="dialog"
			aria-labelledby="basicModal" aria-hidden="true">
			<div class="modal-dialog">
				<div class="modal-content">
					<div class="modal-header">
						<button type="button" class="close" data-dismiss="modal"
							aria-hidden="true">&times;</button>
						<h4 class="modal-title label" id="myModalLabel">제목</h4>
					</div>
					<div class="modal-body">

						<div class="teamList">
							<div id="roomListDiv" class="box box-default">
								<div class="box-header">
									<h3 class="box-title">
										<span class=""> 팀원 관리 페이지
										</span>
									</h3>
								</div>
								<!-- /.box-header -->
								<div class="box-body table-responsive no-padding">
									<table class="table table-hover applyUserTable">
											<tr>
												<th style="max-width: 30px;">체크</th>
												<th style="max-width: 80px;">닉네임</th>
												<th style="width: 80px;" class="hidden-xs">상태</th>
											</tr>
										<tbody>
										</tbody>
									</table>
									<div class="box-footer clearfix">
										<a href="#" class="btn btn-primary applyUserDeleteBtn">선택 삭제</a>
									</div>
								</div>
								<!-- /.box-body -->
							</div>
							<!-- /.box -->
						</div>

					</div>
					<div class="modal-footer">
						<p>
							<!-- <a class="btn btn-mini readMore" href="#">» Read More</a> -->
						</p>
					</div>
				</div>
			</div>
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
	
	var teamList = new Array();
	var sessionNick = '';
	var teamNum = ${teamInfo.no} ;
	var teamName = '';
	var lastMsgNo = 0;
	var chatinterval ;
	$(function() {
		/* ************ 팀 리스트에 대한 정보를 불러옴 ******************/
		getTeamList();
		setInterval( getTeamList() , 60000);
		
	    $('#reservation').daterangepicker();
	    $('#reservationtime').daterangepicker({timePicker: true, timePickerIncrement: 30, format: 'MM/DD/YYYY h:mm A'});
	    $('#datepicker').datepicker({
	      autoclose: true
	    });
	    
	    clickTr();
	    applyUserList();
	    applyUserDelete();
	    applyUser(); 
	    
	    $('.btn-type').click(function(){
	    	var teamSts = $('#a_sts').text()
	    	var selectArr = new Array("가입가능", "승낙대기중", "팀 방장", "팀원");
			/*  a_sts a_no a_url  */
			switch (teamSts) {
				case '0':
					alert('팀에 가입하시겠습니까?');
					//가입신청 후 대기중 상태로 텍스트 바꿔주기
					break;
				case '1':
					alert('승낙 대기중 상태입니다');
					break;
				case '2':
					alert('방장입니다 ');
					break;
				case '3':
					alert('정말로 팀에서 탈퇴하시겠습니까?');
					// 탈퇴후 가입신청으로 텍스트 바꿔주기
					break;
			} 
	    });
	    
	    var nickName = '${sessionScope.member.nickname}';
        if(nickName==''){
           bootbox.dialog({
              message : "로그인 후 사용 가능 합니다.",
              buttons : {
                 success : {
                    label : "네",
                    className : "btn-success",
                    callback : function() {
                       location.href="../home/loginForm"
                    }
                 },
              }
           });
        }
	});

	function clickTr(){
		
		/* ************방접속위해 tr 클릭시 동작******************/
		$(".mainTr").on("click",'tr',function(){
			
			clearInterval(chatinterval);
			
			trInfo = $(this).attr('class');
			console.log($(this).find('#sdate').text());
			console.log($(this).find('#teamname').text());
			console.log($(this).find('#status').text());
			
			teamNum = trInfo.split(' ')[0].split('_no_')[1];
			teamName = trInfo.split(' ')[1].split('_name_')[1];
			teamSts = trInfo.split(' ')[2].split('_sts_')[1];
			dataVal = '';
			teamurl = 'http://192.168.8.31:8088/WhenWhere/home/team?teamNum='+teamNum+'&teamname='+teamName;
			console.log(teamurl);
			
			var span = $(this).find('#spanTag span').clone();
			
			$('#a_sts').text($(this).find('#status').text());
			$('#a_no').text();
			$('#a_url').text(teamurl);
			$('#a_type').html(span);
			$('h3.profile-username').text($(this).find('#teamname').text());
			
			switch (teamSts) {
				case '0':
					$('.btn-type b').text('팀에 가입하기');
					//가입신청 후 대기중 상태로 텍스트 바꿔주기
					break;
				case '1':
					$('.btn-type b').text('승낙 대기중');
					break;
				case '2':
					$('.btn-type b').text('팀 폭파하기');
					break;
				case '3':
					$('.btn-type b').text('팀 탈퇴하기');
					break;
			} 
			
			$.ajax({
		           type:"POST",
		           url:"../team/getTeamUserList",
		           dataType:"JSON",
		           data : {"teamNum":teamNum },
		           success : function(data) {
		        	   if(data[0].ok){
        			   		$('.chat_main_body').html('');
		       				$('#roomTitle').removeClass('nowRoom');
		       				
							console.log(data[1]);
							j = 0;
		       				while(true){
		       					dataVal += data[1].split(',')[j++];
		       					dataVal += ' ';
		       					if(data[1].split(',')[j] == 'end')
		       						break;
		       					console.log(dataVal);
		        	  		 }
		       				$('#a_list').text(dataVal);
		        	   }else{
		        		   alert('비밀번호가 일치하지 않습니다');
		        		   return;
		        	   }
		           },
		           complete : function(data) {
		           },
		           error : function(xhr, status, error) {
		                 console.log(error + "return : " + xhr.responseText);
		           }
		    	});
			
			if(teamSts == 2 || teamSts == 3){
				alert('팀 메세지를 불러옵니다.');
				$.ajax({
		           type:"POST",
		           url:"../team/chatTeam",
		           dataType:"JSON", // 옵션이므로 JSON으로 받을게 아니면 안써도 됨
		           data : { "teamNum": teamNum },
		           success : function(data) {
		        	   console.log(data);
		        	  
		        	   if(data[0].ok){
		        		   $('input[name=title]').val('');
		        		   $('.ddo-chat').removeClass('collapsed-box');
		        		 
		        		   for(var i=1; i<data.length;i++){
		        			   var json_param = new Array();
		        			   json_param.push(data[i].nickName);
		        			   json_param.push(data[i].content);
		        			   
		        			   lastMsgNo = 0;
		        			   lastMsgNo = data[i].msgNo;
		        			   
		        			   var msgObject = new msgObj(json_param);
		        			   str_Txt = msgObject.msg_format();
		        			   $('.item.chat_main_body').append(str_Txt);
		        			   console.log(str_Txt);
		        		   }
		        		   chatinterval = setInterval(function() {
		       					getChatSec(teamNum);
		       			   }, 1000);
		        		   
		        		   $('#roomTitle').text('팀이름:');
		        		   $('.room-title').text(teamName);
		        		   
		        	   }
		           },
		           complete : function(data) {
		        	   
		           },
		           error : function(xhr, status, error) {
		                 console.log(error);
		           }
		   		}); 
			}else if(teamSts == 0){
				$.bootstrapGrowl("팀 구성원이 아닙니다.", {
					type: 'danger',
					align: 'center',
					width: 'auto',
					allow_dismiss: false
				});

			}else{
				$.bootstrapGrowl("팀 승낙 대기상태입니다.", {
					type: 'danger',
					align: 'center',
					width: 'auto',
					allow_dismiss: false
				});
			}
		});
	}
	
	function getChatSec(teamNumInterval){
		$.ajax({
	           type:"POST",
	           url:"../team/chatTeamAfterNum",
	           dataType:"JSON", // 옵션이므로 JSON으로 받을게 아니면 안써도 됨
	           data : { "teamNum": teamNumInterval, "lastMsgNo" : lastMsgNo},
	           success : function(data) {
	        	   console.log(data);
	        	   console.log(lastMsgNo);
	        	   if(data[0].ok){
	        		   for(var i=1; i<data.length;i++){
	        			   var json_param = new Array();
	        			   json_param.push(data[i].nickName);
	        			   json_param.push(data[i].content);
	        			   
	        			   lastMsgNo = data[i].msgNo;
	        			   console.log(data[i].msgNo);
	        			   var msgObject = new msgObj(json_param);
	        			   str_Txt = msgObject.msg_format();
	        			   $('.item.chat_main_body').append(str_Txt);
	        		   }
	        	   }
	           },
	           complete : function(data) {
	        	   
	           },
	           error : function(xhr, status, error) {
	                 console.log(error);
	           }
	   		}); 
	}
	
	function sendMsg(){
		if($('#sendMsg').val() == ''){
			alert('메세지가 입력되지 않았습니다');
			return;
		}	
		
		$.ajax({
	           type:"POST",
	           url:"../team/sendMsg",
	           dataType:"JSON", // 옵션이므로 JSON으로 받을게 아니면 안써도 됨
	           data : { "teamNum": teamNum , "nickName":sessionNick , "msg" : $('#sendMsg').val()},
	           success : function(data) {
	        	   console.log(data);
	        	  
	        	   if(data[0].ok){
	        		   $('#sendMsg').val('')
	        		   $('input[name=title]').val('');
	        		   
	        		  /*  var objDiv = document.getElementById("#ddo-chat");
	        		   objDiv.scrollTop = objDiv.scrollHeight; */
	        	   }
	           },
	           complete : function(data) {
	        	   
	           },
	           error : function(xhr, status, error) {
	                 console.log(error);
	           }
	   		}); 
		//nickname content tno 
	}
		
	function getTeamList() {
		$.ajax({
			type : "POST",
			url : "../team/getTeamList",
			dataType : "JSON",
			data : {
				"page" : 1
			},
			success : function(data) {
				if (data[0].ok) {
					$('.mainTr tbody').html('');
					for (var i = 1; i < data.length; i++) {
						var json_param = new Array();
						json_param.push(data[i].no);
						json_param.push(data[i].status);
						json_param.push(data[i].nickname);
						json_param.push(data[i].sdate);
						json_param.push(data[i].teamname);
						json_param.push(data[i].edate);
						json_param.push(data[i].subject);

						team = new teamObj(json_param);
						str_Txt = team.team_format();
						sessionNick = data[i].nickname;
						
						$('.mainTr tbody').append(str_Txt);
					}
				}
			},
			complete : function(data) {

			},
			error : function(xhr, status, error) {
				console.log(error);
			}
		});
	}

	function teamObj(param) {

		this.no = param[0];
		this.status = param[1];
		this.nickname = param[2];
		this.sdate = param[3];
		this.teamname = param[4];
		this.edate = param[5];
		this.subject = param[6];

		this.team_format = function() {
			var status = 0;
			var typeName ='전체';
			var str='';
			var class_no = 'team_no_'+this.no;
			var class_team = 'team_name_'+this.teamname;
			var class_sts = 'team_sts_'+this.status;
			var selectArr = new Array("가입가능", "승낙대기", "팀장", "팀원");
			/*  a_sts a_no a_url  */
			switch (this.status) {
				case 0:
					status = selectArr[0];
					break;
				case 1:
					status = selectArr[1];
					break;
				case 2:
					status = selectArr[2];
					break;
				case 3:
					status = selectArr[3];
					break;
			} 
			
			switch (this.subject) {
	    	  case '0' : typeName = '전체';
	    	 			 className = '<span class="label label-danger">';
	    	  			 break;
	    	  case '1' : typeName = '동행';
		 	 			 className = '<span class="label label-success">';
		 	  			 break;
	    	  case '2'  :typeName = '숙박';
	 			 		 className = '<span class="label label-warning">';
	 			 		 break;
	    	  case '3'  :typeName = '예약';
				 		 className = '<span class="label label-primary">';
				 		 break;
	    	  default :  typeName = '기타';
	    	  			 className = '<span class="label label-danger">';
	    	             break;
	    	}

			str += '<tr role="row" class="'+ class_no + ' ' + class_team + ' ' + class_sts + '\">'
					+ '<td id="teamname" style="width: 80px;">' + this.teamname + '</td>'
					+ '<td id="sdate" style="max-width: 20px;">'	+ this.sdate + '</td>'
					+ '<td id="edate" style="max-width: 20px;">'+ this.edate + '</td>'
					+ '<td id="status" style="width: 80px;" class="hidden-xs">' + status + '</td>'
					+ '<td id="spanTag" style="width: 80px;" class="hidden-xs">' + className + typeName +'</span></td></tr>';
			return str;
			}
		}

	function msgObj(param) {

		this.nickName = param[0];
		this.content = param[1];

		this.msg_format = function() {
			//내가쓴글이면 오른쪽배치 아닐시 왼쪽 배치 
			if(this.nickName != sessionNick){
				str ='';
				str += '<div class="direct-chat-msg">'
					+ '<div class="direct-chat-info clearfix">'
					+ '<span class="direct-chat-name pull-left">' + this.nickName + '</span> '
					+ '<span class="direct-chat-timestamp pull-right">' + '23 Jan 2:00 pm' + '</span></div> '
					+ '<img class="direct-chat-img" src="../images/team/team2.PNG" alt="Message User Image">'
					+ '<div class="direct-chat-text">' + this.content + '</div></div>';
			}else{
				str ='';
				str += '<div class="direct-chat-msg right">'
					+ '<div class="direct-chat-info clearfix">'
					+ '<span class="direct-chat-name pull-right">' + this.nickName + '</span> '
					+ '<span class="direct-chat-timestamp pull-left">' + '23 Jan 2:00 pm' + '</span></div> '
					+ '<img class="direct-chat-img" src="../images/team/team1.PNG" alt="Message User Image">'
					+ '<div class="direct-chat-text">' + this.content + '</div></div>';
			}
			/* switch (this.subject) {
	    	  case '0' :  typeName = '전체';
	    	 			 className = '<span class="label label-danger">';
	    	  			 break;
	    	  case '1' :  typeName = '동행';
		 	 			 className = '<span class="label label-success">';
		 	  			 break;
	    	  case '2'  :  typeName = '숙박';
	 			 		 className = '<span class="label label-warning">';
	 			 		 break;
	    	  case '3'  :  typeName = '예약';
				 		 className = '<span class="label label-primary">';
				 		 break;
	    	  default :  typeName = '기타';
	    	  			 className = '<span class="label label-danger">';
	    	             break;
	    	} */

			return str;
			}
		}
	
		function makeTeam() {
			var date = $('#reservation').val();
			var formData = $('form').serialize() + "&sdate="
					+ date.split(" - ")[0] + "&edate=" + date.split(" - ")[1];

			if (date == '') {
				$.bootstrapGrowl("날짜를 선택해야징.. 이 바부야!", {
					type : 'danger',
					align : 'center',
					width : 'auto',
					allow_dismiss : false
				});
			} else {
				$.ajax({
					type : "POST",
					url : "../team/makeTeam",
					dataType : "JSON", // 옵션이므로 JSON으로 받을게 아니면 안써도 됨
					data : formData,
					success : function(data) {
						if (data.ok) {

							$('input[name=teamname]').val('');
							$('input[name=text]').val('');
							$('input[name=userNum]').val('');
							$('input[name=subject]').val('');
							$('input[name=loc_code]').val('');

							$('#roomMakeDiv').addClass('collapsed-box');
							$('#chattingRoom').removeClass('collapsed-box');

						}
					},
					complete : function(data) {
					},
					error : function(xhr, status, error) {
						console.log(error);
					}
				});
			}
		}
		
		
		
		function applyUserList() {
			$('.applyUserListBtn').on('click',function(){
				getApplyUserList(teamNum);
			});
			
		}
		
		function applyUserDelete() {
			var deleteUser = [];
			$('.applyUserDeleteBtn').on('click',function(){
				$('.applyCheck:checked').each(function (k, v) {
					deleteUser[k] = {};
					deleteUser[k].tNo=$(this).val();
					deleteUser[k].nickname=$(this).parent().next('#nickname').text();
				});
				
				bootbox.dialog({
					message : "정말 삭제 하시겠습니까?",
					buttons : {
						success : {
							label : "네",
							className : "btn-success",
							callback : function() {
								$.ajax({
									type : "POST",
									url : "../team/applyUserDelete",
									dataType : "JSON", // 옵션이므로 JSON으로 받을게 아니면 안써도 됨
									data : {deleteUser:JSON.stringify(deleteUser)},
									success : function(data) {
										if(data.ok){
											bootbox.alert("삭제 완료.", function() {
												getApplyUserList(deleteUser[0].tNo);
											});
										}
									},
									complete : function(data) {
									},
									error : function(request, status, error) {
										alert("code:"+request.status+"\n"+"message:"+request.responseText+"\n"+"error:"+error);
									}
								});
							}
						},
						danger : {
							label : "아니요",
							className : "btn-danger",
						}
					}
				});
				
			});
		}
		
		function applyUser() {
			var nickname, tNo;
			$(document).on('click','.userApplyBtn',function(){
				nickname = $(this).parent().siblings('#nickname').text();
				tNo = $(this).parent().siblings('#check').children().val();
				$.ajax({
					type : "POST",
					url : "../team/applyUser",
					dataType : "JSON", // 옵션이므로 JSON으로 받을게 아니면 안써도 됨
					data : {nickname:nickname, tNo:tNo},
					success : function(data) {
						if(data.ok){
							bootbox.alert("승인 완료.", function() {
								getApplyUserList(tNo);
							});
						}
					},
					complete : function(data) {
					},
					error : function(request, status, error) {
						alert("code:"+request.status+"\n"+"message:"+request.responseText+"\n"+"error:"+error);
					}
				});
				
			});
		}
		
		function getApplyUserList(tNo) {
			var str='';
			$.ajax({
				type : "POST",
				url : "../team/getApplyTeamUserList",
				dataType : "JSON", // 옵션이므로 JSON으로 받을게 아니면 안써도 됨
				data : {tNo:tNo},
				success : function(data) {
					
					$('.applyUserTable').empty();
					str = '<tr>'
						+'<th style="max-width: 30px;"></th>'
						+'<th style="max-width: 80px;">닉네임</th>'
						+'<th style="width: 80px;" class="">상태</th>'
						+'<th style="width: 80px;" class="">승인</th>'
						+'</tr>'
					$('.applyUserTable').append(str);
					
					for(var i=0; i<data.length; i++){
						var status, applyCheckClass = '', applybtnClass = '';
						switch (data[i].status) {
						case 1:
							status = "승인 대기중"; break;
						case 2:
							status = "팀장"; 
							applybtnClass = "non-applyBtn";
							applyCheckClass = "non-applyBtn";
							break;
						case 3:
							status = "팀원";  
							applybtnClass = "non-applyBtn";
							break;
						default:
							break;
						}
						
						str = '<tr role="row" class="">'
							+ '<td id="check" style="max-width:20px;"><input type="checkbox" class="icheckbox_flat-blue applyCheck '+applyCheckClass+'" value="'+ data[i].tNo+'"></td>'
							+ '<td id="nickname" style="max-width: 40px;">'+ data[i].nickname + '</td>'
							+ '<td id="status" style="width: 100px;">' + status + '</td>'
							+ '<td id="userApplyBtn" style="width: 80px;"><a href="#" class="userApplyBtn btn '+applybtnClass+'" >승인</a></td></tr>';
						$('.applyUserTable').append(str);
					}
					
				},
				complete : function(data) {
				},
				error : function(request, status, error) {
					alert("code:"+request.status+"\n"+"message:"+request.responseText+"\n"+"error:"+error);
				}
			});
		}
		
	</script>
</body>
</html>