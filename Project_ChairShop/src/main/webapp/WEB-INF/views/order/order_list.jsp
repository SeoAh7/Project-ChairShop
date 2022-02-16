<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style type="text/css">
	div.order_confirm{
		width: 1000px;
		min-height: 600px;
		margin: auto;
		margin-top: 250px; 
		box-sizing: border-box;
		position: relative;
	}
	
	div.list_info{
		width: 100%;
	}
	div.list_info>ul{
		margin-top : 70px;
		border-top : 3px solid #ddd;
		border-bottom: 3px solid #ddd;
		padding : 10px 0 10px 0;
		display: flex;
		flex-direction: row;
		justify-content: center;
	}
	div.list_info>ul>li{
		text-align: center;
	}
	div.list_info>ul>li:nth-child(1) {
		width: 10%;
	}
	div.list_info>ul>li:nth-child(2) {
		width: 10%;
	}
	div.list_info>ul>li:nth-child(3) {
		width: 10%;
	}
	div.list_info>ul>li:nth-child(4) {
		width: 40%;
	}
	div.list_info>ul>li:nth-child(5) {
		width: 10%;
	}
	div.list_info>ul>li:nth-child(6) {
		width: 10%;
	}
	div.list_info>ul>li:nth-child(7) {
		width: 10%;
	}
	div.list{
		width: 100%;
	}
	div.list>ul{
		border-bottom: 1px solid #ddd;
		padding : 10px 0 10px 0;
		display: flex;
		flex-direction: row;
		justify-content: center;
	}
	div.list>ul>li{
		text-align: center;
	}
	div.list>ul>li:nth-child(1) {
		width: 10%;
	}
	div.list>ul>li:nth-child(2) {
		width: 10%;
	}
	div.list>ul>li:nth-child(3) {
		width: 10%;
	}
	div.list>ul>li:nth-child(4) {
		width: 40%;
	}
	div.list>ul>li:nth-child(5) {
		width: 10%;
	}
	div.list>ul>li:nth-child(6) {
		width: 10%;
	}
	div.list>ul>li:nth-child(7) {
		width: 10%;
	}
	
</style>

<script type="text/javascript">

	function order_success(o_idx){
		
		if(confirm("주문접수 하시겠습니까?")==false)return;
		
		location.href="order_success.do?o_idx=" + o_idx;
	}
	

</script>
</head>
<body>
<div class="wrap">
		<!-- header -->
		<%@include file="../header/header.jsp" %>
		
		<!-- contents -->
		<div class="order_confirm">
		<h1>주문접수</h1>
			<div class="list_info">
				<ul>
					<li>번호</li>
					<li>회원ID</li>
					<li>제품번호</li>
					<li>제품명</li>
					<li>수량</li>
					<li>재고수량</li>
					<li>주문접수</li>
				</ul>
			</div>
			<div class="list">
				<c:forEach var="vo" items="${ list }">
				<ul>
					<li>${ vo.o_idx }</li>
					<li>${ vo.m_id }</li>
					<li>${ vo.p_idx }</li>
					<li>${ vo.p_name }</li>
					<li>${ vo.c_cnt }</li>
					<li>${ map[vo.p_name] }</li>
					<li>
						<c:if test="${ (vo.order_yn eq 'n') && ( map[vo.p_name] lt vo.c_cnt ) }">
							재고부족
						</c:if>
						<c:if test="${ (vo.order_yn eq 'n') && ( map[vo.p_name] ge vo.c_cnt ) }">
							<input type="button" value="주문접수" onclick="order_success(${ vo.o_idx });">
						</c:if>
						<c:if test="${ vo.order_yn eq 'y' }">
							접수완료
						</c:if>
						
						
					</li>		
				</ul>
				</c:forEach>
			</div>						
		</div>
		
		<!-- footer -->
		<%@include file="../footer/footer.jsp" %>	
</div>
</body>
</html>