<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="https://code.jquery.com/jquery-1.12.4.js"></script>
<script type="text/javascript" src="${ pageContext.request.contextPath }/resources/js/menu_slidedown.js"></script>
<link rel="stylesheet" href="${ pageContext.request.contextPath }/resources/css/header.css">
<link rel="stylesheet" href="${ pageContext.request.contextPath }/resources/css/top_menu.css">
<link rel="stylesheet" href="${ pageContext.request.contextPath }/resources/css/footer.css">
<script type="text/javascript">

	function logout() {
		
		location.href='${ pageContext.request.contextPath }/member/logout.do';
		
		alert('로그아웃되었습니다');
		
	}

	function order_check() {
		
		if('${ empty user}'=='true'){
			if(confirm('주문정보 조회는 로그인 후에 가능합니다.\r\n로그인하시겠습니까?')==false) return;
			location.href='${ pageContext.request.contextPath }/member/login_form.do';
		}else{
			
			location.href='${ pageContext.request.contextPath }/order/order_list.do';
		}
		
	}

	function cart_list() {
		
		if('${ empty user}'=='true'){
			if(confirm('장바구니 조회는 로그인 후에 가능합니다.\r\n로그인하시겠습니까?')==false) return;
			location.href='${ pageContext.request.contextPath }/member/login_form.do';
		}else{
			
			location.href='${ pageContext.request.contextPath }/cart/cart_list.do';
		}
		
	}
	
	function order_check() {
		if('${ empty user }'=='true'){
			if(confirm('주문조회는 로그인 후에 가능합니다. \r\n로그인하시겠습니까?')==false) return;
			location.href='${ pageContext.request.contextPath }/member/login_form.do';
		}
		else{
			location.href='${ pageContext.request.contextPath }/product/p_order_list.do';
		}
		
	}
</script>

</head>
<body>
<header class="header">
	<section class="top_menu">
		<div class="top_menu_f">
			<ul><c:if test="${ user.m_grade eq '관리자' }">
				<li><input class="btn_register" type="button" value="상품등록" onclick="location.href='${ pageContext.request.contextPath }/product/product_insert_form.do'"></li>
				<li><input class="btn_order_manager" type="button" value="주문접수" onclick="location.href='${ pageContext.request.contextPath }/order/order_confirm.do'"></li>
				<li><input class="btn_item_status" type="button" value="재고관리" onclick="location.href='${ pageContext.request.contextPath }/product/product_manage.do'"></li>
				<li><input class="btn_item_status" type="button" value="회원관리" onclick="location.href='${ pageContext.request.contextPath }/member/list.do'"></li>
				</c:if>
				<c:if test="${ not empty user }">
					<li>
						<b>${ user.m_name }</b>님 환영합니다
					</li>
					<li> <a href="#" onclick="logout();">로그아웃</a> </li>
				</c:if>
				<c:if test="${ empty user }">
					<li><a href="${ pageContext.request.contextPath }/member/login_form.do">로그인</a></li>
					<li><a href="${ pageContext.request.contextPath }/member/register_form.do">회원가입</a></li>
				</c:if>
				<li><a href="#" onclick="order_check();">주문조회</a></li>
				<li><a href="#" onclick="cart_list();">장바구니</a></li>
			</ul>
		</div> 
	</section>
	<div class="header_f">
		<div class="header_left">
			<a href="${ pageContext.request.contextPath }">
				<img src="${ pageContext.request.contextPath }/resources/image/logo.png">
			</a>
		</div>
		<div class="header_center">
			<ul>
				<li><a href="#">Company</a></li>
				<li><a href="#">Product</a>
					<ul>
						<li><a href="${ pageContext.request.contextPath }/product/product_list.do?category=">전체보기</a></li>
						<li><a href="${ pageContext.request.contextPath }/product/product_list.do?category=office002">사무용의자</a></li>
						<li><a href="${ pageContext.request.contextPath }/product/product_list.do?category=kids001">유아용의자</a></li>
						<li><a href="${ pageContext.request.contextPath }/product/product_list.do?category=gaming003">게이밍용의자</a></li>
					</ul>
				</li>
				<li><a href="#">Community</a>
					<ul>
						<li><a href="#">이벤트</a></li>
						<li><a href="#">리뷰</a></li>
						<li><a href="#">매장안내</a></li>
						<li><a href="#">조립설명동영상</a></li>
						<li><a href="#">사용설명동영상</a></li>
					</ul>
				</li>
				<li><a href="#">Customer Center</a>
					<ul>
						<li><a href="${ pageContext.request.contextPath }/notice/list.do">공지사항</a></li>
						<li><a href="${ pageContext.request.contextPath }/faq/list.do">FAQ</a></li>
						<li><a href="#">A/S안내</a></li>
						<li><a href="${ pageContext.request.contextPath }/qna/list.do">Q&A</a></li>
					</ul>
				</li>
			</ul>
		</div>
		<div class="header_right">
			<input type="text">
		</div>
	</div>
</header>
</body>
</html>