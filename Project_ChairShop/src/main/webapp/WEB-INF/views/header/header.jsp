<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>

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
</script>

</head>
<body>
<header class="header">
	<section class="top_menu">
		<div class="top_menu_f">
			<ul>
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
				<li><a href="#">Product</a></li>
				<li><a href="${ pageContext.request.contextPath }/qna/list.do">Community</a></li>
				<li><a href="#">Customer Center</a></li>
			</ul>
		</div>
		<div class="header_right">
			<input type="text">
		</div>
	</div>
</header>
</body>
</html>