<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style type="text/css">
	.content_remain{
		width: 1000px;
		min-height: 600px;
		margin: auto;
		margin-top: 250px; 
		box-sizing: border-box;
		position: relative;
	}
	.content_remain>h1{
	
	}
	.btn_manage{
		position: absolute;
		right: 0;
		top: 20px;
	}
	.btn_manage>input{
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
	
	.btn_manage>input:hover{
		background: #ffa400;	
	}
	div.list_info{
		width: 100%;
	}
	div.list_info>ul{
		margin-top : 70px;
		border-top : 3px solid #ddd;
		border-bottom: 3px solid #ddd;
		padding : 10px 0 10px 0;
		display: flex;
		flex-direction: row;
		justify-content: center;
	}
	div.list_info>ul>li{
		text-align: center;
	}
	div.list_info>ul>li:nth-child(1) {
		width: 15%;
	}
	div.list_info>ul>li:nth-child(2) {
		width: 15%;
	}
	div.list_info>ul>li:nth-child(3) {
		width: 30%;
	}
	div.list_info>ul>li:nth-child(4) {
		width: 20%;
	}
	div.list_info>ul>li:nth-child(5) {
		width: 20%;
	}
	
	div.list{
		width: 100%;
	}
	div.list>ul{
		border-bottom: 1px solid #ddd;
		padding : 10px 0 10px 0;
		display: flex;
		flex-direction: row;
		justify-content: center;
	}
	div.list>ul>li{
		text-align: center;
	}
	div.list>ul>li:nth-child(1) {
		width: 15%;
	}
	div.list>ul>li:nth-child(2) {
		width: 15%;
	}
	div.list>ul>li:nth-child(3) {
		width: 30%;
	}
	div.list>ul>li:nth-child(4) {
		width: 20%;
	}
	div.list>ul>li:nth-child(5) {
		width: 20%;
	}
	
</style>

<script type="text/javascript">

	function send(f) {
		
		var p_name = f.p_name.value;
		var p_cnt  = f.p_cnt.value;
		
		f.action="insert_out.do"; 
		f.submit();
	}

</script>

</head>
<body>
<div class="wrap">
		<!-- header -->
		<%@include file="../header/header.jsp" %>
		
		<!-- contents -->
			<div class="content_remain">
			<h1>출고관리</h1>
				<div class="btn_manage">
					<input type="button" value="입고관리" onclick="location.href='product_in_list.do'">
					<input type="button" value="출고관리" onclick="location.href='product_out_list.do'">
					<input type="button" value="재고관리" onclick="location.href='product_remain_list.do'">
				</div>
				<div>
					<form>
						<input name="p_name">
						<input name="p_cnt">
						<input type="button" value="출고" onclick="send(this.form);">
					</form>
				</div>
				<div class="list_info">
					<ul>
						<li>번호</li>
						<li>제품일련번호</li>
						<li>제품명</li>
						<li>수량</li>
						<li>재고일자</li>
					</ul>
				</div>
				<div class="list">
					<c:forEach var="vo" items="${ map.out_list }">
						<ul>
							<li>${ vo.pm_idx }</li>
							<li>${ vo.p_idx }</li>
							<li>${ vo.p_name }</li>
							<li>${ vo.p_cnt }</li>
							<li>${ vo.regdate }</li>
						</ul>
					</c:forEach>
				</div>						
			</div>

		
		<!-- footer -->
		<%@include file="../footer/footer.jsp" %>	
</div>
</body>
</html>