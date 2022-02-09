<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
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
<link rel="stylesheet" href="${ pageContext.request.contextPath }/resources/css/notice_list.css">
</head>
<body>
<div class="wrap">
		<!-- header -->
		<%@include file="../header/header.jsp" %>
		
		<!-- contents -->
			<div class="content_f">
				<div class="n_content">
					<c:if test="${ user.m_grade eq '관리자' }">
						<input class="btn_write" type="button" value="글쓰기">
					</c:if>
					<h1>공지사항</h1>
					
					<ul>
						<li>번호</li>
						<li>제목</li>
						<li>작성일</li>
						<li>조회</li>
					</ul>
				</div>					
			</div>

		
		<!-- footer -->
		<%@include file="../footer/footer.jsp" %>
		
</div>
</body>
</html>