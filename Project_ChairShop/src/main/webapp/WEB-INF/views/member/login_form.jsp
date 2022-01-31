<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>    
    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script type="text/javascript">

	$(document).ready(function(){
		 
		  setTimeout(show_message,100);
		  
	});
	
	
	function show_message(){
		  // /member/login_form.do?reason=fail_id
	
	    if("${ param.reason eq 'fail_id'}"=="true"){
	  	  
	  	  alert('아이디가 틀렸습니다');
	  	  
	    }	
		  
	    // /member/login_form.do?reason=fail_pwd
		  if("${ param.reason eq 'fail_pwd'}"=="true"){
	  	  
	  	  alert('비밀번호가 틀렸습니다');
	  	  
	    }	
		  
	}

	function send(f) {
		var m_id = f.m_id.value;
		var m_pwd = f.m_pwd.value;
		
		if(m_id == ''){
			alert('아이디를 입력하세요');
			f.m_id.value = '';
			f.m_id.focus();
			return;
		}
		if(m_pwd == ''){
			alert('비밀번호를 입력하세요');
			f.m_pwd.value = '';
			f.m_pwd.focus();
			return;
		}
		
		f.action = 'login.do';
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
	/* top_menu */
	section.top_menu{
		position: relative;
		width: 100%;
		height: 40px;
		background: #ccc;
	}
	div.top_menu_f{
		margin : auto;
		width: 1200px;
	}
	div.top_menu_f>ul{
		display: flex;
		flex-direction: row;
		justify-content: flex-end;
	}
	div.top_menu_f>ul>li{
		margin-left : 20px;
		height: 40px;
		line-height: 40px;
	}
	div.top_menu_f>ul>li>a{
		display: block;
		color: #000;
	}
	
	/* header */
	header.header{
		position: relative;
		width: 100%;
		height: 120px;
		background: #fff;
		border-bottom: 1px solid #ccc;
	}
	div.header_f{
		margin : auto;
		width: 1200px;
		height: 120px;
		background: #fff;
		display: flex;
		flex-direction: row;
	}
	div.header_left{
		position: relative;
		width : 20%;
	}
	
	div.header_left>a>img{
		width: 150px;
		margin-top: 30px;
	}
	div.header_center{
		position: relative;
		width: 60%;
		height: 120px;
    	line-height: 120px;
	} 
	div.header_center>ul{
		display: flex;
		flex-direction: row;
		justify-content: center;
	}
	div.header_center>ul>li{
		font-size : 19px;
		width: 150px;
	}
	div.header_center>ul>li>a{
		color: #000;
		display: block;
	}
	
	div.header_right{
		width: 20%;
		text-align: right;
	}
	div.header_right>input{
		width: 220px;
		height : 35px;
		line-height : 35px;
		font-size : 16px;
		margin-top: 43px;
		border-radius: 10px;
		border : 1px solid #ccc;
		text-indent: 15px;
	}
	
	/* contents */
	section.content{
		position: relative;
		width: 100%;
		height: 600px;
		background: #fff;
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
	div.login_f>input.login_id{
		text-indent: 10px;
	}
	div.login_f>input.login_pwd{
		text-indent: 10px;
	}
	
	div.login_f>input.login_b{
		margin: 50px 0 30px 0;
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
	
	/* footer */
	section.footer{
		position: relative;
		width: 100%;
		height: 270px;
		background: #222;
	}
	div.footer_f{
		margin : auto;
		width: 1200px;
		height: 270px;
		background: #222;
	}
	div.foot_info>ul{
		display: flex;
		flex-direction: row;
	}
	div.foot_info>ul.info_1{
		padding-top: 30px;
	}
	
	div.foot_info>ul.info_1>li{
		font-size: 15px;
		color: #fff;
		margin-right: 15px;
		border-right: 1px solid #fff;
	}
	div.foot_info>ul.info_1>li>a{
		color: #fff;
		padding: 0 10px 10px 0;
	}
	div.foot_info>ul.info_1>li:last-child {
		border: none;
	}
	div.foot_info>ul.info_2{
		padding: 20px 0 20px 0;
	}
	div.foot_info>ul.info_2>li{
		font-size: 14px;
		color: #ccc;
		margin-right: 15px;
	}
	div.foot_info2>a{
		font-size: 14px;
		color: #5aadd5;	
	}
	div.foot_info2>ul.info_3>li{
		font-size: 14px;
		color: #ccc;
		margin-top: 15px;
	}
</style>
</head>
<div class="wrap">
		<section class="top_menu">
			<div class="top_menu_f">
				<ul>
					<li><a href="login_form.do">로그인</a></li>
					<li><a href="register_form.do">회원가입</a></li>
					<li><a href="#" onclick="order_check();">주문조회</a></li>
					<li><a href="#" onclick="cart_list();">장바구니</a></li>
				</ul>
			</div>
		</section>
		<!-- header -->
		<header class="header">
			<div class="header_f">
				<div class="header_left">
					<a href="../">
						<img src="../resources/image/logo.png">
					</a>
				</div>
				<div class="header_center">
					<ul>
						<li><a href="#">Company</a></li>
						<li><a href="#">Product</a></li>
						<li><a href="#">Community</a></li>
						<li><a href="#">Customer Center</a></li>
					</ul>
				</div>
				<div class="header_right">
					<input type="text">
				</div>
			</div>
		</header>
		
		<!-- contents -->
		<section class="content">
			<div class="content_f">
			<form>
				<div class="login_f">
					<h2>회원 로그인</h2>
					<input class="login_id" name="m_id" type="text" placeholder="아이디" onblur="placeholder='아이디'" onfocus="placeholder=''">
					<input class="login_pwd" name="m_pwd" type="password" placeholder="비밀번호" onblur="placeholder='비밀번호'" onfocus="placeholder=''">
					<input class="login_b" type="button" value="로그인" onclick="send(this.form);">
					<div class="find_user">
						<ul>
							<li><a href="#">아이디 찾기</a></li>
							<li><a href="#">비밀번호 찾기</a></li>
							<li><a href="${ pageContext.request.contextPath }/register_form.do">회원가입</a></li>
						</ul>
					</div>
				</div>
			</form>
			</div>
		</section>
		
		<!-- footer -->
		<section class="footer">
			<div class="footer_f">
				<div class="foot_info">
					<ul class="info_1">
						<li><a href="../">홈</a></li>
						<li><a href="#">회사소개</a></li>
						<li><a href="#">약관등록</a></li>
						<li><a href="#">개인정보처리방침</a></li>
						<li><a href="#">이용안내</a></li>
					</ul>
					<ul class="info_2">
						<li>법인명(상호): 주식회사 체어샵</li>
						<li>대표자(성명): 서상아,정인혁,김치형,박재정,정원철</li>
						<li>사업자 등록번호 안내 : [111-11-11111]</li>
						<li>통신판매업 신고 제 2022-인크레파스-class3</li>
					</ul>
				</div>
				<div class="foot_info2">
					<a href="#">[사업자정보 확인]</a>
					<ul class="info_3">
						<li>전화 : 02-123-4567&nbsp;&nbsp;팩스 : 02-869-1080&nbsp;&nbsp;통신판매업 신주소 : 서울특별시 관악구 시흥대로 552 석천빌딩 7F</li>
						<li>개인정보보호책임자 : 정인혁(wol01137@naver.com)</li>
						<li>Copyright @ 2022 체어샵.All rights reserved</li>
					</ul>
				</div>
			</div>
		</section>
		
	</div>
</body>
</html>