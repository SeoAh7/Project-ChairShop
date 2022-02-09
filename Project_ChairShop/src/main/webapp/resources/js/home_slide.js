/**
 * 
 */

$(document).ready(function() {	

		$("div.slider ul li").eq(0).siblings().fadeOut();
		
		var slideIndex =0;
    	
		slideStart();
		function slideStart(){
			setInterval(slide,3000);
		};

		function slide(){
        if(slideIndex<$("div.slider ul li").length){
            slideIndex++;
        }else{
            slideIndex=0;
        }
		$("div.slider ul li").eq(slideIndex).siblings().fadeOut();
        $("div.slider ul li").eq(slideIndex).fadeIn();
    }

});


