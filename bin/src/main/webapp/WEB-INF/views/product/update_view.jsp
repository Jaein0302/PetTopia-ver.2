<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<meta content="width=device-width, initial-scale=1.0" name="viewport">
<meta content="Free HTML Templates" name="keywords">
<meta content="Free HTML Templates" name="description">


<title>상품 수정</title>
<script src="https://code.jquery.com/jquery-3.4.1.min.js"></script>
<style>
.updateform { position : absolute;
			  top : 20%;
			  left : 30%;
			  display : inline-block}

</style>

<script>
$(function() { 
	
	//등록 성공 alert창
	var result = "${result}";
	if(result == 'addSuccess'){
		alert("등록 성공 입니다.");
	}

	//checkbox 하나만 선택할 수 있도록 함
	 $('input[name="ITEM_CATEGORY"]').click(function(){	 
	  if($(this).prop('checked')){	 
	     $('input[name="ITEM_CATEGORY"]').prop('checked',false);	 
	     $(this).prop('checked',true);	
	  }
	})
	 $('input[name="ITEM_SEX"]').click(function(){	 
	  if($(this).prop('checked')){	 
	     $('input[name="ITEM_SEX"]').prop('checked',false);	 
	     $(this).prop('checked',true);	
	  }
	})
	 $('input[name="ITEM_WEIGHT"]').click(function(){	 
	  if($(this).prop('checked')){	 
	     $('input[name="ITEM_WEIGHT"]').prop('checked',false);	 
	     $(this).prop('checked',true);	
	  }
	})
	 $('input[name="ITEM_SPECIES"]').click(function(){	 
	  if($(this).prop('checked')){	 
	     $('input[name="ITEM_SPECIES"]').prop('checked',false);	 
	     $(this).prop('checked',true);	
	  }
	})
	
	 //상품옵션 평소에는 안보이게
	 $(".option").slideUp();
	
	 //수술/치료일때만 상품 옵션 보이기
	 $('input[name="ITEM_CATEGORY"][value="treat"]').click(function(){	 
	 	 $(".option").slideDown();
	})	
	
	 $('input[name="ITEM_CATEGORY"][value="education"]').click(function(){	 
	 	 $(".option").slideUp();
	})	
	
	 $('input[name="ITEM_CATEGORY"][value="beauty"]').click(function(){	 
	 	 $(".option").slideUp();
	})	
	
	//모든 항목 클릭해야만 상품등록 가능
	$('#p').on('click',
		function() {
		 	
			var name = $.trim($('input[name="ITEM_NAME"]').val());
			if (name == '') {
				alert("상품이름을 입력하세요");
				return false;
			}

			var price = $.trim($('input[name="ITEM_PRICE"]').val());
			if (price == '') {
				alert("상품가격을 입력하세요");
				return false;
			}
			
			var content = $.trim($('input[name="ITEM_CONTENT"]').val());
			if (content == '') {
				alert("상품내용을 입력하세요");
				return false;
			}
			
			var uploadfile = $.trim($('input[name="uploadfile"]').val());
			if (uploadfile == '') {
				alert("상품파일을 업로드해주세요");
				return false;
			}		
			
		})	
})
</script>

<body>
	<div class="header">
		<jsp:include page="../member/header.jsp" />
	</div>
	
		<div class='updateform'>
			<form action="${pageContext.request.contextPath}/product/update"
			method="post" enctype="multipart/form-data">
			<input type="hidden" name="ITEM_ID" value="${productdata.ITEM_ID}">
			<h5>상품 이름</h5>
			<input id="name" name="ITEM_NAME" type="text" class="form-control" value="${productdata.ITEM_NAME}">
			<hr>
	
			<h5>상품 카테고리</h5>
			<label><input type='checkbox' name='ITEM_CATEGORY' value='treat'>수술/치료</label> 
			<label><input type='checkbox' name='ITEM_CATEGORY' value='education'>교육</label> 
			<label><input type='checkbox' name='ITEM_CATEGORY' value='beauty'>미용</label>
			<hr>		
		
			<div class="option">
				<h5>상품 옵션(수술/치료)</h5>
				<h6>성별</h6>
				<label><input type='checkbox' name='ITEM_SEX' value='male'>남성</label>
				<label><input type='checkbox' name='ITEM_SEX' value='female'>여성</label>
	
				<h6>크기</h6>
				<label><input type='checkbox' name='ITEM_WEIGHT' value='L'>대형</label>
				<label><input type='checkbox' name='ITEM_WEIGHT' value='M'>중형</label>
				<label><input type='checkbox' name='ITEM_WEIGHT' value='S'>소형</label>
	
				<h6>종류</h6>
				<label><input type='checkbox' name='ITEM_SPECIES' value='dog'>반려견</label>
				<label><input type='checkbox' name='ITEM_SPECIES' value='cat'>반려묘</label>
				<hr>
			</div>
	
			<h5>상품 가격</h5>
			<input id="price" name="ITEM_PRICE" type="text" class="form-control" value="${productdata.ITEM_PRICE}">
			<hr>
	
			<h5>상품 내용</h5>
			<input id="content" name="ITEM_CONTENT" type="text" value="${productdata.ITEM_CONTENT}"
				class="form-control">
			<hr>
	
			<h5>상품 이미지</h5>
			<div class="form-group">
		  		<div class="form-group">
				 	<span>파일 첨부</span>			
					<input id="file" type="file" id="upfile" name="uploadfile" value="${boarddata.BOARD_FILE}">	
		  		</div> 	
			</div>

	
			<button type="submit" class="btn btn-primary" id="p">상품	 수정</button>
			<button type="button" class="btn btn-danger" data-dismiss="modal">취소</button>
			<input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}">
				
		</form>
	</div>
		
</body>

