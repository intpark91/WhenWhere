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
		
		.non-applyBtn{
			display: none;
		}
		
		/* div#roomListDiv {
			min-height: 335px;
		}
		
		.box-body>.table {
			margin-bottom: 0;
			height: 276px;
		} */
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
				<div class="col-sm-3 ">
					<!-- Profile Image -->
					<div class="box box-primary">
						<div class="box-body box-profile">
							<img class="profile-user-img img-responsive img-circle"
								src="../images/team/profile.png"
								alt="User profile picture">

							<h3 class="profile-username text-center">팀을 선택후 상세정보를 확인</h3>

							<p class="text-muted text-center">[ 선택된 팀 없음 ]</p>

							<ul class="list-group list-group-unbordered">
								<!-- <li class="list-group-item"><b>팀 인원</b> 
									<a id="a_no" class="pull-right"> 알수없음 </a>
								</li> -->
								<li class="list-group-item"><b>팀 URL</b> 
									<a id="a_url" class="pull-right"> 알수없음 </a>
								</li>
								<li class="list-group-item"><b>팀 상태</b>
								 	<a id="a_sts" class="pull-right"> 알수없음 </a>
								</li>
								<li class="list-group-item"><b>팀원 목록</b>
								 	<a id="a_sts" class="pull-right"> 알수없음 </a>
								</li>
							</ul>

							<a href="#" class="btn btn-primary btn-block applyUserListBtn" data-toggle="modal" data-target="#basicModal"><b>팀을 선택하세요!</b></a>
						</div>
						<!-- /.box-body -->
					</div>
				</div>
				<div class="col-sm-9 teamList">
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
				<div class="col-sm-12">
					<div id="chattingRoom" class="box box-success collapsed-box">
						<div class="box-header">
							<i class="fa fa-comments-o"></i> <span id="roomTitle">선택된
								팀이 없습니다.</span>
							<h3 class="box-title room-title"></h3>
						</div>
						<div class="box-body chat" id="chat-box">
							<!-- chat item -->
							<div class="item chat_main_body">*</div>
							<!-- /.item -->
							<div class="box-footer">
								<div class="input-group">
									<input class="form-control" placeholder="Type message..."
										name="chatInput">
	
									<div class="input-group-btn">
										<button type="button" onclick="sendMsg();"
											class="btn btn-success">
											<i class="fa fa-plus"></i>
										</button>
									</div>
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
										<span> 팀원을 확인.
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
	   
	});

	function clickTr(){
		
		/* ************방접속위해 tr 클릭시 동작******************/
		$(".mainTr").on("click",'tr',function(){
			trInfo = $(this).attr('class');
			console.log($(this).find('#sdate').text());
			console.log($(this).find('#teamname').text());
			console.log($(this).find('#status').text());
			
			teamNum = trInfo.split(' ')[0].split('_no_')[1];
			teamName = trInfo.split(' ')[1].split('_name_')[1];
			
			teamurl = 'http://192.168.8.31:8088/WhenWhere/home/team?teanNum='+teamNum+'&teamname='+teamName;
			console.log(teamurl);
			$('#a_sts').text($(this).find('#status').text());
			$('#a_no').text();
			$('#a_url').text();
			$('h3.profile-username').text($(this).find('#teamname').text());
			
			
			if(false){
				$.ajax({
			           type:"POST",
			           url:"../chat/checkRoomPwd",
			           dataType:"JSON",
			           data : pwdObject,
			           success : function(data) {
			        	   if(data.ok){
			        		    alert('비밀번호가 일치합니다.');
			        		    
	        			   		$('.chat_main_body').html('');
			       				$('#roomTitle').removeClass('nowRoom');
			       				$('#roomTitle').text('아직 채팅방이 개설되지 않았습니다.');
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
			}
			
			/* $.ajax({
		           type:"POST",
		           url:"../chat/enterRoom",
		           dataType:"JSON", // 옵션이므로 JSON으로 받을게 아니면 안써도 됨
		           data : { "roomNum": click_num },
		           success : function(data) {
		        	   console.log(data);
		        	  
		        	   if(data.ok){
		        		   $('input[name=title]').val('');
		        	   	   $('#roomMakeDiv').addClass('collapsed-box');
		        	   	   /* $('#roomMakeDiv .box-body').css('display','none'); 
		        		   $('#roomListDiv').addClass('collapsed-box');
		        		   $('#chattingRoom').removeClass('collapsed-box');
		        		 
		        		   title=data.title;
		        		   user=data.name;
		        		   
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
		    }); */
		});
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
			var selectArr = new Array("가입가능", "승낙대기중", "팀 방장");
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
			} 
			
			switch (this.subject) {
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
	    	}

			str += '<tr role="row" class="'+ class_no + ' ' + class_team +'">'
					+ '<td id="teamname" style="width: 80px;">' + this.teamname + '</td>'
					+ '<td id="sdate" style="max-width: 20px;" class="hidden-xs">'	+ this.sdate + '</td>'
					+ '<td id="edate" style="max-width: 20px;">'+ this.edate + '</td>'
					+ '<td style="width: 80px;" class="hidden-xs">' + className + typeName +'</span></td>'
					+'<td id="status" style="width: 80px;" class="hidden-xs">' + status + '</td></tr>';
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
			var tNo = '9';
			$('.applyUserListBtn').on('click',function(){
				getApplyUserList(tNo);
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
				
				
				$.ajax({
					type : "POST",
					url : "../team/applyUserDelete",
					dataType : "JSON", // 옵션이므로 JSON으로 받을게 아니면 안써도 됨
					data : {deleteUser:JSON.stringify(deleteUser)},
					success : function(data) {
						if(data.ok){
							alert("삭제완료");
							getApplyUserList(deleteUser[0].tNo);
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
		
		function applyUser() {
			var nickname, tNo;
			$(document).on('click','.applyBtn',function(){
				nickname = $(this).parent().siblings('#nickname').text();
				tNo = $(this).parent().siblings('#check').children().val();
				$.ajax({
					type : "POST",
					url : "../team/applyUser",
					dataType : "JSON", // 옵션이므로 JSON으로 받을게 아니면 안써도 됨
					data : {nickname:nickname, tNo:tNo},
					success : function(data) {
						if(data.ok){
							alert("승인 완료");
							getApplyUserList(tNo);
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
						+'<th style="max-width: 30px;">체크</th>'
						+'<th style="max-width: 80px;">닉네임</th>'
						+'<th style="width: 80px;" class="">상태</th>'
						+'<th style="width: 80px;" class="">승인</th>'
						+'</tr>'
					$('.applyUserTable').append(str);
					
					for(var i=0; i<data.length; i++){
						var status, applybtnClass = '';
						switch (data[i].status) {
						case 1:
							status = "승인 대기중"; break;
						case 2:
							status = "방장"; 
							applybtnClass = "non-applyBtn";
							break;
						case 3:
							status = "팀원"; 
							applybtnClass = "non-applyBtn";
							break;
						default:
							break;
						}
						
						str = '<tr role="row" class="">'
							+ '<td id="check" style="max-width:20px;"><input type="checkbox" class="applyCheck" value="'+ data[i].tNo+'"></td>'
							+ '<td id="nickname" style="max-width: 40px;">'+ data[i].nickname + '</td>'
							+ '<td id="status" style="width: 100px;">' + status + '</td>'
							+ '<td id="applyBtn" style="width: 80px;"><a href="#" class="applyBtn btn '+applybtnClass+'" >승인</a></td></tr>';
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