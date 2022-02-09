<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">

<title>Insert title here</title>

<link rel="stylesheet" href="${ pageContext.request.contextPath }/resources/css/main.css">
<link rel="stylesheet" href="${ pageContext.request.contextPath }/resources/css/footer.css">
<link rel="stylesheet" href="${ pageContext.request.contextPath }/resources/css/header.css">
<link rel="stylesheet" href="${ pageContext.request.contextPath }/resources/css/top_menu.css">
<link rel="stylesheet" href="${ pageContext.request.contextPath }/resources/css/product_insert_form.css">

<script type="text/javascript">
	
function send(f){
	var category = f.category.value;
	var p_name = f.p_name.value.trim();
	var p_price = f.p_price.value.trim();
	var p_image = f.p_image.value;
	var p_content = f.p_content.value.trim();
	
	if(category == ''){
		alert("카테고리를 선택해주세요.");
		return;
	}
	
	if(p_name == ''){
		alert("상품명을 입력해주세요.");
		f.p_name.value='';
		f.p_name.focus();
		return;
	}
	
	if(p_price == ''){
		alert("상품가격을 입력해주세요.");
		f.p_price.value='';
		f.p_price.focus();
		return;
	}

	if(p_content == ''){
		alert("내용을 입력해주세요.");
		f.p_content.value='';
		f.p_content.focus();
		return;
	}
	
	if(p_image == ''){
		alert("이미지를 선택해주세요.");
		return;
	}

	
	f.action="insert.do";
	f.submit();
}
	
</script>


</head>
<body>
<div class="wrap">
		<!-- header -->
		<%@include file="../header/header.jsp" %>
		<!-- contents -->
		<section class="content">
			<div class="content_f">
		<form method="POST" enctype="multipart/form-data"> 
		<table align="center" width="600" border="1" 
		    style="border-collapse:collapse;font-size:8pt" bordercolor="navy"
		    cellpadding="2" cellspacing="0">
		    <tr>
		        <td>상품Category</td>
		        <td>
		        	<select name="category">
		        		<option value="">카테고리 선택</option>
		        		<option value="kids001">유아용</option>
		        		<option value="office002">사무용</option>
		        		<option value="gaming003">게이밍용</option>
		        	</select>
		        </td>
		    </tr>
		    <tr>
		        <td>상품명</td>
		        <td><input name="p_name" type="text" ></td>
		    </tr>
		    <tr>
		        <td>상품가격</td>
		        <td><input name="p_price" type="text" ></td>
		    </tr>
		    <tr>
		        <td>상품설명</td>
		        <td>
		        	<TEXTAREA name="p_content" rows="5" cols="50" style="resize: none; width: 99%; border: none;"></TEXTAREA>       	
		        </td>
		    </tr>
		    <tr>
		        <td>상품사진</td>
		        <td><input type="file" name="p_image">
		    </tr>
		    <tr>
		        <td colspan="2" align="center">
		            <input type="button" value="등록" onclick="send(this.form);" >
		            <input type="reset" value="Clear" >
		        </td>
		    </tr>    
		</table>
		</form>
			</div>
			
		</section>
		<!-- footer -->
		<%@include file="../footer/footer.jsp" %>
</div>
</body>
</html>