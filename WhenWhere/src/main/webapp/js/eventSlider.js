$(document).ready(function () {
	
    /***추가 js***********************************************************************/
    

	$('.scrollDown').css('display','none');
    
    $('.locationSearchBtn').on('click', function() {
    	if($('.tabs').css('display') == 'none'){
    		$(this).text('상세검색∧');
    		$('.tabs').slideDown();
    	}else{
    		$('.tabs').slideUp();
    		$(this).text('상세검색∨');
    	}
	});
    
    $('.searchBtn').on('click', function() {
    	
    	$('.checkbox:checked').each(function(k, v) {
			alert($(this).attr('id'));
		});
    	
		if($('.scrollDown').css('visibility') == 'hidden'){
			$('.scrollDown').slideDown();
			
			setTimeout(function () {
				$('.scrollDown').css('visibility','visible');
			}, 500);
			
			
			
			/*$('#content-slider1').lightSlider({
				loop:true,
		        keyPress:true
			});
			
			$('#content-slider2').lightSlider({
				loop:true,
		        keyPress:true
			});
			
			$('#content-slider3').lightSlider({
				loop:true,
		        keyPress:true
			});*/
			
			
		}else{
			$('.scrollDown').slideUp();
			$('.scrollDown').slideDown();
			 
			/*$(".content-slider1").empty();
			$(".content-slider2").empty();
			$(".content-slider3").empty();
			
			$(".item").each(function(k, v) {
				var ul = $('<ul/>').attr('id','content-slider'+(k+1)).attr('class','content-slider'+(k+1));
				ul.append("<li><a href='#'><img src='../resources/img/bg_img.jpg' class='img-thumbnail'/></a></li><li><a href='#'><img src='../resources/img/bg_img.jpg' class='img-thumbnail'/></a></li><li><a href='#'>3</a></li><li><a href='#'>4</a></li><li><a href='#'>5</a></li><li><a href='#'>6</a></li><li><a href='#'>7</a></li>");
				$(this).html(ul);
			});
			
			$("#content-slider1").lightSlider({
                loop:true,
                keyPress:true
            });
			
			$("#content-slider2").lightSlider({
                loop:true,
                keyPress:true
            });
			
			$("#content-slider3").lightSlider({
                loop:true,
                keyPress:true
            });
			*/
		}
	});
    

    $('.carousel').carousel({
       interval: 10000
   });
    
    
});