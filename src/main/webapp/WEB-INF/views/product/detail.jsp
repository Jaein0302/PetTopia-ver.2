<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
<head>
<style>
.prod-bx, .refund-bx {
    background-color: #fcfcfc;
    border: #eee 1px solid;
    border-radius: 10px;
    padding: 15px 20px;
    font-size: 14px;
    line-height: 1.5;
}

</style>

</head>
<body>
  <div class="refund-bx">
                        <h5 class="tit">상품 상세보기</h5>
                        	<img class='img-fluid' src="${pageContext.request.contextPath}/img/Product/detail.jpg">
                        
                        	<img class='img-fluid' src="${pageContext.request.contextPath}/img/Product/detail2.jpg">
                        	
                        <h5 class="tit mt-3">상품 설명</h5>
                   			<textarea class="form-control" rows="6">
                   				${productdata.ITEM_CONTENT}
                   			</textarea>	                   			
  </div>
   
</body>