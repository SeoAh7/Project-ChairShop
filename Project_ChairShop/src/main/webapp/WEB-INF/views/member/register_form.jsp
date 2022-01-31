<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>    
    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>

<!-- 다음우편번호 검색 API -->
<script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>

<script type="text/javascript">

	var regular_id = /^[a-z0-9]{4,16}$/;
	var regular_pwd = /^(?=.*[a-z])(?=.*[0-9]).{4,16}$/;
	var regular_mail = /^[0-9a-zA-Z]([-_.]?[0-9a-zA-Z])*@[0-9a-zA-Z]([-_.]?[0-9a-zA-Z])*.[a-zA-Z]{2,3}$/i;
	var regular_tel = /^(01[016789]{1})-[0-9]{3,4}-[0-9]{4}$/;
	
//현재html문서가 배치완료되면
$(document).ready(function(){
	   
	   $(".id").keyup(function(event){
		   
		   var m_id = $(this).val();
		   console.log(m_id);
		   
		   if(regular_id.test(m_id)==false){
			   $("#m_id_message").html("&nbsp;&nbsp;사용불가능한 아이디입니다").css("color","red");
			   //등록버튼을 불가능하도록 설정
			   $(".join").attr("disabled", true);
			   return;
		   }
		   
		   //$("#m_id_message").html("");//메시지 지우기
		   
		   //ajax를 이용해서 m_id를 서버로 전송해서 사용가능여부 체크
		   $.ajax({
			   url		: 'check_id.do',		//MemberCheckIdAction
			   data 	: {'m_id': m_id},       //parameter   =>  check_id.do?m_id=hong 요청
			   dataType	: 'json',				//서버로부터 받을 데이터 타입		   
			   success	: function(result_data){
				   // result_data = {"result" : true }  <--사용가능한경우
				   // result_data = {"result" : false}  <--사용불가능한경우(이미사용중...)
				   
				   if(result_data.result){
					   //사용가능한 경우
					   $("#m_id_message").html("&nbsp;&nbsp;사용가능한 아이디 입니다").css("color","blue");
					   
					   //등록버튼을 사용가능하도록 설정
					   $(".join").attr("disabled", false);
					   
				   }else{
					   //사용불가능한 경우
					   $("#m_id_message").html("&nbsp;&nbsp;이미 사용중인 아이디 입니다").css("color","red");
					   
					   //등록버튼을 불가능하도록 설정
					   $(".join").attr("disabled", true);
				   }
			   },  
			   error	: function(err){
				   alert(err.responseText);
			   }
		   });
	   });
	   
	   
	   $('#check_pwd').keyup(function(event){
		   
		   var check_pwd = $(this).val();
		   var m_pwd = document.getElementById('m_pwd').value;
		   
		   
		   if(check_pwd == m_pwd){
			   $("#check_pwd_message").html('&nbsp;&nbsp;&nbsp;일치').css("color","blue");
			   $(".join").attr("disabled", false);
		   }else{
			   $("#check_pwd_message").html('&nbsp;&nbsp;&nbsp;&nbsp;불일치').css("color","red");
			   $(".join").attr("disabled", true);
		   }
		   
		   
		   
	   });
	   
	   $('#m_pwd').keyup(function(event){
		   
		   var m_pwd = $(this).val();

			if(regular_pwd.test(m_pwd)==false){
			   
			   $("#m_pwd_message").html('&nbsp;유효하지 않음').css({
				   														"font-size":"12px",
				   														"color":"red"
			   });
			   $(".join").attr("disabled", true);
			   
		    }
			else{
			   
			   $("#m_pwd_message").html('&nbsp;유효한 비밀번호').css({
						"font-size":"12px",
							"color":"blue"
				});
			   $(".join").attr("disabled", false);
			   
		    }
		   
		   
		   
	   });
});

	//주소찾기 함수
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
	            $("#m_zipcode").val(data.zonecode);
	            $("#m_addr").val(data.address);
	            
	        }
	    }).open({
	    	 //화면정중앙에 띄워라
	    	 left: (window.screen.width / 2) - (width / 2),
	    	 top: (window.screen.height / 2) - (height / 2)
	    	
	    });
	}
	
	function insert(f) {
		
		var m_name = f.m_name.value;
		var m_mail = f.m_mail.value;
		var m_tel = f.m_tel.value;
		var m_zipcode = f.m_zipcode.value;
		var m_addr = f.m_addr.value;
		
		if(m_name==''){
			alert('이름을 입력하세요');
			f.m_name.value='';
			f.m_name.focus();
			return;
		}
		
		if(regular_mail.test(m_mail)==false){
			alert('메일을 확인해주세요');
			f.m_mail.value='';
			f.m_mail.focus();
			return;
		}
		
		if(regular_tel.test(m_tel)==false){
			alert('전화번호를 확인해주세요');
			f.m_tel.value='';
			f.m_tel.focus();
			return;
		}
		
		if(m_zipcode==''){
			alert('우편번호를 입력하세요');
			f.m_zipcode.value='';
			f.m_zipcode.focus();
			return;
		}
		if(m_addr==''){
			alert('주소를 입력하세요');
			f.m_addr.value='';
			f.m_addr.focus();
			return;
		}
		
		f.action='insert.do';
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
		background: #fff;
	}
	div.content_f{
		position: relative;
		margin : auto;	
		width: 700px;
		background: #fff;
	}
	
	div.content_f>h1{
		padding : 100px 0 100px 0; 
		font-size: 30px;
	}
	div.user_form>h2{
		color : #444;
		font-size: 20px;
		padding-bottom: 20px;
		border-bottom: 3px solid #444;
	}
	div.user_form>ul{
		width : 100%;
		padding-top: 20px;
	}
	div.user_form>ul>li{
		width: 100%;
		height: 60px;
		line-height : 60px;
		font-weight: bold;
		display: flex;
		padding-bottom: 20px; 
	}
	
	div.user_form>ul>li>span.head{
		width: 20%;
	}
	div.user_form>ul>li>input{
		float : right;
		width: 80%;
		height: 60px;
		border: 1px solid #ccc;
		font-size: 15px;
		text-indent: 15px;
	}
	div.user_form>ul>li>input.id{
		width: 40%;
	}
	
	div.y_n{
		padding : 100px 0 100px 0;
		width: 100%;
		display: flex;
		justify-content: space-between;
	}
	div.y_n>input{
		width: 47.5%;
		height: 50px;
	}
	div.y_n>input.cancel{
		background: #fff;
		color: #5aadd5;
		border: 2px solid #5aadd5;
		cursor: pointer;
	}
	
	div.y_n>input.join{
		background: #5aadd5;
		color: #fff;
		border: 2px solid #5aadd5;
		cursor: pointer;
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
<body>
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
		<form>
			<div class="content_f">
				<h1>회원가입</h1>
				<div class="user_form">
					<h2>기본정보</h2>
					<ul>
						<li><span class="head">이름</span><input name="m_name" type="text"></li>
						<li><span class="head">아이디</span> <input name="m_id" type="text" class="id" placeholder="영문소문자/숫자,4~16자">
							<span id="m_id_message"></span>
						</li>
						<li><span class="head">비밀번호</span> <input style="width: 65%;" id="m_pwd" name="m_pwd" type="password" placeholder="영문 소문자/숫자 조합,4자~16자">
							<span id="m_pwd_message"></span>
						</li>
						<li><span class="head">비밀번호확인</span> <input style="width: 65%;" id="check_pwd" type="password">
							<span id="check_pwd_message"></span>
						</li>
						<li><span class="head">이메일</span> <input name="m_mail" type="text"></li>
						<li><span class="head">휴대전화</span> <input name="m_tel" type="text"></li>
						<li><span class="head">우편번호</span> <input style="width: 35%;" type="text" name="m_zipcode" id="m_zipcode">
							<div><input style="width: 100px; height: 62px;" type="button"  value="주소찾기"  onclick="find_addr();"></div>
						</li>						
						<li><span class="head">주소</span> <input type="text" name="m_addr" id="m_addr"></li>						
					</ul>
				</div>
				
				<div class="y_n">
					<input type="button" class="cancel" value="취소하기" onclick="location.href='../'">
					<input type="button" class="join" value="가입하기" onclick="insert(this.form);" disabled="disabled">
				</div>
			</div>
			</form>
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