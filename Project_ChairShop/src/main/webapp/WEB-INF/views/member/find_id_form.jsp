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

	var regular_tel = /^01([0|1|6|7|8|9])-?([0-9]{3,4})-?([0-9]{4})$/;
	$(document).ready(function(){
		
		$('#find_id').click(function(){
			
	
			var m_name = document.getElementById('m_name').value;
			var m_tel = document.getElementById('m_tel').value;
				
				if(m_name==''){
					alert('이름을 입력해 주세요');
					m_name.value='';
					document.getElementById('m_name').focus();
					return;
				}
				
				if(m_tel==''){
					alert('전화번호를 입력해 주세요');
					m_tel.value='';
					document.getElementById('m_tel').focus();
					return;
				}
				
			
			$.ajax({
				
				url : 'find_id.do',
				data : {"m_name":m_name, "m_tel":m_tel},
				dataType: "json",
				success : function(result_data){
					if(result_data.result){
						$('#find_id_disp').html('찾으시려는 아이디 : ' + result_data.find_id).css('color','black');
					}else{
						$('#find_id_disp').html('찾으시려는 아이디가 없습니다').css('color','red');
					}
					
				},
				error : function(err){
					alert(err.responseText);
				}
				
			});
			
		});
	
	});
	
</script>

<style type="text/css">

	
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
	div.login_f>input.find_id{
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
			<div class="content_f">
				<div class="login_f">
					<h2>아이디 찾기</h2>
					<input class="find_id" name="m_name" id="m_name" type="text" placeholder="찾으시려는 분의 이름을 입력해 주세요" onfocus="placeholder=''">
					<input class="find_id" name="m_tel" id="m_tel" type="text"placeholder="찾으시려는 분의 '-'를 포함한 전화번호를 입력해 주세요" onfocus="placeholder=''">
					<div id="find_id_disp">
					</div>
					<div>
						<input class="find" id="find_id" type="button" value="아이디 찾기">
						<input class="find" type="button" value="돌아가기" onclick="location.href='${ pageContext.request.contextPath }/member/login_form.do'">
					</div>
				</div>
			</div>
		</section>
		

		<!-- footer -->
		<%@include file="../footer/footer.jsp" %>
		
	</div>
</body>
</html>