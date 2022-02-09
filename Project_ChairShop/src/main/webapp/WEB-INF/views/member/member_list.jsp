 <%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<!-- JSTL -->
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="${ pageContext.request.contextPath }/resources/css/main.css">
<link rel="stylesheet" href="${ pageContext.request.contextPath }/resources/css/footer.css">
<link rel="stylesheet" href="${ pageContext.request.contextPath }/resources/css/header.css">
<link rel="stylesheet" href="${ pageContext.request.contextPath }/resources/css/top_menu.css">
<!-- SweetAlert2 사용 설정 (link : https://sweetalert2.github.io/ ) -->
<script src="//cdn.jsdelivr.net/npm/sweetalert2@11"></script>

<!-- Bootstrap 설정 버전3 -->
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>

<style type="text/css">
section.content{
	padding-top: 170px;
}

#box{
	position : relative;
	width: 1000px;
	margin-left: auto;
	margin-right: auto;
}

table{
	width: 100%;
}
tr:first-child {
	border-top: 3px solid #ddd;
	border-bottom: 3px solid #ddd;
}
	
	tr:last-child {
	border-bottom: 3px solid #ddd;
}
th,td{
	text-align: center;
}

#title{
		text-align: left;
		padding: 30px 0 30px 0;
		font-size: 32px;
		font-weight: 500;
	}

#empty_message{
	text-align: center;
	font-size: 16px;
	font-weight: bold;
	color: red;
}


input[value='삭제']{
	border: 1px solid gray;
	background: pink;
}
.delete{
	width: 100%;
	border-radius: 4px; 
}
.user{
	position: absolute;
	right : 0;
	top: 30px;
	margin: 30px 0 30px 0;
	text-align: center;
}


#search_menu{
		width: 1200px;
	    padding-top: 30px;
	    position: relative;
	    margin: auto;
	    text-align: center;
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
		width: 1200px;
	    font-size: 14px;
	    padding: 30px;
	    text-align: center;
	    margin: auto;
	    position: relative;
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

	function del(m_idx){
		
		Swal.fire({
			title: '정말 삭제하시겠습니까?',
			text: "삭제 후에는 되돌릴 수 없습니다.",
			icon: 'warning',
			showCancelButton: true,
			confirmButtonColor: '#3085d6',
			cancelButtonColor: '#d33',
			confirmButtonText: '삭제',
			cancelButtonText: '취소'
		}).then((result) => {
		  	if (result.isConfirmed) {
				location.href="delete.do?m_idx="+ m_idx;
		  	}
		});
	}
	
	//수정폼 띄우기
	 function manage_form(m_idx){
		
		location.href="manage_form.do?m_idx=" + m_idx;
	}
	
</script>

</head>
<body>
<div class="wrap">
	<!-- header -->
	<%@include file="../header/header.jsp" %>
	<section class="content">
		<div class="content_f">
			<div id="box">
				<h1 id="title">회원목록</h1>
				<div class="user">
				
					<!-- 로그인이 안되었을 경우 -->
					<c:if test="${ empty sessionScope.user }">
						<input class="btn btn-info"    type="button" value="로그인"
						       onclick="location.href='login_form.do'">
						<input class="btn btn-warning" type="button" value="회원가입" 
							   onclick="location.href='insert_form.do'">
					</c:if>
					
					<!-- 로그인된 상태일 경우 -->
					<c:if test="${ not empty sessionScope.user }">
						<b>${ user.m_name }</b>님 [ <b>${ user.m_grade }</b> ]
						<input class="btn btn-info"    type="button" value="로그아웃"
						       onclick="location.href='logout.do'">
					</c:if>
						   
				</div>
				
				<table class="table table-striped">
					<!-- title -->
					<tr class="success">
						<th>번호</th>
						<th>이름</th>
						<th>아이디</th>
						<th>비밀번호</th>
						<th>우편번호</th>
						<th>주소</th>
						<th>아이피</th>
						<th>가입일자</th>
						<th>회원등급</th>
						<th>편집</th>
					</tr>
					<!-- Data가 없는 경우 -->
					<c:if test="${ empty list }">
						<tr>
							<td id="empty_message" colspan="10">회원정보가 없습니다</td>
						</tr>
					</c:if>
					
					<!-- Data가 있는 경우 -->
					<!-- for(MemberVO vo : list) -->
					<c:forEach var="vo" items="${ list }">
						<tr>
							<td>${ vo.m_idx }</td>
							<td>${ vo.m_name }</td>
							<td>${ vo.m_id }</td>
							<td>${ vo.m_pwd_hidden }</td>
							<td>${ vo.m_zipcode }</td>
							<td>${ vo.m_addr }</td>
							<td>${ vo.m_ip }</td>
							<td></td>
							<td>${ vo.m_grade }</td>
							<td>
								<!-- 로그인 유저가 관리자가 아닐 경우 -->
								<c:if test="${ (not empty user) and (user.m_grade != '관리자') }">
								편집권한이 없습니다
								</c:if>
								<!-- 로그인 유저가 관리자일 경우 -->
								<c:if test="${ user.m_grade == '관리자' }">
									<input type="button" value="수정" onclick="manage_form( '${ vo.m_idx}' );">
									<input class="delete" type="button" value="삭제" onclick="del( '${ vo.m_idx}' );">
								</c:if>
							</td>
						</tr>
					
					</c:forEach>
					
				</table>
			</div>
			
		</div>
		<div id="search_menu">
					<select id="search">
						<option value="all">전체</option>
						<option value="subject">제목</option>
						<option value="content">내용</option>
						<option value="id">작성자ID</option>
					</select>
					<input id="search_text" value="${ param.search_text }">
					<input id="search_btn" class="btn btn-warning" type="button" value="검색"
						   onclick="search();">
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