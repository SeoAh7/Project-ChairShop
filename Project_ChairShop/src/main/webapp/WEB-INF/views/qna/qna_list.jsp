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
	a:hover{
		text-decoration: none;
	}
	/* contents */
	section.content{
		position: relative;
		padding-top: 170px;
		width: 100%;
		height: auto;
	}
	div.content_f{
		position: relative;
		margin : auto;	
		width: 800px;
		height: inherit;
		background: #fff;
		text-align: center;
	}
	#title{
		padding: 30px 0 30px 0;
		font-size: 30px;
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

</script>

</head>
<div class="wrap">
		<!-- header -->
		<%@include file="../header/header.jsp" %>
		
		<!-- contents -->
		<section class="content">
			<div class="content_f">
				<h1 id="title">QnA 게시판</h1>
				<div style="margin-bottom: 10px; margin-left:10px; text-align: left;">
					<input class="btn btn-warning" type="button" value="글쓰기" 
						   onclick="insert_form();">
				</div>
		
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
							
							<!-- 글깊이(q_depth)에 따라서 들여쓰기 -->
							<c:forEach begin="1" end="${ vo.q_depth }">
								&nbsp;&nbsp;
							</c:forEach>
							
							<!-- 답글인 경우에만 ㄴ 붙인다 -->
							<c:if test="${ vo.q_depth ne 0 }">
							ㄴ
							</c:if>
							
							<!-- 삭제되지 않은 게시물이면 -->
							<c:if test="${ vo.q_use_yn eq 'y' }">
								<a class="q_subject" href="view.do?q_idx=${ vo.q_idx }&page=${ empty param.page ? 1 : param.page }">
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
								<c:if test="${ vo.m_id eq 'admin' }">
									관리자
								</c:if>
								<c:if test="${ vo.m_id ne 'admin' }">
									${ vo.m_id_hidden }
								</c:if>
							</td>
							<td>${ fn:substring(vo.q_regdate,0,10) }</td>
						</tr>
					</c:forEach>
					
					<tr>
						<td colspan="4">
							<div id="page_menu">
								${ pageMenu }
							</div>
						</td>
					</tr>
				</table>
			</div>
		</section>

		
		<!-- footer -->
		<%@include file="../footer/footer.jsp" %>
		
	</div>
</body>
</html>