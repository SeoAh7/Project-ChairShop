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
		
		location.href="list.do";
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
		
		f.action="insert.do";
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
				<h2 id="title">글쓰기</h2>
				<div style="margin-bottom: 10px; margin-right:10px; text-align: right;">
				</div>
				
				<table class="table">
		      		<tr>
						<th width="20%">제목</th>
						<td width="80%"><input name="q_subject" type="text" style="width: 85%; height: 30px;"></td>
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
		<%@include file="../footer/footer.jsp" %>
		
	</div>
</body>
</html>