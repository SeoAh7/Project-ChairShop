<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
	
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="https://code.jquery.com/jquery-1.12.4.js"></script>
<link rel="stylesheet"
	href="${ pageContext.request.contextPath }/resources/css/product_list.css">
<script type="text/javascript">
	function goods_info(p_idx) {
		
		location.href = "product_view.do?p_idx="+p_idx;
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
			<c:if test="${ param.category eq 'office002' }">
				<img
					src="${ pageContext.request.contextPath }/resources/image/1_office.png">
			</c:if>		
			<c:if test="${ param.category eq 'kids001' }">
				<img
					src="${ pageContext.request.contextPath }/resources/image/3_kids.png">
			</c:if>		
			<c:if test="${ param.category eq 'gaming003' }">
				<img
					src="${ pageContext.request.contextPath }/resources/image/2_gaming.png">
			</c:if>		
			<c:if test="${ param.category eq '' }">
				<img
					src="${ pageContext.request.contextPath }/resources/image/4_all.png">
			</c:if>		
				<div class="top_menu">
					<h2>
						총 <em>${ count }</em> 개의 제품이 있습니다.
					</h2>
					
				</div>
				<div class="p_list_menu">
					<c:if test="${ empty list }">
					<div class="none_goods">
						<ul>
							<li>제품이 존재하지 않습니다</li>
						</ul>
					</div>
					</c:if>
					<c:forEach var="vo" items="${ list }">
						<div class="goods"  onclick="goods_info(${ vo.p_idx });">
							<img src="${ pageContext.request.contextPath }/resources/image/${ vo.p_img }">
							<ul>
								<li>상품명 ${ vo.p_name }</li>
								<li>판매가 <fmt:formatNumber type="currency" value="${ vo.p_price }"/></li>
							</ul>
						</div>
					</c:forEach>
				</div>
			</div>

		</section>
		<!-- footer -->
		<%@include file="../footer/footer.jsp"%>
	</div>
</body>
</html>