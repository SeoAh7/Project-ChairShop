<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="https://code.jquery.com/jquery-1.12.4.js"></script>
<script type="text/javascript">

	function find_pwd(m_name,m_id,m_tel){
		
		location.href = "find_pwd.do?m_name=" + m_name + "&m_id=" + m_id + "&m_tel=" + m_tel;
	}
	
	    
	 $(document).ready(function(){
			
		setTimeout(show_message,100);
	 });
	 
	 function show_message(){
		 
		 if("${ param.reason eq 'modify_success' }"=='true')
		 {
			 alert('회원정보가 변경되었습니다.');
		 }
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
							<p>
								${ order_count_n }
							</p>			
						</li>
						<li>배송중
							<p>
								${ order_count_y }
							</p>		
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
							
								<c:forEach var="vo" items="${ list }">
									<ul>
										<li class="p_idx">${ vo.o_idx }</li>
										<li class="p_regdate">  ${ fn:substring(vo.o_date,0,10)}</li>
										<li class="p_info">${ vo.p_name }</li>
										<li class="p_count">${ vo.c_cnt }</li>
										<li class="o_price"><fmt:formatNumber type="currency" value="${ vo.p_price * vo.c_cnt }"/></li>
										<c:if test="${ vo.order_yn eq 'y' }">
											<li class="o_state" value="배송중">배송중</li>
										</c:if>
										<c:if test="${ vo.order_yn eq 'n' }">
											<li class="o_state" value="상품준비중">상품준비중</li>
										</c:if>
									
									</ul>
								</c:forEach>
							
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