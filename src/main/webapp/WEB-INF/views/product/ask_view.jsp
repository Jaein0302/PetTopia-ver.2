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

   .ask { float : right }
   
   #detail_button{ color : brown }
   
   #check { float : left }

   .page-link { color : black !important; } 
</style>

</head>
<body>
   <div class="container">
      <span class="ask" style="display:inline">문의 목록 ( ${listcount} )</span>   
      <table class="table table-striped" id="detail">
         <thead>
            <tr>
               <th><div>글 번호</div></th>            
               <th><div>제목</div></th>         
               <th><div>작성자</div></th>         
               <th><div>날짜</div></th>   
               <th><div>삭제</div></th>                        
               <th><div>답변여부</div></th>  
            </tr>
              <c:forEach var="a" items="${asklist}" varStatus="status">  
               <input type="hidden" value="${answercheck[status.index]}">    	
               <input type="hidden" value="${answerlist[status.index].ITEM_ANSWER_CONTENT}">              
               <input type="hidden" value="${a.ITEM_ASK_CONTENT}">              
               <input type="hidden" value="${a.ITEM_ASK_ITEMID}">              
               <input type="hidden" value="${a.ITEM_ASK_USERNAME}"> 
               <tr>
                  <td>${a.ITEM_ASK_NUM}</td>
                  <sec:authorize access="isAuthenticated()">               
               	  <sec:authentication property="principal" var="pinfo"/>
	                  <td>
	                  	 <strong id="detail_button" style="color:darkbrown; cursor:pointer;">
	                     ${a.ITEM_ASK_SUBJECT} 
	                     </strong>                
	                  </td>
                  </sec:authorize>
                  <sec:authorize access="isAnonymous()">
                  	  <td>
	                  	 <strong class="login_required" style="color:darkbrown; cursor:pointer;">
	                     ${a.ITEM_ASK_SUBJECT} 
	                     </strong>                
	                  </td>
                  </sec:authorize>
                  
                  <td>${a.ITEM_ASK_USERNAME}</td>
                  <td>${a.ITEM_ASK_DATE}</td>
                  
                  <sec:authorize access="isAuthenticated()">            
                  <sec:authentication property="principal" var="pinfo"/>                
	        		  <td>  
	        		  	<c:if test="${pinfo.username == a.ITEM_ASK_USERNAME}"> 
	        		  		<button type="button" class="btn btn-danger a_delete">삭제</button>       		  
						</c:if>
		              </td>
	              </sec:authorize>
	              
	              <td> 
	              	<c:if test = "${answercheck[status.index] eq '1'}" >
                  		답변완료
                  	</c:if>  
	              </td>
                  
               </tr>
            </c:forEach>
         </thead>
      </table>   
    
      <div class="text-right">
          <sec:authorize access="isAnonymous()">
            <button type="button" class="btn btn-info floar-right login_required">문의하기</button>
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
             
                <input type="hidden" class="form-control" name="ITEM_ASK_ITEMID"  value="${param.ITEM_ID}">
                
               	<div class=m-3>                 
	                <h6>작성자</h6>            
	             	<input type="text" class="form-control" name="ITEM_ASK_USERNAME" value="${pinfo.username}" readOnly>
                </div>
                
                <div class=m-3>                 
                  	<h6>제목</h6>
              	 	<input type="text" name="ITEM_ASK_SUBJECT" class="form-control">           
                </div>
                
                <div class=m-3>
                   	<h6>내용</h6>
               		<textarea name="ITEM_ASK_CONTENT" class="form-control" rows="5"></textarea>                
             	</div>    
             
             	<button type="submit" class="btn btn-primary" id="p_add">문의 등록</button>
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
                <sec:authorize access="isAuthenticated()">                           
                <sec:authentication property="principal" var="pinfo"/>                                                
                <input type="hidden" class="form-control" name="id_now" id="id_now" value="${pinfo.username}">
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
				<button type="button" class="btn btn-primary a_update">문의 수정</button>
				<button type="submit" class="btn btn-primary c_update">수정 완료</button>
                <button type="button" class="btn btn-danger a_cancel">취소</button>
				</div>
             	<input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}">  
                </sec:authorize>                                   
            </form>
            
	        <div id="comment">
	            <hr>	        
	        	<h4>판매자 답변</h4>
	        	<textarea class="form-control" name="ITEM_ANSWER_CONTENT" id="content" rows="6" readOnly></textarea>	
			</div>
			
         </div>           
       </div>
     </div>
   </div>   
<script src="${pageContext.request.contextPath}/resources/js/Product/ask_view.js"></script>
   
</body>