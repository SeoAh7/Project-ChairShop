<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>    
    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>

<script src="https://code.jquery.com/jquery-1.12.4.js"></script>
<link rel="stylesheet" href="${ pageContext.request.contextPath }/resources/css/main.css">
<link rel="stylesheet" href="${ pageContext.request.contextPath }/resources/css/footer.css">
<link rel="stylesheet" href="${ pageContext.request.contextPath }/resources/css/header.css">
<link rel="stylesheet" href="${ pageContext.request.contextPath }/resources/css/top_menu.css">

<style type="text/css">

	*{
		margin: 0;
		padding: 0;
		text-decoration: none;
		list-style: none;
	}
	/* contents */
	section.content{
		position: relative;
		padding-top: 170px;
		width: 100%;
		height: 600px;
		padding-top:170px;
	}
	div.content_f{
		position: relative;
		margin : auto;	
		width: 800px;
		height: inherit;
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
	
</style>

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
		  if("${ param.reason eq 'register'}"=="true"){
		  	  
		  	  alert('회원가입 되었습니다.');
		  	  
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

</script>
</head>
<div class="wrap">
		<!-- header -->
		<%@include file="../header/header.jsp" %>
		
		<!-- contents -->
		<section class="content">
			<form>
			<div class="content_f">
				<div class="login_f">
					<h2>회원 로그인</h2>
					<input class="login_id" name="m_id" type="text" placeholder="아이디" onblur="placeholder='아이디'" onfocus="placeholder=''">
					<input class="login_pwd" name="m_pwd" type="password" placeholder="비밀번호" onblur="placeholder='비밀번호'" onfocus="placeholder=''">
					<input class="login_b" type="button" value="로그인" onclick="send(this.form);">
					<div class="find_user">
						<ul>
							<li><a href="${ pageContext.request.contextPath }/member/find_id_form.do">아이디 찾기</a></li>
							<li><a href="${ pageContext.request.contextPath }/member/find_pwd_form.do">비밀번호 찾기</a></li>
							<li><a href="register_form.do">회원가입</a></li>
						</ul>
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