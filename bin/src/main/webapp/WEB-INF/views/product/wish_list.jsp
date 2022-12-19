<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="sec"
	uri="http://www.springframework.org/security/tags"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>펫토피아 - 수술/치료</title>
<link href="${pageContext.request.contextPath}/resources/css/Product/detail.css" rel="stylesheet" type="text/css">

<script src="https://code.jquery.com/jquery-3.4.1.min.js"></script>

</head>

<body>
	<jsp:include page="../member/header.jsp" />
	<div class="container">
		<table class="table table-striped">
			<div m-3><h3>찜한 상품</h3></div>
			<thead>				
				<tr>
					<th>상품정보</th>				
					<th>제목</th>			
					<th>상품금액</th>		

				</tr>
				<tr>
					<td>다리수술</td>
					<td>쓸개골 탈구</td>
					<td>15,000</td>
					<td><button type="submit" class="btn btn-primary">장바구니</button></td>			
					<td><button type="button" class="btn btn-danger">삭제하기</button></td>	
				</tr>
			</thead>
			<tbody>
				
			</tbody>		
		</table>
	</div>	
</body>	