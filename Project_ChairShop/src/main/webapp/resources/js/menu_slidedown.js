/**
 * 
 */

$(document).ready(function(){
	 	$(".header_center>ul>li").mouseover(function(){
			$(this).find("ul>li").stop().slideDown();
		}); 
		
		$(".header_center>ul>li").mouseout(function(){
			$(this).find("ul>li").stop().slideUp();
		}); 
		
		
	
 });