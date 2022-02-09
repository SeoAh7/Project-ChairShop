<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="https://code.jquery.com/jquery-1.12.4.js"></script>
<link rel="stylesheet" href="${ pageContext.request.contextPath }/resources/css/main.css">
<link rel="stylesheet" href="${ pageContext.request.contextPath }/resources/css/footer.css">
<link rel="stylesheet" href="${ pageContext.request.contextPath }/resources/css/header.css">
<link rel="stylesheet" href="${ pageContext.request.contextPath }/resources/css/top_menu.css">
<link rel="stylesheet" href="${ pageContext.request.contextPath }/resources/css/product_gaming_list.css">
<link rel="stylesheet" href="${ pageContext.request.contextPath }/resources/css/p_order_list.css">
</head>
<body>
<div class="wrap">
		<!-- header -->
		<%@include file="../header/header.jsp" %>
		<div class="order">				
		<div class="order_f">
			<h2>마이페이지</h2>
				<div class="order_check">
					<h3>나의 주문처리 현황</h3>
					<ul>
						<li>상품준비
							<p>0</p>
						</li>
						<li>배송중
							<p>0</p>
						</li>
						<li>배송완료
							<p>0</p>
						</li>
					</ul>
				</div>
			</div>
		</div>
		<!-- contents -->
		<section class="content">
			<div class="content_f">
				<div class="my_info">
					<ul>
						<li><a href="#">주문 내역</a></li>
						<li><a href="${ pageContext.request.contextPath }/member/modify_form.do?m_idx=${ user.m_idx }">회원 정보 수정</a></li>
						<li><a href="#">게시물 관리</a></li>
					</ul>
					<div class="order_info">
						<div class="order_info_list">
						<h2>주문 내역</h2>
							<ul>
								<li class="p_idx">주문번호</li>
								<li class="p_regdate">주문일자</li>
								<li class="p_info">상품정보</li>
								<li class="p_count">수량</li>
								<li class="o_price">주문금액</li>
								<li class="o_state">처리상태</li>
							</ul>
						</div>
					</div>
				</div>
				<div></div>
			</div>
		</section>
		<!-- footer -->
		<%@include file="../footer/footer.jsp" %>
</div>
</body>
</html>