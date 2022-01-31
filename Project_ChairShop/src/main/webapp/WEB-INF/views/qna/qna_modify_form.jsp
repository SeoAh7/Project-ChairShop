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
	
</style>

<script type="text/javascript">

	function cancel(){
		
		if(confirm("작성을 취소하시겠습니까?")==false)return;
		
		location.href="view.do?q_idx=${ vo.q_idx }&page=${ param.page }";
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
		
		if(confirm("수정하시겠습니까?")==false)return;
		
		f.action="modify.do";
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
			<input type="hidden" name="q_idx" value="${ vo.q_idx }">
			<input type="hidden" name="page" value="${ param.page }">
			<div class="content_f">
				<h2 id="title">수정하기</h2>
				<div style="margin-bottom: 10px; margin-right:10px; text-align: right;">
				</div>
				
				<table class="table">
		      		<tr>
						<th width="20%">제목</th>
						<td width="80%"><input name="q_subject" type="text" style="width: 85%; height: 30px;" value="${ vo.q_subject }"></td>
					</tr>
					<tr>
						<th>내용</th>
						<td>
							<textarea name="q_content">${ vo.q_content }</textarea>
						</td>
					</tr>
					<tr>
						<td colspan="2" style="text-align: center; padding-bottom: 100px;">
							<input type="button" class="btn btn-info" value="수정" onclick="send(this.form);">
							<input type="button" class="btn btn-danger" value="취소" onclick="cancel();">
						</td>
					</tr>
      			</table>
			</div>
		</form>
		</section>
		
		<!-- footer -->
		<%@include file="../footer/footer.jsp" %>
		
	</div>
</body>
</html>