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
    <link rel="stylesheet" href="../../plugins/select2/select2.min.css">
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
		
		/* .box.box-success {
		    height: 700px;
		    overflow: auto;
		} */
	</style>
	<script type="text/javascript">
		var title;
		var user;
		var ws ='';
		
		$(function(){
			/* ************방 리스트에 대한 정보를 불러옴******************/
			setInterval(function() {
				$.ajax({
			           type:"POST",
			           url:"../chat/getChatRoomList",
			           dataType:"JSON",
			           data : { "page": 1 },
			           success : function(data) {
			        	   console.log(data);
			        	   if(data[0].ok){
			        		   $('.mainTr').html('');
			        		   for(var i=1; i<data.length;i++){
			        			   var json_param = new Array();
			        			   json_param.push(data[i].num);
			        			   json_param.push(data[i].title);
			        			   json_param.push(data[i].wTime);
			        			   json_param.push(data[i].type);
			        			   json_param.push(data[i].userNum);
			        			   json_param.push(data[i].userNumInRoom);
			        			   json_param.push(data[i].pwdCheck);
			        			   
			        			   room = new roomObj(json_param);
			        			   str_Txt = room.room_format();
			        			   
			        			   $('.mainTr').append(str_Txt);
			        			   console.log(str_Txt);
			        		   }
			        	   }
			           },
			           complete : function(data) {
			        	   
			           },
			           error : function(xhr, status, error) {
			                 console.log(error);
			           }
			    	});
			}, 3000);
			
			/* ************비밀번호 체크시 비밀번호 입력할 수 있게******************/
			$( "input[name=pwdChk]" ).on("click", function() {
				var chk = $(this).is(":checked");//.attr('checked');
		        if(chk) $("input[name=pwd]").attr("disabled",false);
		        else  $("input[name=pwd]").attr("disabled",true);
			});
			
			/* ************방접속위해 tr 클릭시 동작******************/
			$(".mainTr").on("click",'#clickTr',function(){
				click_num = $(this).children(':nth-child(1)').text();
				click_numInRoom = $(this).find('#numInRoom').text();
				click_userNum = $(this).find('#userNum').text();
				
				if(click_numInRoom >= click_userNum){
					alert("방에 접속할 수 없습니다.인원초과!")
					return;
				}
				
				if($('#roomTitle').hasClass('nowRoom')){
					if(!confirm("현재 채팅중인 방이 존재합니다. 종료후 재입장 하시겠습니까?"))
						return;
				}
				
				if($(this).hasClass('requiredPwd')){
					var prompt_pwd = prompt('방입장시 비밀번호가 필요합니다.');
					if(prompt_pwd == ''){
						alert('비밀번호를 입력해주세요');
						return;
					}
					
					pwdObject = new Object();
					pwdObject.pwd = prompt_pwd;
					pwdObject.roomNum = click_num;
					
					console.log(pwdObject);
					
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
				
				$.ajax({
			           type:"POST",
			           url:"../chat/enterRoom",
			           dataType:"JSON", // 옵션이므로 JSON으로 받을게 아니면 안써도 됨
			           data : { "roomNum": click_num },
			           success : function(data) {
			        	   console.log(data);
			        	  
			        	   if(data.ok){
			        		   $('input[name=title]').val('');
			        	   	   $('#roomMakeDiv').addClass('collapsed-box');
			        	   	   /* $('#roomMakeDiv .box-body').css('display','none'); */
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
			    });
			});
		});
		
		function websocket(){
			ws = new WebSocket("ws://192.168.8.13:8088/WhenWhere/wsclient");
		}
		
		function sendMsg(){
		    ws.onopen = function () {
		    	msgObj = new MsgObj(0, 'admin', 'Info: 채팅방이 개설되었습니다.', 0);
		    	strTxt=msgObj.msg_format();
		        $('.chat_main_body').append(strTxt);
		        $('#roomTitle').addClass('nowRoom');
		        
		        $('input[name=chatInput]').on('keydown', function(evt){
		            if(evt.keyCode==13){
		               
		            	var msg = $('input[name=chatInput]').val();
		                
		                sendObj = new Object();
		                sendObj.msg = msg;
		                sendObj.name = user;
		                
		                ws.send(JSON.stringify(sendObj));
		                
		                $('input[name=chatInput]').val('');
		            }
		        });
		    }
		    ws.onmessage = function (event) {
		    	var obj = eval("("+event.data+")");
		    	msgObject = new MsgObj(0, obj.name, obj.msg, 0);
		    	//room = new roomObj(json_param);
		    	strTxt = msgObject.msg_format();
		    	//받은메세지
		    	$('.chat_main_body').append(strTxt);
		    }
		    ws.onclose = function (event) {
		    	/* strTxt=msg_format('admin','Info: 채팅방이 종료되었습니다..'); */
		    	msgObj = new MsgObj(0, 'admin', 'Info: 채팅방이 종료되었습니다.', 0);
		    	strTxt=msgObj.msg_format();
		        $('.chat_main_body').append(strTxt);
		    }
		    
		}
		
		function makeRoom() {
			 $.ajax({
		           type:"POST",
		           url:"../chat/makeRoom",
		           dataType:"JSON", // 옵션이므로 JSON으로 받을게 아니면 안써도 됨
		           data :$('form').serialize(),
		           success : function(data) {
					   console.log(data);	
					   
		        	   if(data.ok){
		        		   $('input[name=title]').val('');
		        	   	   $('#roomMakeDiv').addClass('collapsed-box');
		        	   	   /* $('#roomMakeDiv .box-body').css('display','none'); */
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
		     });
		}
		
		function MsgObj(type,from,text,to) {
		    this.type = type;
		    this.from = from;
		    this.text = text;
		    this.to = to;
		    
		    this.msg_format = function(){
				var str='';
		    	str += '<div class="item"><p class="message"><a href="#" class="name">'
		    		+  '<small class="text-muted pull-right"><i class="fa fa-clock-o"></i>'
		    		+  new Date()
					+  '</small>' + '['+ this.from +']'
					+  '</a>' + this.text
					+  '</p></div>';
				return str;
			}
		}
		
		function roomObj (param) {
		    this.num = param[0];
		    this.title = param[1];
		    this.time = param[2];
		    this.type = param[3];
		    this.userNum = param[4];
		    this.userNumInRoom = param[5];
		    this.pwdCheck = param[6];
		    
		    this.room_format = function(){
		    	var str='';
		    	var className='';
		    	var typeName='';
		    	var checkClass='roomclass';
		    	console.log(this.type);
		    	
		    	if(this.pwdCheck){
		    		checkClass += ' requiredPwd';
		    	}
		    	switch (this.type) {
		    	  case 0  :  typeName = '전체';
		    	 			 className = '<span class="label label-danger">';
		    	  			 break;
		    	  case 1  :  typeName = '동행';
			 	 			 className = '<span class="label label-success">';
			 	  			 break;
		    	  case 2  :  typeName = '숙박';
	 	 			 		 className = '<span class="label label-warning">';
	 	 			 		 break;
		    	  case 3  :  typeName = '예약';
					 		 className = '<span class="label label-primary">';
					 		 break;
		    	  default :  typeName = '기타';
		    	  			 className = '<span class="label label-danger">';
		    	             break;
		    	}
		    	
		    	str += '<tr id="clickTr" class="' + checkClass + '">' 
		    		+  '<td style="width: 10px;">' + this.num + '</td>'
		    		+  '<td style="width: 80px;" class="hidden-xs">'+ this.time +'</td>'
					+  '<th style="max-width: 20px;">'+ className + typeName +'</span></th>'
					+  '<td style="width: 80px;" class="hidden-xs">'
					+  '<span id="numInRoom">' + this.userNumInRoom + '</span>' + '/' +  '<span id="userNum">' + this.userNum + '</span>' 
					+' </td>'
					+  '<td>'+ this.title + '</td></tr>';
				return str;
			}
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
		              <h3 class="box-title ">채팅 방 만들기</h3>
		
		              <div class="box-tools pull-right">
		                <button type="button" class="btn btn-box-tool" data-widget="collapse"><i class="fa fa-plus"></i>
		                </button>
		              </div>
		              <!-- /.box-tools -->
		            </div>
		            <!-- /.box-header -->
		            <div class="box-body">
		             	<!-- 방만들기 폼 -->
		             	<form class="form-horizontal">
				         	<div class="box-body">
				                <div class="form-group">
				                  	<label for="inputEmail3" class="col-sm-3 control-label">방제목</label>
				                 	 <div class="col-sm-9">
				                    	<input name="title" type="text" class="form-control" id="inputEmail3" placeholder="방 제목을 입력해주세요">
				                  	</div>
				                </div>
				                <div class="form-group">
				                 	 <label for="inputPassword3" class="col-sm-3 control-label">
				                 	 	 비밀번호(선택)
				                 	 	<input name="pwdChk" type="checkbox" class="flat-red">	
				                 	 </label>
					                 <div class="col-sm-9">
					                    <input name="pwd" type="password" class="form-control" id="inputPassword3" placeholder="비밀번호를 입력해주세요" disabled>
					                 </div>
				                </div>
								<div class="form-group">
									<label class="col-sm-2 control-label">말머리</label>
									<div class="col-sm-4">
										<select name="type" class="form-control select2" style="width: 100%;">
											<option value="0" selected="selected">전체</option>
											<option value="1">동행</option>
											<option value="2">숙박</option>
											<option value="3">예약</option>
											<option value="4">단체</option>
											<option value="5">기타</option>
										</select>
									</div>
									<label class="col-sm-2 control-label">인원수</label>
									<div class="col-sm-4">
										<select name="userNum" class="form-control select2" style="width: 100%;">
											<option value="2" selected="selected">2</option>
											<option value="4">4</option>
											<option value="6">6</option>
											<option value="8">8</option>
											<option value="10">10</option>
										</select>
									</div>
								</div>
								</div>
				              <!-- /.box-body -->
				              <div class="box-footer">
				                <button type="submit" class="btn btn-default">취소</button>
				                <button type="button" onclick="makeRoom();" class="btn btn-info pull-right">방만들기</button>
				              </div>
				              <!-- /.box-footer -->
				            </form>
		            </div>
		            <!-- /.box-body -->
		          </div>
			
				<div class="col-sx-12 " >
					<div id="roomListDiv" class="box box-default">
						<div class="box-header">
							<h3 class="box-title"><span class="hidden-xs">채팅 방 리스트</span></h3>
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
					<span id="roomTitle">아직 채팅방이 개설되지 않았습니다.</span>
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
		<jsp:include page="../component/footer.jsp" />
		<jsp:include page="../component/controlSidebar.jsp" />
		<!-- scripts -->
	<jsp:include page="../component/core_js.jsp" />
	<script src="https://cdnjs.cloudflare.com/ajax/libs/jquery-validate/1.13.1/jquery.validate.min.js"></script>
	<script type="text/javascript">
	</script>
</body>
</html>