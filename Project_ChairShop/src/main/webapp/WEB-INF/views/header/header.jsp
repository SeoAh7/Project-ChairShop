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
<link rel="stylesheet" href="${ pageContext.request.contextPath }/resources/css/main.css">
<link rel="stylesheet" href="${ pageContext.request.contextPath }/resources/css/header.css">
<link rel="stylesheet" href="${ pageContext.request.contextPath }/resources/css/top_menu.css">
<link rel="stylesheet" href="${ pageContext.request.contextPath }/resources/css/footer.css">
<link rel="stylesheet" href="${ pageContext.request.contextPath }/resources/css/p_order_list.css">
<script type="text/javascript">

	function logout() {
		
		location.href='${ pageContext.request.contextPath }/member/logout.do';
		
		alert('로그아웃되었습니다');
		
	}

	function cart_list() {
		
		if('${ empty user}'=='true'){
			if(confirm('장바구니 조회는 로그인 후에 가능합니다.\r\n로그인하시겠습니까?')==false) return;
			location.href='${ pageContext.request.contextPath }/member/login_form.do';
		}else{
			
			location.href='${ pageContext.request.contextPath }/cart/cart_list.do';
		}
		
	}
	
	function my_page() {
		if('${ empty user }'=='true'){
			if(confirm('마이페이지는 로그인 후에 이용 가능합니다.\r\n로그인하시겠습니까?')==false) return;
			location.href='${ pageContext.request.contextPath }/member/login_form.do';
		}
		else{
			location.href='${ pageContext.request.contextPath }/product/p_order_list.do?m_idx=${ user.m_idx }';
		}
		
	}
	
	
	
	//----------------------------------------------------------------------	
	$(document).ready(function() {
		$("#search_product").keypress(function(e) {
			if(e.keyCode == 13){
				 search(); 
			}
		});
		
		
	});
	//----------------------------------------------------------------------
	
	
	function search() {
		
		var search_product = document.getElementById('search_product').value.trim();
		
		if(search_product == ''){
			alert('검색어를 입력해주세요');
			document.getElementById('search_product').value =='';
			document.getElementById('search_product').focus();
			return;
		}
			
		location.href = '${pageContext.request.contextPath}/product/product_list.do?category=&search_product=' + search_product;
	}
	
	function admin_page() {
		$(".admin_page").css("display","flex");
		$(".user_page").css("display","none");
	}
	function user_page() {
		$(".admin_page").css("display","none");
		$(".user_page").css("display","flex");
	}


	
	
</script>

</head>
<body>
<header class="header">
	<section class="top_menu">
		<div class="top_menu_f">
			<ul><c:if test="${ user.m_grade eq '관리자' }">
				
				<li class="admin"><a href="#" onclick="admin_page();">관리자페이지</a></li>
				<li class="btn_user"><a href="#" onclick="user_page();">회원페이지</a></li>
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
				<li><a href="#" onclick="my_page();">마이페이지</a></li>
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
			<ul class="user_page">
				<li><a href="#">회사연혁</a></li>
				<li><a href="#">상품리스트</a>
					<ul>
						<li><a href="${ pageContext.request.contextPath }/product/product_list.do?category=&search_product=">전체보기</a></li>
						<li><a href="${ pageContext.request.contextPath }/product/product_list.do?category=office002&search_product=">사무용의자</a></li>
						<li><a href="${ pageContext.request.contextPath }/product/product_list.do?category=kids001&search_product=">유아용의자</a></li>
						<li><a href="${ pageContext.request.contextPath }/product/product_list.do?category=gaming003&search_product=">게이밍용의자</a></li>
					</ul>
				</li>
				<li><a href="#">커뮤니티</a>
					<ul>
						<li><a href="#">이벤트</a></li>
						<li><a href="#">리뷰</a></li>
						<li><a href="#">매장안내</a></li>
						<li><a href="#">조립설명동영상</a></li>
						<li><a href="#">사용설명동영상</a></li>
					</ul>
				</li>
				<li><a href="#">고객센터</a>
					<ul>
						<li><a href="${ pageContext.request.contextPath }/notice/list.do">공지사항</a></li>
						<li><a href="${ pageContext.request.contextPath }/faq/list.do">FAQ</a></li>
						<li><a href="#">A/S안내</a></li>
						<li><a href="${ pageContext.request.contextPath }/qna/list.do">Q&A</a></li>
					</ul>
				</li>
			</ul>
			<ul class="admin_page">
					<li><a href="${ pageContext.request.contextPath }/product/product_insert_form.do">상품등록</a></li>
					<li><a href="${ pageContext.request.contextPath }/order/order_list.do">주문접수</a></li>
					<li><a href="${ pageContext.request.contextPath }/admin/product_remain_list.do">재고관리</a></li>
					<li><a href="${ pageContext.request.contextPath }/admin/member_list.do">회원목록</a></li>
			</ul>
		</div>
		<div class="header_right">
			<input type="text" id="search_product">
			<input type="button" class="btn_search"  onclick="search();">
		</div>
	</div>
</header>
</body>
</html>