<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet"
	href="${ pageContext.request.contextPath }/resources/css/main.css">
<link rel="stylesheet"
	href="${ pageContext.request.contextPath }/resources/css/footer.css">
<link rel="stylesheet"
	href="${ pageContext.request.contextPath }/resources/css/header.css">
<link rel="stylesheet"
	href="${ pageContext.request.contextPath }/resources/css/top_menu.css">
<link rel="stylesheet"
	href="${ pageContext.request.contextPath }/resources/css/product_view.css">
	
<script type="text/javascript">
	function p_list() {
	
		location.href = "/product/product_list.do?category="+category;
	}
	
</script>
</head>
<body>
<div class="wrap">
		<!-- header -->
		<%@include file="../header/header.jsp"%>
		<!-- contents -->
		<section class="content">
			<div class="content_f">
				<div class="load_list">
					<ul>
						<li><a href="../">홈</a></li>
						<li>></li>
						<li><a href="${ pageContext.request.contextPath }/product/product_list.do?category=">전체보기</a></li>
						<li>></li>
						<li><a href="#" onclick="p_list();">현상품 카테고리 리스트</a></li>
					</ul>
				</div>
				<div class="goods_info">
					<img alt="상품이미지" src="">
					<div class="p_info">
						<h1>상품명</h1>
						<p>가격</p>
						<div class="p_buy">
							<a href="#" class="cart_insert" onclick="cart_insert();">장바구니</a>
							<a href="#" class="cart_buy" onclick="cart_buy();">구매하기</a>
						</div>
					</div>
				</div>
			</div>
		</section>
		<!-- footer -->
		<%@include file="../footer/footer.jsp"%>
</div>
</body>
</html>