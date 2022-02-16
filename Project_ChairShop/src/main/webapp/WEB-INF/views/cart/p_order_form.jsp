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
<link rel="stylesheet" href="${ pageContext.request.contextPath }/resources/css/p_order_form.css">
<!-- 다음 우편번호검색 API -->
<script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>

<script type="text/javascript">
	
	
	//숫자 제약조건
	var regular_number = /^[0-9]{1,6}$/;
	//전화번호 제약조건 
	var regular_tel = /^(01[016789]{1})-[0-9]{3,4}-[0-9]{4}$/;
	
	
	function show_table(){
		
		if(	$("#standard_radio").is(":checked")){
			$(".first_table").css("display","block");
			
	
		}
		
		
	}
	//-----------------------------------------------------------------------------------------------------
	$(document).ready(function(){
		
		show_table();
		
		$("#standard_radio").click(function(){
			var member=$('input:radio[name=member]:checked').val();
			$("#receiver").val('${user.m_name}');
			$("#zipcode").val('${user.m_zipcode_str}');
			$("#addr").val('${user.m_addr}');
			$("#tel").val('${user.m_tel}');
			
		});
		
		$("#new_radio").click(function(){
				$('.first').val("");
			
		});
		
		$("#new_radio").click(function(){
			$("#find").prop("type","button");
 		});
		
		$("#standard_radio").click(function(){
			$("#find").prop("type","hidden");
 		});
	});

	//-----------------------------------------------------------------------------------------------------
	
		
 	$(document).ready(function(){
 		
	});


	function find_addr(){
	   
	   var width  = 500; //팝업의 너비
	   var height = 600; //팝업의 높이
	   
	   new daum.Postcode({
		    width: width, //생성자에 크기 값을 명시적으로 지정해야 합니다.
		    height: height,
	        oncomplete: function(data) {
	            // 팝업에서 검색결과 항목을 클릭했을때 실행할 코드를 작성하는 부분입니다.
	            // data = {"zonecode":13494, "address":"서울시 관악구..." , "roadAddress":"서울시 관악구 ..." , "jibunAddress","서울시 관악구"}
	            //선택주소의 우편번호와 주소를 넣어준다
	            $("#zipcode").val(data.zonecode);
	            $("#addr").val(data.address);
	            
	        }
	    }).open({
	    	 //화면정중앙에 띄워라
	    	 left: (window.screen.width / 2) - (width / 2),
	    	 top: (window.screen.height / 2) - (height / 2)
	    	
	    });
	}	
	//-----------------------------------------------------------------------------------------------------
	
	function p_order_set(f) {
		
		var receiver = f.receiver.value.trim();
		var zipcode = f.zipcode.value;
		var addr = f.addr.value.trim();
		var tel = f.tel.value.trim();
		
		
		if(receiver==''){
			alert('수취인을 입력하세요');
			f.receiver.value='';
			f.receiver.focus();
			return;
		}
		
		if(zipcode==''){
			alert('우편번호를 입력하세요');
			f.zipcode.value='';
			f.zipcode.focus();
			return;
		}
		
		if(addr==''){
			alert('주소를 입력하세요');
			f.addr.value='';
			f.addr.focus();
			return;
		}
		if(tel==''){
			alert('전화번호를 입력하세요');
			f.tel.value='';
			f.tel.focus();
			return;
		}
		
		f.action = 'p_order_set.do';
		f.submit();
		
	}

	
	
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
			<h1>주문서작성</h1> 
			<ul>
				<li>01. 장바구니</li>
				<li>></li>
				<li>02. 주문서작성</li>
				<li>></li>
				<li>03. 주문완료</li>
			</ul>
		</div>
		
		<form>
			<input type="hidden" name="m_idx" value="${ user.m_idx }">
			<div class="product_cart_list">
				<!-- 통화단위 설정 : 지역설정 -->
				<fmt:setLocale value="ko_kr"/>
				<!-- 배송받는 분, 배송지, 배송받는 분의 전화번호, 상품명, 상품 수량,  -->
				<div class="box">
					<input type="radio" id="standard_radio" name="member" value="기존회원정보" checked="checked"><span>기존회원정보</span>
					<input type="radio" id="new_radio"      name="member" value="새로운배송정보"><span>새로운배송정보</span>
				</div>
				
				<div  class="first_table">
					<table class="standard">
						<tr>
							<th>받으시는 분</th>
							<td><input class="first" id="receiver" name="receiver" value="${ user.m_name }"></td>
						</tr>
						<tr>
							<th>우편번호</th>
							<td><input class="first" id="zipcode" name="zipcode" value="${ user.m_zipcode_str }">
							
								<input type="hidden" id="find" value="우편번호찾기" onclick="find_addr();">
							</td>
						</tr>
						<tr>
							<th>배송주소</th>
							<td><input class="first" id="addr" name="addr" value="${ user.m_addr }"></td>
						</tr>
						<tr>
							<th>전화번호</th>
							<td><input class="first" id="tel" name="tel" value="${ user.m_tel }"></td>
						</tr>
						
						
					</table>
				</div>
				
				<!-- <div class="second_table">
				<table class="new">
					<tr>
						<th>받으시는 분</th>
						<td><input class="second" name="receiver" type="text" value="" disabled="disabled"></td>
					</tr>
					<tr>
						<th>우편번호</th>
						<td><input class="second" name="zipcode" value="" disabled="disabled"></td>
					</tr>
					<tr>
						<th>배송주소</th>
						<td><input class="second" name="addr" type="text" value="" disabled="disabled"></td>
					</tr>
					<tr>
						<th>전화번호</th>
						<td><input class="second" name="tel" type="text" value="" disabled="disabled"></td>
					</tr>
				</table>
				</div> -->
				
				
					<div class="product_cart_list">
						<ul>
							<li>상품정보</li>
							<li>수량</li>
							<li>주문금액</li>
						</ul> 
						<c:forEach var="vo" items="${ list }">
							<ul>
								<li class="p_info"><img src="${ pageContext.request.contextPath }/resources/image/${ vo.p_img }"><span>${ vo.p_name }</span></li>
								<li class="p_count">${ vo.c_cnt }</li>
								<li class="o_price"><fmt:formatNumber type="currency" value="${ vo.c_cnt*vo.p_price }"/></li>
							</ul>
						</c:forEach>
					</div>
			</div>
		
		

		


		<!-- 위에 주문한 상품 표시하기 -->
		
		
		<div class="product_total_price">
		<h3>※   <fmt:formatNumber type="currency" value="100000"/>원 이상 구매시 배송비 무료</h3>
			<c:if test="${ empty list }">
				<ul>
					<li>
						총 상품금액
						<p><fmt:formatNumber type="currency" value="${ total_amount }"/></p>	<!-- 수정 필요 -->
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
							<fmt:formatNumber type="currency" value="${ total_amount }"/> <!-- 수정 필요 -->
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
				<li><!-- <a href="#" class="p_order" onclick="p_order_set(this.form);">상품주문</a> -->
				    <input type="button" class="p_order" onclick="p_order_set(this.form);" value="상품주문">
				</li>
			</ul>
		</div>
	</form>	
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