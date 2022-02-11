<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="https://code.jquery.com/jquery-1.12.4.js"></script>
<script type="text/javascript">
function find_pwd(m_name,m_id,m_tel){
	
	location.href = "find_pwd.do?m_name=" + m_name"&m_id=" + m_id"&m_tel=" + m_tel;
}
</script>
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
						<li><a href="${ pageContext.request.contextPath }/member/find_pwd.do?m_name=${ user.m_name }&m_id=${ user.m_id }&m_tel=${ user.m_tel }&m_idx=${ user.m_idx }">비밀번호 변경</a></li>
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