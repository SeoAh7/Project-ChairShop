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

	function qna_delete(){
		
		if(confirm("정말 삭제하시겠습니까?")==false)return;
		
		location.href="delete.do?q_idx=${ vo.q_idx }&page=${ param.page }&search=${ param.search }&search_text=${ param.search_text }";
		
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
						   onclick="location.href='list.do?&page=${ param.page }&search=${ param.search }&search_text=${ param.search_text }'">
				</div>
			
				<table class="table" style="margin-bottom: 60px;">
		      		<tr>
						<th width="20%">제목</th>
						<td width="80%">${ vo.q_subject }</td>
					</tr>
					<tr>
						<th>ID</th>
						<td>
							<c:if test="${ vo.m_id eq 'admin' }">
								관리자
							</c:if>
							<c:if test="${ vo.m_id ne 'admin' }">
								${ vo.m_id_hidden }
							</c:if>
						</td>
					</tr>
					<tr>
						<th>작성일자</th>
						<td>${ fn:substring(vo.q_regdate,0,10) }</td>
					</tr>
					<tr>
						<td colspan="2" style="padding: 40px; padding-left: 60px; height: 300px;">
							${ vo.q_content }
						</td>
					</tr>
					<tr>
						<td colspan="2" style="text-align: center;">
							
							<!-- 작성자 본인일 경우에만 표시 -->
							<c:if test="${ user.m_idx == vo.m_idx }">
								<input type="button" class="btn btn-info" value="수정" onclick="location.href='modify_form.do?q_idx=${ vo.q_idx }&page=${ param.page }&search=${ param.search }&search_text=${ param.search_text }'">
								<input type="button" class="btn btn-danger" value="삭제" onclick="qna_delete();">
							</c:if>
							
							
							<!-- 관리자일 경우에만 표시 -->
							<c:if test="${ (user.m_grade eq '관리자') && ( vo.q_depth eq 0 ) }">
								<input type="button" class="btn btn-warning" value="답변작성" onclick="location.href='reply_form.do?q_idx=${ vo.q_idx }&page=${ param.page }&search=${ param.search }&search_text=${ param.search_text }'">
								<input type="button" class="btn btn-danger" value="삭제" onclick="qna_delete();">
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