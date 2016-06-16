$(document).ready(function() {
	
	var request;

	/***추가 js***********************************************************************/
	$('.input-daterange').datepicker({
		todayBtn : "linked"
	});

	$('.scrollDown').css('display', 'none');

	$('.locationSearchBtn').on('click', function() {
		if ($('.tabs').css('display') == 'none') {
			$(this).text('상세검색∧');
			$('.tabs').slideDown();

		} else {
			$('.tabs').slideUp();
			$(this).text('상세검색∨');
		}
	});


	$('.searchBtn').on('click', function() {

		run_wait('#myCarousel1');
		run_wait('#myCarousel2');
		run_wait('#myCarousel3');
		run_wait('#myCarousel4');
		run_waitBtn('.loadingBtn');
		setTimeout(function() {
			$('.loadingBtn').waitMe('hide');
		}, 1000);
		

		//start, end Date 가져오기 
		var startDate = $('#start').val(), 
		endDate = $('#end').val(),
		locations = [];
 
		if(startDate == '' || endDate == ''){
			$.bootstrapGrowl("날짜를 선택해야징.. 이 바부야!", {
				type: 'danger',
				align: 'center',
				width: 'auto',
				allow_dismiss: false
			});
			$('.checkbox').attr('checked', false);
		}else{

			if ($('.scrollDown').css('visibility') == 'hidden') {
				$('.scrollDown').slideDown();

				setTimeout(function() {
					$('.scrollDown').css('visibility', 'visible');
				}, 400);

			} else {
				//$('.scrollDown').slideUp();

				setTimeout(function() {
					$('.scrollDown').slideDown();
				}, 500);
			}

			setTimeout(function() { //로딩시간
				
				$('.checkbox:checked').each(function(k, v) {
					locations[k] = $(this).attr('id');
				});

				if(locations.length == 0){
					locations[0] = 'all';
				}
				

				jQuery.ajaxSettings.traditional = true; //ajax로 배열을 넘기기위한 설정

				$.ajax({
					dataType:"json",
					type:"post",
					url:"../home/search",
					data:{sDate:startDate, eDate:endDate, locations:locations},
					success:function(data){
						var carousel1 = $('#myCarousel1'),
						carousel2 = $('#myCarousel2'),
						carousel3 = $('#myCarousel3');
						carousel4 = $('#myCarousel4');

						carousel1.empty();
						carousel2.empty();
						carousel3.empty();
						carousel4.empty();
						
						carousel4.append($('<h1 class="slideLabel"><span class="label">※ 팀</span></h1>'));
						carousel1.append($('<h1 class="slideLabel"><span class="label">※ 행사</span></h1>'));
						carousel2.append($('<h1 class="slideLabel"><span class="label">※ 먹거리</span></h1>'));
						carousel3.append($('<h1 class="slideLabel"><span class="label">※ 숙박</span></h1>'));
						carousel4.append($('<div/>').attr('class','carousel-inner'));
						carousel1.append($('<div/>').attr('class','carousel-inner'));
						carousel2.append($('<div/>').attr('class','carousel-inner'));
						carousel3.append($('<div/>').attr('class','carousel-inner'));

						
						if(data.searchTeamList.length == 0){
							carousel4.children('h1').text('※ 해당 기간내에 팀 검색결과가 존재하지 않습니다.').attr('class','label searchFail');
						}

						var carouselDiv = carousel4.children('.carousel-inner');

						for(var j=0; j<data.searchTeamList.length; j++){
							var imgName, subject, teamUrm, label;
							teamUrl = 'http://192.168.8.31:8088/WhenWhere/home/team?teamNum='+data.searchTeamList[j].tNo+'&teamname='+data.searchTeamList[j].teamName;
							switch (data.searchTeamList[j].subject) {
							case '0':
								subject = '동행';
								label = 'label label-success';
								imgName = 'partnership.png'; break;
							case '1':
								subject = '숙박';
								label = 'label label-warning';
								imgName = 'hotel.png'; break;
							case '2':
								subject = '예약';
								label = 'label label-primary';
								imgName = 'reservation.png'; break;
							case '3':
								subject = '단체';
								label = 'label label-info';
								imgName = 'together.png'; break;
							case '4':
								subject = '기타';
								label = 'label label-danger';
								imgName = 'etc.png'; break; 
							}
							
							var itemDiv = carouselDiv.children('.item:last-child'),
							thumbnailsUl = itemDiv.children('.thumbnails'),
							colLi = $('<li/>').attr('class','col-sm-3'),
							fDiv = $('<div/>').attr('class','fff'),
							thumbnailDiv = $('<div/>').attr('class','thumbnail'),
							img = $('<img/>').attr('src','../resources/img/'+imgName+'').attr('width','200px'),
							/*img = $('<img/>').attr('src','http://192.168.8.13:8088/'+imgName+'').attr('width','200px'),*/
							imgA = $('<a href="#" class="searchImgA" data-toggle="modal" data-target="#basicModal"></a>'),
							captionDiv = $('<div/>').attr('class','caption'),
							nav = $('<nav/>'),
							navUl = $('<ul/>').attr('class','control-box pager'),
							title = $('<h4>'+"["+data.searchTeamList[j].locName+"] "+data.searchTeamList[j].teamName+'</h4>').attr('class','label'),
							content = $('<p>'+data.searchTeamList[j].tSDate+"~"+data.searchTeamList[j].tEDate+'</p>');

							if(j % 4 == 0){
								if(j == 0){
									itemDiv = $('<div/>').attr('class','item active');
								}else{
									itemDiv = $('<div/>').attr('class','item');
								}
								thumbnailsUl = $('<ul/>').attr('class','thumbnails');
								itemDiv.append(thumbnailsUl);
								carouselDiv.append(itemDiv);
							}

							captionDiv.append(title);
							captionDiv.append($('<span class="subName glyphicon '+label+'">' +subject+ '</span>').attr('id','subName'+data.searchTeamList[j].subject));
							captionDiv.append(content);
							captionDiv.append($('<input type="hidden" value='+teamUrl+'">'));
							imgA.append($('<input type="hidden" value="'+data.searchTeamList[j].teamName+'">'));
							imgA.append($('<input type="hidden" value="'+data.searchTeamList[j].tSDate+'~'+data.searchTeamList[j].tEDate+'">'));
							imgA.append($('<input type="hidden" value="'+data.searchTeamList[j].locName+'">'));
							imgA.append($('<input type="hidden" value="'+subject+'">'));
							imgA.append(img);
							thumbnailDiv.append(imgA);
							fDiv.append(thumbnailDiv);
							fDiv.append(captionDiv);
							colLi.append(fDiv);
							thumbnailsUl.append(colLi);

							if(j == data.searchFoodList.length-1){
								navUl.append($('<li><a data-slide="prev" href="#myCarousel4"><i class="glyphicon glyphicon-chevron-left"></i></a></li>'));
								navUl.append($('<li><a data-slide="next" href="#myCarousel4"><i class="glyphicon glyphicon-chevron-right"></i></a></li>'));
								nav.append(navUl);
								carousel4.append(nav);
							}

						}
						
						
						
						if(data.searchEventList.length == 0){
							carousel1.children('h1').text('※ 해당 기간내에 행사 검색결과가 존재하지 않습니다.').attr('class','label searchFail');
						}
						
						carouselDiv = carousel1.children('.carousel-inner');

						for(var j=0; j<data.searchEventList.length; j++){

							var itemDiv = carouselDiv.children('.item:last-child'),
							thumbnailsUl = itemDiv.children('.thumbnails'),
							colLi = $('<li/>').attr('class','col-sm-3'),
							fDiv = $('<div/>').attr('class','fff'),
							thumbnailDiv = $('<div/>').attr('class','thumbnail'), 
							img = $('<img/>').attr('src','http://192.168.8.13:8088/img/'+data.searchEventList[j].imgName+'').attr('width','200px'),
							imgA = $('<a href="#" class="searchImgA" data-toggle="modal" data-target="#basicModal"></a>'),
							captionDiv = $('<div/>').attr('class','caption'),
							nav = $('<nav/>'),
							navUl = $('<ul/>').attr('class','control-box pager'),
							title = $('<h4>'+"["+data.searchEventList[j].locName+"] "+data.searchEventList[j].title+'</h4>').attr('class','label'),
							content = $('<p>'+data.searchEventList[j].eSDate+'~'+data.searchEventList[j].eEDate+'</p>');

							if(j % 4 == 0){
								if(j == 0){ 
									itemDiv = $('<div/>').attr('class','item active');
								}else{
									itemDiv = $('<div/>').attr('class','item');
								}
								thumbnailsUl = $('<ul/>').attr('class','thumbnails');
								itemDiv.append(thumbnailsUl);
								carouselDiv.append(itemDiv);
							}
							
							captionDiv.append(title);
							captionDiv.append($('<span class="recommend glyphicon glyphicon-thumbs-up">' +data.searchEventList[j].bRecommend+ '</span>'));
							captionDiv.append(content);
							captionDiv.append($('<input type="hidden" value="../board/eventRead?no='+data.searchEventList[j].bNo+'&category=4">'));
							imgA.append($('<input type="hidden" value="'+data.searchEventList[j].eSDate+'~'+data.searchEventList[j].eEDate+'">'));
							imgA.append($('<input type="hidden" value="'+data.searchEventList[j].locName+'">'));
							imgA.append($('<input type="hidden" value="'+data.searchEventList[j].bRecommend+'">'));
							imgA.append($('<input type="hidden" value="'+data.searchEventList[j].bContent+'">'));
							imgA.append(img); 
							thumbnailDiv.append(imgA);
							fDiv.append(thumbnailDiv);
							fDiv.append(captionDiv);
							colLi.append(fDiv);
							thumbnailsUl.append(colLi);

							if(j == data.searchEventList.length-1){
								navUl.append($('<li><a data-slide="prev" href="#myCarousel1"><i class="glyphicon glyphicon-chevron-left"></i></a></li>'));
								navUl.append($('<li><a data-slide="next" href="#myCarousel1"><i class="glyphicon glyphicon-chevron-right"></i></a></li>'));
								nav.append(navUl);
								carousel1.append(nav);
							}

						}
						 
						if(data.searchFoodList.length == 0){
							carousel2.children('h1').text('※ 해당 기간내에 특산물 검색결과가 존재하지 않습니다.').attr('class','label searchFail');
						}

						carouselDiv = carousel2.children('.carousel-inner');

						for(var j=0; j<data.searchFoodList.length; j++){

							var itemDiv = carouselDiv.children('.item:last-child'),
							thumbnailsUl = itemDiv.children('.thumbnails'),
							colLi = $('<li/>').attr('class','col-sm-3'),
							fDiv = $('<div/>').attr('class','fff'),
							thumbnailDiv = $('<div/>').attr('class','thumbnail'),  
							img = $('<img/>').attr('src','http://192.168.8.13:8088/'+data.searchFoodList[j].imgName+'').attr('width','200px'),
							imgA = $('<a href="#" class="searchImgA" data-toggle="modal" data-target="#basicModal"></a>'),
							captionDiv = $('<div/>').attr('class','caption'),
							nav = $('<nav/>'),
							navUl = $('<ul/>').attr('class','control-box pager'),
							title = $('<h4>'+"["+data.searchFoodList[j].locName+"] "+data.searchFoodList[j].foodName+'</h4>').attr('class','label'),
							content = $('<p>'+data.searchFoodList[j].fSDate+"~"+data.searchFoodList[j].fEDate+'</p>');

							if(j % 4 == 0){
								if(j == 0){
									itemDiv = $('<div/>').attr('class','item active');
								}else{
									itemDiv = $('<div/>').attr('class','item');
								}
								thumbnailsUl = $('<ul/>').attr('class','thumbnails');
								itemDiv.append(thumbnailsUl);
								carouselDiv.append(itemDiv);
							}

							captionDiv.append(title);
							captionDiv.append(content);
							imgA.append(img);
							thumbnailDiv.append(imgA);
							fDiv.append(thumbnailDiv);
							fDiv.append(captionDiv);
							colLi.append(fDiv);
							thumbnailsUl.append(colLi);

							if(j == data.searchFoodList.length-1){
								navUl.append($('<li><a data-slide="prev" href="#myCarousel2"><i class="glyphicon glyphicon-chevron-left"></i></a></li>'));
								navUl.append($('<li><a data-slide="next" href="#myCarousel2"><i class="glyphicon glyphicon-chevron-right"></i></a></li>'));
								nav.append(navUl);
								carousel2.append(nav);
							}

						}
						
						if(data.searchHotelList.length == 0){
							carousel3.children('h1').text('※ 숙박 정보는 지역선택이 필수입니다.').attr('class','label searchFail');
						}
						
						carouselDiv = carousel3.children('.carousel-inner');

						for(var j=0; j<data.searchHotelList.length; j++){
							var itemDiv = carouselDiv.children('.item:last-child'),
							thumbnailsUl = itemDiv.children('.thumbnails'),
							colLi = $('<li/>').attr('class','col-sm-3'),
							fDiv = $('<div/>').attr('class','fff'),
							thumbnailDiv = $('<div/>').attr('class','thumbnail'),
							img = $(data.searchHotelList[j].img).attr('width','200px'),
							imgA = $('<a href="#" class="searchImgA" data-toggle="modal" data-target="#basicModal"></a>'),
							captionDiv = $('<div/>').attr('class','caption'),
							nav = $('<nav/>'),
							navUl = $('<ul/>').attr('class','control-box pager'),
							title = $('<h4>'+"["+data.searchHotelList[j].locName+"] "+data.searchHotelList[j].hotelName+'</h4>').attr('class','label'),
							content, p = $('<div/>').attr('class','starRating');
							
							for(var i=0; i<data.searchHotelList[j].starRating;i++){
								p.append('<span class="glyphicon glyphicon-star"></span>');
							}
							content = $(p);
							
							
							if(j % 4 == 0){
								if(j == 0){
									itemDiv = $('<div/>').attr('class','item active');
								}else{
									itemDiv = $('<div/>').attr('class','item');
								}
								thumbnailsUl = $('<ul/>').attr('class','thumbnails');
								itemDiv.append(thumbnailsUl);
								carouselDiv.append(itemDiv);
							}
							
							captionDiv.append(title);
							captionDiv.append(content);
							captionDiv.append($('<input type="hidden" value='+data.searchHotelList[j].href+'">'));
							imgA.append($('<input type="hidden" value="'+data.searchHotelList[j].roomType+'">'));
							imgA.append($('<input type="hidden" value="'+data.searchHotelList[j].hotelType+'">'));
							imgA.append($('<input type="hidden" value="'+data.searchHotelList[j].capacity+'">'));
							imgA.append($('<input type="hidden" value="'+data.searchHotelList[j].bedCnt+'">'));
							imgA.append(img);
							thumbnailDiv.append(imgA);
							fDiv.append(thumbnailDiv);
							fDiv.append(captionDiv);
							colLi.append(fDiv);
							thumbnailsUl.append(colLi);
							
							if(j == data.searchHotelList.length-1){
								navUl.append($('<li><a data-slide="prev" href="#myCarousel3"><i class="glyphicon glyphicon-chevron-left"></i></a></li>'));
								navUl.append($('<li><a data-slide="next" href="#myCarousel3"><i class="glyphicon glyphicon-chevron-right"></i></a></li>'));
								nav.append(navUl);
								carousel3.append(nav);
							}

						}

						if(data.searchFoodList.length == 0 && data.searchEventList.length == 0 && data.searchHotelList.length == 0){
							$.bootstrapGrowl("검색 결과가 존재하지 않습니다.", {
								type: 'danger',
								align: 'center',
								width: 'auto',
								allow_dismiss: false
							});
						}


					},
					error:function(request,error,status){
						alert("code:"+request.status+"\n"+"message:"+request.responseText+"\n"+"error:"+error);
					}
				});
				
				$('.checkbox').attr('checked', false);
				
			}, 1000);
			
		}
		
	});

	$(document).on('click', '.searchImgA', function() {
		$('.carousel-indicators').empty();
		$('.carousel-indicators').append('<li data-target="#detailCarousel" data-slide-to="0" class="active"></li>');
		$('.detailImg1').parent().siblings().attr('class','item row');
		$('.detailImg1').parent().attr('class','item active row');
		$('.detailImg1').attr('src', $(this).children('img').attr('src'));
		
		$('.modal-title').text($(this).parent().next().children('h4').text());
		$('.readMore').attr('href',$(this).parent().next().children('input').val());
		
		
		if($(this).parents('.carousel').attr('id') == 'myCarousel2'){
			$('.modal-footer').css('display','none');
			$('.detail2').parent().remove();
		}else if($(this).parents('.carousel').attr('id') == 'myCarousel3'){
			$('.readMore').text('예약하기');
			$('.modal-footer').css('display','block');
			$('.detail2').parent().remove();
			$('.carousel-indicators').append('<li data-target="#detailCarousel" data-slide-to="1" class="active"></li>');
			$('.modalContent').append($('<div class="item row"><div class="detail2 col-sm-offset-1 col-sm-10 col-xs-offset-1 col-xs-10"></div></div>'));
			
			var detailSub = ['숙소 유형', '집 유형', '수용 인원', '침실 수'], 
			detail = [];
			$(this).children('input').each(function(k, v) {
				detail[k] = $(this).val();
			});
			
			for(var i=0; i<detail.length; i++){
				var spanSub = $('<span/>').attr('class','spanSub').text(detailSub[i]),
				spanVal = $('<span/>').attr('class','spanVal').text(detail[i]);
				
				$('.detail2').append($('<hr>'));
				var div = $('<div/>').attr('class','justifyDiv');
				div.append(spanSub);
				div.append(spanVal);
				$('.detail2').append(div);
			}
			 
			
		}else if($(this).parents('.carousel').attr('id') == 'myCarousel4'){
			$('.readMore').text('팀 참가하기');
			$('.modal-footer').css('display','block');
			$('.detail2').parent().remove();
			$('.carousel-indicators').append('<li data-target="#detailCarousel" data-slide-to="1" class="active"></li>');
			$('.modalContent').append($('<div class="item row"><div class="detail2 col-sm-offset-1 col-sm-10 col-xs-offset-1 col-xs-10"></div></div>'));
			
			var detailSub = ['팀 이름', '여행 기간', '지역', '모집 유형'], 
			detail = [];
			$(this).children('input').each(function(k, v) {
				detail[k] = $(this).val();
			});
			
			for(var i=0; i<detail.length; i++){
				var spanSub = $('<span/>').attr('class','spanSub').text(detailSub[i]),
				spanVal = $('<span/>').attr('class','spanVal').text(detail[i]);
				
				$('.detail2').append($('<hr>'));
				var div = $('<div/>').attr('class','justifyDiv');
				div.append(spanSub);
				div.append(spanVal);
				$('.detail2').append(div);
			}
			 
			
		}else{
			$('.modal-footer').css('display','block');
			$('.detail2').parent().remove();
			$('.carousel-indicators').append('<li data-target="#detailCarousel" data-slide-to="1" class="active"></li>');
			$('.modalContent').append($('<div class="item row"><div class="detail2 col-sm-offset-1 col-sm-10 col-xs-offset-1 col-xs-10"></div></div>'));
			
			var detailSub = ['행사 일정', '행사 지역', '추천 수', '상세 설명'], 
			detail = [];
			$(this).children('input').each(function(k, v) {
				detail[k] = $(this).val();
			});
			
			for(var i=0; i<detail.length; i++){
				var spanSub = $('<span/>').attr('class','spanSub').text(detailSub[i]),
				spanVal = $('<span/>').attr('class','spanVal').text(detail[i]);
				
				$('.detail2').append($('<hr>'));
				var div = $('<div/>').attr('class','justifyDiv');
				div.append(spanSub);
				div.append(spanVal);
				$('.detail2').append(div);
			}
			var spanSub = $('<span/>').attr('class','spanSub').text(detailSub[detail.length-1]),
			spanVal = $('<span/>').attr('class','spanVal').html(detail[detail.length-1]);
			$('.detail2').append($('<hr>'));
			var div = $('<div/>').attr('class','justifyDiv');
			div.append(spanSub);
			div.append(spanVal);
			$('.detail2').append(div);
		}
		

	});

	$('.carousel').each(function() {
		$(this).carousel("pause").removeData();
		$(this).carousel({
		        interval : 100000
		    });
	});
   

});
function run_waitBtn(location){
	$(location).waitMe({
		effect: 'bounce',
		text: '검색 중...',
		bg: '#00c0ef',
		color: 'white',
		maxSize: '',
		onClose: function() {}
	});
}
function run_wait(location){
	$(location).waitMe({
		effect: 'bounce',
		text: '검색 중...',
		bg: 'rgba(255,255,255,0.3)',
		color: 'white',
		maxSize: '100px',
		onClose: function() {}
	});
}