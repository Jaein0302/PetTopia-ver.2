<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<body>
<c:if test="${!empty p}">
<div class="container mt-3 mb-5">
    <div class="container-fluid">
        <div class="row px-xl-5 pb-3">
        <c:forEach var="p" items="${p}">	        
            <div class="col-lg-3 col-md-6 col-sm-12 pb-1">
                <div class="card product-item border-0 mb-4" >
                    <div class="card-header product-img position-relative overflow-hidden bg-transparent border p-0">
                  	    <img class='img-fluid w-100' src="/pet_topia/upload${p.ITEM_IMAGE_FILE}" onclick="location.href='${pageContext.request.contextPath}/product/detail?ITEM_ID=${p.ITEM_ID}'">              	
                    </div>
                    <div class="card-body border-left border-right p-0 pt-2 text-center">
                    	<span class="text-body">${p.seller_name}</span>
						<h4 class="text-truncate m-0">${p.ITEM_NAME}</h4>
						<i class="fas fa-star"></i><span class="text-body">&nbsp;${p.ITEM_SCORE}&ensp;<span class="text-small">후기 (${p.cnt})</span></span>
                    </div>
                    <div class="card-footer d-flex justify-content-between bg-light border">
                    	 <span class="text-dark price" style="margin:0;font-color:black"><fmt:formatNumber value="${p.ITEM_PRICE}" pattern="#,###" />원</span>
                    	<!-- 찜하기 버튼 -->
                    	<a href="javascript:void(0)" class="btn border wishbutton">
                  			<i class="fas fa-heart text-primary"></i>
               			</a>
               			<input type="hidden" value="${p.ITEM_ID}">
                    </div>
                </div>
            </div>        
         </c:forEach>            
         </div>     
     </div>
</div>
</c:if>
<c:if test="${empty p}">
<div class="text-center mt-3">
<h2 style="color:gray">검색결과가 없습니다.</h2>
</div>
</c:if>
</body>
