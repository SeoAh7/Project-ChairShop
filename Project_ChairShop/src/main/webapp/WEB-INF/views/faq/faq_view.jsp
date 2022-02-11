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
		padding-top: 170px !important;
		width: 100%;
		height: auto;
	}
	div.content_f{
		position: relative;
		margin : auto;	
		width: 800px !important;
		min-height : 600px;
		background: #fff;
		text-align: center;
	}
	th{
		text-align: center;
	}
	td{
		text-align: left;
	}
	
</style>

<script type="text/javascript">

	function faq_delete(){
		
		if(confirm("정말 삭제하시겠습니까?")==false)return;
		
		location.href="delete.do?f_idx=${ vo.f_idx }&page=${ param.page }";
		
	}
	
</script>

</head>
<div class="wrap">
		<!-- header -->
		<%@include file="../header/header.jsp" %>
		
		<!-- contents -->
		<section class="content">
			<div class="content_f">
				<div style="margin-bottom: 10px; margin-right:10px; text-align: right;">
					<input class="btn btn-success" type="button" value="목록" style="margin-top: 50px;"
						   onclick="location.href='list.do?&page=${ param.page }'">
				</div>
			
				<table class="table" style="margin-bottom: 60px;">
		      		<tr>
						<th width="20%">제목</th>
						<td width="80%">${ vo.f_subject }</td>
					</tr>
					<tr>
						<th>ID</th>
						<td>${ vo.m_id }</td>
					</tr>
					<tr>
						<th>작성일자</th>
						<td>${ fn:substring(vo.f_regdate,0,10) }</td>
					</tr>
					<tr>
						<th>조회수</th>
						<td>${ vo.f_readhit }</td>
					</tr>
					<tr>
						<td colspan="2" style="padding: 40px; padding-left: 60px; height: 300px;">
							${ vo.f_content }
						</td>
					</tr>
					<tr>
						<td colspan="2" style="text-align: center;">
						<!-- 관리자일 경우에만 표시 -->
							<c:if test="${ (user.m_grade eq '관리자') }">
								<input type="button" class="btn btn-success" value="수정" onclick="location.href='modify_form.do?f_idx=${ vo.f_idx}&page=${ param.page }'">
								<input type="button" class="btn btn-danger" value="삭제" onclick="faq_delete();">
							</c:if>
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