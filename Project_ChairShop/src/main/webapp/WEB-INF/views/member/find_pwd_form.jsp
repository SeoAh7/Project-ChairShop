<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>    
    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="https://code.jquery.com/jquery-1.12.4.js"></script>
<script type="text/javascript">

	$(document).ready(function(){
		
		setTimeout(show_message, 100);
		
	});
	
	function show_message(){
		
		if('${ param.reason eq "null_account" }' == 'true'){
				alert('찾으시려는 회원 정보가 존재하지 않습니다');
				return;	
		}
	}

	var regular_tel = /^01([0|1|6|7|8|9])-?([0-9]{3,4})-?([0-9]{4})$/;
	
	function find_pwd(f) {
		
		var m_name = f.m_name.value;
		var m_id   = f.m_id.value;
		var m_tel  = f.m_tel.value;
			
		if(m_name==''){
			alert('이름을 입력해 주세요');
			f.m_name.value='';
			f.m_name.focus();
			return;
		}
		
		if(m_id==''){
			alert('이름을 입력해 주세요');
			f.m_id.value='';
			f.m_id.focus();
			return;
		}
		
		if(m_tel==''){
			alert('전화번호를 입력해 주세요');
			f.m_tel.value='';
			f.m_tel.focus();
			return;
		}
		
		if(regular_tel.test(m_tel)==false){
			alert('전화번호를 확인해 주세요');
			f.m_tel.value='';
			f.m_tel.focus();
			return;
		}
		
		f.action = 'find_pwd.do';
		f.submit();
	}

	function order_check() {
		
		if('${ empty user}'=='true'){
			if(confirm('주문정보 조회는 로그인 후에 가능합니다.\r\n로그인하시겠습니까?')==false) return;
			location.href='login_form.do';
		}else{
			
			location.href='order/order_list.do';
		}
		
	}
	
	function cart_list() {
		
		if('${ empty user}'=='true'){
			if(confirm('장바구니 조회는 로그인 후에 가능합니다.\r\n로그인하시겠습니까?')==false) return;
			location.href='login_form.do';
		}else{
			
			location.href='cart/cart_list.do';
		}
		
	}
	
	
</script>

<style type="text/css">
	*{
		margin: 0;
		padding: 0;
		text-decoration: none;
		list-style: none;
	}
		
	div.wrap{
		width: 100%;
		height: auto;
	}

	
	/* contents */
	section.content{
		position: relative;
		width: 100%;
		height: 600px;
		background: #fff;
		padding-top:170px !important;
	}
	div.content_f{
		position: relative;
		margin : auto;	
		width: 1200px;
		height: 600px;
		background: #fff;
		text-align: center;
	}
	div.login_f{
		margin : auto;
		width: 500px;
		height: auto;
	}
	
	div.login_f>h2{
		padding : 100px 0 30px 0;
		font-size: 50px;
		color:  #5aadd5;
	}
	div.login_f>input{
		width: 100%;
		height: 50px;
		margin-bottom: 20px; 
	}
	div.login_f>input.reset_pwd{
		widt: 60%;
		text-indent: 10px;
	}
	
	.find{
		width: 120px;
		height: 40px;
		margin: 20px 0 30px 0;
		background: #5aadd5;
		border: none;
		font-weight : bold;
		font-size: 15px;
		color: #fff;
		cursor: pointer;
	}
	div.find_user>ul{
		display: flex;
		flex-direction: row;
		justify-content: center;
	}
	div.find_user>ul>li{
		padding: 0 10px 0 10px;
		border-right: 1px solid #000; 
		font-size: 14px;
		
	}
	
	div.find_user>ul>li:last-child{
		border: none;
	}
	div.find_user>ul>li>a{
		color: #000;
	}
	
	
</style>
</head>
<div class="wrap">
		<!-- header -->
		<%@include file="../header/header.jsp"%>
		<!-- contents -->
		<section class="content">
		<form>
			<div class="content_f">
				<div class="login_f">
					<h2>비밀번호 찾기</h2>
					<input class="reset_pwd" name="m_name" id="m_name" type="text" placeholder="찾으시려는 분의 이름을 입력해 주세요" onblur="placeholder='찾으시려는 분의 이름을 입력해 주세요'" onfocus="placeholder=''">
					<input class="reset_pwd" name="m_id"   id="m_id" type="text" placeholder="찾으시려는 분의 아이디를 입력해 주세요" onblur="placeholder='찾으시려는 분의 아이디를 입력해 주세요'" onfocus="placeholder=''">
					<input class="reset_pwd" name="m_tel" id="m_tel" type="text"placeholder="찾으시려는 분의 - 를 포함한 전화번호를 입력해 주세요" onblur="placeholder='찾으시려는 분의 - 를 포함한 전화번호를 입력해 주세요'" onfocus="placeholder=''">
					
					<div>
						<input class="find"  type="button" value="비밀번호 찾기" onclick="find_pwd(this.form);">
						<input class="find"  type="button" value="돌아가기" onclick="location.href='${ pageContext.request.contextPath }/member/login_form.do'">
					</div>
				</div>
			</div>
		</form>	
		</section>
		
		<!-- footer -->
		<%@include file="../footer/footer.jsp" %>
		
	</div>
</body>
</html>