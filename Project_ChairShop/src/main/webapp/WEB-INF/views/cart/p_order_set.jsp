<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c"  uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="https://code.jquery.com/jquery-1.12.4.js"></script>
<link rel="stylesheet" href="${ pageContext.request.contextPath }/resources/css/p_order_set.css">
</head>
<body>
<div class="wrap"> 
	<!-- header -->
	<%@include file="../header/header.jsp" %>
	<!-- contents -->
<section class="order_set_content">
	<div class="order_set_content_f">
		<div class="top_text">
			<h1>주문완료</h1> 
			<ul>
				<li>01. 장바구니</li>
				<li>></li>
				<li>02. 주문서작성</li>
				<li>></li>
				<li>03. 주문완료</li>
			</ul>
		</div>
		
		<div class="order_form">
			<h1>상품주문이 완료되었습니다.</h1>
			<p>
			   아래 계좌정보로 입금해 주시면<br>
			   결제 완료처리가 됩니다.
			</p>
			<div class="order_box">
				<ul>
					<li><span>입금계좌 안내</span>
						<ul>
							<li>체어샵은행</li>
							<li>1002-123-456789</li>
							<li>(주)chair#</li>
							<li><fmt:formatNumber type="currency" value="${ total_amount }"/></li>
						</ul>
					</li>
					<li><span>배송지</span>
						<ul>
							<li>${ map.receiver }</li>
							<li>${ map.tel }</li>
							<li>${ map.zipcode }</li>
							<li>${ map.addr }</li>
						</ul>
					</li>
					<li><span>배송방법</span>택배</li>
				</ul>
				<input type="button" value="홈으로" class="home_btn" onclick="location.href='../product/p_order_list.do?m_idx=${ user.m_idx }'">
			</div>
		</div>
		
		
	</div>
</section>
	<!-- footer -->
	<%@include file="../footer/footer.jsp" %>
</div>
</body>
</html>