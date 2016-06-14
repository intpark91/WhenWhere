function userObj (param) {
   
	this.nickname = param[0];
    this.email = param[1];
    this.phone = param[2];
    this.authority = param[3];
    
    this.user_format = function(){
    	var str='';
    	var className='';
    	var select = '';
    	var selectArr = new Array("user","manager","ect","admin");
    	
    	select +='<div class="form-group">'
    			+ '<select class="form-control auth-class" onchange="changeAuth(this.value,$(this).closest(\'tr\').children(\'.nick\').text())">'
    			+ '<option>' + this.authority + '</option>';
    	for(var i=0;i<selectArr.length;i++){
    		now = selectArr[i];
    		if(now != this.authority ){
    			select += '<option>' + now + '</option>';
    		}
    	}
    	select +='</select></div>';
    	
    	switch (this.authority) {
    	  case 'admin' : 
    	 			 className = '<span class="label label-danger">';
    	  			 break;
    	  case 'user'  :  
	 	 			 className = '<span class="label label-success">';
	 	  			 break;
    	  case 'ect'  : 
 			 		 className = '<span class="label label-warning">';
 			 		 break;
    	  case 'manager'  : 
			 		 className = '<span class="label label-primary">';
			 		 break;
    	  default :  
    	  			 className = '<span class="label label-danger">';
    	             break;
    	}
    	
    	str += '<tr role="row" class="odd">'
    		+  '<td class="sorting_1 nick">' + this.nickname + '</td>'
    		+  '<td class="hidden-xs">'+ this.email +'</td>'
			+  '<td class="hidden-xs">'+ this.phone + '</td>'
			+  '<td>' +  select +'</span></td>'
			+  '<td><input class="input_class" type="checkbox"></td>'
			+  '<td style="max-width: 50px; min-width: 40px;"><button type="button" onclick="delUser($(this).closest(\'tr\').find(\'input\').is(\':checked\'),$(this).closest(\'tr\').children(\'.nick\').text())" class="btn btn-block btn-success">삭제</button></td></tr>';
		return str;
	}
}


function boardObj (param) {
    this.num = param[0];
    this.title = param[1];
    this.writer = param[2];
    
    this.board_format = function(){
    	var str='';
    	var className='';
    	var select = '';
    	
    	str += '<tr role="row" class="' + this.num +'">'
    		+  '<td class="hidden-xs">' + this.num + '</td>'
    		+  '<td style="max-width: 100px;">'+ this.title +'</td>'
			+  '<td >'+ this.writer + '</td>'
			+  '<td><input class="input_class" type="checkbox"></td>'
			+  '<td style="max-width: 50px; min-width: 40px;"><button type="button" onclick="delBoard($(this).closest(\'tr\').find(\'input\').is(\':checked\'),$(this).closest(\'tr\').attr(\'class\'))" class="btn btn-block btn-success">삭제</button></td></tr>';
		return str;
	}
}

function delUser(ischeck,nickname){
	
	if(!ischeck){
		alert('선택된 회원이 없습니다');
		return;
	}
	
	console.log(nickname);
	console.log($('tr').find(nickname));
	
	if(confirm(nickname+'회원정보를 삭제하시겠습니까?')){
		$.ajax({
	           type:"POST",
	           url:"../admin/delUser",
	           dataType:"JSON",
	           data : { "nickname" : nickname },
	           success : function(data) {
	        	   if(data.ok){
	        		  alert(nickname+' 회원정보가 삭제되었습니다....');
	        		  $('tr').each(function(index) {
	        			  if($(this).find('td.nick').text()==nickname){
	        				  $(this).remove();
	        			  }
        			  });
	        	   }else{
	        		   alert(nickname+' 회원정보 삭제에 실패하였습니다...');
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

function delBoard(ischeck,bnum){
	if(!ischeck){
		alert('선택된 게시글이 없습니다');
		return;
	}
	
	if(confirm(bnum+'번 게시글을 삭제하시겠습니까?')){
		$.ajax({
	           type:"POST",
	           url:"../admin/delBoard",
	           dataType:"JSON",
	           data : { "bnum" : bnum , "type" : 1 },
	           success : function(data) {
	        	   if(data.ok){
	        		  alert(bnum+'번 게시글이 삭제되었습니다....');
	        		  $('tr').each(function(index) {
	        			  if($(this).attr('class')==bnum){
	        				  $(this).remove();
	        			  }
        			  });
	        	   }else{
	        		   alert(nickname+'번 게시글 삭제에 실패하였습니다...');
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

function changeAuth(changeVal,nickname){
	console.log(parent);
	if(confirm(changeVal+'로 변경하시겠습니까?')){
		$.ajax({
	           type:"POST",
	           url:"../admin/changeUserAuth",
	           dataType:"JSON",
	           data : { "val": changeVal , "nickname" : nickname },
	           success : function(data) {
	        	   if(data.ok){
	        		  alert('회원의 권한이 '+ changeVal + '로 변경되었습니다.');
	        	   }else{
	        		   $('auth-class').val(beforeChangeValue);
	        	   }
	           },
	           complete : function(data) {
	        	   
	           },
	           error : function(xhr, status, error) {
	                 console.log(error);
	           }
	    });
	}else{
		$('auth-class').val(beforeChangeValue);
	}
}

function changeBoard(type){
	boardType = type;
	eventFunc(1);
}

function userFunc(){
	search='';
	search +='<div class="input-group input-group-sm" style="width: 150px;">'
			+ '<input type="text" name="table_search" class="form-control pull-right" placeholder="Search">'
			+ '<div class="input-group-btn">'
			+ '<button type="submit" class="btn btn-default">'
			+ '<i class="fa fa-search"></i>'
			+ '</button></div></div>';
	
	$('.box-tools').html(search);
	$('.box-title').text('회원 관리 리스트');
	theadStr = '';
	theadStr += '<tr><th>닉네임</th><th class="hidden-xs">이메일</th>'
			  + '<th class="hidden-xs">휴대폰번호</th>'
			  + '<th>권한</th>'
			  + '<th style="max-width: 30px;">회원선택</th>'
			  + '<th style="max-width: 50px; min-width: 50px;"></th>'
			  + '</tr>';
	
	$('thead').append(theadStr);
	
	$.ajax({
           type:"POST",
           url:"../admin/getUserList",
           dataType:"JSON",
           data : { "page": 1 },
           success : function(data) {
        	   console.log(data);
        	   if(data[0].ok){
        		   $('.mainTr').html('');
        		   for(var i=1; i<data.length;i++){
        			   
        			   var json_param = new Array();
        			   json_param.push(data[i].nickname);
        			   json_param.push(data[i].email);
        			   json_param.push(data[i].phone);
        			   json_param.push(data[i].authority);
        			   
        			   user = new userObj(json_param);
        			   str_Txt = user.user_format();
        			   
        			   $('.box-body tbody').append(str_Txt);
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

function boardFunc(){
	var selectArr = new Array("공지사항","커뮤니티","리뷰","행사");
	var selectB = selectArr[boardType-1];
	selectArr.splice(boardType-1, 1);
	
	select='';
	select +='<div class="form-group">'
			+ '<select class="form-control board-class" onchange="changeBoard(this.value)">'
			+ '<option value="1">' + selectB + '</option>'
			+ '<option value="2">' + selectArr[0] + '</option>'
			+ '<option value="3">' + selectArr[1] + '</option>'
			+ '<option value="4">' + selectArr[2] + '</option></select></div>';
	
	$('.box-tools').html(select);
	$('.box-title').text('게시판 관리 리스트');
	
	theadStr = '';
	theadStr += '<tr><th style="max-width: 30px;" class="hidden-xs">글번호</th>'
			  +	'<th>제목</th>'
			  + '<th>작성자</th>'
			  + '<th style="max-width: 30px;">게시글선택</th>'
			  + '<th style="max-width: 20px; min-width: 20px;"></th>'
			  + '</tr>';
	
	$('thead').append(theadStr);
	
	alert(boardType);
	$.ajax({
           type:"POST",
           url:"../admin/getBoardList",
           dataType:"JSON",
           data : { "type": boardType },
           success : function(data) {
        	   console.log(data);
        	   if(data[0].ok){
        		   $('.box-body tbody').html('');
        		   for(var i=1; i<data.length;i++){
        			   
        			   var json_param = new Array();
        			   json_param.push(data[i].no);
        			   json_param.push(data[i].title);
        			   json_param.push(data[i].writer);
        			   
        			   board = new boardObj(json_param);
        			   str_Txt = board.board_format();
        			   
        			   $('.box-body tbody').append(str_Txt);
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

function localProductFunc(){
	
	//////////// 지역 특산물 트리구조로 보이게 ~~
}
