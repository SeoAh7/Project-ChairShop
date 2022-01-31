<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>

<!-- Bootstrap 설정 버전3 -->
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>

<script src="https://code.jquery.com/jquery-1.12.4.js"></script>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.3/jquery.min.js"></script> 
<script type="text/javascript" src="../resources/js/header_scroll.js"></script>
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
	header.header_hide{
		position: absolute;
		width: 100%;
		height: 120px;
	}
	
	header.header{
		position: relative;
		width: 100%;
		height: 120px;
		background: #fff;
		border-bottom: 1px solid #ccc;
		z-index: 20;
	}
	div.header_f{
		margin : auto;
		width: 1200px;
		height: 120px;
		background: #fff;
		display: flex;
		flex-direction: row;
		z-index: 10;
	}
	div.header_left{
		position: relative;
		width : 20%;
		z-index: 10;
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
    	z-index: 10;
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
		z-index: 10;
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
		background: blue;
	}
	div.content_f{
		position: relative;
		margin : auto;	
		width: 800px;
		height: inherit;
		background: #fff;
		text-align: center;
	}
	
	th{
		text-align: center;
	}
	td{
		text-align: left;
	}
	textarea{
		width: 85%;
		height: 200px;
		resize: none;
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

<script type="text/javascript">

	function cancel(){
		
		if(confirm("작성을 취소하시겠습니까?")==false)return;
		
		location.href="view.do?q_idx=${ vo.q_idx }";
	}
	
	function send(f){
		
		var q_subject = f.q_subject.value.trim();
		var q_content = f.q_content.value.trim();
		
		if(q_subject==''){
			alert("제목을 입력하세요");
			f.q_subject.value='';
			f.q_subject.focus();
			return;
		}
		if(q_content==''){
			alert("내용을 입력하세요");
			f.q_content.value='';
			f.q_content.focus();
			return;
		}
		
		if(confirm("작성을 완료하시겠습니까?")==false)return;
		
		f.action="reply.do";
		f.submit();
		
		
	}

</script>

</head>
<div class="wrap">
		<section class="top_menu">
			<div class="top_menu_f">
				<ul>
					<c:if test="${ not empty user }">
						<li>
							<b>${ user.m_name }</b>님 환영합니다
						</li>
						<li> <a href="#" onclick="logout();">로그아웃</a> </li>
					</c:if>
					<c:if test="${ empty user }">
						<li><a href="member/login_form.do">로그인</a></li>
						<li><a href="member/register_form.do">회원가입</a></li>
					</c:if>
					<li><a href="#" onclick="order_check();">주문조회</a></li>
					<li><a href="#" onclick="cart_list();">장바구니</a></li>
				</ul>
			</div> 
		</section>

		<!-- header -->
		<header class="header_hide">
			
		</header>
		<header class="header">
			<div class="header_f">
				<div class="header_left">
				<a href="${ pageContext.request.contextPath }">
					<img src="${ pageContext.request.contextPath }/resources/image/logo.png">
				</a>
				</div>
				<div class="header_center">
					<ul>
						<li><a href="#">Company</a></li>
						<li><a href="#">Product</a></li>
						<li><a href="${ pageContext.request.contextPath }/qna/list.do">Community</a></li>
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
			<input type="hidden" name="q_idx" value="${ vo.q_idx }">
			<div class="content_f">
				<h2 id="title">답변하기</h2>
				<div style="margin-bottom: 10px; margin-right:10px; text-align: right;">
				</div>
				
				<table class="table">
		      		<tr>
						<th width="20%">제목</th>
						<td width="80%"><input name="q_subject" type="text" style="width: 85%; height: 30px;" value="${ vo.q_subject } [답변완료]" readonly="readonly"></td>
					</tr>
					<tr>
						<th>내용</th>
						<td>
							<textarea name="q_content"></textarea>
						</td>
					</tr>
					<tr>
						<td colspan="2" style="text-align: center;">
							<input type="button" class="btn btn-info" value="등록" onclick="send(this.form);">
							<input type="button" class="btn btn-danger" value="취소" onclick="cancel();">
						</td>
					</tr>
      			</table>
			</div>
		</form>
		</section>
		
		
		
		<!-- footer -->
		<section class="footer">
			<div class="footer_f">
				<div class="foot_info">
					<ul class="info_1">
						<li><a href="">홈</a></li>
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