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
		padding-top: 170px !important;
		width: 100%;
		height: auto;
	}
	div.content_f{
		position: relative;
		margin : auto;	
		width: 1000px !important;
		min-height : 600px;
		height: inherit;
		background: #fff;
		text-align: center;
	}
	#title{
		text-align: left;
		padding: 30px 0 30px 0;
		font-size: 32px;
		font-weight: 500;
	}
	th,td{
		height: 30px;
		text-align: center;
		color: #333333;
	}
	.q_subject{
		color: #333333;
	}
	.q_subject:hover{
		text-decoration:none;
		color: #333333;
		font-weight: bold;
	}
	.insert_btn{
		position: absolute;
		right : 0;
		top: 30px;
		margin: 30px 0 30px 0;
		text-align: center;
		width: 100px;
		height: 30px;
		line-height: 30px; 
		background: #fdc257;
		font-weight: bold;
		font-size: 15px;
		color : #fff;
		border: none;
		border-radius: 10px;
		cursor: pointer; 
	}
	.insert_btn:hover{
	background: #ffa400;	
	}
	
	#search_menu{
		padding-top: 30px;
	}
	#search{
		height: 33px;
		width: 100px;
		padding-bottom: 2px;
	}
	#search_text{
		height: 33px;
		width: 300px;
		margin-left: 5px;
		padding-bottom: 2px;
	}
	#search_btn{
		height: 33px;
		margin-left: 5px;
	}
	
	#page_menu{
		font-size: 14px;
		padding: 30px;
	}
	.page_box{
		display:inline-block;
		width: 27px;
		height: 23px;
		border: 1px solid #d9d9d9;
		border-radius: 2px;
	}
	.page_btn{
		display:inline-block;
		width: 27px;
		height: 23px;
		border: 1px solid #d9d9d9;
		border-radius: 2px;
		color: #333333;
	}
	.page_btn:hover{
		color: #333333;
	}
	tr:first-child {
	border-top: 3px solid #ddd;
	border-bottom: 3px solid #ddd;
}
	
	tr:last-child {
	border-bottom: 3px solid #ddd;
}
</style>

<script type="text/javascript">

	function insert_form(){
		
		//로그인 안되어있는 경우
		if("${ empty user }"=="true"){
			if(confirm("글쓰기는 로그인 후 이용 가능합니다\n로그인 하시겠습니까?")==false)return;
			
			//로그인폼으로 이동
			location.href="${ pageContext.request.contextPath }/member/login_form.do";
			return;
		}
		
		//로그인되어있는 경우
		location.href="insert_form.do";
	}
	
	//----------------------------------------------------------------------	
	$(document).ready(function() {
		$("#search_text").keypress(function(e) {
			if(e.keyCode == 13){
				search_qna(); 
			}
		});
	});
	//----------------------------------------------------------------------
	
	
	function search_qna(){
		
		var search 		= $("#search").val();
		var search_text = $("#search_text").val().trim();
		
		if(search != 'all' && search_text ==''){
			alert('검색어를 입력하세요');
			$("#search_text").val("");
			$("#search_text").focus();
			return;
		}
		
		location.href="list.do?" + "&search=" + search + "&search_text=" + encodeURIComponent(search_text);
		
	}
	
	$(document).ready(function(){
		
		if("${ not empty param.search }"=="true"){
			
			$("#search").val("${ param.search }");
		}
	});

</script>

</head>
<div class="wrap">
		<!-- header -->
		<%@include file="../header/header.jsp" %>
		
		<!-- contents -->
		<section class="content">
			<div class="content_f">
				<h1 id="title">QnA</h1>
					<!-- 관리자가 아닐경우 버튼 표시 -->
					<c:if test="${ user.m_grade ne '관리자' }">
						<input class="insert_btn" type="button" value="글쓰기" onclick="insert_form();">
					</c:if>
				<!-- 게시판내용 -->
				<table class="table">
					<!-- 제목 -->
					<tr>
						<th width="10%">번호</th>
						<th width="50%">제목</th>
						<th width="20%">ID</th>
						<th width="20%">작성일자</th>
					</tr>
					
					<!-- 데이터가 없는 경우 -->
					<c:if test="${ empty list }">
						<tr>
							<td colspan="4" align="center">
								작성된 게시물이 없습니다
							</td>
						</tr>
					</c:if>
					
					<!-- 데이터가 있는 경우 -->
					<c:forEach var="vo" items="${ list }">
						<tr>
							<td>${ vo.q_idx }</td>
							<td style="text-align: left; text-indent: 10px;">
							
								<!-- 답글인 경우에만 ㄴ 붙인다 -->
								<c:if test="${ vo.q_depth ne 0 }">&nbsp;&nbsp;ㄴ</c:if>
								
								<!-- 삭제되지 않은 게시물이면 -->
								<c:if test="${ vo.q_use_yn eq 'y' }">
									<a class="q_subject" href="view.do?q_idx=${ vo.q_idx }&page=${ empty param.page ? 1 : param.page }&search=${ empty param.search ? 'all' : param.search }&search_text=${ param.search_text }">
										${ vo.q_subject }
										<c:if test="${ fn:substring(vo.q_regdate,0,10) eq vo.today }">
											<img src="${ pageContext.request.contextPath }/resources/image/new.png">
										</c:if>
									</a>
								</c:if>
								
								<!-- 삭제된 게시물이면 -->
								<c:if test="${ vo.q_use_yn eq 'n' }">
									<font color=gray>삭제된 글입니다.</font>
								</c:if>
							</td>
							<td>
								${ vo.m_id_hidden }
							</td>
							<td>${ fn:substring(vo.q_regdate,0,10) }</td>
						</tr>
					</c:forEach>
				</table>
				
				
		
				<div id="search_menu">
					<select id="search">
						<option value="all">전체</option>
						<option value="subject">제목</option>
						<option value="content">내용</option>
						<option value="id">작성자ID</option>
					</select>
					<input id="search_text" value="${ param.search_text }">
					<input id="search_btn" class="btn btn-warning" type="button" value="검색"
						   onclick="search_qna();">
				</div>
		
				<div id="page_menu">
					${ pageMenu }
				</div>
			</div>
		</section>

		
		<!-- footer -->
		<%@include file="../footer/footer.jsp" %>
		
	</div>
</body>
</html>