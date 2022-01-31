/**
 * 
 */
$(window).scroll(function(){
	
	if($(this).scrollTop()>50){
		$('.header').css({
			'position':'fixed',
			'top': 0
		});
		$('.header_hide').css({
			'position':'relative'
		});
		
	}else{
		$('.header').css({
			'position':'relative',
			'top': 0
		});
		$('.header_hide').css({
			'position':'absolute'
		});
		
	}
	
	
});