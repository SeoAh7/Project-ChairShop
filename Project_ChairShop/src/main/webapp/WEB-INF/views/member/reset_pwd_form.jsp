<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>    
    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script type="text/javascript">

	var regular_pwd = /^(?=.*[a-z])(?=.*[0-9]).{4,16}$/;
	
	$(document).ready(function(){
 		if('${ empty param.m_idx}'=='true'){
			if(confirm('입력하신 아이디를 찾았습니다\r비밀번호를 변경하시겠습니까?')==false){
				location.href = '${ pageContext.request.contextPath }/member/login_form.do';
				return;
			}
 		}
		
		$('#m_pwd').keyup(function(event){
			   
			   var m_pwd = $(this).val();

				if(regular_pwd.test(m_pwd)==false){
				   
				   $("#m_pwd_message").html('&nbsp;유효하지 않음').css({
					   														"font-size":"15px",
					   														"color":"red"
				   });
				   
			    }
				else{
				   
				   $("#m_pwd_message").html('&nbsp;유효한 비밀번호').css({
							"font-size":"15px",
								"color":"blue"
					});

			    }
		   });
		   
			$('#check_pwd').keyup(function(event){
				
				var check_pwd = $(this).val();
				var m_pwd = document.getElementById('m_pwd').value;
				
				$.ajax({
					
					url : 'check_pwd.do',
					data : {'m_pwd': m_pwd, 'check_pwd': check_pwd},
					success : function(result_data){
						if(result_data.result){
							$("#check_pwd_message").html('&nbsp;일치').css({"color":"blue"});
							
							//등록버튼을 가능하도록 설정
							$("#reset_pwd_btn").attr("disabled", false);
						}
						else
							$("#check_pwd_message").html('&nbsp;불일치').css({"color":"red"});
					},
					error : function(err){
						alert(err.responseText);
					}
				});   
			   
		   });//keyup
		   
		
	});
	
	function reset_pwd(f) {

		var m_pwd = f.m_pwd.value;
		var m_idx = f.m_idx.value;
		
		f.action = 'reset_pwd.do';
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

	/* contents */
	section.content{
		position: relative;
		width: 100%;
		height: 600px;
		background: #fff;
		padding-top: 170px !important; 
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
					<h2>비밀번호 변경</h2>
					<input type="hidden" name="m_idx" value="${ find_vo.m_idx }">
					<table>
					<tr>
							<th>비밀번호</th> 
							<td >
								<input style="width: 240px; height: 30px;" id="m_pwd" name="m_pwd" type="password" placeholder="영문 소문자/숫자 조합,4자~16자">
							</td>
							<td>	
								<span id="m_pwd_message"></span>
							</td>
					</tr>
					<tr>		
							<th>비밀번호 확인</th>
							<td>
								<input style="width: 240px; height: 30px;" id="check_pwd" type="password" placeholder="비밀번호와 동일하게 입력하세요">
							</td>
							<td>	
								<span id="check_pwd_message"></span>
							</td>
					</tr>		
					</table>		
					<div>
						<input id="reset_pwd_btn" class="find"  type="button" value="비밀번호 변경" onclick="reset_pwd(this.form);" disabled="disabled">
						<input class="find"  type="button" value="돌아가기" onclick="location.href='${ pageContext.request.contextPath }/product/p_order_list.do'">
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