<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="https://code.jquery.com/jquery-1.12.4.js"></script>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.3/jquery.min.js"></script> 
<script type="text/javascript" src="resources/js/header_scrolling.js"></script>
<link rel="stylesheet" href="${ pageContext.request.contextPath }/resources/css/main.css"> 
<link rel="stylesheet" href="${ pageContext.request.contextPath }/resources/css/header.css">
<link rel="stylesheet" href="${ pageContext.request.contextPath }/resources/css/top_menu.css">
<link rel="stylesheet" href="${ pageContext.request.contextPath }/resources/css/footer.css">
<link rel="stylesheet" href="${ pageContext.request.contextPath }/resources/css/home_content.css">
<link rel="stylesheet" href="${ pageContext.request.contextPath }/resources/css/slider.css">
</head>
<div class="wrap"> 
		<!-- header -->
		<%@include file="header/header.jsp" %>
		
		<!-- slider -->
		<section class="slider">

		</section>
		
		<!-- content -->
		<div class="content_f">
				
		</div>
		
		<!-- content_info -->
		<section class="content_info">
			<div class="content_info_f">
						<div class="cs_center">
							<h2>CS CENTER</h2>
							<ul>
								<li>070-1234-5678, 02-123-4567</li>
								<li>월요일~금요일,오전 09:00~오후 18:00 (점심시간 12:00~13:00)</li>
							</ul>
						</div>
						<div class="sns">
							<h2>SNS</h2>
							<ul>
								<li><a href="#"><img src="resources/image/blog.png"></a></li>
								<li><a href="#"><img src="resources/image/facebook.png"></a></li>
								<li><a href="#"><img src="resources/image/youtube.png"></a></li>
								<li><a href="#"><img src="resources/image/instagram.png"></a></li>
							</ul>
						</div>
						<div class="bank_info">
							<h2>BANK INFO</h2>
							<p>IC은행 123-456789-01-234/예금주 : 주식회사 체어샵</p>
						</div>
						<div class="community">
							<h2>COMMUNITY</h2>
							<ul>
								<li><a href="#">구매문의</a></li>
								<li><a href="#">제휴문의</a></li>
								<li><a href="#">사용후기</a></li>
								<li><a href="#">배송안내</a></li>
								<li><a href="#">제품문의</a></li>
							</ul>
						</div>
			</div>
		</section>
		
		<!-- footer -->
		<%@include file="footer/footer.jsp" %>
		
</div>
</body>
</html>