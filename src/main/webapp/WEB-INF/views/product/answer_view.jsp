<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>

<title>상품 등록</title>
<script src="https://code.jquery.com/jquery-3.4.1.min.js"></script>

<style>

   .ask { float : left }
      
   #detail_button{ color : brown }
   
</style>

<body>
	<jsp:include page="../member/header.jsp" />
	<div class="container">
      <h3 class="ask">문의 목록 ( ${listcount} )</h3>   
      <table class="table table-striped" id="detail">
         <thead>
            <tr>
               <th><div>글 번호</div></th>            
               <th><div>제목</div></th>         
               <th><div>작성자</div></th>         
               <th><div>날짜</div></th>   
               <th><div>답변 여부</div></th>      
            </tr>
            <c:forEach var="a" items="${asklist}" varStatus="status">  
                       
               <input type="hidden" value="${answerlist[status.index].ITEM_ANSWER_NUM}">        
               <input type="hidden" value="${answerlist[status.index].ITEM_ANSWER_CONTENT}">        
               <input type="hidden" value="${a.ITEM_ASK_CONTENT}">              
               <input type="hidden" value="${a.ITEM_ASK_ITEMID}">              
               <input type="hidden" value="${a.ITEM_ASK_USERNAME}">
               <tr>
                  <td>${a.ITEM_ASK_NUM}</td>
                  <td><strong id="detail_button" style="color:darkbrown; cursor:pointer;">
                     ${a.ITEM_ASK_SUBJECT} 
                     </strong>                
                  </td>
                  <td>${a.ITEM_ASK_USERNAME}</td>
                  <td>${a.ITEM_ASK_DATE}</td>   
                  <td id="p_check"><td> 
                  <td><input type="hidden" value="${answercheck[status.index]}" id="check"></td>
               </tr>            
            </c:forEach>
         </thead>
      </table>  
	</div>
	
   <%-- 문의 수정 modal 시작 --%>
   <div class="modal" id="ask_detail">
     <div class="modal-dialog">
       <div class="modal-content">          
         <!-- Modal body -->
         <div class="modal-body">
            <form id="update">              
                <sec:authentication property="principal" var="pinfo"/>             
	            <input type="hidden" class="form-control" name="ITEM_ANSWER_USERNAME" value="${pinfo.username}">

                <input type="hidden" class="form-control" name="ITEM_ASK_NUM" id="ASK_NUM">
                <input type="hidden" class="form-control" name="ITEM_ASK_DATE" id="ASK_DATE">
                <input type="hidden" class="form-control" name="ITEM_ASK_ITEMID" id="ASK_ITEMID">
                
                <div class=m-3>
                	<h6>작성자</h6>                	
                    <input type="text" class="form-control" name="ITEM_ASK_USERNAME" id="USERNAME" readOnly>
                </div>
                
                <div class=m-3>
	                <h6>제목</h6>
	                <input type="text" class="form-control" name="ITEM_ASK_SUBJECT" id="SUBJECT" readOnly>
                </div>
                
                <div class=m-3>
	                <h6>내용</h6>
	                <textarea name="ITEM_ASK_CONTENT" class="form-control" rows="5" id="CONTENT" readOnly></textarea>
                </div>    
                <div>
	                <button type="button" class="btn btn-info a_write">답변</button>
	                <button type="button" class="btn btn-danger a_cancel">취소</button>
				</div>
             <input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}" >                                            
            </form>
            
            <div id="comment">
            	<input type="hidden" class="form-control" name="ITEM_ANSWER_NUM" id="answer_num">            	
            	<hr>
				<h4>답변하기</h4>
				<textarea class="form-control" id="content" rows="6"></textarea>	
				<button id="write" class="btn btn-info float-left">답변등록</button>
				<div id="u"></div>						
			</div>
         </div>           
       </div>
     </div>
   </div>  
<script src="${pageContext.request.contextPath}/resources/js/Product/answer_view.js"></script> 
</body>