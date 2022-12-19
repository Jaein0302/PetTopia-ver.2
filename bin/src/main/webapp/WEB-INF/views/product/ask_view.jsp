<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
<head>
<style>
   select.form-control {
      width: auto;
      display: inline-block
   }
   
   .rows {
      text-align: right;
   }
   
    body > div > table > thead > tr:nth-child(2) > th:nth-child(1){width:10%}
    body > div > table > thead > tr:nth-child(2) > th:nth-child(2){width:40%}
    body > div > table > thead > tr:nth-child(2) > th:nth-child(3){width:50%}

   .ask { float : right }

</style>
<script>
   $(function(){
 
      $(".ask_denied").click(function(){
         alert("로그인 후 이용가능합니다.")            
      });
      


      $(".a_detail").click(function(){
    	  var ITEM_ASK_NUM = $('#ask_num').text();
    	  console.log("ITEM_ASK_NUM=" + ITEM_ASK_NUM);
    	  
    	  $.ajax({
    		url : 'ask/detail',
    		type : 'GET',
    		data : {"ITEM_ASK_NUM" : ITEM_ASK_NUM},
    		dataType : "json",
    		success : function(data) {
    			
				console.log("성공")
    			
    			
    		}
    	  })
      })      
   })
</script>

</head>
<body>
   <div class="container">
      <span class="ask" style="display:inline">문의 목록 ( ${listcount} )</span>   
      <table class="table table-striped">
         <thead>
            <tr>
               <th><div>글 번호</div></th>            
               <th><div>제목</div></th>         
               <th><div>작성자</div></th>         
               <th><div>날짜</div></th>         
            </tr>
              <c:forEach var="a" items="${asklist}">   
               <tr>
                  <td id="ask_num">${a.ITEM_ASK_NUM}</td>
                  <td>
                     ${a.ITEM_ASK_SUBJECT}                 
                  </td>
                  <td>${a.ITEM_ASK_USERNAME}</td>
                  <td>${a.ITEM_ASK_DATE}</td>
                  <td><button class="btn-dark a_detail" data-toggle="modal" data-target="#ask_detail">상세보기</button></td>
               </tr>
            </c:forEach>
         </thead>
      </table>   
    
      <div class="text-right">
          <sec:authorize access="isAnonymous()">
            <button type="button" class="btn btn-info floar-right ask_denied">문의하기</button>
          </sec:authorize>
          <sec:authorize access="isAuthenticated()">
            <button type="button" class="btn btn-info floar-right ask_access" data-toggle="modal" 
                  data-target="#product_ask">문의하기</button>
           </sec:authorize>
      </div>
</div>

   <%-- 문의 등록 modal 시작 --%>
   <div class="modal" id="product_ask">
     <div class="modal-dialog">
       <div class="modal-content">          
         <!-- Modal body -->
         <div class="modal-body">
            <form  action="${pageContext.request.contextPath}/ask/add" method="post">   
               <sec:authorize access="isAuthenticated()">               
               <sec:authentication property="principal" var="pinfo"/>
               	               
                <input type="text" class="form-control" name="ITEM_ASK_ITEMID"  value="${param.ITEM_ID}">
            
             	<input type="text" class="form-control" name="ITEM_ASK_USERNAME" value="${pinfo.username}" readOnly>
                
                 <div>                 
                   <p>제목</p>
               <textarea name="ITEM_ASK_SUBJECT" class="form-control" rows="1"></textarea>                
                 </div>
                
                <div>
                   <p>내용</p>
               <textarea name="ITEM_ASK_CONTENT" class="form-control" rows="5"></textarea>                
             </div>    
             
             <button type="submit" class="btn btn-primary" id="p_add">상품 등록</button>
                <button type="button" class="btn btn-danger" data-dismiss="modal">취소</button>
             <input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}">   
             </sec:authorize>                   
            </form>
         </div>           
       </div>
     </div>
   </div> 
     
   <%-- 문의 수정 modal 시작 --%>
   <div class="modal" id="ask_detail">
     <div class="modal-dialog">
       <div class="modal-content">          
         <!-- Modal body -->
         <div class="modal-body">
            <form id="update" action="${pageContext.request.contextPath}/ask/update" method="post">              
                
                <div><p>제목</p><textarea name="ITEM_ASK_SUBJECT" class="form-control" rows="1"></textarea></div>
                
                <div><p>내용</p><textarea name="ITEM_ASK_CONTENT" class="form-control" rows="5"></textarea></div>    
             
             	<sec:authentication property="principal" var="pinfo"/>         
             	<c:if  test="${pinfo.username} !=  ${ITEM_ASK_USERNAME}">       
	             	<button type="button" class="btn btn-primary">문의 수정</button>
	             	<button type="button" class="btn btn-primary">문의 삭제</button>             	
	                <button type="button" class="btn btn-danger" data-dismiss="modal">취소</button>
	            </c:if>
             
             <input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}">      
                                      
            </form>
         </div>           
       </div>
     </div>
   </div>   
   
 
   
   
</body>