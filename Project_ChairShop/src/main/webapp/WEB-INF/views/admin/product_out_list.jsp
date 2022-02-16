<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
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
	.insert_manage{
		position:relative;
		text-align: right;
		top: 50px;
	}
	.insert_btn{
		width: 70px;
		height: 25px;
		background: #fdc257;
		font-weight: bold;
		font-size: 15px;
		color : #fff;
		border: none;
		border-radius: 10px;
		cursor: pointer; 
	}
	.delete_btn{
		width: 70px;
		height: 25px;
		background: #999;
		font-weight: bold;
		font-size: 15px;
		color : #fff;
		border: none;
		border-radius: 10px;
		cursor: pointer; 
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
		width: 10%;
	}
	div.list_info>ul>li:nth-child(2) {
		width: 10%;
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
	div.list_info>ul>li:nth-child(6) {
		width: 10%;
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
		width: 10%;
	}
	div.list>ul>li:nth-child(2) {
		width: 10%;
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
	div.list>ul>li:nth-child(6) {
		width: 10%;
	}
	
</style>

<script type="text/javascript">

	function insert_out(f) {
		
		var p_name = f.p_name.value.trim();
		var p_cnt  = f.p_cnt.value;
		
		if(p_name==''){
			alert('제품명을 입력하세요');
			f.p_name.value='';
			f.p_name.focus();
			return;
		}

		var number_filter=/^[0-9]+$/;
		if(number_filter.test(p_cnt)==false){
			alert('수량은 숫자만 입력하세요');
			f.p_cnt.value='';
			f.p_cnt.focus();
			return;
		}
		
		f.action="insert_out.do"; 
		f.submit();
	}
	
	function delete_out(pm_idx){
		if(confirm("정말 출고를 취소하시겠습니까?")==false) return;
		
		location.href="delete_out.do?pm_idx=" + pm_idx;
	}
	
	 window.onload=function(){
	      
		 $(document).ready(function(){
				
			setTimeout(show_message,100);
		 });
		 
		 function show_message(){
			 
			 if("${ param.error eq 'remain_not' }"=='true')
			 {
				 alert('재고목록에 출고할\n상품이 없습니다');
			 }
			
			 if("${ param.error eq 'remain_lack' }"=='true')
			 {
				 alert('출고할 상품수량이 부족합니다');
			 }
		 }
	 };

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
				<div class="insert_manage">
					<form>
						제품명 <input name="p_name">
						수량 <input name="p_cnt">
						<input class="insert_btn" type="button" value="출고" onclick="insert_out(this.form);">
					</form>
				</div>
				<div class="list_info">
					<ul>
						<li>번호</li>
						<li>제품번호</li>
						<li>제품명</li>
						<li>수량</li>
						<li>재고일자</li>
						<li>취소여부</li>
					</ul>
				</div>
				<div class="list">
					<c:forEach var="vo" items="${ map.out_list }">
						<ul>
							<li>${ vo.pm_idx }</li>
							<li>${ vo.p_idx }</li>
							<li>${ vo.p_name }</li>
							<li>${ vo.p_cnt }</li>
							<li>${ fn:substring(vo.regdate,0,16) }</li>
							<li><input class="delete_btn" type="button" value="출고취소" onclick="delete_out('${ vo.pm_idx }');"></li>
						</ul>
					</c:forEach>
				</div>						
			</div>

		
		<!-- footer -->
		<%@include file="../footer/footer.jsp" %>	
</div>
</body>
</html>