<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c"  uri="http://java.sun.com/jsp/jstl/core"%>
    <%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
    <%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="https://code.jquery.com/jquery-1.12.4.js"></script>
<link rel="stylesheet" href="${ pageContext.request.contextPath }/resources/css/cart_list_content.css">
<script type="text/javascript">
	
	
	//숫자제약조건
	var regular_number = /^[0-9]{1,6}$/;
	
	
	//수량 변경
	function cart_update(c_idx){
	
		var c_cnt =$(".c_cnt_"+c_idx).val();
		
		if(regular_number.test(c_cnt)==false){
			alert('1~6자리 숫자만 입력하세요');
			$(".c_cnt_"+c_idx).val("");
			$(".c_cnt_"+c_idx).focus();
			return;
		}
		
		location.href = "cart_update.do?c_idx=" + c_idx + "&c_cnt=" + c_cnt ;
		
	}
	
	
	
	 
	//선택상품 삭제
	function cart_delete(f) {
		
		if($("input:checkbox[name=c_idx]:checked").length==0){
			alert('삭제할 항목을 선택하세요');
			return;
		};
		
		f.action="cart_delete.do"; 
		f.submit();
		
	}
	
	//-----------------------------------------------------------------------------------------------------
	$(document).ready(function(){
		$('.check_all').click(function(){
			var checked = $(this).is(":checked");
			
			if(checked){
				$("input:checkbox[name='c_idx']").prop('checked',true);
			}else{
				$("input:checkbox[name='c_idx']").prop('checked',false);
			}
		});
		$("input:checkbox[name='c_idx']").click(function(){

			if($("input:checkbox[name='c_idx']").length == $("input:checkbox[name='c_idx']:checked").length) 
				$(".check_all").prop("checked", true);
			else $(".check_all").prop("checked", false); 
		});

	});
	//-----------------------------------------------------------------------------------------------------
</script>
</head>
<body>
<div class="wrap"> 
	<!-- header -->
	<%@include file="../header/header.jsp" %>
	<!-- contents -->
<section class="content">
	<div class="content_f">
		<div class="top_text">
			<h1>장바구니</h1> 
			<ul>
				<li>01. 장바구니</li>
				<li>></li>
				<li>02. 주문서작성</li>
				<li>></li>
				<li>03. 주문완료</li>
			</ul>
		</div>
		
		<form>
			<div class="product_cart_list">
				<ul>
					<li><input type="checkbox" class="check_all"></li>
					<li>상품정보</li>
					<li>수량</li>
					<li>주문금액</li>
				</ul> 
				<c:if test="${ empty list }">
					<p>장바구니가 비었습니다.</p>
				</c:if>
				<!-- 통화단위 설정 : 지역설정 -->
				<fmt:setLocale value="ko_kr"/>
				
				<c:forEach var="vo" items="${ list }">
				
					<ul>
						<li class="box">
								<input type="checkbox" name="c_idx"  value="${ vo.c_idx }"> 
						</li>
						<li class="p_info"><img src="${ pageContext.request.contextPath }/resources/image/${ vo.p_img }"><span>${ vo.p_name }</span></li>
						<li class="p_count">
								<input type="text" id="c_cnt" class="c_cnt_${ vo.c_idx }" value="${ vo.c_cnt }">
								<input class="correct" type="button" value="수정" onclick="cart_update('${ vo.c_idx }');">
						</li>
						<li class="o_price"><fmt:formatNumber type="currency" value="${ vo.c_cnt*vo.p_price }"/></li>
					</ul>
				</c:forEach>
				
				
			</div>
			<input class="p_delete" type="button" value="선택상품삭제" onclick="cart_delete(this.form);">
			
		</form>
		

		

		<div class="product_total_price">
		<h3>※   <fmt:formatNumber type="currency" value="100000"/>원 이상 구매시 배송비 무료</h3>
			<c:if test="${ empty list }">
				<ul>
					<li>
						총 상품금액
						<p><fmt:formatNumber type="currency" value="${ total_amount }"/></p>	
					</li>
					<li class="plus">+</li>
					<li>
						배송비
						<p><fmt:formatNumber type="currency" value="0"/></p>
					</li>
					<li class="minus">-</li>
					<li>
						할인금액
						<p>0</p>
					</li>
					<li class="result">=</li>
					<li>
						결제예정금액
						<p>
							<fmt:formatNumber type="currency" value="${ total_amount }"/>
						</p>
						
					</li>	
				</ul>
			</c:if>
			
			<c:if test="${ not empty list }">
				<ul>
					<li>
						총 상품금액
						<p><fmt:formatNumber type="currency" value="${ total_amount }"/></p>	
					</li>
					<li class="plus">+</li>
					<li>
						배송비
						<p>
							<c:if test="${ total_amount>=100000 }">
								<fmt:formatNumber type="currency" value="0"/>
						   </c:if>	
						   <c:if test="${ total_amount<100000 }">
								<fmt:formatNumber type="currency" value="2500"/>
						   </c:if>						
						</p>
					</li>
					<li class="minus">-</li>
					<li>
						할인금액
						<p>0</p>
					</li>
					<li class="result">=</li>
					<li>
						결제예정금액
						<p>
							<c:if test="${ total_amount>=100000 }">
								<fmt:formatNumber type="currency" value="${ total_amount }"/>
						    </c:if>	
						     <c:if test="${ total_amount<100000 }">
								<fmt:formatNumber type="currency" value="${ total_amount+2500 }"/>
						    </c:if>
							
						</p>
						
					</li>	
				</ul>
			</c:if>
			
		</div>
		<div class="add_cart">
			<ul>
				<li><a href="#">상품주문</a></li>
			</ul>
		</div>
		
		<div class="cart_use_info">
			<p>장바구니 이용안내</p>
			<ul>
				<li>해외배송 상품과 국내배송 상품은 함께 결제하실 수 없으니 장바구니 별로 따로 결제해 주시기 바랍니다.</li>
				<li>해외배송 가능 상품의 경우 국내배송 장바구니에 담았다가 해외배송 장바구니로 이동하여 결제하실 수 있습니다.</li>
				<li>선택하신 상품의 수량을 변경하시려면 수량변경 후 [변경] 버튼을 누르시면 됩니다.</li>
				<li>[쇼핑계속하기] 버튼을 누르시면 쇼핑을 계속 하실 수 있습니다.</li>
				<li>장바구니와 관심상품을 이용하여 원하시는 상품만 주문하거나 관심상품으로 등록하실 수 있습니다.</li>
				<li>파일첨부 옵션은 동일상품을 장바구니에 추가할 경우 마지막에 업로드 한 파일로 교체됩니다.</li>
			</ul>
		</div>
		<div class="cart_discount_info">
			<p>무이자할부 이용안내</p>
			<ul>
				<li>상품별 무이자할부 혜택을 받으시려면 무이자할부 상품만 선택하여 [주문하기] 버튼을 눌러 주문/결제 하시면 됩니다.</li>
				<li>[전체 상품 주문] 버튼을 누르시면 장바구니의 구분없이 선택된 모든 상품에 대한 주문/결제가 이루어집니다.</li>
				<li>단, 전체 상품을 주문/결제하실 경우, 상품별 무이자할부 혜택을 받으실 수 없습니다.</li>
			</ul>
		</div>
	</div>
</section>
	<!-- footer -->
	<%@include file="../footer/footer.jsp" %>
</div>
</body>
</html>