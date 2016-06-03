<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
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
	</style>
	
	<script type="text/javascript">
		function sendMsg(){
		 
		    var ws = new WebSocket("ws://localhost:8088/WhenWhere/wsclient?id=1234");
		    ws.onopen = function () {
		        $('#msgBoard').text('Info: connection opened.');
		 
		        $('input[name=chatInput]').on('keydown', function(evt){
		            if(evt.keyCode==13){
		            	console.log('보냄버튼누름');
		                var msg = $('input[name=chatInput]').val();
		                console.log('보낸메세지'+msg);
		                ws.send(msg);
		                $('input[name=chatInput]').val('');
		            }
		        });
		    };
		    ws.onmessage = function (event) {
		        $('#msgBoard').prepend(event.data+'\n');
		    };
		    ws.onclose = function (event) {
		        $('#msgBoard').text('Info: connection closed.');
		    };
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
			
		          <!-- /.box -->
			<div class="row chatTable">
				 <div class="col-sx-12">
		          <div class="box box-default collapsed-box">
		            <div class="box-header with-border">
		              <h3 class="box-title">채팅 방 만들기</h3>
		
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
				                    	<input type="email" class="form-control" id="inputEmail3" placeholder="방 제목을 입력해주세요">
				                  	</div>
				                </div>
				                <div class="form-group">
				                 	 <label for="inputPassword3" class="col-sm-3 control-label">
				                 	 	 비밀번호(선택)
				                 	 	<input type="checkbox" class="flat-red">	
				                 	 </label>
					                 <div class="col-sm-9">
					                    <input type="password" class="form-control" id="inputPassword3" placeholder="Password" disabled>
					                 </div>
				                </div>
								<div class="form-group">
									<label class="col-sm-3 control-label">말머리</label>
									<div class="col-sm-9">
										<select class="form-control select2" style="width: 100%;">
											<option selected="selected">동행</option>
											<option>숙박</option>
											<option>예약</option>
											<option>단체</option>
											<option>기타</option>
										</select>
									</div>
								</div>
								</div>
				              <!-- /.box-body -->
				              <div class="box-footer">
				                <button type="submit" class="btn btn-default">Cancel</button>
				                <button type="submit" class="btn btn-info pull-right">Sign in</button>
				              </div>
				              <!-- /.box-footer -->
				            </form>
		            </div>
		            <!-- /.box-body -->
		          </div>
			
				<div class="col-sx-12 " >
					<div class="box box-default">
						<div class="box-header">
							<h3 class="box-title">채팅 방 리스트</h3>

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
							<table class="table table-hover">
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
								<tr>
									<td>183</td>
									<td class="hidden-xs">5분전</td>
									<td><span class="label label-success">동행</span></td>
									<td class="hidden-xs">4/4</td>
									<td>프랑스 여행 동행하실분 구합니다.</td>
								</tr>
								<tr>
									<td>219</td>
									<td class="hidden-xs">6분전</td>
									<td><span class="label label-warning">예약</span></td>
									<td class="hidden-xs">2/4</td>
									<td>전주 한옥마을 단체예약 하실분 모집!</td>
								</tr>
								<tr>
									<td>657</td>
									<td class="hidden-xs">11-7-2014</td>
									<td><span class="label label-primary">기타</span></td>
									<td class="hidden-xs">3/4</td>
									<td>솔로라 할 일 없는 분들! 다같이 강원도로 놀러가요</td>
								</tr>
								<tr>
									<td>175</td>
									<td class="hidden-xs">11-7-2014</td>
									<td><span class="label label-danger">숙박</span></td>
									<td class="hidden-xs">3/4</td>
									<td>가족여행 패키지로 예약하실분 모집합니다.</td>
								</tr>
								<tr>
									<td>175</td>
									<td class="hidden-xs">11-7-2014</td>
									<td><span class="label label-danger">숙박</span></td>
									<td class="hidden-xs">3/4</td>
									<td>가족여행 패키지로 예약하실분 모집합니다.</td>
								</tr>
								<tr>
									<td>175</td>
									<td class="hidden-xs">11-7-2014</td>
									<td><span class="label label-danger">숙박</span></td>
									<td class="hidden-xs">3/4</td>
									<td>가족여행 패키지로 예약하실분 모집합니다.</td>
								</tr>
								<tr>
									<td>175</td>
									<td class="hidden-xs">11-7-2014</td>
									<td><span class="label label-danger">숙박</span></td>
									<td class="hidden-xs">3/4</td>
									<td>가족여행 패키지로 예약하실분 모집합니다.</td>
								</tr>
								<tr>
									<td>175</td>
									<td class="hidden-xs">11-7-2014</td>
									<td><span class="label label-danger">숙박</span></td>
									<td class="hidden-xs">3/4</td>
									<td>가족여행 패키지로 예약하실분 모집합니다.</td>
								</tr>
								<tr>
									<td>175</td>
									<td class="hidden-xs">11-7-2014</td>
									<td><span class="label label-danger">숙박</span></td>
									<td class="hidden-xs">3/4</td>
									<td>가족여행 패키지로 예약하실분 모집합니다.</td>
								</tr>
								<tr>
									<td colspan="5">
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
									</td>
								</tr>
							</table>
						</div>
						<!-- /.box-body -->
					</div>
					<!-- /.box -->
				</div>
			</div>

			<!-- 채팅방 관련-->
			<div class="box box-success">
				<div class="box-header">
					<i class="fa fa-comments-o"></i>
					<h3 class="box-title">Chat</h3>
				</div>
				<div class="box-body chat" id="chat-box">
				
					<!-- chat item -->
					<div class="item">
						<img src="../resources/img/test.JPG" alt="user image" class="online">

						<p class="message">
							<a href="#" class="name"> 
								<small class="text-muted pull-right">
									<i class="fa fa-clock-o"></i>
									2:15
								</small> Mike Doe
							</a> 
							I would like to meet you to discuss the latest news about the
							arrival of the new theme. They say it is going to be one the best
							themes on the market
						</p>
					</div>
					<!-- /.item -->
					<div id="msgBoard">
					
					</div>
					<div class="box-footer">
			              <div class="input-group">
			                <input class="form-control" placeholder="Type message..." name="chatInput">
			
			                <div class="input-group-btn">
			                  <button type="button" class="btn btn-success" onclick="sendMsg();"><i class="fa fa-plus"></i></button>
			                </div>
			              </div>
			            </div>
					</div>
				<!-- /.chat -->
				<!-- --------------------------------------- Main content ------------------------------------------------------- -->
			</div>
			</div>
			<!-- include -->
			<jsp:include page="../component/footer.jsp" />
			<jsp:include page="../component/controlSidebar.jsp" />
		</div>
		<!-- scripts -->
	<jsp:include page="../component/core_js.jsp" />
	<script src="https://cdnjs.cloudflare.com/ajax/libs/jquery-validate/1.13.1/jquery.validate.min.js"></script>
	<script type="text/javascript">
	</script>
</body>
</html>