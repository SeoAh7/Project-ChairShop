<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="${ pageContext.request.contextPath }/resources/css/product_view.css">
	
<script type="text/javascript">
	
	function cart_insert() {
		
		//로그인 상태 체크
		if('${ empty user }' == 'true'){
			if(confirm('장바구니 담기는 로그인 후에 이용가능합니다\n로그인 하시겠습니까?')==false)return;
		
		//로그인폼으로 이동: 현재위치를 넘겨주고
		//alert(location.href);
		//현재 주소위치 : location.href
		location.href='../member/login_form.do?url=' + encodeURIComponent(location.href);
		return;
		}
		
		//로그인 된 경우 ajax를 이용해서 장바구니 담기 처리
		$.ajax({
			url 	 : "${pageContext.request.contextPath}/cart/cart_insert.do",//CartInsertAction
			data	 : {'p_idx':"${param.p_idx}", 'm_idx':"${user.m_idx}"},
			dataType : "json",
			success  : function(result_data){
				
				//result_data = {"result":"success"} //장바구니담기 성공
				//result_data = {"result":"exist"}   //장바구니에 이미 존재
				
				if(result_data.result == "success"){
					if(confirm('해당 상품을 장바구니에 담았습니다\n장바구니로 이동하시겠습니까?')==false)return;
					
					location.href='${pageContext.request.contextPath}/cart/cart_list.do';
					return;
				}
				
				if(result_data.result == "exist"){
					if(confirm('해당 상품이 이미 장바구니에 존재합니다\n장바구니로 이동하시겠습니까?')==false)return;
					
					location.href='${pageContext.request.contextPath}/cart/cart_list.do';
					return;
				}
			
			},
			error	 : function(err){
				alert(err.responseText);
			}
		});
		
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
						<li><a href="${ pageContext.request.contextPath }/product/product_list.do?category=&search_product=">전체보기</a></li>
						<li>></li>
						<li><a href="${ pageContext.request.contextPath }/product/product_list.do?category=${ vo.category }&search_product=">현상품 카테고리 리스트</a></li>
					</ul>
				</div>
					<div class="goods_info">
						
							<img alt="상품이미지" src="${ pageContext.request.contextPath }/resources/image/${ vo.p_img }">
							<div class="p_info">
								<h1>${ vo.p_name }</h1>
								<p><fmt:formatNumber type="currency" value="${ vo.p_price }"/></p>
								<textarea disabled="disabled">${ vo.p_content }</textarea>
								<div class="p_buy">
									<a href="#" class="cart_insert" onclick="cart_insert();">장바구니</a>
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